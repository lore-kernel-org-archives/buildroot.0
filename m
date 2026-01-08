Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFAED185C6
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 11:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE275605C7;
	Thu,  8 Jan 2026 11:11:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NFnRzFvdjM6h; Thu,  8 Jan 2026 11:11:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E96060A38
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767870660;
	bh=Mb0mhNGIx+pdcn8fvJx0RVfXo9CEzDEt/qSil+tyMbw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=clQ9lfIlLFMF5sBGhQR5SPUsRT74a2dEDqHer57eWrKg8Vhvmh+P8pVZcfaD4W8kz
	 2FxfU8hisSPVbBF82M1UfopHLVuXn8OcODOlzUbZ1w6ua4g3Za6DTOXeZYog6XmB1T
	 dz9q6h9d2NQXFmYuekGAsup7P+YqPMX8z0m2KdPGcf/u9YmDcSuVZDyauq27KccdiW
	 xzlYAivOxgz7DOJ8+DLni3NIxnonLX9ynrcaxUpBfnpM9QMjkCFJxEp8lsP59VxTeh
	 /09A2GmPxiCLRctop0tU+aImOD3WMHGuooysS7oV4Ve816HuGCejACZiOnbt+hqYdj
	 rb2sRyYDogw0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E96060A38;
	Thu,  8 Jan 2026 11:11:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C49F3436
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAEBB80AF9
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8UYwdWcRZci for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 11:10:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9D1280AFD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9D1280AFD
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 11:10:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4FB688494; Thu,  8 Jan 2026 11:10:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 8 Jan 2026 12:07:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3e5fa2e9d207abfc4a6c4ff813b5e95af0e6b822
X-Git-Newrev: 1b86e51016f8e17647a462aa0b78c8878c4880fa
X-Patchwork-Hint: ignore
Message-Id: <20260108111055.E4FB688494@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-marshmallow: bump to
 version 4.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=1b86e51016f8e17647a462aa0b78c8878c4880fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-packaging runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-marshmallow/Config.in               | 1 -
 package/python-marshmallow/python-marshmallow.hash | 4 ++--
 package/python-marshmallow/python-marshmallow.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-marshmallow/Config.in b/package/python-marshmallow/Config.in
index cc1b42f465..7c4048760c 100644
--- a/package/python-marshmallow/Config.in
+++ b/package/python-marshmallow/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_MARSHMALLOW
 	bool "python-marshmallow"
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	help
 	  A lightweight library for converting complex datatypes to
 	  and from native Python datatypes.
diff --git a/package/python-marshmallow/python-marshmallow.hash b/package/python-marshmallow/python-marshmallow.hash
index fb11bca0ac..bce3e58f6e 100644
--- a/package/python-marshmallow/python-marshmallow.hash
+++ b/package/python-marshmallow/python-marshmallow.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow/json
-md5  6c6ccf9a63b69844257dbb6cbc45d593  marshmallow-4.1.2.tar.gz
-sha256  083f250643d2e75fd363f256aeb6b1af369a7513ad37647ce4a601f6966e3ba5  marshmallow-4.1.2.tar.gz
+md5  09036899f9ccc33eafc5c7d7040952d2  marshmallow-4.2.0.tar.gz
+sha256  908acabd5aa14741419d3678d3296bda6abe28a167b7dcd05969ceb8256943ac  marshmallow-4.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
 sha256  f982e6fd97ba00973e94605b972ff04894b22c4fa937b868828b32ae8f0a7c2e  docs/license.rst
diff --git a/package/python-marshmallow/python-marshmallow.mk b/package/python-marshmallow/python-marshmallow.mk
index 7879fa0ede..d748774246 100644
--- a/package/python-marshmallow/python-marshmallow.mk
+++ b/package/python-marshmallow/python-marshmallow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_VERSION = 4.1.2
+PYTHON_MARSHMALLOW_VERSION = 4.2.0
 PYTHON_MARSHMALLOW_SOURCE = marshmallow-$(PYTHON_MARSHMALLOW_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/e9/e1/5edfd1edf05d3cc98415b0810ca45fa19d7dee6def0d0ec639eb4eb14e20
+PYTHON_MARSHMALLOW_SITE = https://files.pythonhosted.org/packages/bc/34/55d47aab1ef03fb5aab96257a31acfc58791d274cf86c044e6e75e6d3bfe
 PYTHON_MARSHMALLOW_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_LICENSE = MIT
 PYTHON_MARSHMALLOW_LICENSE_FILES = LICENSE docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
