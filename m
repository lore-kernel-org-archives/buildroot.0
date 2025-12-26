Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2A9E8FDA8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 11:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 491E440951;
	Fri, 26 Dec 2025 11:36:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9u-2yI_zFITw; Fri, 26 Dec 2025 11:36:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01EC34055D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766748969;
	bh=rXhD6TuXrE+DHQ+BfapPIw+jB/B16TDRTpQq4u+7imA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BZpU0mhLSOd16x3vsmrbPKWY5u3kKjkNE7VixYf95n4lO2mOn2ofjc+9kdEfnF0Bg
	 RJOP3d9UIZdS9hxIgrpdOSdHxmeoZ6JZOes7R0urFQgDqAKDBEIHhAWFNHsDhRJ04V
	 Yk9fMkTbFoDqzO0kgHNvgZOx43IiOQzZxT1nQiiwRtNOLjr6mPfIaqMZrEKabaUP3N
	 qr1/Lfc4ZfoKlmciWuIewLbnjnQ1us5/YNMIvChEJtoCYSJpWwjE7XG2KLEYT5iGlY
	 hU8/w0wnxjXYkc23I6MmUDxTgn6FKJcxMHO9qTAOxTbmHzonvmaMowvZFweWMWE03d
	 PjeQyIvlJVb+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01EC34055D;
	Fri, 26 Dec 2025 11:36:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E1025EC
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C62284012D
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VQ1r6N3FfW7g for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB1FF40448
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB1FF40448
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA7B48767C; Fri, 26 Dec 2025 11:36:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 12:15:06 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 849dc900988529d0fa2dc7fbbb7d762a1889d9a6
X-Git-Newrev: 39bcd458910accea8de4b3de792badcae5000bf4
X-Patchwork-Hint: ignore
Message-Id: <20251226113602.AA7B48767C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] DEVELOPERS: add Giulio Benetti for package
 zlib-ng
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

commit: https://git.buildroot.net/buildroot/commit/?id=39bcd458910accea8de4b3de792badcae5000bf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c5a2d5c772..ea74f9d505 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1335,6 +1335,7 @@ F:	package/udisks/
 F:	package/util-linux/
 F:	package/vim/
 F:	package/wilc-driver/
+F:	package/zlib-ng/
 F:	toolchain/
 
 N:	Graeme Smecher <gsmecher@threespeedlogic.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
