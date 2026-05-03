Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E603CD342F
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5FC96126F;
	Sun,  3 May 2026 14:51:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9sLYXlNPTmD; Sun,  3 May 2026 14:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00C6861505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819871;
	bh=IwaLw8IDbozMUxRDhoZZNaQFwU1Ho9X1MODFQcM2QAI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nPVdokkSTvjX8qFWBT4cMQx9l/fJ0fDpyzXVrWMeGCpRzjABZkDJ783hekl9OEorY
	 SfMG4Ll7cnasLxjkH6e4bSZs8ImMD54YOIPhj5rrlBXLGo29welkavZg4rBG8nY4+P
	 FbwIkTj2lljFZ4XvNoIUnC4+04JHgKNtWNO5PFt9mpLWVsgFxh44qRgJ6riZdGzXoA
	 xT4/A14NXmbBN66tMunql6L6cPu005QkdRxANcx5zji6EIa0okAwaD+qoOLnBNTxcv
	 Xy6DIKlTePD9xQkwpMFZt3XIrtxZ0wSlMFt5h45CSjay9S7cBKMQDA4uF9n6SBBjr1
	 0eimAFMUd9rWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00C6861505;
	Sun,  3 May 2026 14:51:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E52BB127
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CAD07612C1
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4JPsC17geJyp for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C23E9612E1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C23E9612E1
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88AF583FAE; Sun,  3 May 2026 14:50:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9df1d5653007ad0e24306860f3856930e293bf2c
X-Git-Newrev: 5acf70b92e95c33d9987bc49cbe8095a2c66cd62
X-Patchwork-Hint: ignore
Message-Id: <20260503145041.88AF583FAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pymodbus: bump version to
 3.13.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5acf70b92e95c33d9987bc49cbe8095a2c66cd62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pymodbus-dev/pymodbus/blob/v3.13.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pymodbus/python-pymodbus.hash | 4 ++--
 package/python-pymodbus/python-pymodbus.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pymodbus/python-pymodbus.hash b/package/python-pymodbus/python-pymodbus.hash
index ddeeb6afb6..7da0adf9da 100644
--- a/package/python-pymodbus/python-pymodbus.hash
+++ b/package/python-pymodbus/python-pymodbus.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pymodbus/json
-md5  d706a1227df2b0efa613ebbf3996ed40  pymodbus-3.12.1.tar.gz
-sha256  bcb483381747b3e3aec2c8e01d5df885e5ea43f85b7145dc1907af06aca93a2c  pymodbus-3.12.1.tar.gz
+md5  d2db6a8e9ae1688a6ddf227a4c9e5ccd  pymodbus-3.13.0.tar.gz
+sha256  da4c87afe772787620594c564cd8aa8a4c58ff9786382aba9550fe0ce8879f32  pymodbus-3.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  572a4d6fa7541553f70cc6d494fbcbee7eb7d3f2fbd16080d39b20cccda26f0b  LICENSE
diff --git a/package/python-pymodbus/python-pymodbus.mk b/package/python-pymodbus/python-pymodbus.mk
index db12e2943d..2d969b0f65 100644
--- a/package/python-pymodbus/python-pymodbus.mk
+++ b/package/python-pymodbus/python-pymodbus.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYMODBUS_VERSION = 3.12.1
+PYTHON_PYMODBUS_VERSION = 3.13.0
 PYTHON_PYMODBUS_SOURCE = pymodbus-$(PYTHON_PYMODBUS_VERSION).tar.gz
-PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/c8/cf/9ace571421e4ed8bc870e79caca7fe04b7e2529764494f1fb406053640ef
+PYTHON_PYMODBUS_SITE = https://files.pythonhosted.org/packages/3d/55/eee0782c2ca9fa8e7c3218caca22fe30e850cd6c0c0d475c10b8c19e5a36
 PYTHON_PYMODBUS_SETUP_TYPE = setuptools
 PYTHON_PYMODBUS_LICENSE = BSD-3-Clause
 PYTHON_PYMODBUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
