Return-Path: <SRS0=WrHH=PM=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7164EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:26:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3028660F70
	for <buildroot@archiver.kernel.org>; Sun, 24 Oct 2021 13:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3028660F70
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 031BF4025E;
	Sun, 24 Oct 2021 13:26:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J65LMW6zT4J9; Sun, 24 Oct 2021 13:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14B6440271;
	Sun, 24 Oct 2021 13:26:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C53281BF2F2
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B511240271
 for <buildroot@lists.busybox.net>; Sun, 24 Oct 2021 13:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tkKxQbKrp_0q for <buildroot@lists.busybox.net>;
 Sun, 24 Oct 2021 13:26:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04F834025E
 for <buildroot@buildroot.org>; Sun, 24 Oct 2021 13:26:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5F158885A5; Sun, 24 Oct 2021 13:23:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 24 Oct 2021 15:25:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 777b1f91353ddae3a32d2dccfdbbfca853bf30f9
X-Git-Newrev: 946397f8e43ffa711fd3217e750504224a084dd5
X-Patchwork-Hint: ignore
Message-Id: <20211024132309.5F158885A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ca-certificates: bump version to
 20211016
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=946397f8e43ffa711fd3217e750504224a084dd5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump version to 20211016

- add host-python3-cryptography dependency (needed since upstream
  commit [1])

[1] https://salsa.debian.org/debian/ca-certificates/-/commit/8033d52259172b4bddc0f8bbcb6f6566b348db72

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 024034c977..a1675b999e 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1  c9875aa16e42981c6975e59a11727539053e2299  ca-certificates_20210119.tar.xz
-sha256  daa3afae563711c30a0586ddae4336e8e3974c2b627faaca404c4e0141b64665  ca-certificates_20210119.tar.xz
+sha1  bce5a8fac45456dbebf256f3a812c6cd0a853e3e  ca-certificates_20211016.tar.xz
+sha256  2ae9b6dc5f40c25d6d7fe55e07b54f12a8967d1955d3b7b2f42ee46266eeef88  ca-certificates_20211016.tar.xz
 
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 94302ea96b..0b75a8c778 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20210119
+CA_CERTIFICATES_VERSION = 20211016
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20210325T091936Z/pool/main/c/ca-certificates
-CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20211022T144903Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3 host-python3-cryptography
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
