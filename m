Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3AF7ECE587
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 19:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 820E480B4C;
	Mon,  9 Sep 2024 19:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id altBwfqfCXR7; Mon,  9 Sep 2024 19:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CD5E380D18
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD5E380D18;
	Mon,  9 Sep 2024 19:11:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56A821BF313
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 417EC80B2B
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sgqAkELGliiL for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3582B80B4D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3582B80B4D
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1EA4E86E8D; Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 20:56:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f85074ec4ee92220ea3fe6c218d2671ec30c9c8a
X-Git-Newrev: ae40223b5dcc69327cba1a534262b3053669c220
X-Patchwork-Hint: ignore
Message-Id: <20240909191137.1EA4E86E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic: bump to version
 2.9.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=ae40223b5dcc69327cba1a534262b3053669c220
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pyproject.toml declared the tzdata package as a required dependency, but
this is in fact only needed on win32. This was fixed upstream [1]. Since
we don't actually check the runtime dependencies from pyproject.toml, we
don't need to do anything in Buildroot.

[1] https://github.com/pydantic/pydantic/pull/10331

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Arnout: remove tzdata runtime dependency]
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pydantic/python-pydantic.hash | 4 ++--
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 6127dcaf37..fd8d16dbb1 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  940d760de174d3567d4f5be28fd215f5  pydantic-2.8.2.tar.gz
-sha256  6f62c13d067b0755ad1c21a34bdd06c0c12625a22b0fc09c6b149816604f7c2a  pydantic-2.8.2.tar.gz
+md5  f328e2d6c3d511a81e358aac6a8636b6  pydantic-2.9.0.tar.gz
+sha256  c7a8a9fdf7d100afa49647eae340e2d23efa382466a8d177efcd1381e9be5598  pydantic-2.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index c549970db9..828658af19 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.8.2
+PYTHON_PYDANTIC_VERSION = 2.9.0
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8c/99/d0a5dca411e0a017762258013ba9905cd6e7baa9a3fd1fe8b6529472902e
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/f6/8f/3b9f7a38caa3fa0bcb3cea7ee9958e89a9a6efc0e6f51fd6096f24cac140
 PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
