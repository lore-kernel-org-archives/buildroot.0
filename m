Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACBBD68BC2
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 22:11:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B776111F;
	Wed, 17 Dec 2025 22:11:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1w68iCYMinTQ; Wed, 17 Dec 2025 22:11:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 974EF60BA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766009476;
	bh=cae+Y597xK0AyyGa0yibmxtLt/w8JvxDVPiJtdr4Wh4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=byB6j3586EitTluVA1dShrgBUqk/HfG1D2lcdQzDVISOOVBe8xRhHmB+eFn2ncPOv
	 8X2sY2m152VtXuTieTct+HOLwhB3yoXcUOYSd02LmSvuGFmE919IEo2Jk9xQu+fHvp
	 NBJsXt9SlAa+TkhQwtJpgQSQrSW3a3CwBbCFNn5dGK1eXYCEe+wAIBxMLcESIffAvH
	 02nSNTTEkweyDoOYptBGwesVZOKNKZd9ZHh6ufaAlEWUMK+AUbgDozzZjFzviIrPZ+
	 kWkDb3DEvVFO2161Qj55I3i9vkxUJyGULUk5PE5KWw+KCjhOcTz+6A/AWN6HR4o3QL
	 /CD/dBYnNq+GQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 974EF60BA6;
	Wed, 17 Dec 2025 22:11:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F7CD361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 466BE40B2B
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:11:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wJm8oAIYAQ37 for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 22:11:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8404E40725
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8404E40725
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 22:11:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EDE28711F; Wed, 17 Dec 2025 22:11:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:50:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2ce6f09ee155a55b7d74e910e4336b68b66e0d16
X-Git-Newrev: 2d69dfb41e3290c8220a8c9891fb480e5b13ccf8
X-Patchwork-Hint: ignore
Message-Id: <20251217221114.7EDE28711F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-magic-wormhole: bump
 version to 0.21.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d69dfb41e3290c8220a8c9891fb480e5b13ccf8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since 0.19.2, see:
https://github.com/magic-wormhole/magic-wormhole/blob/0.21.1/NEWS.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to change log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-magic-wormhole/python-magic-wormhole.hash | 4 ++--
 package/python-magic-wormhole/python-magic-wormhole.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-magic-wormhole/python-magic-wormhole.hash b/package/python-magic-wormhole/python-magic-wormhole.hash
index 8ba2c04993..3a3af3cd26 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.hash
+++ b/package/python-magic-wormhole/python-magic-wormhole.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/magic-wormhole/json
-md5  37fdc279a6b55f52945098850a381708  magic_wormhole-0.19.2.tar.gz
-sha256  b2b4a78acf09ff4cfc503a238f674394a5e735fa08dcd54519243ffc67f97c71  magic_wormhole-0.19.2.tar.gz
+md5  ad5a6114cb148cd3e400e34e6826408e  magic_wormhole-0.21.1.tar.gz
+sha256  b6d35972a19b4baa44e022518317b4e0ad26709fa019196f67ca0d127672a367  magic_wormhole-0.21.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4a9cc2415c52cef591b6822eee68fed36d7e6d80284b09638cff61d762d99060  LICENSE
diff --git a/package/python-magic-wormhole/python-magic-wormhole.mk b/package/python-magic-wormhole/python-magic-wormhole.mk
index ce146181f7..67091352d0 100644
--- a/package/python-magic-wormhole/python-magic-wormhole.mk
+++ b/package/python-magic-wormhole/python-magic-wormhole.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_MAGIC_WORMHOLE_VERSION = 0.19.2
+PYTHON_MAGIC_WORMHOLE_VERSION = 0.21.1
 PYTHON_MAGIC_WORMHOLE_SOURCE = magic_wormhole-$(PYTHON_MAGIC_WORMHOLE_VERSION).tar.gz
-PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/e0/5b/4aff155b8e8ead4bc7c6aa3d1c19dc75aac2315e0c9b12f4e2f246b40141
+PYTHON_MAGIC_WORMHOLE_SITE = https://files.pythonhosted.org/packages/d1/c6/0ed9e0dca81eb5d0bcfc72690613bf26a13b95a9edb95fc35cebbfff8fba
 PYTHON_MAGIC_WORMHOLE_SETUP_TYPE = setuptools
 PYTHON_MAGIC_WORMHOLE_LICENSE = MIT
 PYTHON_MAGIC_WORMHOLE_LICENSE_FILES = LICENSE
+PYTHON_MAGIC_WORMHOLE_DEPENDENCIES = host-python-versioneer
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
