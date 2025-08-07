Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AA4C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FEBE80C0F;
	Thu,  7 Aug 2025 17:00:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n-yMCNP8YKZ1; Thu,  7 Aug 2025 17:00:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29E7080BFC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29E7080BFC;
	Thu,  7 Aug 2025 17:00:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1AAF1767
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22A7D80C08
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvJZnRoA1J27 for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 484DC80BE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 484DC80BE1
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45EA686709; Thu,  7 Aug 2025 17:00:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 11:06:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 504aaaab1b3ce6931a6123fa423d6b5732675523
X-Git-Newrev: 9ee12628b4a5c17c62329d60416b702ebbe1011f
X-Patchwork-Hint: ignore
Message-Id: <20250807170020.45EA686709@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-aiohttp:
 fix missing build dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ee12628b4a5c17c62329d60416b702ebbe1011f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since aiohttp was bumped in e4451602ebee8ef6f6b354e8f9b6dcc80206f079,
it now requires pkgconfig at setup time, see upstream commit
https://github.com/aio-libs/aiohttp/commit/40563751adf02b811d5acf95696c096a4dbd9ed4

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit dcf9df16d89181c9f5022099a9b8874c004f3db9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-aiohttp/python-aiohttp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index e52b6e81c5..7070d00cec 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -13,4 +13,6 @@ PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
 PYTHON_AIOHTTP_CPE_ID_VENDOR = aiohttp
 PYTHON_AIOHTTP_CPE_ID_PRODUCT = aiohttp
 
+PYTHON_AIOHTTP_DEPENDENCIES = host-python-pkgconfig
+
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
