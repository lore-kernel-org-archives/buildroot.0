Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BFCC48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E6D241579;
	Tue,  6 Feb 2024 15:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E6D241579
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IxjYgFDHFiKI; Tue,  6 Feb 2024 15:19:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 16A8C4159A;
	Tue,  6 Feb 2024 15:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 16A8C4159A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B7F591BF215
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC72382998
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hplwU10ZkMjU for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2DBE82A0B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2DBE82A0B
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB8B5870F5; Tue,  6 Feb 2024 15:18:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 16:18:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc68e20d8525408389866b15f492e9911f92cbe8
X-Git-Newrev: 9d7b0259e21335c8da8566a581ef84d785d5a861
X-Patchwork-Hint: ignore
Message-Id: <20240206151815.CB8B5870F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pygments: bump to version
 2.17.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9d7b0259e21335c8da8566a581ef84d785d5a861
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 9714fd2ea0..a742a05e52 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  e40631bb812bbd15954027c23b23013a  Pygments-2.15.1.tar.gz
-sha256  8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c  Pygments-2.15.1.tar.gz
+md5  7c059773b0f4808f9402eb0650de6bd4  pygments-2.17.2.tar.gz
+sha256  da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367  pygments-2.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index f151f0061b..e42f613cf1 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.15.1
-PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/89/6b/2114e54b290824197006e41be3f9bbe1a26e9c39d1f5fa20a6d62945a0b3
+PYTHON_PYGMENTS_VERSION = 2.17.2
+PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/55/59/8bccf4157baf25e4aa5a0bb7fa3ba8600907de105ebc22b0c78cfbf6f565
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
 PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
-PYTHON_PYGMENTS_SETUP_TYPE = setuptools
+PYTHON_PYGMENTS_SETUP_TYPE = pep517
+PYTHON_PYGMENTS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
