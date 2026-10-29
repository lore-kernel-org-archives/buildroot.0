Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8329606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RtQdkNLG
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E2C860C2E;
	Fri, 30 Oct 2026 14:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z7_EkZAl3n8P; Fri, 30 Oct 2026 14:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AB8D360C12
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369967;
	b=bd+V/ktFSUdmgTsmhTOEGUOMormPBB05XuK2Cl34s7lsMzhrqBAvbfhKvFCtQtd+Kr4a
	 HdAsh1t55yBgF49qHX53sQ4KkPSXRa7EjrFiO3HC6RpYMl5CPeRWGYbODaxQKEfVgE9DO
	 rz8aG32G7vympN94nTSFvz8ZchLha2sSbyM9RSeh5i/X3Nu4/pJl2Uv1rRynsrma6eKDM
	 CtSgWwhjq0zMbHGPrdozOisoAi5gy9vGx8ZUHsx2UAJ7PQhwhLOvD7f8JQJ0jvsdkMSYA
	 DjvlXnyEmAK9TwAUp/1LL1wGIgpX80nxKJ3vkoZ682eOa/Efc7JTwuJLaOCoMDMXsaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369967;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=LMzAOrNfirwFBSrvyOqaRbUIkAT1sJ+2+oDcjIwEuZ8=;
	b=tFPTvDmxUYKN6elFlPhcRZy1t9S8boTh9kbslBitAeUxDiz1S/4gOfL98FkUAiVB+WzF
	 8vunu0H26rndItVqSKOjiZGTrZM2G1t9gBbDL4ykHvJ1eZkJdQqM2swJnT76fiLZbS5mW
	 PfLSNznk74LaP2IRp4/zvWLAkH0NOjWo2hDT2y1LVy389hSuy4oUKSOctlh9x/yt6o3CJ
	 Dg2qTyv7UI33NOA0FzqJRmzeRY4KH58WZlp9i+udKD0htDbxqRvwEWIQwgKUD0t7PF768
	 252kt0YlWUA1AwxQQqo2vhD5i80VNYSI8MtTgs27SiuuZaUGAxxlnbT7xPz3qQrs3kg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369967;
	bh=LMzAOrNfirwFBSrvyOqaRbUIkAT1sJ+2+oDcjIwEuZ8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RtQdkNLGRHzEmAvswMtiNmybUUGsVXCqh8d39j82+T631q8mLD9rHcOO18DCT1p47
	 7Wx0GytmeLpu0tRGHBXcnyiVFp8I0QPiLW4cmlzBALLpIe5ZLmZ31snhdr1V+i5z2Q
	 2FA8LIXvT+6OKJZcnr1LSsH3tjTKMKOC4TIGEp0hzSWYFP2absQF84HoFGZz1xBcDf
	 hkzPw8Emp4HGjMIOJbGvW4T3CQTWPZbYvgfXYX9e9hh261Le0S3I+GqS/HE01fxmip
	 WGUgocBICLxFonzwop6CzqZaBY0e1G1dP7/4gy+HQd0Z/d5ni0DqEnefS5WNdvCYIo
	 s60Bee6Gmrn1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AB8D360C12;
	Fri, 30 Oct 2026 14:19:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F020AD43
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B61D140243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MLdNaZOLE9Jt for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E2D4840535
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369890;
 b=UQnc+tMEwhUytDYos8CjrHFuQzpEpyE9NfdBv4jmKXNJlQeGOMJgtMc+yHCGPDDuxoLt
 V/nyRCOtiRQj+C6wnPhTyGDiV+HBFY1mAQtNIStC4QjHOSOM+heWvKZX5L0Yjsv2t1e+l
 pwMif/Dp2OYmioPfCvU8+3Oc/KGVk0hEHLBbzHl8N2NwT3WUxnrtU+t1VEvoYtt3S8FXF
 5/Tl9CSksn8V1JkE5xAvp+X8k0iA5NUTJgBWkrPjqW4ZE3J3KZD5gq/5aYSulJauBxE9I
 oH56NZR+JDNdrXwW6ssiRCL6/FTf7PG/O1kJEekRaspbRJYxlKGUVjyOJqCDDDfLT4w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369890;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AatTl+RiBTN82V6Y35AmxSh1z4hvF5dcbad8DktCtP0=;
 b=ConjikeIuG22PjhcN8zaE0bOEYPw15X7089ZcCzwP9jeRrbzc3p5uflnMFHCQr34oejW
 6RrLGUtlFfwulv/Myii1KioOgvO9Jp2uHGvV1Hzrh3XGSBuPPM4qDZIfEqZXE+htisdcM
 TZ0KMQ17J7geC9ZXfATN6BlIAr5JCvV9wWDLtFE9eZnNW/SYqdfwHM+FUn7Q0GeCXAuux
 D/Tk4J+tGJsBwihMvOZkLOT+Gub4aLrXpMLYjw37KLdWOZC9XCRgfRkqnn3hdFsjag0XS
 HQvjJ6V/cHW/RP+Px/hOhjwWXsDRPcaIl0KTVEy2orWc7cDp8SiRRJNzgVebwWg/LFg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2D4840535
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CCE49D389; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 20bdf6feb73ce97876c524b520f84f54b1356c72
X-Git-Newrev: a26c883b7cc05f23b8f35117d5e9c1d4d80d2f97
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.0CCE49D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/gauche: disable
 TLS support in host-gauche
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6706896736725797458=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6706896736725797458==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a26c883b7cc05f23b8f35117d5e9c1d4d80d2f97
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

host-gauche fails to build on build machines that have mbedtls 4.x
installed, e.g. Arch Linux:

  checking for mbedtls/version.h... yes
  ...
             tls/ssl: mbedtls
  ...
  ./tls-mbed.c:41:10: fatal error: mbedtls/ctr_drbg.h: No such file or directory
     41 | #include <mbedtls/ctr_drbg.h>
        |          ^~~~~~~~~~~~~~~~~~~~

Since version 0.9.6, Gauche's configure enables mbedtls support by
default whenever it finds mbedtls on the system. For host-gauche, this
means the mbedtls of the build machine is used, and mbedtls 4.x no
longer provides mbedtls/ctr_drbg.h, which Gauche 0.9.12 needs.

host-gauche only provides the gosh interpreter used to build the target
gauche, so it doesn't need TLS support at all. Pass --with-tls=no to
not depend on whatever mbedtls the build machine has.

This issue has been present since commit 73e836e13982 ("package/gauche:
bump to version 0.9.8"), which bumped Gauche from 0.9.5 (no mbedtls
support) and thereby made host-gauche auto-detect the build machine's
mbedtls. It therefore affects 2019.11 and later, including all
maintained branches.

Fixes:
https://autobuild.buildroot.org/results/14af1c847c09fd8df35c8923194c75931d8a568d

Fixes: 73e836e1398293abc1ec2b4297e1e680d2b29e32 ("package/gauche: bump to version 0.9.8")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 333517125c1ae1798a39415292f1d242bf3f598c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/gauche/gauche.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index b635c488fe..c63a663ddd 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -11,7 +11,10 @@ GAUCHE_LICENSE = BSD-3-Clause, Boehm-gc, SRFI (srfi-11.scm), reload (reload.scm)
 GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
-HOST_GAUCHE_CONF_OPTS = --without-zlib
+# host-gauche is only used to build the target gauche, so it doesn't
+# need TLS support. Disable it so that configure doesn't pick up an
+# incompatible mbedtls from the build machine.
+HOST_GAUCHE_CONF_OPTS = --without-zlib --with-tls=no
 GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS

--===============6706896736725797458==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6706896736725797458==--
