Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E6D0BB6A
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94B3080F94;
	Thu, 24 Oct 2024 07:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wb9tiRZ_eLYu; Thu, 24 Oct 2024 07:32:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A161381305
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A161381305;
	Thu, 24 Oct 2024 07:32:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15228972
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C300E8088F
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HVGyc4UEb0rG for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65BE880838
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 65BE880838
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 626448645B; Thu, 24 Oct 2024 07:31:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:27:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 715d8ae7b31efeb5528b14a8d24bd1dcee510867
X-Git-Newrev: a58373d905c0fa3e606ccbec6c45779a1c718360
X-Patchwork-Hint: ignore
Message-Id: <20241024073111.626448645B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-fastui: use hatch setup type
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

commit: https://git.buildroot.net/buildroot/commit/?id=a58373d905c0fa3e606ccbec6c45779a1c718360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-fastui/python-fastui.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-fastui/python-fastui.mk b/package/python-fastui/python-fastui.mk
index 7ed2eb39a9..898bc26eb9 100644
--- a/package/python-fastui/python-fastui.mk
+++ b/package/python-fastui/python-fastui.mk
@@ -7,9 +7,8 @@
 PYTHON_FASTUI_VERSION = 0.7.0
 PYTHON_FASTUI_SOURCE = fastui-$(PYTHON_FASTUI_VERSION).tar.gz
 PYTHON_FASTUI_SITE = https://files.pythonhosted.org/packages/87/97/3f001410200256026ff98a4588ec8cb4f3b48bc74a28325e32bfb3b08ffd
-PYTHON_FASTUI_SETUP_TYPE = pep517
+PYTHON_FASTUI_SETUP_TYPE = hatch
 PYTHON_FASTUI_LICENSE = MIT
 PYTHON_FASTUI_LICENSE_FILES = LICENSE
-PYTHON_FASTUI_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
