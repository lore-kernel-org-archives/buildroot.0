Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CDCC25B4F
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:32:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3CD741713;
	Thu,  9 May 2024 14:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIhcGSMf8xoz; Thu,  9 May 2024 14:32:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6127741707
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6127741707;
	Thu,  9 May 2024 14:32:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5805F1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36107400F5
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:31:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UDEB-uqNurQC for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:31:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AC89402E4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC89402E4
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:31:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 54C8886BB7; Thu,  9 May 2024 14:31:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 May 2024 16:15:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a8676aa6e4b0e372a1a744eac6e53c90c03bf0e
X-Git-Newrev: c65639ebd509cc6a9f6a616b6ef01a85ba32aff0
X-Patchwork-Hint: ignore
Message-Id: <20240509143147.54C8886BB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libjwt: security bump to version
 1.17.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c65639ebd509cc6a9f6a616b6ef01a85ba32aff0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball and so drop autoreconf
- Update hash of LICENSE file, verbatim copy of the current MPL 2.0 with
  https://github.com/benmcollins/libjwt/commit/ebebb5027f37a85c40c072a02681e206d31875ca
- Fix CVE-2024-25189: libjwt 1.15.3 uses strcmp (which is not constant
  time) to verify authentication, which makes it easier to bypass
  authentication via a timing side channel.

https://github.com/benmcollins/libjwt/compare/v1.15.3...v1.17.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libjwt/libjwt.hash | 4 ++--
 package/libjwt/libjwt.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libjwt/libjwt.hash b/package/libjwt/libjwt.hash
index 47e8b2c506..adc32c3a26 100644
--- a/package/libjwt/libjwt.hash
+++ b/package/libjwt/libjwt.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  cb2fd95123689e7d209a3a8c060e02f68341c9a5ded524c0cd881a8cd20d711f  libjwt-1.15.3.tar.gz
-sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
+sha256  b8b257da9b64ba9075fce3a3f670ae02dee7fc95ab7009a2e1ad60905e3f8d48  libjwt-1.17.0.tar.bz2
+sha256  3f3d9e0024b1921b067d6f7f88deb4a60cbe7a78e76c64e3f1d7fc3b779b9d04  LICENSE
diff --git a/package/libjwt/libjwt.mk b/package/libjwt/libjwt.mk
index 8929904d10..f143ba4b62 100644
--- a/package/libjwt/libjwt.mk
+++ b/package/libjwt/libjwt.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBJWT_VERSION = 1.15.3
-LIBJWT_SITE = $(call github,benmcollins,libjwt,v$(LIBJWT_VERSION))
+LIBJWT_VERSION = 1.17.0
+LIBJWT_SITE = https://github.com/benmcollins/libjwt/releases/download/v$(LIBJWT_VERSION)
+LIBJWT_SOURCE = libjwt-$(LIBJWT_VERSION).tar.bz2
 LIBJWT_DEPENDENCIES = host-pkgconf jansson
-LIBJWT_AUTORECONF = YES
 LIBJWT_INSTALL_STAGING = YES
 LIBJWT_LICENSE = MPL-2.0
 LIBJWT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
