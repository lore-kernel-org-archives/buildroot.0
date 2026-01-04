Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 849CEC2A074
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 11:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A6B280E3E;
	Sun,  4 Jan 2026 11:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EawXItkkCtT0; Sun,  4 Jan 2026 11:18:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DDB580E40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767525508;
	bh=5TY0axIWpyajqMSHLcBOalsYCKf2JyWF7wgGTsG52Rc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oLRX4WpBI62+ANfbXbRsq8+F8HL7fRW9wAskdP0VNyBJIKg+Andgph5X5wMKY1ueR
	 X25PhkqVCUXbt8Hsuh8i14yvkCa2WI2pUhHrIsSvEyXPLzGz8Hqhh7c5JEf4FXVLoB
	 Pn8eybLOJ1oxdyKp9LOmlODDGMyOCE5abzuM4iLzjThqjQshB/OMzJKEqQEl3T9mpk
	 xPmIrYvn9MaNRlzB20f7JBI5Aq+mZrB0cR/bJT+nLaIhqvXoIpJK8e1ibRAejnt7SS
	 /8EgbAnyzjw28zeUgdrtQayl2QxUBYSuS/0N/4HI9km6+PbrD0aquLU/JHNyq6PbZM
	 Ayz5j5ngJVrfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DDB580E40;
	Sun,  4 Jan 2026 11:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2379249
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A445580E40
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cPwMFMMT3v5f for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 11:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D635E80E3E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D635E80E3E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 11:18:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE932881AB; Sun,  4 Jan 2026 11:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 12:02:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 611ad8e88c615f74c20dcd31340392f51320995e
X-Git-Newrev: 1c21d39cb3133c8ebf769355a34c97ef2133c5f0
X-Patchwork-Hint: ignore
Message-Id: <20260104111826.CE932881AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipython-pygments-lexers:
 new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=1c21d39cb3133c8ebf769355a34c97ef2133c5f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[Julien: add package homepage url in Config.in]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                          |  1 +
 package/python-ipython-pygments-lexers/Config.in           |  8 ++++++++
 .../python-ipython-pygments-lexers.hash                    |  5 +++++
 .../python-ipython-pygments-lexers.mk                      | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index f5f1f6a741..def3db0e50 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1176,6 +1176,7 @@ menu "External python modules"
 	source "package/python-ipy/Config.in"
 	source "package/python-ipython/Config.in"
 	source "package/python-ipython-genutils/Config.in"
+	source "package/python-ipython-pygments-lexers/Config.in"
 	source "package/python-iso8601/Config.in"
 	source "package/python-iterable-io/Config.in"
 	source "package/python-itsdangerous/Config.in"
diff --git a/package/python-ipython-pygments-lexers/Config.in b/package/python-ipython-pygments-lexers/Config.in
new file mode 100644
index 0000000000..bfb48d7381
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_IPYTHON_PYGMENTS_LEXERS
+	bool "python-ipython-pygments-lexers"
+	select BR2_PACKAGE_PYTHON_PYGMENTS # runtime
+	help
+	  Defines a variety of Pygments lexers for highlighting
+	  IPython code.
+
+	  https://pypi.org/project/ipython-pygments-lexers/
diff --git a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash
new file mode 100644
index 0000000000..90c69fa626
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/ipython-pygments-lexers/json
+md5  a8d51d899ed01e1cb6773657cf88f734  ipython_pygments_lexers-1.1.1.tar.gz
+sha256  09c0138009e56b6854f9535736f4171d855c8c08a563a0dcd8022f78355c7e81  ipython_pygments_lexers-1.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  b1d0dbc0fa79774d34b8e2d0aec91d50d8caf05f7b40fc22c3010a4bd9ad2bf9  LICENSE
diff --git a/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
new file mode 100644
index 0000000000..e86284b265
--- /dev/null
+++ b/package/python-ipython-pygments-lexers/python-ipython-pygments-lexers.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ipython-pygments-lexers
+#
+################################################################################
+
+PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION = 1.1.1
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SOURCE = ipython_pygments_lexers-$(PYTHON_IPYTHON_PYGMENTS_LEXERS_VERSION).tar.gz
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SITE = https://files.pythonhosted.org/packages/ef/4c/5dd1d8af08107f88c7f741ead7a40854b8ac24ddf9ae850afbcf698aa552
+PYTHON_IPYTHON_PYGMENTS_LEXERS_SETUP_TYPE = flit
+PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE = BSD-3-Clause
+PYTHON_IPYTHON_PYGMENTS_LEXERS_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
