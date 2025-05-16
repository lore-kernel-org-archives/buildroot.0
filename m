Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38967C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB776F70E;
	Mon, 19 May 2025 10:48:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIMjjg_eTwNa; Mon, 19 May 2025 10:48:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4334A6F722
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4334A6F722;
	Mon, 19 May 2025 10:48:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 46762D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E40FD41928
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nsos23HHbzlH for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 289304180E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 289304180E
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25BEA873D4; Mon, 19 May 2025 10:40:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 16:51:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 69ac2100c61edc9260c557212ff5d9c7f3be293e
X-Git-Newrev: 253f53a155fa85e4d68eb3c51232d269b4fd373e
X-Patchwork-Hint: ignore
Message-Id: <20250519104005.25BEA873D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 package/python-types-setuptools: new host package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=253f53a155fa85e4d68eb3c51232d269b4fd373e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 .../python-types-setuptools/python-types-setuptools.hash   |  5 +++++
 package/python-types-setuptools/python-types-setuptools.mk | 14 ++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/python-types-setuptools/python-types-setuptools.hash b/package/python-types-setuptools/python-types-setuptools.hash
new file mode 100644
index 0000000000..de273aa77e
--- /dev/null
+++ b/package/python-types-setuptools/python-types-setuptools.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/types-setuptools/json
+md5  8df05b03cbdda63e797f38543483138e  types_setuptools-75.6.0.20241223.tar.gz
+sha256  d9478a985057ed48a994c707f548e55aababa85fe1c9b212f43ab5a1fffd3211  types_setuptools-75.6.0.20241223.tar.gz
+# Locally computed sha256 checksums
+sha256  295f8538c94ae5c3043301cf7cff1c852dab6a786a8ddee471e061b40d5ecabe  LICENSE
diff --git a/package/python-types-setuptools/python-types-setuptools.mk b/package/python-types-setuptools/python-types-setuptools.mk
new file mode 100644
index 0000000000..4c7df27139
--- /dev/null
+++ b/package/python-types-setuptools/python-types-setuptools.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-types-setuptools
+#
+################################################################################
+
+PYTHON_TYPES_SETUPTOOLS_VERSION = 75.6.0.20241223
+PYTHON_TYPES_SETUPTOOLS_SOURCE = types_setuptools-$(PYTHON_TYPES_SETUPTOOLS_VERSION).tar.gz
+PYTHON_TYPES_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/53/48/a89068ef20e3bbb559457faf0fd3c18df6df5df73b4b48ebf466974e1f54
+PYTHON_TYPES_SETUPTOOLS_SETUP_TYPE = setuptools
+PYTHON_TYPES_SETUPTOOLS_LICENSE = Apache-2.0
+PYTHON_TYPES_SETUPTOOLS_LICENSE_FILES = LICENSE
+
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
