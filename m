Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18977E8FDA7
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 10:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7D664091A;
	Fri, 26 Dec 2025 10:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cLEv6rPZKH8r; Fri, 26 Dec 2025 10:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6ED64091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766745817;
	bh=32MEP9QKApDhe8zUrMD/3FQt7vGmQPb6D6+zkdJq3oA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=E5EUeHbe2lluhyTqApMcwqMyTHxEyeYT1179N6K4FioiRJnrULiP6zgmRwVhODxXV
	 uWpbOZbLXu4182SkYalkJOyyx2IUI9IFJDZM9Pe868Zm3MuiXuzCXFu9xxCPE+wqCY
	 t3yDl5dZ3Yu/ZAxWzH3xXMq6CuOTQGURhFaqnhZwpbOJpOBqy5XeX+eyBhXLXBubIN
	 KCLUsotSKFRJXypc89SnihVPqv0iiH1rTFz87tnpaijutNvx9FSPDL460f+ecvso7V
	 x+DUyO0VmEwEXQ2AsXSWGxuNdvEPLXb/ie6ggWLImTZjuOF1ab+iDrDpb4+h3HT+ZT
	 8ZEsCTHJSv2tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6ED64091D;
	Fri, 26 Dec 2025 10:43:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 48AC5B9
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33BE44091D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E_ZLXWJx8aKx for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 10:43:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A2C84091A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A2C84091A
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 10:43:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A05987666; Fri, 26 Dec 2025 10:43:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 11:42:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dca8423fbcc8389021ddb710cf7f9eec8aa047f3
X-Git-Newrev: 85a8faec193fd43bb7956b04ebbc77502cb4fe34
X-Patchwork-Hint: ignore
Message-Id: <20251226104334.7A05987666@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti to package
 util-linux
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

commit: https://git.buildroot.net/buildroot/commit/?id=85a8faec193fd43bb7956b04ebbc77502cb4fe34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f16a724b15..a06035b869 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1332,6 +1332,7 @@ F:	package/swupdate/
 F:	package/tmux/
 F:	package/trace-cmd/
 F:	package/udisks/
+F:	package/util-linux/
 F:	package/wilc-driver/
 F:	toolchain/
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
