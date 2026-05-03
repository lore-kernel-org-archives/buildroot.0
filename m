Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F1CCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A11A84233;
	Sun,  3 May 2026 14:50:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bt0FCsg6xkDu; Sun,  3 May 2026 14:50:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C49084269
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819851;
	bh=b2h4Z0ff9UMVn2F0u2xhyYZRYUflSLH5EmLCsr3mc8s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lcD1vo5z+ghflFkbEPDcD1katIGZaKKcBDDLdlxLDrT8qnZeE6ZPcpV7asNmFCkv/
	 XxnexD+tnQZVMDO8rTylwHmaLrV2xI6iPsh4nWMj4NHJmTbEwLbvafDimLIw8yrnJS
	 UyXJ+2OXVl9a8lk5GEmynEAykqsxO0yAE3uL9NsCHgGxptBTbuFC2MRS4gDf1Ip38N
	 tVOuaScGIUmw+98aQWEiGo6SEM5HbFl1NBkUQWd5FlXj20f5hnAAjG3ktRUNxmYtwQ
	 DbqsGHrLHjf7SY56O2lKnapS97mlg/XeCg4QiGDNpVlBrF4zP68yRs00oK5PVPQh1r
	 3peNx65YK0bEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C49084269;
	Sun,  3 May 2026 14:50:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 100A4392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 307A561182
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNQSsL5FkuLQ for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2745A61273
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2745A61273
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E283083E54; Sun,  3 May 2026 14:50:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b50e6b48d9ef0514417f4a09fa1f27771d0fa250
X-Git-Newrev: 7330ecb682cba3b2cad1022f979e70f2df951316
X-Patchwork-Hint: ignore
Message-Id: <20260503145026.E283083E54@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-hiredis: bump version to
 3.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7330ecb682cba3b2cad1022f979e70f2df951316
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/redis/hiredis-py/releases/tag/v3.3.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-hiredis/python-hiredis.hash | 4 ++--
 package/python-hiredis/python-hiredis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hiredis/python-hiredis.hash b/package/python-hiredis/python-hiredis.hash
index 57e658e6e3..8804a47b8a 100644
--- a/package/python-hiredis/python-hiredis.hash
+++ b/package/python-hiredis/python-hiredis.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/hiredis/json
-md5  3dc0c18cedc67e6eb9027245157a29b3  hiredis-3.3.0.tar.gz
-sha256  105596aad9249634361815c574351f1bd50455dc23b537c2940066c4a9dea685  hiredis-3.3.0.tar.gz
+md5  ac8a2fa2182ff57c5fb5650d71e85b59  hiredis-3.3.1.tar.gz
+sha256  da6f0302360e99d32bc2869772692797ebadd536e1b826d0103c72ba49d38698  hiredis-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3256b5b77e98aa34ff31a4d2c2c10f7f177b0f3058753a6044430a168987353b  LICENSE
 sha256  dca05ce8fc87a8261783b4aed0deef8becc9350b6aa770bc714d0c1833b896eb  vendor/hiredis/COPYING
diff --git a/package/python-hiredis/python-hiredis.mk b/package/python-hiredis/python-hiredis.mk
index 6cedbe0076..a722f2eab9 100644
--- a/package/python-hiredis/python-hiredis.mk
+++ b/package/python-hiredis/python-hiredis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HIREDIS_VERSION = 3.3.0
+PYTHON_HIREDIS_VERSION = 3.3.1
 PYTHON_HIREDIS_SOURCE = hiredis-$(PYTHON_HIREDIS_VERSION).tar.gz
-PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/65/82/d2817ce0653628e0a0cb128533f6af0dd6318a49f3f3a6a7bd1f2f2154af
+PYTHON_HIREDIS_SITE = https://files.pythonhosted.org/packages/97/d6/9bef6dc3052c168c93fbf7e6c0f2b12c45f0f741a2d30fd919096774343a
 PYTHON_HIREDIS_SETUP_TYPE = setuptools
 PYTHON_HIREDIS_LICENSE = MIT, BSD-3-Clause
 PYTHON_HIREDIS_LICENSE_FILES = LICENSE vendor/hiredis/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
