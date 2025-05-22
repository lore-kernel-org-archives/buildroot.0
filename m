Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB65C54E90
	for <buildroot@archiver.kernel.org>; Thu, 22 May 2025 20:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77C0483E01;
	Thu, 22 May 2025 20:00:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ufs4MO-GUWUG; Thu, 22 May 2025 20:00:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8F1783E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8F1783E2E;
	Thu, 22 May 2025 20:00:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 087CD237
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE76683E2E
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hWwTUDLKX7oE for <buildroot@buildroot.org>;
 Thu, 22 May 2025 20:00:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C9D283E01
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4C9D283E01
 for <buildroot@buildroot.org>; Thu, 22 May 2025 20:00:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4328287655; Thu, 22 May 2025 20:00:16 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 May 2025 21:58:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4c890bc46dc7d959eda2224499a45fb65c07969f
X-Git-Newrev: 46916c3536a066e876b77eb282d5b24eeb8ecf64
X-Patchwork-Hint: ignore
Message-Id: <20250522200016.4328287655@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-referencing: remove runtime
 python-typing-extensions dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=46916c3536a066e876b77eb282d5b24eeb8ecf64
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 0586ee6cba7411b2d1f6635cdfe36ab8fac791d7.

The dependency is not needed any more with package/python3 providing
3.13 (since commit d63e207eb869063f82c867658676c2903beb08cb).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Julien: reword commit log title]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-referencing/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
index 3a8dc49b2a..273c42543e 100644
--- a/package/python-referencing/Config.in
+++ b/package/python-referencing/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_PYTHON_REFERENCING
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime, with Python < 3.13
 	help
 	  JSON Referencing + Python.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
