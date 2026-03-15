Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D12FF3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E76E84148E;
	Sun, 15 Mar 2026 22:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c7ocLLLNvb82; Sun, 15 Mar 2026 22:18:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E9A041491
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613135;
	bh=wXOpIL/WaYpGhlPVbaZgiz/SCWDJStmKlHWO9eo/2d8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o3DB+lFUCpnyxcWRHn59/tzzX4RZDbcQ5CgCFg1OE0MzGrPiLggczr4qXCl16SmBL
	 zictDnbUr/9A/MVKKcPVuaphZ55JRWCRpy7QL5di6NAnofoKBgWCCwReEbhtj9DosD
	 6se1P5w9InfGwFnkUqCLTsskebvBuUY+b4n7is1r92+vOBxoZ6/RiBas7JBiM7X91o
	 9yVsJplve80kAE7HEEmYqvSjY6ir5GxxiYoSDb0zSwZhu4nWuvwpdCnobljIMzLliZ
	 JSXvcqZ5BnjV04+LwnkpLFb1+mgg/VFRjhr+UyKSdmOyAgGTEaaFBkD7xzw96AgXKm
	 SLKdXGLW1+Xfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E9A041491;
	Sun, 15 Mar 2026 22:18:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F38A357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB7EC408CD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UiqUoGJZEooG for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 195D1409DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 195D1409DF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5B94385BFF; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7c5d57fe820b2a1f74ce2e0153c2aaff9b24ca2f
X-Git-Newrev: 6a8be79402986d71bb917e7f486a6c863c27ef74
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.5B94385BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump version to
 3.12.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6a8be79402986d71bb917e7f486a6c863c27ef74
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pymodbus-dev/pymodbus/blob/v3.12.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index b1183fba1e..ddeeb6afb6 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  c120f359fa9a0bba0c450efcb93941e9  pymodbus-3.12.0.tar.gz
-sha256  3fafe85e5d82bb9bcbda14b97a0e69a47dc46be55631e9f988adfaf95140c44b  pymodbus-3.12.0.tar.gz
+md5  d706a1227df2b0efa613ebbf3996ed40  pymodbus-3.12.1.tar.gz
+sha256  bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c  pymodbus-3.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index 75c0bdc35a..db12e2943d 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.12.0
+PYTHON_PYMODBUS_VERSION = 3.12.1
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/41/dc/8db192f3a66032e1bd900eb87b5bbcb539d5118f520372af0cb92ba42499
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/c8/cf/9ace571421e4ed8bc870e79caca7fe04b7e2529764494f1fb406053640ef
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
