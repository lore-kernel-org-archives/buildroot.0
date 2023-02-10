Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F1B0C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07699700A2;
	Tue, 21 Feb 2023 01:53:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07699700A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Tgwbkr_XXhM; Tue, 21 Feb 2023 01:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B3FC701A4;
	Tue, 21 Feb 2023 01:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3B3FC701A4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CC18D1BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5A54E7001B
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5A54E7001B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XxSGjdAFK35m for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E61770012
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E61770012
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7E86E828C8; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 16:36:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd
X-Git-Newrev: 1613273542554776b089b3df2b6b71c1af2cc0da
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.7E86E828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-flit-core: set
 license path
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
Content-Type: multipart/mixed; boundary="===============2122688638273657585=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2122688638273657585==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1613273542554776b089b3df2b6b71c1af2cc0da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When generating legal info with a configuration enabling a package which uses
flit as setup type, we get a warning about python-flit-core license:
WARNING: python-flit-core-3.8.0: cannot save license (HOST_PYTHON_FLIT_CORE_LICENSE_FILES not defined)

Add missing variable to point to python-flit-core license file

Signed-off-by: Alexis Lothoré <alexis.lothore@bootlin.com>
[Peter: add sha256sum to .hash file]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-flit-core/python-flit-core.hash | 2 ++
 package/python-flit-core/python-flit-core.mk   | 1 +
 2 files changed, 3 insertions(+)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index 9281635f1a..f63a64ed1b 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,3 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
 md5  7c41da13273f7787709a24f74e0f5a99  flit_core-3.8.0.tar.gz
 sha256  b305b30c99526df5e63d6022dd2310a0a941a187bd3884f4c8ef0418df6c39f3  flit_core-3.8.0.tar.gz
+# Locally computed
+sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index 4d7bee81da..f96191ade6 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -8,6 +8,7 @@ PYTHON_FLIT_CORE_VERSION = 3.8.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
 PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/10/e5/be08751d07b30889af130cec20955c987a74380a10058e6e8856e4010afc
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
+PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
 
 # Use flit built in bootstrap_install for installing host-python-flit-core.

--===============2122688638273657585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2122688638273657585==--
