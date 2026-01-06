Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B81D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE11416A2;
	Wed,  7 Jan 2026 18:03:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoZ7tn63snjm; Wed,  7 Jan 2026 18:03:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4A8D415B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809017;
	bh=NoN0O1yucmy99AQ84rEWnWA079j+zVRbizBNxiTkg8o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HsRoY3H0xwRuZx4124YnlQkeeZqFvW5tIfN2kDQJy6tS9rahUasT+h4GYF3CrhGVd
	 JCelg403YWmgG6Kk7LqYphAl4sqq7KgBUgesItYURUABg7WAfAdR0Hrxzjgt+Sd8er
	 mgAiWlS9qyskJQijsGhEkXFgNd6dyf+sYNCdmWxfp1soS/R7huyMbY+CEbD0MQ+DZM
	 RNcJqPXSJu1bBHxtfsEVShZKg7Xnzcs3JRUe7CEIwbZjIMayAWVnr5RA/iNdfEnFeR
	 /Bixp2lehBQ9bAEjRmxQRe4W+U3xoCYArZSwjzkk02X7PM7pni/EvhDnN4hMOpfNif
	 Yy+h0b/1OEXQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4A8D415B3;
	Wed,  7 Jan 2026 18:03:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0901A9ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E51E480B9F
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWVF8QLXhBmw for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D6C980C97
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D6C980C97
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C4A88282A; Wed,  7 Jan 2026 18:01:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 09:01:24 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: acc6b5d3d0a884a0400d1cba094f87c08bb90ca3
X-Git-Newrev: 5222d152d38cd96012df186879bf7e3ddc6df209
X-Patchwork-Hint: ignore
Message-Id: <20260107180115.0C4A88282A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x]
 package/python-pysendfile: update tarball URL
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5222d152d38cd96012df186879bf7e3ddc6df209
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2952d38125d2f8f0229d7daa450f7d961d3417e1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-pysendfile/python-pysendfile.hash | 6 ++++--
 package/python-pysendfile/python-pysendfile.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-pysendfile/python-pysendfile.hash b/package/python-pysendfile/python-pysendfile.hash
index d1aff6aed2..2b5b8a9714 100644
--- a/package/python-pysendfile/python-pysendfile.hash
+++ b/package/python-pysendfile/python-pysendfile.hash
@@ -1,3 +1,5 @@
-# Locally computed:
-sha256  f4ca8a7f0be67e3d710c0633dd9aadab6881203c31cb9eb9be4f10361ad3f937  python-pysendfile-2.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pysendfile/json
+md5  e7b301eddd703ab74a48c59a8fda1f97  pysendfile-2.0.1.tar.gz
+sha256  510a414b270986fba3c79cb76d90a4c910c701bfb43ff983a5d4e92846050e17  pysendfile-2.0.1.tar.gz
+# Locally computed sha256 checksums
 sha256  259f433563cfe0296c84c00381c600e82e0ab1b617ce20fe6e7f555a2b95af26  LICENSE
diff --git a/package/python-pysendfile/python-pysendfile.mk b/package/python-pysendfile/python-pysendfile.mk
index bb8f057d3d..6c2d06e367 100644
--- a/package/python-pysendfile/python-pysendfile.mk
+++ b/package/python-pysendfile/python-pysendfile.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_PYSENDFILE_VERSION = 2.0.1
-PYTHON_PYSENDFILE_SITE = $(call github,giampaolo,pysendfile,release-$(PYTHON_PYSENDFILE_VERSION))
+PYTHON_PYSENDFILE_SOURCE = pysendfile-$(PYTHON_PYSENDFILE_VERSION).tar.gz
+PYTHON_PYSENDFILE_SITE = https://files.pythonhosted.org/packages/cd/3f/4aa268afd0252f06b3b487c296a066a01ddd4222a46b7a3748599c8fc8c3
 PYTHON_PYSENDFILE_SETUP_TYPE = setuptools
 PYTHON_PYSENDFILE_LICENSE = MIT
 PYTHON_PYSENDFILE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
