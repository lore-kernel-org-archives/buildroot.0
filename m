Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27B3FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 11:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A364607F5;
	Sat,  3 Jan 2026 11:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RO-9aRRi2II5; Sat,  3 Jan 2026 11:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ACC6F606A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767439766;
	bh=SzyEf0jyHlilV+gU5Toonx+3zvcjOY1SPfdVCjdX660=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZLMtLccEBlELykWd/y5adnthX+6BWYNl9/hbpmBWRyGkgWEAORzjuMBP2pgjWmyVz
	 FaVqba8m4TzlCAGFP6zBDCKI+cOWGbCwlaXVo2pZ2aPF6cdqB9IZWpuSXXO45c9X7+
	 9736+QqTB//nQNVcKRsGEXlHwOfVwnGPZtZBfLq9y8C3+TtNmHwpT3zhW1RrL6czMh
	 Bq86i7Lff5/Qi7QcJs9ru+a3ZWsHCLVt4xExoc6khDUIz44MzEVdyn4NV8sCybyLiS
	 xeZoMdrKJGsfKrPR2A6J8jQAkNmqCpSCwY7acehKkrdBIONaDpRM4EPNlCSsHI6sBO
	 AZMxWIHTw0lCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACC6F606A0;
	Sat,  3 Jan 2026 11:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 276DBA21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 192DE6072E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7WTV7BJXMbC for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69CA5606A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69CA5606A0
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A6BE8101A; Sat,  3 Jan 2026 11:29:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 12:23:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ae976e003dda440de9cdc6df85a51271bcf5b64
X-Git-Newrev: 4d095402afe4659eed495b3e4149b0fd35c19eb8
X-Patchwork-Hint: ignore
Message-Id: <20260103112924.5A6BE8101A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-git: bump to version 3.1.46
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d095402afe4659eed495b3e4149b0fd35c19eb8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-git/python-git.hash | 4 ++--
 package/python-git/python-git.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-git/python-git.hash b/package/python-git/python-git.hash
index aac8b3fab0..cda8ae49e1 100644
--- a/package/python-git/python-git.hash
+++ b/package/python-git/python-git.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gitpython/json
-md5  14e2083b71e235ba4d81fa485ce9153d  gitpython-3.1.44.tar.gz
-sha256  c87e30b26253bf5418b01b0660f818967f3c503193838337fe5e573331249269  gitpython-3.1.44.tar.gz
+md5  e011828008698572f60dbc3a798e594d  gitpython-3.1.46.tar.gz
+sha256  400124c7d0ef4ea03f7310ac2fbf7151e09ff97f2a3288d64a440c584a29c37f  gitpython-3.1.46.tar.gz
 # Locally computed sha256 checksums
 sha256  86fc94c321a9afbc11514713511bafded225f25100dcc0f7350e82bc231b8beb  LICENSE
diff --git a/package/python-git/python-git.mk b/package/python-git/python-git.mk
index 318cb614f0..49cd04f66c 100644
--- a/package/python-git/python-git.mk
+++ b/package/python-git/python-git.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GIT_VERSION = 3.1.44
+PYTHON_GIT_VERSION = 3.1.46
 PYTHON_GIT_SOURCE = gitpython-$(PYTHON_GIT_VERSION).tar.gz
-PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/c0/89/37df0b71473153574a5cdef8f242de422a0f5d26d7a9e231e6f169b4ad14
+PYTHON_GIT_SITE = https://files.pythonhosted.org/packages/df/b5/59d16470a1f0dfe8c793f9ef56fd3826093fc52b3bd96d6b9d6c26c7e27b
 PYTHON_GIT_LICENSE = BSD-3-Clause
 PYTHON_GIT_LICENSE_FILES = LICENSE
 PYTHON_GIT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
