Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7730C4828F
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 16:40:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A95583750;
	Wed,  7 Feb 2024 16:40:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eR3xaW65TzbS; Wed,  7 Feb 2024 16:40:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 790B283417
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 790B283417;
	Wed,  7 Feb 2024 16:40:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E96041BF86C
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B154C41461
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 16:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rNhmCB8oUR-d for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 16:40:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E09EE41553
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E09EE41553
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 16:40:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C0E2487665; Wed,  7 Feb 2024 16:40:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Feb 2024 17:38:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bdb470c7b41e7c0425f59a23f78a398dba883fd
X-Git-Newrev: 03e360c380f5398fe168296284c7cf46318ca425
X-Patchwork-Hint: ignore
Message-Id: <20240207164000.C0E2487665@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools-scm: bump to
 version 8.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=03e360c380f5398fe168296284c7cf46318ca425
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to intree pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 6 +++---
 package/python-setuptools-scm/python-setuptools-scm.mk   | 9 +++++----
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index 8cfe07d1d9..1a884dbbbf 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  158dc741637fb4fa4b955c62bd2c08be  setuptools_scm-7.1.0.tar.gz
-sha256  6c508345a771aad7d56ebff0e70628bf2b0ec7573762be9960214730de278f27  setuptools_scm-7.1.0.tar.gz
-# sha256 locally computed
+md5  a05e98ab9ae447e173f0c747e0d49e81  setuptools-scm-8.0.4.tar.gz
+sha256  b5f43ff6800669595193fd09891564ee9d1d7dcb196cab4b2506d53a2e1c95c7  setuptools-scm-8.0.4.tar.gz
+# Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 5a35c35a1f..4cbf914690 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 7.1.0
-PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/98/12/2c1e579bb968759fc512391473340d0661b1a8c96a59fb7c65b02eec1321
+PYTHON_SETUPTOOLS_SCM_VERSION = 8.0.4
+PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools-scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/eb/b1/0248705f10f6de5eefe7ff93e399f7192257b23df4d431d2f5680bb2778f
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
-PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = setuptools
+PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
+	host-python-setuptools \
 	host-python-typing-extensions
 
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
