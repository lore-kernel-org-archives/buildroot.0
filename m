Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D7BE6ADF9
	for <buildroot@archiver.kernel.org>; Mon, 22 Dec 2025 21:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35F4160B17;
	Mon, 22 Dec 2025 21:07:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f6_dEHWfhYpQ; Mon, 22 Dec 2025 21:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E37696078C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766437636;
	bh=zfuWgTj9xw0v1X/nr8SNBit87CLy+voU4JH0OHLa3rI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=VImAkbgTegsa1mEOgWNpY6MC3+ikB38kUQ0ariqgOF64fZmqTw4X7iUKgmmUsxgi/
	 tms7BZSUIblAFCkRf5t7gnERl40HiuSKMiMLGuyyL876mqO1belL2JBPRMNZieVaw4
	 6df7Ie4BdN/71d+ykxgs2jaARRIhrQ0D40zVHpUAeduYX9vxplQN0f8eX8oD/hRWcQ
	 R5F6En0WYwpXs0mlTf4gC+rFNJMkGux5LPjBwPiwgl1iv91YMYnFCBBNDCt+Zm2Xfx
	 +SPPVPkP58zQeHNQjjVsE9tzMJqMQj0T0MDya+gyuJ5C2fAc2H4Z+m1qHZaKY2H8ds
	 mL1NjhfqgtWtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E37696078C;
	Mon, 22 Dec 2025 21:07:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 64AE7BC
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A0644044F
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lCppkxcqbZLw for <buildroot@buildroot.org>;
 Mon, 22 Dec 2025 21:07:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 518DF4036A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 518DF4036A
 for <buildroot@buildroot.org>; Mon, 22 Dec 2025 21:07:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B47D870D9; Mon, 22 Dec 2025 21:07:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Dec 2025 21:22:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c3f7f070e6a8750ba06e63574319902d6a9cbd42
X-Git-Newrev: 122a0904d7d2dcca8ae60a12fa2cea650cce48e1
X-Patchwork-Hint: ignore
Message-Id: <20251222210714.3B47D870D9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfuse3: bump to version 3.18.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=122a0904d7d2dcca8ae60a12fa2cea650cce48e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://github.com/libfuse/libfuse/releases/tag/fuse-3.18.1

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libfuse3/libfuse3.hash | 2 +-
 package/libfuse3/libfuse3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libfuse3/libfuse3.hash b/package/libfuse3/libfuse3.hash
index b4d252ce40..e80d39ac56 100644
--- a/package/libfuse3/libfuse3.hash
+++ b/package/libfuse3/libfuse3.hash
@@ -1,3 +1,3 @@
 # Locally calculated sha256 checksums
-sha256  354b001b112bafa956005d242f6fca9c3a2a03433eeea874e8a44fe2a4a36e7c  libfuse3-3.18.0.tar.gz
+sha256  adb6b7eed09331d72cbbe6d5ef3597024ab46a1d61c6ca7cdd495e51600f8957  libfuse3-3.18.1.tar.gz
 sha256  b8832d9caaa075bbbd2aef24efa09f8b7ab66a832812d88c602da0c7b4397fad  LICENSE
diff --git a/package/libfuse3/libfuse3.mk b/package/libfuse3/libfuse3.mk
index 6a9d0097bf..6418c5798b 100644
--- a/package/libfuse3/libfuse3.mk
+++ b/package/libfuse3/libfuse3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBFUSE3_VERSION = 3.18.0
+LIBFUSE3_VERSION = 3.18.1
 LIBFUSE3_SITE = $(call github,libfuse,libfuse,fuse-$(LIBFUSE3_VERSION))
 LIBFUSE3_LICENSE = LGPL-2.1
 LIBFUSE3_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
