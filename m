Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5A2D59F75
	for <buildroot@archiver.kernel.org>; Wed,  6 Nov 2024 22:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288F5404EF;
	Wed,  6 Nov 2024 22:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7r5HW0jnoBzN; Wed,  6 Nov 2024 22:24:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 039D3405C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 039D3405C0;
	Wed,  6 Nov 2024 22:24:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2E62E4C49
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 707206072E
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9cP_DHcWWWl for <buildroot@buildroot.org>;
 Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 987D4606AA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 987D4606AA
 for <buildroot@buildroot.org>; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 86E7885D80; Wed,  6 Nov 2024 22:24:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Nov 2024 23:22:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 099d3a23e9950b24e1833fa1752929a3777f6778
X-Git-Newrev: 549dde9f1a40200376b72bd7f522bfff885382b4
X-Patchwork-Hint: ignore
Message-Id: <20241106222425.86E7885D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simplelogging: use poetry
 setup type
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

commit: https://git.buildroot.net/buildroot/commit/?id=549dde9f1a40200376b72bd7f522bfff885382b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new poetry setup type which automatically pulls in the
host-python-poetry-core dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-simplelogging/python-simplelogging.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-simplelogging/python-simplelogging.mk b/package/python-simplelogging/python-simplelogging.mk
index d725cccdd8..43f2e0781a 100644
--- a/package/python-simplelogging/python-simplelogging.mk
+++ b/package/python-simplelogging/python-simplelogging.mk
@@ -7,9 +7,8 @@
 PYTHON_SIMPLELOGGING_VERSION = 0.12.0
 PYTHON_SIMPLELOGGING_SOURCE = simplelogging-$(PYTHON_SIMPLELOGGING_VERSION).tar.gz
 PYTHON_SIMPLELOGGING_SITE = https://files.pythonhosted.org/packages/30/71/d6b6513598e6a4300f6142a839d1b0e10a25a4707f1b586d9a6331be91bb
-PYTHON_SIMPLELOGGING_SETUP_TYPE = pep517
+PYTHON_SIMPLELOGGING_SETUP_TYPE = poetry
 PYTHON_SIMPLELOGGING_LICENSE = BSD-3-Clause
 PYTHON_SIMPLELOGGING_LICENSE_FILES = LICENSE
-PYTHON_SIMPLELOGGING_DEPENDENCIES = host-python-poetry-core
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
