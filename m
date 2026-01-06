Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8992D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC7BD81EB9;
	Wed,  7 Jan 2026 17:47:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IYtYQwQf-ww; Wed,  7 Jan 2026 17:47:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC69D81FAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808075;
	bh=BctnY5hJsW+zPSUMNcOlK2NhluqvepY0DaCCSwpNsFI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L40PnI07kCtyamQiKr/Lhon+ab0zm97xDZLUPTelpgAatPwKfjUc2RMzEfWWuuWp5
	 JYnUCxz+N/7l5KU+AR6sXkOb1TZ+MX67VTBLajkeMybytfSX5f+yu+6Eo2f7yAPpnE
	 sAj2/3gk9FYgrQPIRFeyRMGAOtlBxQOYlptwMLC/MQaVO+9quLupPECl1LyA+KDC7P
	 6CgdRlbvL43WqfOlw0gRqJXkRInxkqFpnFgcKM2C9tGXW3oxjMxsxSQnd9ZOioeVHB
	 fiGM4dLV44iAtZ67hVhD4Wii4h3YK3N2uHzbvra3r/Lz4IWiscCu69hNQ72Nzn5o+o
	 TNJInDsYGN2Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC69D81FAF;
	Wed,  7 Jan 2026 17:47:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E9539ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E44760B97
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPSYrG9cTquM for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1755260891
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1755260891
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1607586FC2; Wed,  7 Jan 2026 17:46:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:18:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c8f90ae3935f51d73a0582ad8ffe29b519a3a617
X-Git-Newrev: 951530dae057a00478b366c981eeed4bee66ae6d
X-Patchwork-Hint: ignore
Message-Id: <20260107174643.1607586FC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-crc16:
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

commit: https://git.buildroot.net/buildroot/commit/?id=951530dae057a00478b366c981eeed4bee66ae6d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
