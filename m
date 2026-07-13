Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F59C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 13:44:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C72C180F37;
	Mon, 13 Jul 2026 13:44:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jGFAi4Fe5aRX; Mon, 13 Jul 2026 13:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D07980F1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783950254;
	bh=dc/9USlP54q51e5xCUQZoflXoCpSJtRrI0EtaE4ci5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ITsxP7g9ba1Wxveb26AdE4pnJmb/ldWRduYsqnKy2iDA6CCzKgZ/V7lc4I9SdZVLS
	 EnTard+g2Qidumcb2QczviRWYSZfHnRWFM5Qog0uGyU8dWve19K76U/9Poyz2gCiF4
	 r9rh+teyKna7WuL/eULXMBJntxUJZwn7MVX2u6BRL2+V+fNAbWHmSjSTYiC5rQDSHG
	 uHopLkqI/xbWkUUpCSdfVUtkQ6QjkMcyb0P8TSwIqqRHHFtd58zVWRw5rIlASLmgIU
	 MaKAgD8FqhhRkpvv49ygF2K1PvSHak9QGfuolfIjVxNquVVkbjnpSCs3SWSAzLxKo3
	 Cj6Je2cvnx2dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D07980F1E;
	Mon, 13 Jul 2026 13:44:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25559128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1728B407CE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4bmRpq_dNxDZ for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 13:44:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64165407D7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64165407D7
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:44:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2892F887CF; Mon, 13 Jul 2026 13:43:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 15:22:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8c8bd9bc56a827db90c3bb2e71e4613a5a2c730
X-Git-Newrev: 102d5c2c918af677ab996d6cdc73e980abdaaf75
X-Patchwork-Hint: ignore
Message-Id: <20260713134338.2892F887CF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libffi: bump version to 3.7.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/102d5c2c918af677ab996d6cdc73e980abdaaf75
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/libffi/libffi/releases/tag/v3.7.1
https://github.com/libffi/libffi/releases/tag/v3.7.0
https://github.com/libffi/libffi/releases/tag/v3.6.0

Updated license hash due to copyright year bump:
https://github.com/libffi/libffi/commit/4f7ef24565eb60e8a093bfeba0bb77d5c576c311

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libffi/libffi.hash | 6 +++---
 package/libffi/libffi.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libffi/libffi.hash b/package/libffi/libffi.hash
index 11e30e0e44..5f34afd392 100644
--- a/package/libffi/libffi.hash
+++ b/package/libffi/libffi.hash
@@ -1,4 +1,4 @@
-# From https://github.com/libffi/libffi/releases/tag/v3.5.2
-sha256  f3a3082a23b37c293a4fcd1053147b371f2ff91fa7ea1b2a52e335676bac82dc  libffi-3.5.2.tar.gz
+# From https://github.com/libffi/libffi/releases/tag/v3.7.1
+sha256  d5e9a6638ddbd2513ddb54518eb67e4bbe6fa707bcc01c10f6212f0a088d819d  libffi-3.7.1.tar.gz
 # License files, locally calculated
-sha256  d5699fa516968e3a1550e6c902b7441c78856f2603d61bedd0b0662a26655366  LICENSE
+sha256  17b64dc60f3b6897a60f971e288b973f655c2edcdf08b25f3c3dd5549857881c  LICENSE
diff --git a/package/libffi/libffi.mk b/package/libffi/libffi.mk
index 2f3208333c..c24ce22c84 100644
--- a/package/libffi/libffi.mk
+++ b/package/libffi/libffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFFI_VERSION = 3.5.2
+LIBFFI_VERSION = 3.7.1
 LIBFFI_SITE = \
 	https://github.com/libffi/libffi/releases/download/v$(LIBFFI_VERSION)
 LIBFFI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
