Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 902DED0BB66
	for <buildroot@archiver.kernel.org>; Thu, 24 Oct 2024 07:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58B7081336;
	Thu, 24 Oct 2024 07:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fc8JuU5jaDbE; Thu, 24 Oct 2024 07:32:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7139B81330
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7139B81330;
	Thu, 24 Oct 2024 07:32:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 106A227ED
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E05B8059C
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jqOCuuZSNPLQ for <buildroot@buildroot.org>;
 Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46F90809E8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46F90809E8
 for <buildroot@buildroot.org>; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 43C5A85C78; Thu, 24 Oct 2024 07:31:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Oct 2024 09:28:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 085fcb5390d4186f8db0f8e4d15ec182fff3d50b
X-Git-Newrev: f15906ded9f299c1319431a872723cc2753ad1e4
X-Patchwork-Hint: ignore
Message-Id: <20241024073113.43C5A85C78@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-colorama: use hatch setup
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

commit: https://git.buildroot.net/buildroot/commit/?id=f15906ded9f299c1319431a872723cc2753ad1e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the new hatch setup type which automatically pulls in the
host-python-hatchling dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-colorama/python-colorama.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-colorama/python-colorama.mk b/package/python-colorama/python-colorama.mk
index d633e00602..e87c60afb9 100644
--- a/package/python-colorama/python-colorama.mk
+++ b/package/python-colorama/python-colorama.mk
@@ -7,9 +7,8 @@
 PYTHON_COLORAMA_VERSION = 0.4.6
 PYTHON_COLORAMA_SOURCE = colorama-$(PYTHON_COLORAMA_VERSION).tar.gz
 PYTHON_COLORAMA_SITE = https://files.pythonhosted.org/packages/d8/53/6f443c9a4a8358a93a6792e2acffb9d9d5cb0a5cfd8802644b7b1c9a02e4
-PYTHON_COLORAMA_SETUP_TYPE = pep517
+PYTHON_COLORAMA_SETUP_TYPE = hatch
 PYTHON_COLORAMA_LICENSE = BSD-3-Clause
 PYTHON_COLORAMA_LICENSE_FILES = LICENSE.txt
-PYTHON_COLORAMA_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
