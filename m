Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC32C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C93E41E46;
	Thu,  9 Nov 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C93E41E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DYybyE7pfqar; Thu,  9 Nov 2023 21:46:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A038441E30;
	Thu,  9 Nov 2023 21:46:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A038441E30
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28ED71BF312
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:46:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F4A8825B9
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F4A8825B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pM8ozJR7-6eN for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:46:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 604E5823E0
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 604E5823E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BFCE86EAF; Thu,  9 Nov 2023 21:46:20 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 22:32:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2add559e506e0af92beb2841c07db038ea48127a
X-Git-Newrev: 74ceb71a52b001630c9d11e9ab015acc87cb2a26
X-Patchwork-Hint: ignore
Message-Id: <20231109214620.4BFCE86EAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kmod: fix licensing
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=74ceb71a52b001630c9d11e9ab015acc87cb2a26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 2add559e506e (package/python-kmod: new package) listed LGPL-2.1+
(aka -or-later) as the licensed applicable. However, thode contains the
following blurbs:

    # python-kmod is free software: you can redistribute it and/or modify it under
    # the terms of the GNU Lesser General Public License version 2.1 as published
    # by the Free Software Foundation.

There is no mention of the usual "or, at your option, any later
version".

As such, the license is reall LGPL-2.1-only.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-kmod/python-kmod.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-kmod/python-kmod.mk b/package/python-kmod/python-kmod.mk
index 337a61491f..6164b0f1eb 100644
--- a/package/python-kmod/python-kmod.mk
+++ b/package/python-kmod/python-kmod.mk
@@ -9,7 +9,7 @@
 PYTHON_KMOD_VERSION = 0.9.2
 PYTHON_KMOD_SITE = $(call github,maurizio-lombardi,python-kmod,v$(PYTHON_KMOD_VERSION))
 PYTHON_KMOD_SETUP_TYPE = setuptools
-PYTHON_KMOD_LICENSE = LGPL-2.1+
+PYTHON_KMOD_LICENSE = LGPL-2.1
 PYTHON_KMOD_LICENSE_FILES = COPYING.LESSER
 PYTHON_KMOD_DEPENDENCIES = host-python-cython kmod
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
