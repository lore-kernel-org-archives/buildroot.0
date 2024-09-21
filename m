Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3524BCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 21:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 710CD60A5C;
	Sat, 21 Sep 2024 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iUBgAIoJ35pB; Sat, 21 Sep 2024 21:10:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 06FB1608D9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 06FB1608D9;
	Sat, 21 Sep 2024 21:10:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE271BF473
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E6866075A
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 21:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2rckpVZU2b7O for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 21:07:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3707D60784
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3707D60784
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 29A0484150; Sat, 21 Sep 2024 21:07:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 22:53:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2f036c20159572bbb910041cb7cba881dc61fef
X-Git-Newrev: d5463c142fa02a52836a345323c8c087c21429d0
X-Patchwork-Hint: ignore
Message-Id: <20240921210743.29A0484150@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pysmi: bump to version 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d5463c142fa02a52836a345323c8c087c21429d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-jinja2 and python-requests runtime dependencies.

Migrate from setuptools to poetry build backend.

License hash changed due to formatting changes:
https://github.com/lextudio/pysmi/commit/8341b2e13421739cb3f284c1bf725ab56f7af15a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-pysmi/Config.in         | 2 ++
 package/python-pysmi/python-pysmi.hash | 6 +++---
 package/python-pysmi/python-pysmi.mk   | 7 ++++---
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/package/python-pysmi/Config.in b/package/python-pysmi/Config.in
index 2e4453d886..d30e24afd1 100644
--- a/package/python-pysmi/Config.in
+++ b/package/python-pysmi/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYSMI
 	bool "python-pysmi"
+	select BR2_PACKAGE_PYTHON_JINJA2 # runtime
 	select BR2_PACKAGE_PYTHON_PLY # runtime
+	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	help
 	  SNMP SMI/MIB Parser.
 
diff --git a/package/python-pysmi/python-pysmi.hash b/package/python-pysmi/python-pysmi.hash
index bb13f0ef00..729b980032 100644
--- a/package/python-pysmi/python-pysmi.hash
+++ b/package/python-pysmi/python-pysmi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pysmi/json
-md5  10a9dd140ad512eed9f37344df83ce9d  pysmi-0.3.4.tar.gz
-sha256  bd15a15020aee8376cab5be264c26330824a8b8164ed0195bd402dd59e4e8f7c  pysmi-0.3.4.tar.gz
+md5  f99b37bb4a31a9cfaedc8b7f269ad7b8  pysmi-1.5.0.tar.gz
+sha256  e42bcd3961de71d58186f7a7fa6adac133701ae74cd19e6376289d89593b0af2  pysmi-1.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c43704eafcfa2bc33e56168f2b498c3c34a1d7865855626a52b5af411fc5837f  LICENSE.rst
+sha256  46aa9a218d0f066d2565b826b08872227480e93f561eadf4d994213b08882b8a  LICENSE.rst
diff --git a/package/python-pysmi/python-pysmi.mk b/package/python-pysmi/python-pysmi.mk
index 2aee27b186..f747864def 100644
--- a/package/python-pysmi/python-pysmi.mk
+++ b/package/python-pysmi/python-pysmi.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_PYSMI_VERSION = 0.3.4
+PYTHON_PYSMI_VERSION = 1.5.0
 PYTHON_PYSMI_SOURCE = pysmi-$(PYTHON_PYSMI_VERSION).tar.gz
-PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/52/42/ddaeb06ff551672b17b77f81bc2e26b7c6060b28fe1552226edc6476ce37
-PYTHON_PYSMI_SETUP_TYPE = setuptools
+PYTHON_PYSMI_SITE = https://files.pythonhosted.org/packages/59/d9/136ca19b66a917377a3b40f390f525eeeb21122dba7562a726bfb2d3629e
+PYTHON_PYSMI_SETUP_TYPE = pep517
 PYTHON_PYSMI_LICENSE = BSD-2-Clause
 PYTHON_PYSMI_LICENSE_FILES = LICENSE.rst
+PYTHON_PYSMI_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
