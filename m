Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09E53FA3751
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D123180BB1;
	Fri,  2 Jan 2026 22:01:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoGdQ7Fpzipx; Fri,  2 Jan 2026 22:01:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9B3280ADE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391273;
	bh=P/RRg7Qs9D4UEZeRByNPCImTtpzQtF0MhrocMsEsvtE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T9xT/scjGUhIr0Cm9azOUyX9qN/xR8rm8k+ohkQH5fGegRPUBjZ/TA0YkAHZr2+n+
	 En49vPuEI1IejOBR/jNqFeGE6khnxeIgyrYaVXssEPWiG8+wP9pSiwi0eAO1nODxjR
	 UE2aRRnOQguaIzNHmtkVFIncNaEgaIzv/pD8ej8R3TiLVxOQz4AJJKOutiPozh9LQV
	 oor56dyIuDhho2UCuv+9RM9JC+3jyAowoBcsoJkCO2VX+k7w3KGpOofam4OGOWklaL
	 qJ1WIw+9cF65u0pCoyyGzYlEFSdg9DPTxVyk73g+/NHkUwNJf0XOoFxsG+IfSGatAD
	 61/K1toMZp5dw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9B3280ADE;
	Fri,  2 Jan 2026 22:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 38C2419D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 335A960625
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FWBpgEp-4xGF for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6A1D460633
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A1D460633
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 68D8E80E31; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:00:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c53d5ef5c6179a742d5057a3266d046b3e5f9962
X-Git-Newrev: d492ff7912c20626c190d5b455edb7777058e3fc
X-Patchwork-Hint: ignore
Message-Id: <20260102220105.68D8E80E31@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-logbook: bump to version
 1.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=d492ff7912c20626c190d5b455edb7777058e3fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools cython based build to setuptools-rust.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-logbook/Config.in           |  2 ++
 package/python-logbook/python-logbook.hash |  5 ++---
 package/python-logbook/python-logbook.mk   | 10 +++++-----
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/package/python-logbook/Config.in b/package/python-logbook/Config.in
index 99996b6517..8950ee234a 100644
--- a/package/python-logbook/Config.in
+++ b/package/python-logbook/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_LOGBOOK
 	bool "python-logbook"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON3_ZLIB
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  A logging replacement for Python.
 
diff --git a/package/python-logbook/python-logbook.hash b/package/python-logbook/python-logbook.hash
index 361ea9921e..de75a97e72 100644
--- a/package/python-logbook/python-logbook.hash
+++ b/package/python-logbook/python-logbook.hash
@@ -1,5 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/logbook/json
-md5  d15918a5745349eefab327661454527d  logbook-1.8.0.tar.gz
-sha256  487fa41539787bfa21a51fabd7f3ae8ae7f9e6679bb3e241d0f5f18a2fc37e9c  logbook-1.8.0.tar.gz
+# Locally calculated after vendoring
+sha256  1533f03ef76a4d646b14dd00e9982d6ef5d5dc86f134c9bbc1cd98b55fbf566f  python-logbook-1.9.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2ca266337cc6947578654ab0dd6438de4d01fa78b2e6eb554b09757df1178f98  LICENSE
diff --git a/package/python-logbook/python-logbook.mk b/package/python-logbook/python-logbook.mk
index f6ccc1aac6..2bcd48bc2f 100644
--- a/package/python-logbook/python-logbook.mk
+++ b/package/python-logbook/python-logbook.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LOGBOOK_VERSION = 1.8.0
-PYTHON_LOGBOOK_SOURCE = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
-PYTHON_LOGBOOK_SITE = https://files.pythonhosted.org/packages/c3/a2/fafcc4ce7bad34093150e14f9ed179aa53e3e60a5c46e840547bdae26674
-PYTHON_LOGBOOK_SETUP_TYPE = setuptools
+PYTHON_LOGBOOK_VERSION = 1.9.2
+PYTHON_LOGBOOK_SOURCE_PYPI = logbook-$(PYTHON_LOGBOOK_VERSION).tar.gz
+PYTHON_LOGBOOK_SITE_PYPI = https://files.pythonhosted.org/packages/f2/cf/e39c249003caaa7f84e2b00c11c7423892d525f8136ff349f9914914a744
+PYTHON_LOGBOOK_SITE = $(PYTHON_LOGBOOK_SITE_PYPI)/$(PYTHON_LOGBOOK_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_LOGBOOK_SETUP_TYPE = setuptools-rust
 PYTHON_LOGBOOK_LICENSE = BSD-3-Clause
 PYTHON_LOGBOOK_LICENSE_FILES = LICENSE
-PYTHON_LOGBOOK_DEPENDENCIES = host-python-cython
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
