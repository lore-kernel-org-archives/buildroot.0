Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24EA5EEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EED734086E;
	Thu,  1 Jan 2026 09:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JKqVjGh8DrTV; Thu,  1 Jan 2026 09:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F8434086F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260587;
	bh=LYx9NGuAHsX0bper6TZrhiKJQ/QjgXcyCJBMMsI43Qg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Yqbp1bceDpUmounN19hJdgzkCx3ljyynKUiRciNlZ1lq6l6Ww+gtQSiTDQTZwjP9k
	 KxlFQZVNIx5pjKhVbv1cHP932cd6bAYlXFbNOrin4MRwfAT177o7DSP5k3iOP3126E
	 xREsKt4nYa2Bwoa526wMwq95f2xkoIjbSUrEMITd4ypN1+XJk+2aCMm7YjlzCwwzXP
	 q961Wl19xLhNODxNO8y4M/m+ZXrLJBzcIzpv9G62n5zNWwZmXG7SNF9eNQVGEs/Pov
	 0nrfd69QGNU3L7wpeTBebZfOZMkBQY3Wzb4Gg8aoiG4u6FjlLLSvLKbZaPeQh+gxqr
	 MVYHhWz8MeAUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F8434086F;
	Thu,  1 Jan 2026 09:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE22206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BC381511
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2MF7EVXij8DC for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 016A481545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 016A481545
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F3A7887CDE; Thu,  1 Jan 2026 09:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4a5d35a5f0b35b8f2dd11e5aa4de6411b414e77
X-Git-Newrev: 902e711f105f335da2c92d4578b81640f835c077
X-Patchwork-Hint: ignore
Message-Id: <20260101094232.F3A7887CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyparted: bump to version
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=902e711f105f335da2c92d4578b81640f835c077
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License file renamed with no content changes:
https://github.com/dcantrell/pyparted/commit/78876337d9e0037fc8034f839c2b918a99d05e3b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyparted/python-pyparted.hash | 6 +++---
 package/python-pyparted/python-pyparted.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyparted/python-pyparted.hash b/package/python-pyparted/python-pyparted.hash
index a13276ce79..421fe26309 100644
--- a/package/python-pyparted/python-pyparted.hash
+++ b/package/python-pyparted/python-pyparted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparted/json
-md5  97df779564210100ea3e4eda0d33f7b9  pyparted-3.12.0.tar.gz
-sha256  da985e116beb733371feb605b174db9eec8bd0eedffc8f739f8e603f51b521e7  pyparted-3.12.0.tar.gz
+md5  70f1346ab01fb752d38c181a285a64d0  pyparted-3.13.0.tar.gz
+sha256  443b59eb9ac63b8ca87094e02376646e172c7ea075f955f105889ca3485b06fd  pyparted-3.13.0.tar.gz
 # Locally computed sha256 checksums
-sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
+sha256  91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  LICENSE
diff --git a/package/python-pyparted/python-pyparted.mk b/package/python-pyparted/python-pyparted.mk
index 5e12995e2e..e8b15fecf7 100644
--- a/package/python-pyparted/python-pyparted.mk
+++ b/package/python-pyparted/python-pyparted.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYPARTED_VERSION = 3.12.0
+PYTHON_PYPARTED_VERSION = 3.13.0
 PYTHON_PYPARTED_SOURCE = pyparted-$(PYTHON_PYPARTED_VERSION).tar.gz
-PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/c2/d0/d32aa5758d6567eef620075f5c84f475c93bb1bf8da9d17051ce3ef055db
+PYTHON_PYPARTED_SITE = https://files.pythonhosted.org/packages/e7/53/b02306f89dc3eaf949659e8814545cde575867bc0175f60361809af7f71a
 PYTHON_PYPARTED_SETUP_TYPE = setuptools
 PYTHON_PYPARTED_LICENSE = GPL-2.0+
-PYTHON_PYPARTED_LICENSE_FILES = COPYING
+PYTHON_PYPARTED_LICENSE_FILES = LICENSE
 PYTHON_PYPARTED_DEPENDENCIES = parted
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
