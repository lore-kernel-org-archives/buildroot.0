Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E69AE95A86
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F1618124D;
	Tue, 30 Dec 2025 13:00:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yi_qKWPeVRxs; Tue, 30 Dec 2025 13:00:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C7CB81CAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099633;
	bh=nENMny1gDg55KFAdrz5FaUsYae7eVXJGMiM/pmTzJls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gns48CGnbrjpo584NupI3QKhUv7o/i3lonoMsbw+DZxeDXDC1YoR4VrvdpgSsgQYR
	 6TddxGRqUIkfSvZRPQcqr6gThUw958lowy145+m1K/3ICIF0zFq7keImem62HPK0G8
	 Q98TzJHj6FErEbD1rqTToED0K3o4guNF/rcoqk96/0Ph3xbTIl3K6CWin7A8nbvwfZ
	 ANkKUoY7WGDSD/xMytuo+G+hlUCbhYSSOvd2Lh+/HAMx9z2ZkSuPLgRhtV+M9Rzi9C
	 I4H/yqBaciOwf/8qT8vE/p6Olu4bkv2Ya2cBiO6QAfpw0DuQoUopo0Kt0QJVXt7ww6
	 6MrCblsEqo6KA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C7CB81CAD;
	Tue, 30 Dec 2025 13:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 28612372
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EC044013F
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sv3ur2Yd35Jh for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D90740390
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3D90740390
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3951087A42; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:44:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c68927229646820dbd0d2a5653811662623a5ae1
X-Git-Newrev: 37015b15cdc8ef57fca73f84d966a0da72f26570
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.3951087A42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-txaio: bump to version
 25.12.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=37015b15cdc8ef57fca73f84d966a0da72f26570
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatch build backend.

License hash changed due to formatting changes:
https://github.com/crossbario/txaio/commit/9d1cb8a83964cb52643df4a105dc368c9c4f09ea

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index d561cec635..7e729e969f 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  297409f2dff8e71bad24467374aa8775  txaio-23.1.1.tar.gz
-sha256  f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704  txaio-23.1.1.tar.gz
+md5  86e8dd45a2ef07583fd85006cebd90e3  txaio-25.12.2.tar.gz
+sha256  9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78  txaio-25.12.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
+sha256  e7b0171093d8d2cec2db922db6d7634b5ddbb0338de111b38857d3160a7ea770  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 585b3a5f57..cb29609254 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 23.1.1
+PYTHON_TXAIO_VERSION = 25.12.2
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/51/91/bc9fd5aa84703f874dea27313b11fde505d343f3ef3ad702bddbe20bfd6e
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/7f/67/ea9c9ddbaa3e0b4d53c91f8778a33e42045be352dc7200ed2b9aaa7dc229
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
-PYTHON_TXAIO_SETUP_TYPE = setuptools
+PYTHON_TXAIO_SETUP_TYPE = hatch
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
