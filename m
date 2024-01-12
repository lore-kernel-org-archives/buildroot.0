Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697F2C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 16:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21EB36FB13;
	Fri, 12 Jan 2024 16:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21EB36FB13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rA9ChqLVXbCE; Fri, 12 Jan 2024 16:40:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE8E66FAFA;
	Fri, 12 Jan 2024 16:40:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE8E66FAFA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D7911BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 01D1243A7F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 16:40:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01D1243A7F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eDFax8RrF_xl for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DABBF43A93
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DABBF43A93
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C400785D60; Fri, 12 Jan 2024 16:40:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 16:25:33 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: bd8751b7b6e3b798eaf44f9b502a66041c76d95c
X-Git-Newrev: 466c72828cd5df58532cde21c3cfdac346e5dd70
X-Patchwork-Hint: ignore
Message-Id: <20240112164019.C400785D60@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-werkzeug:
 security bump to version 2.3.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=466c72828cd5df58532cde21c3cfdac346e5dd70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Fix slow multipart parsing for large parts potentially enabling DoS
attacks (CVE-2023-46136):
https://github.com/pallets/werkzeug/security/advisories/GHSA-hrfv-mqp8-q5rw

https://werkzeug.palletsprojects.com/en/2.3.x/changes/#version-2-3-8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b8bacbfb9762e4c2dc58fd36d2bddc91f033e21e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-werkzeug/python-werkzeug.hash | 4 ++--
 package/python-werkzeug/python-werkzeug.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 07b6f2f40d..34adc67088 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  de26f240d6f95689a8d15170c2d958b6  Werkzeug-2.3.6.tar.gz
-sha256  98c774df2f91b05550078891dee5f0eb0cb797a522c757a2452b9cee5b202330  Werkzeug-2.2.3.tar.gz
+md5  3bb49cd2f2b51a1c638532e9a935e207  werkzeug-2.3.8.tar.gz
+sha256  554b257c74bbeb7a0d254160a4f8ffe185243f52a52035060b761ca62d977f03  werkzeug-2.3.8.tar.gz
 # Locally computed sha256 checksums
 sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index 3b7c663437..e8ef32bb1b 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.3.6
-PYTHON_WERKZEUG_SOURCE = Werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/d1/7e/c35cea5749237d40effc50ed1a1c7518d9f2e768fcf30b4e9ea119e74975
+PYTHON_WERKZEUG_VERSION = 2.3.8
+PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/3d/4b/d746f1000782c89d6c97df9df43ba8f4d126038608843d3560ae88d201b5
 PYTHON_WERKZEUG_SETUP_TYPE = setuptools
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
 PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
