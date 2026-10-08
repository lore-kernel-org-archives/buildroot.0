Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACB9BCA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 09:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72B0540949;
	Sat, 10 Oct 2026 09:22:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fnQeJ5TBiPah; Sat, 10 Oct 2026 09:22:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6DC044095D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791624132;
	b=RWkpwZnp35tMX7dm3NsyNfVwEqpy+9wYJin0Itg6tP8To54ikE0aC01ZnS4Vbv8G709g
	 ERlzADzJkl5jrqZSlBU2dA+2Yb6Krh2w66DdbdTd9HCpmoJGOauZLohL8fZZzndGKSqvm
	 X/jTMd4C8lwVZg/cCWaw2CeJUvOB13zK7ngVObqpLJGVpsMn0rzYtLIuG02UEBAk/947g
	 TgIzksgT2QIIBjL5DKBLcqO6mfHcrrgogBfCMVz0i8fAkpiG6832qcWD4weWsz//neXNy
	 lWl493V8kNFjMSe1jefCFXPxU1hCrVrxR7ocN1lmmo2WYnMr4BhXgXhERIWy/vzSvhQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791624132;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=hfDi7Yp+evYUGVRZ67xwJnCr4DMqCMMet0dGg2aBYzw=;
	b=UH8LO1KqIa3hhtIHavYIAZ28j/1gUgITtDc3AOwWFbLrTIMuGIf0AUjTWd9ScC4CFDFn
	 Hqw1GwzE/PirWG5YtleKutV+RQZggZKIAdp9mD4BlXzne7KWXAYnV2BZhUTrqlp6N+24r
	 krjOWYYJcWnnniZTQyE8TEEdFFpipNfx9zKZsQuwuYyyPxz3GN5GAn7hojRkGvHyV2R2K
	 F0L5Zg05OJBBJwklS+IIegYiOAetuHoldvE20TmgVInxDaCB+SmRDrMcMcmY7bdDm/J24
	 3w1/zTcGgU3b24RpcIGwGwn5N5Kr9wbXu+pPHxMtZPHzDkbripojBImfOcEqgdOR4YQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791624132;
	bh=hfDi7Yp+evYUGVRZ67xwJnCr4DMqCMMet0dGg2aBYzw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=juaXdpcR6uWpGIYY44qqPTloR2NXyiiCT5O3pl1FqFS+bXzXT4Twm8cWbRs198xHx
	 h6NDuxeTZu4wJa+djNmRRVFNItniRbP1jq+XX+mgmTlENRLFcT8t95SAk6kQBfcK2d
	 hJKVbda9rzlv4LezI2oeWvAcvDQCiYMPG1t9gpmBQSW0tMzoTk2FAKkKX2fegV+zGK
	 e9EW3ZI9YTh6isFGD7R9WNHc78HA5/JgRdhnQGvSe3j1YwXt6Oqc5VYw6UcKEMfcNS
	 o9ItXk6zOt0fnp2oWMkbqtrNSu2SwbyOVYTJbh2/LfhtLjSvpsEt/KmmFgygWzzLwK
	 tBtEsnHN1SMHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC044095D;
	Sat, 10 Oct 2026 09:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 778A6E45
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E8E36066C
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IzqV98a-g2r for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 09:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D36F060670
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791624086;
 b=RYMiLXlTJpWLBvTQN3Bm2veGgl6+ixmW9UfaJs7sexEzYKQk2PU3GiGKCjnhYjD8h/rI
 /4be6H05cp3uW39WSwhsH56jkrpdCEK9wKEj2axDryLO9cd/whyLEKpodzeCsd4XHDbcS
 kY+6raejLAYzwTWXSaafzddkRugb8SmNARHdIiMjbctbf33rRXOJDzVrhga/UmaEYLmZ7
 RzYQfvWaKXPnYLyfSbV41Rv3TQ8Cz8ZizL1jfrg4SE57S+NwwkUprm270JZdYT6NObImQ
 DsynE43CvWu0ZuUz5uXy94fSOsN7nYrDnGYvXL3GQ6p9OVGrw1MaaW2AzBhJgG1Oo6Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791624086;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=N/tk590HS+VWW94VF5gEFbz8nn5JznDGnECOyPPLubc=;
 b=gWmEWsGwEDtiURetUMZA/7opfgLHlmO2sLsByvfpFhPezceY+2eeV1aNNQyOdnYaMdqV
 ruC2UwFVNYo0wZ+0odlLKJyiFnYdqqpxgN02lsZnIVRD3loARCch29NUGplVlVqDEi7pY
 u9XFItAZ8IOZeTj9LDawHN1yA9TvOv4YEl71nadX21iiP5F10CDcgRnUip+QNx62Hs0zG
 q+4CB+XosfLrCiDDwnRn36G3nfSjGsrTuT3ATq63pAvqhV/4VVL2pSfp8Dqczkc+aKZgN
 S2kpaBa6AebXrQy2IGXTu9sRabSqRoB2UsAg/tfoHsOfO7gqtFvDfNL4q0Q4I4jJcvg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D36F060670
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 09:21:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BDB448F065; Sat, 10 Oct 2026 09:20:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Oct 2026 12:01:59 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 5e4fddd4e81d02bed7129c78934e87c2bbc9ca6e
X-Git-Newrev: dc8e76474f5b48a3dc05fd9ace1795c62fb26679
X-Patchwork-Hint: ignore
Message-Id: <20261010092008.BDB448F065@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/erlang: fix build
 with BR2_TIME_BITS_64
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3827017090654113165=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3827017090654113165==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dc8e76474f5b48a3dc05fd9ace1795c62fb26679
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

erts/emulator/sys/unix/sys_time.c undefines _FILE_OFFSET_BITS before
including system headers. With BR2_TIME_BITS_64=y, Buildroot passes
-D_TIME_BITS=64, which glibc only accepts together with
_FILE_OFFSET_BITS=64, so the build fails with:

  error: #error "_TIME_BITS=64 is allowed only with _FILE_OFFSET_BITS=64"

Backport the upstream commit that removes this ancient workaround.

Fixes:
https://autobuild.buildroot.org/results/72443d8e794451cbc4063e906d6b2405021cb52f

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b2005938aed8798b2ce2df7733dcb75394b2d6b7)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/erlang/0002-otp-Fix-build-on-Yocto.patch | 80 ++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/package/erlang/0002-otp-Fix-build-on-Yocto.patch b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
new file mode 100644
index 0000000000..9f4de3508e
--- /dev/null
+++ b/package/erlang/0002-otp-Fix-build-on-Yocto.patch
@@ -0,0 +1,80 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?John=20H=C3=B6gberg?= <john@erlang.org>
+Date: Wed, 13 Dec 2023 16:34:04 +0100
+Subject: [PATCH] otp: Fix build on Yocto
+
+A workaround to avoid breaking "micro level process accounting on
+/proc/self" broke the build on Yocto. As this is a really ancient
+workaround (pre-2009) and the comment is unclear about what
+actually breaks, we'll try removing it to see if this is still a
+problem.
+
+Upstream: https://github.com/erlang/otp/commit/c38fc7c62e818273870340f3faf83cc3905e1cf1
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ erts/configure                    |  9 ---------
+ erts/emulator/sys/unix/sys_time.c | 10 ----------
+ make/autoconf/otp.m4              |  9 ---------
+ 3 files changed, 28 deletions(-)
+
+diff --git a/erts/configure b/erts/configure
+index 1d573b4..0b046dd 100755
+--- a/erts/configure
++++ b/erts/configure
+@@ -24417,15 +24417,6 @@ else $as_nop
+ /* end confdefs.h.  */
+ 
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>
+diff --git a/erts/emulator/sys/unix/sys_time.c b/erts/emulator/sys/unix/sys_time.c
+index eb2c47b..f60e345 100644
+--- a/erts/emulator/sys/unix/sys_time.c
++++ b/erts/emulator/sys/unix/sys_time.c
+@@ -22,16 +22,6 @@
+ #  include "config.h"
+ #endif
+ 
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+-
+ #include <stdlib.h>
+ #include "sys.h"
+ #include "global.h"
+diff --git a/make/autoconf/otp.m4 b/make/autoconf/otp.m4
+index f543101..984ee1a 100644
+--- a/make/autoconf/otp.m4
++++ b/make/autoconf/otp.m4
+@@ -2705,15 +2705,6 @@ dnl
+ AC_MSG_CHECKING([if gethrvtime works and how to use it])
+ AC_RUN_IFELSE([AC_LANG_SOURCE([[
+ /* gethrvtime procfs ioctl test */
+-/* These need to be undef:ed to not break activation of
+- * micro level process accounting on /proc/self 
+- */
+-#ifdef _LARGEFILE_SOURCE
+-#  undef _LARGEFILE_SOURCE
+-#endif
+-#ifdef _FILE_OFFSET_BITS
+-#  undef _FILE_OFFSET_BITS
+-#endif
+ #include <stdlib.h>
+ #include <unistd.h>
+ #include <string.h>

--===============3827017090654113165==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3827017090654113165==--
