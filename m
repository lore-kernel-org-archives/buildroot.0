Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A8ECAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 188A7615BF;
	Thu, 25 Sep 2025 20:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gyisLbcmdN-A; Thu, 25 Sep 2025 20:19:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC5B46156B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC5B46156B;
	Thu, 25 Sep 2025 20:19:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D5C712D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D03241229
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MgeTjVbQJ7Yz for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32C1414B2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C32C1414B2
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C14FF86418; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:13 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cb38c181a6f51a2174e2ecb661ed7fb1aa72c6a8
X-Git-Newrev: a5e85ef3a98ce17eec24bb6bced6381bf7cb83e9
X-Patchwork-Hint: ignore
Message-Id: <20250925201941.C14FF86418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-trove-classifiers: bump to version 2025.9.11.17
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

commit: https://git.buildroot.net/buildroot/commit/?id=a5e85ef3a98ce17eec24bb6bced6381bf7cb83e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

package/python-cffi 2.0.0 (bumped in commit
07903d2b274bc98f930e06dee237682015acb1d7) fails to build due to an
unknown trove-classifier:

* Getting build dependencies for wheel...
configuration error: `project.classifiers[8]` must be trove-classifier
DESCRIPTION:
    `PyPI classifier <https://pypi.org/classifiers/>`_.

GIVEN VALUE:
    "Programming Language :: Python :: Free Threading :: 2 - Beta"

OFFENDING RULE: 'format'

DEFINITION:
    {
        "type": "string",
        "format": "trove-classifier"
    }

For more details about `format` see
https://validate-pyproject.readthedocs.io/en/latest/api/validate_pyproject.formats.html

The list of trove classifiers Setuptools checks against is provided by
package/python-trove-classifiers. Upstream has added the classifier as
of version 2025.5.8.15 [1], as well as a bunch of others [2], so
update to fix the problem.

[1] https://github.com/pypa/trove-classifiers/commit/331838aaea0eea6374e4e51e8fe05e13bf7e4957
[2] https://github.com/pypa/trove-classifiers/compare/2025.1.15.22...2025.9.11.17

Fixes:
- 07903d2b274bc98f930e06dee237682015acb1d7
- https://autobuild.buildroot.org/results/45b57a919182ae3f9ea0db9b0fa430a72e1e3cdf/

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: add link to autobuilder failure]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 44e0ba2bd256b269b578e64e0ebb0ab386bdf51d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-trove-classifiers/python-trove-classifiers.hash | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index bb9f40a7f3..008c3a0b3e 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  3656424a10a761108fa8250033ffe3d4  trove_classifiers-2025.1.15.22.tar.gz
-sha256  90af74358d3a01b3532bc7b3c88d8c6a094c2fd50a563d13d9576179326d7ed9  trove_classifiers-2025.1.15.22.tar.gz
+md5  769cd978e6756c423958bbfe76f130d8  trove_classifiers-2025.9.11.17.tar.gz
+sha256  931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd  trove_classifiers-2025.9.11.17.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 8d2238d41a..a556cbd3dd 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.1.15.22
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.9.11.17
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/f3/cb/8f6a91c74049180e395590901834d68bef5d6a2ce4c9ca9792cfadc1b9b4
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/ca/9a/778622bc06632529817c3c524c82749a112603ae2bbcf72ee3eb33a2c4f1
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
