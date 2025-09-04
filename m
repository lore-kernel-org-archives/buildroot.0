Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB1CCA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F407E405DC;
	Thu,  4 Sep 2025 16:34:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW_EFxrPQv-x; Thu,  4 Sep 2025 16:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2514640622
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2514640622;
	Thu,  4 Sep 2025 16:34:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBD2106
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A39106063F
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ptoYJFyjnet for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A34C760631
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A34C760631
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A0B5887F4B; Thu,  4 Sep 2025 16:33:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Sep 2025 14:22:19 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 6fe30ffa6bf0143e5c33fd142cc0b2857a4661e5
X-Git-Newrev: 311ae6d9bf616bae022f2dcb2a420aff47112b12
X-Patchwork-Hint: ignore
Message-Id: <20250904163336.A0B5887F4B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python-h2:
 security bump to version 4.3.0
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=311ae6d9bf616bae022f2dcb2a420aff47112b12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following security vulnerability:

- CVE-2025-57804: HTTP/2 request splitting via CRLF injection

  https://github.com/python-hyper/h2/security/advisories/GHSA-847f-9342-265h

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2389965eaf8ba396f74e35d4558be79bf1e8c8a6)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/python-h2/python-h2.hash | 4 ++--
 package/python-h2/python-h2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-h2/python-h2.hash b/package/python-h2/python-h2.hash
index 2f9c8f647f..5adfc86f52 100644
--- a/package/python-h2/python-h2.hash
+++ b/package/python-h2/python-h2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/h2/json
-md5  4274f9619c0a43bb4ae01b6b02bf0c99  h2-4.1.0.tar.gz
-sha256  a83aca08fbe7aacb79fec788c9c0bac936343560ed9ec18b82a13a12c28d2abb  h2-4.1.0.tar.gz
+md5  b4781bbaaae609aa759565585718e0d7  h2-4.3.0.tar.gz
+sha256  6c59efe4323fa18b47a632221a1888bd7fde6249819beda254aeca909f221bf1  h2-4.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7a65a5af0cbabf1c16251c7c6b2b7cb46d16a7222e79975b9b61fcd66a2e3f28  LICENSE
diff --git a/package/python-h2/python-h2.mk b/package/python-h2/python-h2.mk
index 699e8baece..d9cfbdbf92 100644
--- a/package/python-h2/python-h2.mk
+++ b/package/python-h2/python-h2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_H2_VERSION = 4.1.0
+PYTHON_H2_VERSION = 4.3.0
 PYTHON_H2_SOURCE = h2-$(PYTHON_H2_VERSION).tar.gz
-PYTHON_H2_SITE = https://files.pythonhosted.org/packages/2a/32/fec683ddd10629ea4ea46d206752a95a2d8a48c22521edd70b142488efe1
+PYTHON_H2_SITE = https://files.pythonhosted.org/packages/1d/17/afa56379f94ad0fe8defd37d6eb3f89a25404ffc71d4d848893d270325fc
 PYTHON_H2_SETUP_TYPE = setuptools
 PYTHON_H2_LICENSE = MIT
 PYTHON_H2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
