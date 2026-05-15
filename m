Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23040CD8C92
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CE6FF8571D;
	Tue,  9 Jun 2026 13:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EqzvCgJcrz0h; Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B680B8572A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010133;
	bh=JhWOakldqJq8G2LCbI6DBRcwWvgeOnlStrGQLQfM4gw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j+a+nL0txb8KSkqcWlwq718TYbD4T4TJM2ZOIfD7BWxnScwSf41Z4A8QXhvAb52TI
	 iyrJ3SjiVJWPSwj6IQZKG9doIUPBN+x51Cj1aKXSvzJbmplRLUO7EZtUX5/y7t6HFM
	 fb4t6DwOiNIZQRRghj7IhOMkBzz/+0q7hhoisD+EkLmrVwAAVOtAzF52O6aewZcCiF
	 Yd+MjxglV/q5q3Rmv+1kytJa62lo6qZ3VjUMnsN/nxLFsPq7YNi2NzIJxZyqt6p6as
	 PdQDqT0gHziP0O2oJId+S+AFLlcHDOxYxmDspJ4A/FSiABUYJ+xxHPYAkY463gCR9b
	 vowL6cR5nGCjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B680B8572A;
	Tue,  9 Jun 2026 13:02:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EFED196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68EEF426BF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQ2vTK5BmATZ for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AC49D426C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC49D426C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E76BA87E7E; Tue,  9 Jun 2026 13:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 15:13:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0c73553d840697b78181c773786f76e318f03214
X-Git-Newrev: 85a3edc0ba54abe02556682f661068c620596e83
X-Patchwork-Hint: ignore
Message-Id: <20260609130115.E76BA87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gymnasium: bump version to
 1.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/85a3edc0ba54abe02556682f661068c620596e83
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Farama-Foundation/Gymnasium/releases/tag/v1.3.0

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gymnasium/python-gymnasium.hash | 4 ++--
 package/python-gymnasium/python-gymnasium.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
index b76e0a5710..9a3b598346 100644
--- a/package/python-gymnasium/python-gymnasium.hash
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gymnasium/json
-md5  b67cd4243af164eb11888fe731c91e11  gymnasium-1.2.3.tar.gz
-sha256  2b2cb5b5fbbbdf3afb9f38ca952cc48aa6aa3e26561400d940747fda3ad42509  gymnasium-1.2.3.tar.gz
+md5  e401a13a7c39201ec6e55c2dac1f91f2  gymnasium-1.3.0.tar.gz
+sha256  6939e86e835d6b71b6ba6bfd360487420876deafc79bfb7bacba83a7c446bcf3  gymnasium-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
index 1cf79a0baf..dd5ca59f30 100644
--- a/package/python-gymnasium/python-gymnasium.mk
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GYMNASIUM_VERSION = 1.2.3
+PYTHON_GYMNASIUM_VERSION = 1.3.0
 PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
-PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/76/59/653a9417d98ed3e29ef9734ba52c3495f6c6823b8d5c0c75369f25111708
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/4d/ff/14b6880d703dfaca204490979d3254ccd280c99550798993319902873658
 PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
 PYTHON_GYMNASIUM_LICENSE = MIT
 PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
