Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B0BCA0FF6
	for <buildroot@archiver.kernel.org>; Thu, 28 Aug 2025 20:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 450B061147;
	Thu, 28 Aug 2025 20:35:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hZV9kpgZxidr; Thu, 28 Aug 2025 20:35:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61CF861155
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61CF861155;
	Thu, 28 Aug 2025 20:35:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 73AF092D
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6601A61147
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2KJO2ksS60s for <buildroot@buildroot.org>;
 Thu, 28 Aug 2025 20:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1EBF61145
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1EBF61145
 for <buildroot@buildroot.org>; Thu, 28 Aug 2025 20:35:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE0E887C70; Thu, 28 Aug 2025 20:35:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 Aug 2025 22:15:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f87067d742043faa7efd10688747fd6af149de5c
X-Git-Newrev: 0bd88146ee355109faf55f73133dc8d8632d8ba1
X-Patchwork-Hint: ignore
Message-Id: <20250828203527.DE0E887C70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] python-yarl: bump to v1.20.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0bd88146ee355109faf55f73133dc8d8632d8ba1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the python-cython bump to v3.1.2 (see [1]), python-yarl has been
failing on the autobuilder with the following error message:

```
ERROR Missing dependencies:
	Cython~=3.0.0; python_version >= "3.12"
make: *** [package/pkg-generic.mk:273: /home/buildroot/instance-0/output-1/build/python-yarl-1.18.3/.stamp_built] Error 1
```

The cython dependency has been addressed in python-yarl v1.20.1, for
more information see the github issue [2].

For more information on the release, see:

  - https://github.com/aio-libs/yarl/releases/tag/v1.19.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.0
  - https://github.com/aio-libs/yarl/releases/tag/v1.20.1

[1] b536caaec0 package/python-cython: bump to version 3.1.2
[2] https://github.com/aio-libs/yarl/pull/1514

Fixes: https://autobuild.buildroot.org/results/d36/d367b69b85a65fa94e923ecff3ba03723b2a6e88
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index ca2d42bf58..43ba31f81f 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  80b89d2b28be7345a38f099b2f839d7d  yarl-1.18.3.tar.gz
-sha256  ac1801c45cbf77b6c99242eeff4fffb5e4e73a800b5c4ad4fc0be5def634d2e1  yarl-1.18.3.tar.gz
+md5  23352fbc2b165825d4a33682c91788bc  yarl-1.20.1.tar.gz
+sha256  d017a4997ee50c91fd5466cef416231bb82177b93b029906cefc542ce14c35ac  yarl-1.20.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index 160dec8a1b..4f25394c8b 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.18.3
+PYTHON_YARL_VERSION = 1.20.1
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/b7/9d/4b94a8e6d2b51b599516a5cb88e5bc99b4d8d4583e468057eaa29d5f0918
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/3c/fb/efaa23fa4e45537b827620f04cf8f3cd658b76642205162e072703a5b963
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
