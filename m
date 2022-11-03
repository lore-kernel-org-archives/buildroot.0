Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E5FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 21:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A2FF181FBC;
	Thu,  3 Nov 2022 21:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A2FF181FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G6oJBABACGzm; Thu,  3 Nov 2022 21:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA12881EFC;
	Thu,  3 Nov 2022 21:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA12881EFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 157E61BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A62D740C2B
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:55:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A62D740C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fMFP7ntMiR-p for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:55:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 261B540BDC
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 261B540BDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 16F2F87BCA; Thu,  3 Nov 2022 20:55:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 3 Nov 2022 21:03:35 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 2f4b2e8fb6984789bfcc7eff30fbecf2f51b8665
X-Git-Newrev: d2ccca7470426f25244684e0cf86b031ec0add96
X-Patchwork-Hint: ignore
Message-Id: <20221103205511.16F2F87BCA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-daphne: bump to
 version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d2ccca7470426f25244684e0cf86b031ec0add96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixup remove pytest runner patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../python-daphne/0001-remove-pytest-runner-requirement.patch  | 10 +++++-----
 package/python-daphne/python-daphne.hash                       |  6 +++---
 package/python-daphne/python-daphne.mk                         |  4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/package/python-daphne/0001-remove-pytest-runner-requirement.patch b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
index 30acf201d6..70cdb4f19d 100644
--- a/package/python-daphne/0001-remove-pytest-runner-requirement.patch
+++ b/package/python-daphne/0001-remove-pytest-runner-requirement.patch
@@ -15,13 +15,13 @@ index 64e94f1..4e3abb0 100755
 --- a/setup.py
 +++ b/setup.py
 @@ -23,7 +23,6 @@ setup(
-     packages=find_packages() + ["twisted.plugins"],
      include_package_data=True,
-     install_requires=["twisted[tls]>=18.7", "autobahn>=0.18", "asgiref~=3.2"],
+     install_requires=["twisted[tls]>=22.4", "autobahn>=22.4.2", "asgiref>=3.5.2,<4"],
+     python_requires=">=3.7",
 -    setup_requires=["pytest-runner"],
-     extras_require={
-         "tests": ["hypothesis~=3.88", "pytest~=3.10", "pytest-asyncio~=0.8"]
-     },
+     extras_require={"tests": ["hypothesis", "pytest", "pytest-asyncio", "django"]},
+     entry_points={
+         "console_scripts": ["daphne = daphne.cli:CommandLineInterface.entrypoint"]
 -- 
 2.21.0
 
diff --git a/package/python-daphne/python-daphne.hash b/package/python-daphne/python-daphne.hash
index f80d7175cb..90d053bff6 100644
--- a/package/python-daphne/python-daphne.hash
+++ b/package/python-daphne/python-daphne.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/daphne/json
-md5  564353eaed92659e3b113d966a0288f2  daphne-2.4.1.tar.gz0
-sha256  1e41d02d78da373c1f8504835cdca6d447b5d64c2941661d4bd968d412b6c383  daphne-2.4.1.tar.gz
-# Locally computed sha256
+md5  f0dcc0618459ad7d25508704f9505b56  daphne-4.0.0.tar.gz
+sha256  cce9afc8f49a4f15d4270b8cfb0e0fe811b770a5cc795474e97e4da287497666  daphne-4.0.0.tar.gz
+# Locally computed sha256 checksums
 sha256  b846415d1b514e9c1dff14a22deb906d794bc546ca6129f950a18cd091e2a669  LICENSE
diff --git a/package/python-daphne/python-daphne.mk b/package/python-daphne/python-daphne.mk
index cd4739db19..c08088278e 100644
--- a/package/python-daphne/python-daphne.mk
+++ b/package/python-daphne/python-daphne.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DAPHNE_VERSION = 2.4.1
+PYTHON_DAPHNE_VERSION = 4.0.0
 PYTHON_DAPHNE_SOURCE = daphne-$(PYTHON_DAPHNE_VERSION).tar.gz
-PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/03/6c/847d1c962f8c45aa2ab0791583c4a41669d158e28fd6369ce940b8ea8417
+PYTHON_DAPHNE_SITE = https://files.pythonhosted.org/packages/d7/77/57b19d5caabf8537879aa4cf3a017b99d0b727f2521ffca7fd9140573509
 PYTHON_DAPHNE_SETUP_TYPE = setuptools
 # https://github.com/django/daphne/blob/master/LICENSE
 PYTHON_DAPHNE_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
