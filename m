Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52913CCD1A4
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:39:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B47A80D7D;
	Fri, 17 Oct 2025 16:39:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E09ZYYJQaXoM; Fri, 17 Oct 2025 16:39:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70F38812FA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70F38812FA;
	Fri, 17 Oct 2025 16:39:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D003972
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A40B240B8B
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7N_35pPiW9b for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5318C40B89
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5318C40B89
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E4E287409; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4c6fabc715831dcd664590a1278fde4187d27f7
X-Git-Newrev: e4c433d3884ba7d7bb9759011c39f2f078cfa283
X-Patchwork-Hint: ignore
Message-Id: <20251017163855.4E4E287409@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pydantic{,
 -core}: bump to 2.12.2 and 2.41.4
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e4c433d3884ba7d7bb9759011c39f2f078cfa283
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping pydantic requires also bumping pydantic-core (and vice versa),
so we do that in the same commit.

Release announcement for pydantic 2.12:
https://pydantic.dev/articles/pydantic-v2-12-release

pydantic-core had a build-time dependency on host-python-typing-extensions,
but that is no required, it builds fine without.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add pydantic-core in commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 5 ++---
 package/python-pydantic/python-pydantic.hash           | 4 ++--
 package/python-pydantic/python-pydantic.mk             | 4 ++--
 4 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index 735abcb4c6..f61ab7a8e4 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  d075c06f299090879748db99ab202a253e9a2b22ee4140b96c0257257b9351c8  python-pydantic-core-2.33.2-cargo4.tar.gz
+sha256  8c31786f387bc0ce4a0fdfb500dbee7b102358616633b37159b389d5c53efa64  python-pydantic-core-2.41.4-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 5085b906d5..9eb0510278 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -6,13 +6,12 @@
 
 # python-pydantic pins an exact version of pydantic-core in pyproject.toml,
 # make sure to sync pydantic-core to this version when updating pydantic
-PYTHON_PYDANTIC_CORE_VERSION = 2.33.2
+PYTHON_PYDANTIC_CORE_VERSION = 2.41.4
 PYTHON_PYDANTIC_CORE_SOURCE_PYPI = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
 PYTHON_PYDANTIC_CORE_SITE = $(PYTHON_PYDANTIC_CORE_SITE_PYPI)/$(PYTHON_PYDANTIC_CORE_SOURCE_PYPI)?buildroot-path=filename
-PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/ad/88/5f2260bdfae97aabf98f1778d43f69574390ad787afb646292a638c923d4
+PYTHON_PYDANTIC_CORE_SITE_PYPI = https://files.pythonhosted.org/packages/df/18/d0944e8eaaa3efd0a91b0f1fc537d3be55ad35091b6a87638211ba691964
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-PYTHON_PYDANTIC_CORE_DEPENDENCIES = host-python-typing-extensions
 
 $(eval $(python-package))
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index ae1a479991..4148804302 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  40710323d4273536c49c73ca0fa6b1fc  pydantic-2.11.9.tar.gz
-sha256  6b8ffda597a14812a7975c90b82a8a2e777d9257aba3453f973acd3c032a18e2  pydantic-2.11.9.tar.gz
+md5  a3ade0862560d0f85951374e1004578c  pydantic-2.12.2.tar.gz
+sha256  7b8fa15b831a4bbde9d5b84028641ac3080a4ca2cbd4a621a661687e741624fd  pydantic-2.12.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index fae4822a56..19f4f7f420 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 2.11.9
+PYTHON_PYDANTIC_VERSION = 2.12.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/ff/5d/09a551ba512d7ca404d785072700d3f6727a02f6f3c24ecfd081c7cf0aa8
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/8d/35/d319ed522433215526689bad428a94058b6dd12190ce7ddd78618ac14b28
 PYTHON_PYDANTIC_SETUP_TYPE = hatch
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
