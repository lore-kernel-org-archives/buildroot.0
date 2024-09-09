Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B8AECE587
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 19:11:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CB5D380BCF;
	Mon,  9 Sep 2024 19:11:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-HES3-0ntJ7; Mon,  9 Sep 2024 19:11:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE1B680BEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE1B680BEE;
	Mon,  9 Sep 2024 19:11:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 408D61BF313
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E52C80B25
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 19:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GryauS0WfnIz for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AE3C80B5B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4AE3C80B5B
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 376AD86EBD; Mon,  9 Sep 2024 19:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 9 Sep 2024 21:05:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37c397c8b691495b21623b7d0a4d1e5ee7f0f61e
X-Git-Newrev: 9022c0ca00615ed11e92420194fcd4d8ad3bf5b6
X-Patchwork-Hint: ignore
Message-Id: <20240909191137.376AD86EBD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic-core: bump to
 version 2.23.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9022c0ca00615ed11e92420194fcd4d8ad3bf5b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While we're at it, also fix the _SOURCE variable so it contains the
-cargo2 suffix. Without this change, the downloaded tarball name
pre-vendoring is the same as post-vendoring and is thus overwritten.
This change was actually done in commit
c617ebbc977d28c5c0ebc7d3bdfa3888f432640c, but then forgotten when the
python-pydantic-core temporarily switched to upstream git instead of
PyPI.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 3554d0c0f6..39f64e760f 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  87cee9e796c31e3470dd13675286f13d58084e4362dae9288a9fa45b1264c084  pydantic_core-2.20.1.tar.gz
+sha256  4d2ad4888a80e06641bfe6a950fa2390ac59a6b0cf0f4e03574122b4b5bcc6a4  python-pydantic-core-2.23.2-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 4332c4f6a6..aad7988fff 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = 2.20.1
-PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
-PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/12/e3/0d5ad91211dba310f7ded335f4dad871172b9cc9ce204f5a56d76ccd6247
+PYTHON_PYDANTIC_CORE_VERSION = 2.23.2
+PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/5f/03/54e4961dfaed4804fea0ad73e94d337f4ef88a635e73990d6e150b469594
+PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
