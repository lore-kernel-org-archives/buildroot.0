Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AF7CCD183
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 12:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8D1341099;
	Mon, 13 Oct 2025 12:41:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gWsebzMh6BRf; Mon, 13 Oct 2025 12:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1930F40DE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1930F40DE4;
	Mon, 13 Oct 2025 12:41:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D639FBC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C7D14813E7
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kG_9uN3gKSRE for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 12:41:36 +0000 (UTC)
X-Greylist: delayed 379 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 13 Oct 2025 12:41:35 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C1F0380CF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C1F0380CF8
Received-SPF: Neutral (mailfrom) identity=mailfrom; client-ip=54.37.254.54;
 helo=kmf2.trabucayre.com; envelope-from=gwenj@trabucayre.com;
 receiver=<UNKNOWN> 
Received: from kmf2.trabucayre.com (ns3108948.ip-54-37-254.eu [54.37.254.54])
 by smtp1.osuosl.org (Postfix) with ESMTP id C1F0380CF8
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 12:41:35 +0000 (UTC)
Received: from kmf3.. (localhost [IPv6:::1])
 by kmf2.trabucayre.com (Postfix) with ESMTP id 046EA160225;
 Mon, 13 Oct 2025 12:35:12 +0000 (UTC)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Date: Mon, 13 Oct 2025 12:35:10 +0000
Message-Id: <20251013123510.956091-1-gwenj@trabucayre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=trabucayre.com
Subject: [Buildroot] [PATCH] package/python-markdown: bump version to 3.9
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 9a452bb4f7..25725b3c8e 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  de4cdc6db368c7386f733d6dd8c858b1  markdown-3.7.tar.gz
-sha256  2ae2471477cfd02dbbf038d5d9bc226d40def84b4fe2986e49b59b6b472bbed2  markdown-3.7.tar.gz
+md5  46aaa9fe3d42144f185368e819b7e720  markdown-3.9.tar.gz
+sha256  d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a  markdown-3.9.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 4cacee24f8..6fcdd6b830 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.7
+PYTHON_MARKDOWN_VERSION = 3.9
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/54/28/3af612670f82f4c056911fbbbb42760255801b3068c48de792d354ff4472
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/8d/37/02347f6d6d8279247a5837082ebc26fc0d5aaeaf75aa013fcbb433c777ab
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
