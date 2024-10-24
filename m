Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BCE9D0BB6A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:32:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A49940741;
	Thu, 24 Oct 2024 07:32:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6D7kKo2GyGcg; Thu, 24 Oct 2024 07:32:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC4C8407A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4C8407A2;
	Thu, 24 Oct 2024 07:32:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 127C4972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 32181809D3
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBHkVHgp_VWd for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B30A8059D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B30A8059D
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 94D19839BE; Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:27:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b2cf67ece02dc731d157c278d6a3f79f4f101571
X-Git-Newrev: 07525ad019b341cc8a5ff51d2607c1b6d266e0a3
X-Patchwork-Hint: ignore
Message-Id: <20241024073111.94D19839BE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httpcore: use hatch setup
 type
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=07525ad019b341cc8a5ff51d2607c1b6d266e0a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-httpcore/python-httpcore.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/python-httpcore/python-httpcore.mk b/package/python-httpcore/python-httpcore.mk
index 19edf18c97..a432433884 100644
--- a/package/python-httpcore/python-httpcore.mk
+++ b/package/python-httpcore/python-httpcore.mk
@@ -7,11 +7,9 @@
 PYTHON_HTTPCORE_VERSION = 1.0.6
 PYTHON_HTTPCORE_SOURCE = httpcore-$(PYTHON_HTTPCORE_VERSION).tar.gz
 PYTHON_HTTPCORE_SITE = https://files.pythonhosted.org/packages/b6/44/ed0fa6a17845fb033bd885c03e842f08c1b9406c86a2e60ac1ae1b9206a6
-PYTHON_HTTPCORE_SETUP_TYPE = pep517
+PYTHON_HTTPCORE_SETUP_TYPE = hatch
 PYTHON_HTTPCORE_LICENSE = BSD-3-Clause
 PYTHON_HTTPCORE_LICENSE_FILES = LICENSE.md
-PYTHON_HTTPCORE_DEPENDENCIES = \
-	host-python-hatchling \
-	host-python-hatch-fancy-pypi-readme
+PYTHON_HTTPCORE_DEPENDENCIES = host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
