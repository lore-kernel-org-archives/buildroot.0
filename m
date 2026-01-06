Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90F29D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:02:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66FC24152F;
	Wed,  7 Jan 2026 18:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ecMs-d_10GcM; Wed,  7 Jan 2026 18:02:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7900F4153B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808974;
	bh=2KS7lBjz7tSu4Q6FRKPB4zleFB3BTOFGmcj+g5N7lco=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BRPEMOzd95sKXl//ML87xwGvpjwAoAiGWym9Y/3LGRBvgnQRBJEThge/5Ofiee4Mc
	 VKNkvDq0q3E/0Ks8vrWBk9qI/hO08HAwFQm6aEwHu0tds42Va68sNGDDmzurrBWZ+S
	 WmbFHObep5Ap75yuBCe4tz5ZK9/yZ/+J9l2PvHEnFX9yQDm0AbX3WPngvb8ZEqkBO/
	 M3Ip/YoAPxP9ENJiKXk6NrNnqGGp7jROSo11aWip5+H1XuLpfBPGV4WN+PG1cJr1Th
	 JuzPA584bg259+zP04XRL3fQQjsQ6MIPPa1E40aZRyaEnUlmPf+ZyLqQ5/Xy0ITrZK
	 0r1T45kS1EElQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7900F4153B;
	Wed,  7 Jan 2026 18:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07C1525B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 456CC40A46
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o0BbXBi6IPPa for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 40FE240B57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40FE240B57
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F8EA811C5; Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 08:58:25 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: b495fc06c1dbbe273e0336c93e5606fa0e5657da
X-Git-Newrev: 410fc5866602f73d97f95dd504472f521dd4c829
X-Patchwork-Hint: ignore
Message-Id: <20260107180114.3F8EA811C5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/python-crc16:
 switch SITE to pypi.org
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=410fc5866602f73d97f95dd504472f521dd4c829
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4adcc7cac31c71f44d50c3db39db8b19c2b41f0d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-crc16/python-crc16.hash | 6 ++++--
 package/python-crc16/python-crc16.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-crc16/python-crc16.hash b/package/python-crc16/python-crc16.hash
index 4576a907ec..5244e400fa 100644
--- a/package/python-crc16/python-crc16.hash
+++ b/package/python-crc16/python-crc16.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  10aeda70fbe8b284874b3b1b8f74b9c1f6d5e8dee20ac8f9d5bc49f45f12a42a  python-crc16-0.1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crc16/json
+md5  3cb6a4f5fd10a58c09792e321cc467e5  crc16-0.1.1.tar.gz
+sha256  c1f86aa0390f4baf07d2631b16b979580eae1d9a973a826ce45353a22ee8d396  crc16-0.1.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  COPYING.txt
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 86e6f2ecf2..7a773eaf8e 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_CRC16_VERSION = 0.1.1
-PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
+PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
+PYTHON_CRC16_SITE = https://files.pythonhosted.org/packages/a6/e0/70a44c4385f2b33df82e518005aae16b5c1feaf082c73c0acebe3426fc0a
 PYTHON_CRC16_LICENSE = LGPL-3.0+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
