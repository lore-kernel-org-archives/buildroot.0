Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEBAC04E69
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 20:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C31981E52;
	Mon,  7 Aug 2023 20:22:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C31981E52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sb3cLgue-u4T; Mon,  7 Aug 2023 20:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3630081E1D;
	Mon,  7 Aug 2023 20:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3630081E1D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB2F71BF287
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 84B0881E1D
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 20:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84B0881E1D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42xBFGfW84xc for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 20:22:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A51E081B6D
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 20:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A51E081B6D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95BEA846D0; Mon,  7 Aug 2023 20:22:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 22:21:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9fa3799dfaa0cc08ff787a09e1f5b68e9bd4eef2
X-Git-Newrev: d1508c9d5cb6bcb297bf7945db20eade350ed613
X-Patchwork-Hint: ignore
Message-Id: <20230807202245.95BEA846D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-botocore: bump to version
 1.31.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=d1508c9d5cb6bcb297bf7945db20eade350ed613
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
we broke compatibility with python-botocore.

This compatibility error was fixed upstream in botocore 1.29.122:
https://github.com/boto/botocore/commit/0a6d8e3c6325da395a04227599cfa292190d6841

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561482

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Tested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 89f4c06de8..1f5e5c0d3b 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  805e638c353c532c2af7a7538d5bd4d6  botocore-1.29.115.tar.gz
-sha256  58eee8cf8f4f3e515df29f6dc535dd86ed3f4cea40999c5bc74640ff40bdc71f  botocore-1.29.115.tar.gz
+md5  efadef54dc1959898a42d4cae949572f  botocore-1.31.20.tar.gz
+sha256  485ef175cd011ebc965f4577d8cc02a226c46bd608dd2bb75ce6938328cff0fd  botocore-1.31.20.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 3e828fef78..b76d1c64d7 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.29.115
+PYTHON_BOTOCORE_VERSION = 1.31.20
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/9e/00/4560081a431aaa14c2257040d43f56c2ccba816d8bce3b8e1577a19f4076
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/f9/0d/ec24cb66b7651268462d5eb5d9d3c140a99f487db3ed58a45617991b11e8
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
