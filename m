Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3684CD8CA8
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:03:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FF4885AD2;
	Tue,  9 Jun 2026 13:03:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lJ_mF8GcHO4O; Tue,  9 Jun 2026 13:03:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE3C785734
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010226;
	bh=YL9+CNnDd9LP9Nx44ttQ0Hiwb8nCck/yFRpg5ET8V8A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Uvoby+w6+Ab0lpusrGFBvxnoyZ97CjR+b43vWi9tg1dAWsFmWW7MHp+5LrK1E1wdr
	 JQXS6CaWHPuxyh19LXFQfNlZkOMIRdWdDHIDXaidSSqTcojeyWXvJyazMGwO3FEH22
	 mc/MaPOFG2r74oAzWJVzbLcs5KmfMbBcNCkSfCIBXnJFJTYKW3xSInyjT+lbtaM1bc
	 U8opP3Mv8ruAfAe8ncvQRDtHG0QEGZ9AD2IT4K1QWV0l9HZz5QLSKgBdpE5XlZccKj
	 rxYPWjESEqk+iddGgpqqPBJuWYWErNjgLjCj0oZ52LTf13SokTm9pZYJMzluKjiH2r
	 7XA8DLW49eB9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE3C785734;
	Tue,  9 Jun 2026 13:03:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83069190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3CF94270E
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EA55fzFACrtn for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B87BB426FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B87BB426FF
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E78A387E7E; Tue,  9 Jun 2026 13:01:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:57:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da278ba1dab7e29369879c8a29cbd1b42dbe9ce0
X-Git-Newrev: e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
X-Patchwork-Hint: ignore
Message-Id: <20260609130120.E78A387E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch/m68k: add 68000 nommu support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e5c7b43494c4d6aa57c6ef314bd4e636aacc14fc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Everyone thinks they like ARM but secretly they want to run
Linux on their Megadrive[0].

Building a working toolchain/userland for nommu m68k is a bit
difficult because of the bitrotten tools all over the place and
one big issue is GCC generates code that uses unaligned
accesses that will cause an exception on 68000 machines if you
aren't careful.

Buildroot can easily create a working toolchain and userland
for nommu m68k so why not?

0 - This isn't a joke, I'm working on this. I have u-boot working
    on the Megadrive, Linux is already working on a bunch of 68000
    machines and I just need to get everything a little bit smaller
    to get into 4MB of RAM.

Signed-off-by: Daniel Palmer <daniel@thingy.jp>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 arch/Config.in.m68k | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/Config.in.m68k b/arch/Config.in.m68k
index 235cafacf5..74a197934f 100644
--- a/arch/Config.in.m68k
+++ b/arch/Config.in.m68k
@@ -23,6 +23,11 @@ choice
 	help
 	  Specific CPU variant to use
 
+config BR2_m68k_68000
+	bool "68000"
+	select BR2_m68k_m68k
+	select BR2_SOFT_FLOAT
+
 config BR2_m68k_68030
 	bool "68030"
 	select BR2_m68k_m68k
@@ -41,6 +46,7 @@ config BR2_m68k_cf5208
 endchoice
 
 config BR2_GCC_TARGET_CPU
+	default "68000"		if BR2_m68k_68000
 	default "68030"		if BR2_m68k_68030
 	default "68040"		if BR2_m68k_68040
 	default "5208"		if BR2_m68k_cf5208
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
