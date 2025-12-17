Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC51D68BC1
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BC9B611A7;
	Wed, 17 Dec 2025 21:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAZRTt54wUdK; Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F36D611D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007922;
	bh=I9MSuUXcaAWcOFsESOUjhzM95IFjagqv4y+DDJhrt3U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Br17oKQPEV76DnWzFgm1g+Z2cPiyegIpikH35EOhvAIYuLL6MhomnFOH4bWfIj7m7
	 AfGbEqZc8zfZZAnsv909/NeTx5D/BKHq0u7RH7k26/4JRX1gdMIQDw0jvSe31YBzEa
	 d79/FXOe/4CRrxKHhTAXg9agLaT2u8WuRCOme8mAg/U7PTe+wBRI8zcFkxRDoFAV3z
	 poS9m3qvFVUX7OxqtLbMim2Y7WqJJAA6kg41qTUfpNVBTZdJaG86MR8f8hMkrzRz+W
	 s7GkbeBlgH1Zw5wXmbiLuyIQ6GWlVk/zajx3Zrx2DrXyKon2CMv8QCH3fGAyaHhfPN
	 JzB8BU3V/QkSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F36D611D5;
	Wed, 17 Dec 2025 21:45:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FCDC375
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C35AD40F87
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6e-ADZjKA6ga for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96E4C40F85
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96E4C40F85
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 947A181E43; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:11:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06e60c15de5195c6bfc6e166979d4d7efaa6325f
X-Git-Newrev: 13e1e1562b6392e90938583fd7da9bc4f70d9fb6
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.947A181E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-werkzeug: bump version to
 3.1.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=13e1e1562b6392e90938583fd7da9bc4f70d9fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pallets/werkzeug/blob/3.1.4/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 29621bb332..1a85d99558 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  b6005d403d01d08b9fe2330a0cfea05a  werkzeug-3.1.3.tar.gz
-sha256  60723ce945c19328679790e3282cc758aa4a6040e4bb330f53d30fa546d44746  werkzeug-3.1.3.tar.gz
+md5  601c4ad4d597c665da5642550d6740a9  werkzeug-3.1.4.tar.gz
+sha256  cd3cd98b1b92dc3b7b3995038826c68097dcb16f9baa63abe35f20eafeb9fe5e  werkzeug-3.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index f9b6a6c27a..2ea0006d54 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 3.1.3
+PYTHON_WERKZEUG_VERSION = 3.1.4
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/9f/69/83029f1f6300c5fb2471d621ab06f6ec6b3324685a2ce0f9777fd4a8b71e
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/45/ea/b0f8eeb287f8df9066e56e831c7824ac6bab645dd6c7a8f4b2d767944f9b
 PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
