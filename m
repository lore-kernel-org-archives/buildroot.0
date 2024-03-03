Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70A2C48BF6
	for <buildroot@archiver.kernel.org>; Sun,  3 Mar 2024 09:12:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDC57410BC;
	Sun,  3 Mar 2024 09:12:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rcF96jSup292; Sun,  3 Mar 2024 09:12:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF482410BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF482410BB;
	Sun,  3 Mar 2024 09:12:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D6271BF2BF
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 281F7410BA
 for <buildroot@lists.busybox.net>; Sun,  3 Mar 2024 09:12:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Xo1N9XKKZsAU for <buildroot@lists.busybox.net>;
 Sun,  3 Mar 2024 09:12:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D6E0410AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D6E0410AF
 for <buildroot@buildroot.org>; Sun,  3 Mar 2024 09:12:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17CC687EEE; Sun,  3 Mar 2024 09:12:01 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 3 Mar 2024 10:07:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8707cee5e7e4af8fc2addd317b294e081db994f
X-Git-Newrev: 4a71f029085f8eda64aeee0edb80b7be8ca58022
X-Patchwork-Hint: ignore
Message-Id: <20240303091202.17CC687EEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm-git-archive:
 drop package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4a71f029085f8eda64aeee0edb80b7be8ca58022
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-setuptools-scm-git-archive is obsolete as
python-setuptools-scm >= 7.0.0 supports Git archives by itself.

Moreover, it raises the following build failure without pip since its
addition in commit 9359325c6081df89ff57667cb49e0d12cd553b97:

/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python: No module named pip
Traceback (most recent call last):
  File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/site-packages/setuptools/installer.py", line 82, in fetch_build_egg
    subprocess.check_call(cmd)
  File "/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/lib/python3.10/subprocess.py", line 369, in check_call
    raise CalledProcessError(retcode, cmd)
subprocess.CalledProcessError: Command '['/nvmedata/autobuild/instance-3/output-1/per-package/host-python-setuptools-scm-git-archive/host/bin/python', '-m', 'pip', '--disable-pip-version-check', 'wheel', '--no-deps', '-w', '/tmp/tmpaxobatcs', '--quiet', 'typing-extensions']' returned non-zero exit status 1.

Fixes:
 - http://autobuild.buildroot.org/results/d05e412170c427e4f210da164c783b3527f15892
 - http://autobuild.buildroot.org/results/50f80cfabccbe5c75cd889ce6af2b418e376d4e5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../python-setuptools-scm-git-archive.hash                |  5 -----
 .../python-setuptools-scm-git-archive.mk                  | 15 ---------------
 2 files changed, 20 deletions(-)

diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
deleted file mode 100644
index ce790a3d59..0000000000
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/setuptools-scm-git-archive/json
-md5  cfcdab6edbe6b710ab24ad355e7cf7a3  setuptools_scm_git_archive-1.4.1.tar.gz
-sha256  c418bc77b3974d3ac65f268f058f23e01dc5f991f2233128b0e16a69de227b09  setuptools_scm_git_archive-1.4.1.tar.gz
-# Locally computed sha256 checksums
-sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk b/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
deleted file mode 100644
index 153343788b..0000000000
--- a/package/python-setuptools-scm-git-archive/python-setuptools-scm-git-archive.mk
+++ /dev/null
@@ -1,15 +0,0 @@
-################################################################################
-#
-# python-setuptools-scm-git-archive
-#
-################################################################################
-
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION = 1.4.1
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SOURCE = setuptools_scm_git_archive-$(PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SITE = https://files.pythonhosted.org/packages/47/d6/c9a8d1ea95613f79b9b914cf9a5e8e420b7625fc54137c1d7c9cbbda5adf
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_SETUP_TYPE = setuptools
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE = MIT
-PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_LICENSE_FILES = LICENSE
-HOST_PYTHON_SETUPTOOLS_SCM_GIT_ARCHIVE_DEPENDENCIES = host-python-setuptools-scm
-
-$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
