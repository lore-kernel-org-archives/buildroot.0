Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C010CD3423
	for <buildroot@archiver.kernel.org>; Sat,  2 May 2026 11:48:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C64E983D29;
	Sat,  2 May 2026 11:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uJQt_bxQVWQ; Sat,  2 May 2026 11:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26C7983D23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777722518;
	bh=xhAKOUvkAXjz2me5NoANwOYqzZMRn0k+4iBaSoPiJbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=B8/bdJ4MWqanJ6s6pTkNpnY4fmHvSSA2rUW7DGpbyiUsZHPlIbrahXjgYxJlEUanQ
	 gsnEVZkoKUsDw14/QmQhpUE7fgv5CzEWSVger0fqEsgS9Yzf9+OEKxPbIbAhwqiMC5
	 Qb04DEqClSpnk6PalE+Oy7F2RLHTJtxTawvDLbf3jbc5NWvyYfMQorcWKor4XZlDQd
	 DFPINKWQG/kdJTex84jzuj4Nrqm0KgDELGp4AcPFr8MuUgRcSJ1WfIQ2ek0DcMF1q/
	 337lPN6GMiB1Wu2DXZM1ZD2fMT3nhf1jY9f0fKnuUl0CwwBG1E0ifwnhlQjxJzrLYJ
	 FK3qnklBByOQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26C7983D23;
	Sat,  2 May 2026 11:48:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D45F127
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F2CAF60F4E
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pp0ga2eWIwh for <buildroot@buildroot.org>;
 Sat,  2 May 2026 11:48:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21F5060A54
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21F5060A54
 for <buildroot@buildroot.org>; Sat,  2 May 2026 11:48:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B02597FDE7; Sat,  2 May 2026 11:48:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 May 2026 13:46:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1880965a3b8dccaaa93dbdc36806c06b90d77eb9
X-Git-Newrev: d230af8bba84bbff2615fbfe402a30e710c8f535
X-Patchwork-Hint: ignore
Message-Id: <20260502114834.B02597FDE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to wireshark
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d230af8bba84bbff2615fbfe402a30e710c8f535
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1270365ef0..fd973d7f86 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1337,6 +1337,7 @@ F:	package/udisks/
 F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
+F:	package/wireshark/
 F:	package/zlib-ng/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
