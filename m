Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAC5C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 12:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C345820B6;
	Tue,  6 Feb 2024 12:40:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id epxSkR5JkQWI; Tue,  6 Feb 2024 12:40:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52E1181F4F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52E1181F4F;
	Tue,  6 Feb 2024 12:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 412431BF33B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26E4C60B77
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 12:40:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E4C60B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2Izgf-Fmh3w0 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48BE360AEB
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48BE360AEB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A3F86FD1; Tue,  6 Feb 2024 12:40:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 12:04:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 683c81a04cef804c3590861351d97277cf84d639
X-Git-Newrev: 9ab334817a1b7ccbc139f0d64ac04c6d7b0ba48a
X-Patchwork-Hint: ignore
Message-Id: <20240206124011.36A3F86FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-uvicorn: requires
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9ab334817a1b7ccbc139f0d64ac04c6d7b0ba48a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Uvicorn has a hard requirement on the python ssl module. Without it even
running uvicorn --help fails.

Signed-off-by: Marcus Hoffmann <bubu@bubu1.eu>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
