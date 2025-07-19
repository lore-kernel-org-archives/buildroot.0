Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 923A4C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 47FFA40C7D;
	Sat, 19 Jul 2025 10:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FpB97-uRgO8; Sat, 19 Jul 2025 10:16:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8171840C22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8171840C22;
	Sat, 19 Jul 2025 10:16:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC38DDA
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE92B40C22
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:16:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ISsEP8mNdmk for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E6A40C11
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 19E6A40C11
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:16:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 13B8A8658D; Sat, 19 Jul 2025 10:16:21 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:15:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4149871af19dbe88d95801f557866474120febfc
X-Git-Newrev: dcf9df16d89181c9f5022099a9b8874c004f3db9
X-Patchwork-Hint: ignore
Message-Id: <20250719101621.13B8A8658D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: fix missing build
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=dcf9df16d89181c9f5022099a9b8874c004f3db9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since aiohttp was bumped in e4451602ebee8ef6f6b354e8f9b6dcc80206f079,
it now requires pkgconfig at setup time, see upstream commit
https://github.com/aio-libs/aiohttp/commit/40563751adf02b811d5acf95696c096a4dbd9ed4

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
