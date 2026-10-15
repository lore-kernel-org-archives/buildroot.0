Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45299CCF2C1
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 13:13:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4DAA61327;
	Fri, 16 Oct 2026 13:13:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RNTZmPrM4xlJ; Fri, 16 Oct 2026 13:13:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6D6576134F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792156403;
	b=pkQrq4NTvZm/ALxVHTygFzGaMSd2SeROZNa3VuSgSJs8JIqSW4WEVhxZqAkxp17DOQ4T
	 UMVlGKkohAYY4Lc/ugqv5gZwoAu7ngb/mNFSPEz6yEyDCxPg5QlnYHzz1dQOX6lpuOcL3
	 4BZsWAcLTt33KDDCCG2HQvk6rvnCZ+hCSEZLR5OKx4nHrdM+7RErennXlAxWvNk2ZvQ7I
	 WR/HRLYTflAySg4vHqy9FJrBhp+o0gYfSFyCqoABOdmg/1kvv7yXk+VeZjJSLCa9vzb4F
	 i/pipZ4nzuuAjC54GpaF70Rftw+q7RCfKUv/IaCW4t+0YwzSbQ64YQSLmqHHGw013ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792156403;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=A0C1NpJ2zWfv1BVAW9mzMp3pbSK4RVn+ub5W8l7qrPc=;
	b=ZJdC/8a9nFDYqAnRXWH0bG1B1v0UlATPv4RCHBFZiHf7qcdoY6Bc2nGF+plUh6ZFPRXd
	 KbyJsTwDeJg6rY/qlbUEDUvzW67jXDmcu9xqGsbkNOjAN7ALH4O7DG3sQi7FI+110rWB8
	 dHHAt/AcwlDcXLINuX6TfpHnhZzMY2+F/etGDxaDv0x8e+V2z+vSzV+Lo/J4v6sD3UVt9
	 BT3g3zHo6Ssfurm7Z3BjOku5BAYqLPRqbvnyb06ZucBEkupNjXEmrQmwl6y1cCrw0NJ5U
	 a5c7tWltgZ8l9m4kItt4S2T17bvd6dMBOweqiSamkbRBtfbljTVXuGTqv0ZQWVavZRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792156403;
	bh=A0C1NpJ2zWfv1BVAW9mzMp3pbSK4RVn+ub5W8l7qrPc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=a3UOttxec+K32d1pAVY1OMbgy7INjzStbSW5o4ze5bHKA/NUGnxDKdDdyWVOgSS96
	 fQ8165gRwp3+BePCJc3pRhOKGr7fHAu0r6edODJb46/BQT4avYRIcAFxKpUrjYRun0
	 /+ayv+MP8X3nOvHHaSuzo+qfFXGyGXb6aZmgD5a0LGC/DNei7w5Gb/gA7jFjWOgBGc
	 4GOVbw6TalIECnbHPgDJ//iQUOw+X4Am2Wz6YiKcdBSK8m/LqNO6i/JkKHyZ+OwERh
	 92xQeibGEdK8+wRZf+22HLmICr/1FUHEQudZsW8iNmiGr6ajTdiS+Ym/9T3S2TDiWv
	 H1a6IUlCldtRQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D6576134F;
	Fri, 16 Oct 2026 13:13:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B22ED105
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A116560B3C
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cw8PosCLXdok for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 13:10:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 0367260F39
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792156193;
 b=XRhhoqGr5+n5apLUBW0KTGkDTjjnJvsUdrQnzaNldxPVAuDXeiXCV7/sQjkb5wRTGTdl
 FMGECo3f8/eSrvSci3806y9C1GCU7rsKuPVL52F8F3BRxn0462YB0ZI4y7M31Hdl8Do++
 00lnlhE/JzI0qE+qYbIoxFIOJzG8fjgRziBo/bkAEgwOb1VXm2BPhBi7/KmjkNAQ/65gw
 M5DWgG2UoMppJ05nLp39ocQC5S1HS5Zhh5qaOa5uQiTymE9uKAfAuce0kmaF+IlRnjMWb
 1Nu5583thI+bHKhrUH1AB4Krh0wCMyR7c0R/qjcJZBO4cZMF3VsLH0WCjsnS0llv0hA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792156193;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eIQN+9OKmtZeT6UIBS8hyx6IVg3kwaEl4eM1CfAAHlo=;
 b=bmN/L2iH+zCtVP8xZM0N1xlTBiI4yL8kNt4pfrNohiWMnaTVbFYooGWfebnMmRqISwBf
 LgHXs36GdltwbQj6LgsutlqUc+uv5QDeHsjZWwKz5ddW06SEux74JNpNnosVqei+GXgzv
 TriUTr00Zf2o5Wc5BMhyVwk4qi//1RSKxSMgQE8pHdOF7FTe2F6RBqrj9gVgn0YmSqNl+
 SmiotW4Sf+Z3gXqRDsccZmmjb9H08QbrCQBZqbmDuxu+ff6bex3TmF8jQUW9Vs+o7l6hJ
 oOHzUqXHW2y+VZK1cqMrqvi0ZXIzDnpgL/vtPcUFxE8rMUSaAOuYn4zlxCxU507Uk2g==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0367260F39
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 13:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E698D960D7; Fri, 16 Oct 2026 13:08:31 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 14:36:19 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 7baaf34fa5aea2a50d0e92a47b3de435b9a5af19
X-Git-Newrev: 66eaacb941092a8a83fa9db34b79a994a1d5b8a9
X-Patchwork-Hint: ignore
Message-Id: <20261016130831.E698D960D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/atop: fix musl
 build
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
Content-Type: multipart/mixed; boundary="===============2887135773672207835=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2887135773672207835==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/66eaacb941092a8a83fa9db34b79a994a1d5b8a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Since the bump to version 2.13.0 in Buildroot commit [1],
atop fails to build with musl:

drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]

(Before 2.13.0, the same configurations already failed earlier on
uClibc because _POSIX_C_SOURCE was defined without a value. Upstream
fixed that in 2.13.0 by giving it an explicit value, but the same
pattern remains for _XOPEN_SOURCE.)

ncurses only declares its wide-character API, including waddwstr(),
when NCURSES_WIDECHAR is set. If the application does not set it,
curses.h derives it from the feature test macros:

  #if defined(_XOPEN_SOURCE_EXTENDED) || \
      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))

drawbar.c defines _XOPEN_SOURCE with an empty value, which makes the
check evaluate as 0 >= 500 and fail.

This only breaks with musl because of the C library's <features.h>,
which curses.h pulls in through <stdio.h> before doing the check.
glibc and uClibc both redefine _XOPEN_SOURCE to 700 and define
_XOPEN_SOURCE_EXTENDED whenever _GNU_SOURCE is set, which drawbar.c
does, so the empty definition gets fixed up. musl never modifies the
application's feature test macros, so the empty value reaches
curses.h and the wide-character prototypes are left out.

Add a patch that defines _XOPEN_SOURCE as 700, matching the
_POSIX_C_SOURCE value of 200809L that is already used.

Fixes:
 - https://autobuild.buildroot.org/results/914c1d8fa0fc8bbef64e4a64d58e5941d0077a3e
 - https://autobuild.buildroot.org/results/b91ea0722202de0d1fdeeaeea167fd1b21b6d5d6

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/2110131cab2a613567c99491ba540bb33440e46c

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Tested-By: Thomas Perale <thomas.perale@mind.be>
[Julien: add link to Buildroot commit introducing the issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 99909a8a955dc6ba89aaa72e488e8c262ad2f469)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ine-explicit-value-for-_XOPEN_SOURCE-macr.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
new file mode 100644
index 0000000000..d526d58433
--- /dev/null
+++ b/package/atop/0001-drawbar-define-explicit-value-for-_XOPEN_SOURCE-macr.patch
@@ -0,0 +1,48 @@
+From 54799216beac63a195cd6d34b22476fc15a80295 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Wed, 30 Sep 2026 10:59:49 +0200
+Subject: [PATCH] drawbar: define explicit value for _XOPEN_SOURCE macro
+
+drawbar.c uses the wide-character curses function waddwstr(). ncurses
+only declares its wide-character API when NCURSES_WIDECHAR is set,
+which curses.h derives from the feature test macros:
+
+  #if defined(_XOPEN_SOURCE_EXTENDED) || \
+      (defined(_XOPEN_SOURCE) && (_XOPEN_SOURCE - 0 >= 500))
+
+drawbar.c defines _XOPEN_SOURCE without a value, so _XOPEN_SOURCE - 0
+evaluates to 0 and the check fails.
+
+With glibc and uClibc this goes unnoticed, because their <features.h>
+redefines _XOPEN_SOURCE to 700 (and defines _XOPEN_SOURCE_EXTENDED)
+whenever _GNU_SOURCE is set. musl does not touch the application's
+feature test macros, so the empty definition reaches curses.h
+unchanged and the build fails:
+
+drawbar.c:2336:33: error: implicit declaration of function 'waddwstr'; did you mean 'waddstr'? [-Wimplicit-function-declaration]
+
+Define _XOPEN_SOURCE as 700, which matches the already explicit
+_POSIX_C_SOURCE value of 200809L (both refer to POSIX.1-2008).
+
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+Upstream: https://github.com/Atoptool/atop/pull/415
+---
+ drawbar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/drawbar.c b/drawbar.c
+index 651a81e..e4db0d6 100644
+--- a/drawbar.c
++++ b/drawbar.c
+@@ -104,7 +104,7 @@
+ // the other.
+ /////////////////////////////////////////////////////////////////////////////
+ #define _POSIX_C_SOURCE	200809L
+-#define _XOPEN_SOURCE
++#define _XOPEN_SOURCE	700
+ #define _GNU_SOURCE
+ #define _DEFAULT_SOURCE
+ 
+-- 
+2.34.1
+

--===============2887135773672207835==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2887135773672207835==--
