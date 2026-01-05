Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5860BC2A075
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 08:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2DA4064A;
	Mon,  5 Jan 2026 08:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yh-H7cFhjrUb; Mon,  5 Jan 2026 08:49:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D9FE4062E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767602999;
	bh=U8JuoICf9AZAsQY/SDlK98CX3Bn0SPuil+4yKu3QrZI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Et06j8Mmzy8qXc8APmofhZGp4MvZuL5HkDrhctIai02kMWOq59A0WsNzaylj8yWL6
	 lFntpAss1zc/azwGfZYeTbfsak5i1TeotD82ipNaJ209x2Anvg/+ngl4lqJcawWR9B
	 7RVTc5XsUakgd7x6FwyRVmdrShyduYhPtbm2e52RHl+U1beP3sVeV0RjVxLbbZb2BJ
	 +1KbtCCeWjYXq6sfMT/Zm4Pmput2Jfb5yXSj8OfQwlIaiILurtgtcQjwWQ0bFu1knm
	 lIHcetlIgvFQoJ10t9s4bByXx9JYzj4TSIey3O8e8M0FKbnfETGz3Bz82gmQ0UEc3o
	 LXWqVqRdNuj4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9FE4062E;
	Mon,  5 Jan 2026 08:49:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EA52DF
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E310980FF8
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F__l-AxshiJA for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 08:49:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B3A780FBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B3A780FBA
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 08:49:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 279EF8823F; Mon,  5 Jan 2026 08:49:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jan 2026 09:49:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41de83af1fba998ab9b1e5e92b5efda910dcfd37
X-Git-Newrev: 18655efbd5eab0fe8e9f5fd208647de04715cd9b
X-Patchwork-Hint: ignore
Message-Id: <20260105084957.279EF8823F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/beagleboneai_defconfig: fix
 whitespace
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

commit: https://git.buildroot.net/buildroot/commit/?id=18655efbd5eab0fe8e9f5fd208647de04715cd9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/beagleboard/beagleboneai/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beagleboard/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
index 8aefd76ef8..02e61bc9be 100644
--- a/board/beagleboard/beagleboneai/genimage.cfg
+++ b/board/beagleboard/beagleboneai/genimage.cfg
@@ -19,7 +19,7 @@ image sdcard.img {
 	partition u-boot {
 		partition-type = 0xC
 		bootable = "true"
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
