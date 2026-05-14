Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8ECD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EEF8555D;
	Tue,  9 Jun 2026 13:01:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uz_E-QgW9UED; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D786585536
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010079;
	bh=AwGQ1mdBrWFII53C5IthfP/HecEA0eQ9n+CK1JvuIMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PmFr2Eg/pjqYG66NP7wWCIciCPRbSn037bccZwKQTxZJxBF80mwbHja6ddBuRygPg
	 gXkkWYkN9wm/GsRgh24Dptac1JNpm9AU3vYkOzCkcheOsrnA6HAg5STPs1GBCUTEiD
	 Dq1zZjqG+hrxChon44pMkrnml8+okI+xhcnIlYzWDfwMzUOyjPew5bn+MnRiPRarOa
	 UuPBvCBlCFIgtunFswfqQPasU8zRXpl1L1YrKb358w1gyn2fXbT+2oU7EBzcNlM1Rx
	 BLItC0x/H60G7/TgGYHIgazsQc7xBh+4gnBgTX/IKBX07UFlguvaUfLoQhGoH1kDBm
	 R+VKitJK9xrzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D786585536;
	Tue,  9 Jun 2026 13:01:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA60196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC7E28550A
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RqLs2TbNHNoi for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D01BC85516
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D01BC85516
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0B2AF87DE8; Tue,  9 Jun 2026 13:00:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:27:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0452451195518ab694bb488b6e5e8b2d5073551e
X-Git-Newrev: 11e5c1ffdff1bfb8609caeb769ef23c4a269dd30
X-Patchwork-Hint: ignore
Message-Id: <20260609130054.0B2AF87DE8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachelib: bump version to
 0.14.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/11e5c1ffdff1bfb8609caeb769ef23c4a269dd30
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cachelib/python-cachelib.hash | 8 ++++----
 package/python-cachelib/python-cachelib.mk   | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
index 6a50350aa1..0ae8e5f10e 100644
--- a/package/python-cachelib/python-cachelib.hash
+++ b/package/python-cachelib/python-cachelib.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/cachelib/json
-md5  fc25e9c9165cd5fd42ce282c2ba540fd  cachelib-0.13.0.tar.gz
-sha256  209d8996e3c57595bee274ff97116d1d73c4980b2fd9a34c7846cd07fd2e1a48  cachelib-0.13.0.tar.gz
+md5  4159f620b8800fbe104f20ea4702e16b  cachelib-0.14.0.tar.gz
+sha256  73fedcadd0ba818fb2bb9f3c7cd5fcc2a71e86286f1842f55f28d500faee17f1  cachelib-0.14.0.tar.gz
 # Locally computed sha256 checksums
-sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.rst
-sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
+sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.txt
+sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
index 7361a21f4f..937925e1e3 100644
--- a/package/python-cachelib/python-cachelib.mk
+++ b/package/python-cachelib/python-cachelib.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_CACHELIB_VERSION = 0.13.0
+PYTHON_CACHELIB_VERSION = 0.14.0
 PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
-PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/1d/69/0b5c1259e12fbcf5c2abe5934b5c0c1294ec0f845e2b4b2a51a91d79a4fb
-PYTHON_CACHELIB_SETUP_TYPE = setuptools
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/66/a5/5eb041dbee71766704d44cf5dfb6950ab018be0fd02cd763ade09869e33c
+PYTHON_CACHELIB_SETUP_TYPE = flit
 PYTHON_CACHELIB_LICENSE = BSD-3-Clause
-PYTHON_CACHELIB_LICENSE_FILES = LICENSE.rst docs/license.rst
+PYTHON_CACHELIB_LICENSE_FILES = LICENSE.txt docs/license.rst
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
