Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55760C4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 17:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E313E40468;
	Mon,  5 Feb 2024 17:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E313E40468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iMR3ASNupuK; Mon,  5 Feb 2024 17:33:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 066F340AB8;
	Mon,  5 Feb 2024 17:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 066F340AB8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A8E911BF3D6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79A8040AB8
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 17:33:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79A8040AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2HfpY9YW5zQY for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 17:33:13 +0000 (UTC)
Received: from mail-a.sr.ht (mail-a.sr.ht [46.23.81.152])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 785DB40468
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 17:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 785DB40468
Received: from git.sr.ht (unknown [46.23.81.155])
 by mail-a.sr.ht (Postfix) with ESMTPSA id 8D2242013A;
 Mon,  5 Feb 2024 17:33:21 +0000 (UTC)
From: ~bubu <bubu@git.sr.ht>
Date: Mon, 05 Feb 2024 18:09:43 +0100
Message-ID: <170715438947.30890.14026766289772625544-0@git.sr.ht>
X-Mailer: git.sr.ht
To: buildroot@buildroot.org
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 bh=E9eRMJ3WAx9ENFwEtV7AaTscmYTPaaR+nS5Hhmu939A=; 
 c=simple/simple; d=git.sr.ht; h=From:Date:Subject:Reply-to:To:Cc;
 q=dns/txt; s=20240113; t=1707154401; v=1;
 b=AAEJuKUFxFzps5lwQp1BWvydiiYY+syDCvjAleW98gSZRh+JkjWs53QJN8e++bXtrMCj+6Aa
 mvof1p1jxRBmJAabZwQGAFQ9hML6HoRXxT428kvbKS+3nJhRCVhkn6dQy8kCa9z5f0DHtVKQjxy
 tiLP91G6FiEigDi5dsCY/PtXl2PPjbHcG6WzHHxEar+LOOYh1ZvlWUK1PtEIx2Q+qjYdWQRN9C7
 Hm9sCD4nOxSQouweBtwQqqF1HFCaOiQRnExvVbDLwuQ49DVtbXLT+H0W3By/qcnihZDUa0UkitI
 5hoz7u8VFSQIV6jGhxUDbxTVq5glQmwhfx26qFOvnQ5Gw==
Subject: [Buildroot] [PATCH buildroot 1/2] package/python-uvicorn: requires
 PYTHON3_SSL
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
Reply-To: ~bubu <bubu@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Marcus Hoffmann <bubu@bubu1.eu>

Uvicorn has a hard requirement on the python ssl module. Without it even
running uvicorn --help fails.
---
 package/python-uvicorn/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-uvicorn/Config.in b/package/python-uvicorn/Config.in
index 3e769392f9..c84f54781f 100644
--- a/package/python-uvicorn/Config.in
+++ b/package/python-uvicorn/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_UVICORN
 	bool "python-uvicorn"
 	select BR2_PACKAGE_PYTHON_CLICK # runtime
 	select BR2_PACKAGE_PYTHON_H11 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	help
 	  The lightning-fast ASGI server.
 
-- 
2.38.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
