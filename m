Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABD04D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB9E80B64;
	Wed,  6 Nov 2024 22:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ubIV3j0u9a6l; Wed,  6 Nov 2024 22:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81EFD81235
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81EFD81235;
	Wed,  6 Nov 2024 22:24:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23452B8
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1447740547
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F7c0PztaGGnY for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C56E34054C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C56E34054C
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C151285E1B; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 23:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 017d46de473e053e1f031ceca60ac99955d0838e
X-Git-Newrev: 7ae59137a25c0487b5493ba74eba8f4df77499ac
X-Patchwork-Hint: ignore
Message-Id: <20241106222425.C151285E1B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pkgconfig: use poetry setup
 type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7ae59137a25c0487b5493ba74eba8f4df77499ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pkgconfig/python-pkgconfig.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/python-pkgconfig/python-pkgconfig.mk b/package/python-pkgconfig/python-pkgconfig.mk
index 239dd90a5d..fc7e8273fe 100644
--- a/package/python-pkgconfig/python-pkgconfig.mk
+++ b/package/python-pkgconfig/python-pkgconfig.mk
@@ -7,10 +7,8 @@
 PYTHON_PKGCONFIG_VERSION = 1.5.5
 PYTHON_PKGCONFIG_SOURCE = pkgconfig-$(PYTHON_PKGCONFIG_VERSION).tar.gz
 PYTHON_PKGCONFIG_SITE = https://files.pythonhosted.org/packages/c4/e0/e05fee8b5425db6f83237128742e7e5ef26219b687ab8f0d41ed0422125e
-PYTHON_PKGCONFIG_SETUP_TYPE = setuptools
+PYTHON_PKGCONFIG_SETUP_TYPE = poetry
 PYTHON_PKGCONFIG_LICENSE = MIT
 PYTHON_PKGCONFIG_LICENSE_FILES = LICENSE
 
-HOST_PYTHON_PKGCONFIG_DEPENDENCIES = host-python-poetry-core
-
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
