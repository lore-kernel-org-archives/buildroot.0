Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71FFC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 11:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B17813D9;
	Mon,  5 Dec 2022 11:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B17813D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XryAnfKYHhM3; Mon,  5 Dec 2022 11:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id ADD83813CE;
	Mon,  5 Dec 2022 11:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADD83813CE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F8021BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED7BA41678
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED7BA41678
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yfcUGXHJ7o_t for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C66D4163E
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C66D4163E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A78F85BA2; Mon,  5 Dec 2022 11:26:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 22:02:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55fb5ddec854e6298a2c5454cbadb1a3fdc8cb84
X-Git-Newrev: 3164c0983ab0fa76c8c70ccb02164ad5085d7a65
X-Patchwork-Hint: ignore
Message-Id: <20221205112606.2A78F85BA2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tqdm: bump to version 4.64.1
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3164c0983ab0fa76c8c70ccb02164ad5085d7a65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new host-python-setuptools-scm build dependency.

License has changed due to file->project word change:
https://github.com/tqdm/tqdm/commit/5df32ae36013ed056619aa0b90f7d249d04087fa

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-tqdm/python-tqdm.hash | 6 +++---
 package/python-tqdm/python-tqdm.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 8251ae48d2..4be54de7de 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/tqdm
-md5  285af1f905f4c375f03a86a667047950  tqdm-4.40.1.tar.gz
-sha256  e405d16c98fcf30725d0c9d493ed07302a18846b5452de5253030ccd18996f87  tqdm-4.40.1.tar.gz
+md5  5822af464d77ea156ad1167c23e1bdac  tqdm-4.64.1.tar.gz
+sha256  5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4  tqdm-4.64.1.tar.gz
 # Locally computed sha256 checksums
-sha256  1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
+sha256  a0fc1785a8f2a200a3124d703d49550601b7741ccffc861713c2ddaa07a537dd  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 5ceddde14c..a6296bd0f5 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.40.1
+PYTHON_TQDM_VERSION = 4.64.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/4c/45/830c5c4bfaba60ef7d356a53c7751a86c81d148a16fda0daf3ac5ca8e288
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/c1/c2/d8a40e5363fb01806870e444fc1d066282743292ff32a9da54af51ce36a2
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
 PYTHON_TQDM_CPE_ID_VENDOR = tqdm_project
 PYTHON_TQDM_CPE_ID_PRODUCT = tqdm
+PYTHON_TQDM_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
