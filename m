Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F900F483EC
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7094860863;
	Mon, 23 Mar 2026 19:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmFohJwC13YY; Mon, 23 Mar 2026 19:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD69D6083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295712;
	bh=lT2Cqvrt92FXi1ArcEdNJRmcE70EmdhI8dILczgkp4U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qpPvc9GEYwnvapMav1h2bsgDBRKLGAPa8d148Ouvdw6rGeUUEkS0dZeybr9RwFrul
	 ZpUg4++jK2xfT+Pdk3+bPnyKnT36ZskyYYbTIxXUyLMrpxVD5Rzwt2bfCD0g3qADYQ
	 ceu14jA4yiEjbZ16Ban/qGq6j0oDNjToNGPibc45mC5CX15x5VGXbu/k4h8cNFo6p3
	 NnSegaO1AmpzHs0yq4y5M14qGG29LAIb7U4N0Oacxg+2WOqp1Vwjv/p+160FaCnQux
	 23nNqnb+lWeqYMA/GLyI75gzUSI7Wl7Bn9mmxsJTR/IKyW5fKQa/HSGhEZAtcNDCtI
	 VEK/TvJubW1Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD69D6083D;
	Mon, 23 Mar 2026 19:55:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D5E8E353
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2EA94027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xRmVS_qFsXk1 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0853640262
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0853640262
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54DE0801DE; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 22 Mar 2026 15:11:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe4b42063055f9ee2ae8e6c95d902e732c343cf9
X-Git-Newrev: 170b59b4fbf5f8707ed43c59a012053935283d91
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.54DE0801DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: bump to version 0.5.13.2
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/170b59b4fbf5f8707ed43c59a012053935283d91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=b308564a1ff6530f9fd3e7dd7b19aabae32ed375

Let's also drop useless comment in hash file.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 8 +++-----
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 85f8f3bf82..aa41d10af6 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,7 +1,5 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
-# After checking pgp signature
-# using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
-sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d  dash-0.5.13.1.tar.gz
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
+sha512  7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f  dash-0.5.13.2.tar.gz
 # Locally calculated
-sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
+sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 143972f01a..547fe8c9b0 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.1
+DASH_VERSION = 0.5.13.2
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
