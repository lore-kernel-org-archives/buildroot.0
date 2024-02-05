Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A98BC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:40:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9AEC840B12;
	Mon,  5 Feb 2024 10:40:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AEC840B12
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jXOMLAinu-QP; Mon,  5 Feb 2024 10:40:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8876B40ADD;
	Mon,  5 Feb 2024 10:40:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8876B40ADD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 18BEE1BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6C8A8220B
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6C8A8220B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TlIg32jQZF8a for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DF6E82244
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DF6E82244
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 093F686AF7; Mon,  5 Feb 2024 10:39:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 11:39:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8129c3c2c5985d2e4eeae6cb05948601d0b59772
X-Git-Newrev: 67b1eb8a6de5378b041cff9a0289a42a6760cbca
X-Patchwork-Hint: ignore
Message-Id: <20240205103947.093F686AF7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyzmq: bump to version
 25.1.2
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=67b1eb8a6de5378b041cff9a0289a42a6760cbca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hashes/names changed due to rename/reformat:
https://github.com/zeromq/pyzmq/pull/1837

Add new host-python-setuptools-scm build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pyzmq/python-pyzmq.hash |  8 ++++----
 package/python-pyzmq/python-pyzmq.mk   | 11 +++++++----
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/package/python-pyzmq/python-pyzmq.hash b/package/python-pyzmq/python-pyzmq.hash
index efbc91d83c..3c91d25995 100644
--- a/package/python-pyzmq/python-pyzmq.hash
+++ b/package/python-pyzmq/python-pyzmq.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pyzmq/json
-md5  f10b7c3dee2c03557e2c5d00b73dfc7f  pyzmq-24.0.1.tar.gz
-sha256  216f5d7dbb67166759e59b0479bca82b8acf9bed6015b526b8eb10143fb08e77  pyzmq-24.0.1.tar.gz
+md5  280afc0992b0a9f109dafc1e672d2f26  pyzmq-25.1.2.tar.gz
+sha256  93f1aa311e8bb912e34f004cf186407a4e90eec4f0ecc0efd26056bf7eda0226  pyzmq-25.1.2.tar.gz
 # Locally computed sha256 checksums
-sha256  aef3b80570351d44e29c22d080d4e9e106b34f3fdbc5cdf9636994474c72b1a2  COPYING.BSD
-sha256  44b23767df3c0fe27f88981f09bc7f50a1695cec4b24252fa5f55f03e76bcd6d  COPYING.LESSER
+sha256  c0cf5f5c03f8d6772f7a271df1cb671054578bd3d79527c72fc1f28f8cc72a7a  LICENSE.BSD
+sha256  5f1dac83d6c25674004810ec9e54b304ccbb8303ac5961813b09235966abfd48  LICENSE.LESSER
diff --git a/package/python-pyzmq/python-pyzmq.mk b/package/python-pyzmq/python-pyzmq.mk
index 5792957eaf..1d9a7d01cb 100644
--- a/package/python-pyzmq/python-pyzmq.mk
+++ b/package/python-pyzmq/python-pyzmq.mk
@@ -4,15 +4,18 @@
 #
 ################################################################################
 
-PYTHON_PYZMQ_VERSION = 24.0.1
+PYTHON_PYZMQ_VERSION = 25.1.2
 PYTHON_PYZMQ_SOURCE = pyzmq-$(PYTHON_PYZMQ_VERSION).tar.gz
-PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/46/0d/b06cf99a64d4187632f4ac9ddf6be99cd35de06fe72d75140496a8e0eef5
+PYTHON_PYZMQ_SITE = https://files.pythonhosted.org/packages/3a/33/1a3683fc9a4bd64d8ccc0290da75c8f042184a1a49c146d28398414d3341
 PYTHON_PYZMQ_LICENSE = LGPL-3.0+, BSD-3-Clause, Apache-2.0
 # Apache license only online: http://www.apache.org/licenses/LICENSE-2.0
-PYTHON_PYZMQ_LICENSE_FILES = COPYING.LESSER COPYING.BSD
-PYTHON_PYZMQ_DEPENDENCIES = host-python-packaging zeromq
+PYTHON_PYZMQ_LICENSE_FILES = LICENSE.LESSER LICENSE.BSD
 PYTHON_PYZMQ_SETUP_TYPE = setuptools
 PYTHON_PYZMQ_BUILD_OPTS = --zmq=$(STAGING_DIR)/usr
+PYTHON_PYZMQ_DEPENDENCIES = \
+	host-python-packaging \
+	host-python-setuptools-scm \
+	zeromq
 
 # Due to issues with cross-compiling, hardcode to the zeromq in BR
 define PYTHON_PYZMQ_PATCH_ZEROMQ_VERSION
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
