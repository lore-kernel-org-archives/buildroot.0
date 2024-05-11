Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C0BC04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 20:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAF5141498;
	Sat, 11 May 2024 20:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iAZAPvS9Xtpg; Sat, 11 May 2024 20:11:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51BA141F2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51BA141F2A;
	Sat, 11 May 2024 20:11:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 188511BF57C
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0021241F2A
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 20:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CWO5aelO3jqA for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 20:11:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02A7541498
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A7541498
 for <buildroot@buildroot.org>; Sat, 11 May 2024 20:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED55386FAB; Sat, 11 May 2024 20:11:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 22:08:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 142fec6cbd8f6af0eb21cdf38ebbdf8dbea8724c
X-Git-Newrev: 23d71be5a985a03a3cc29f2507243488889c244c
X-Patchwork-Hint: ignore
Message-Id: <20240511201119.ED55386FAB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: update to 2024.02
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=23d71be5a985a03a3cc29f2507243488889c244c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream added riscv32 support.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/elf2flt/elf2flt.hash | 2 +-
 package/elf2flt/elf2flt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/elf2flt/elf2flt.hash b/package/elf2flt/elf2flt.hash
index 4dc040645e..e338ff6780 100644
--- a/package/elf2flt/elf2flt.hash
+++ b/package/elf2flt/elf2flt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  735482d8c5fd76191e86ff2d6985dd68c232a7b8bdac11fdb480385c6a75ca8f  elf2flt-2023.09.tar.gz
+sha256  e1d419c463431ff1af7fdc76a402f628744ad10dff063bea76a386942255119c  elf2flt-2024.02.tar.gz
 sha256  f20bc5007904094e3a4e9fbcc3526cdd40893f91d458c3139b308e5c4c0899c6  LICENSE.TXT
diff --git a/package/elf2flt/elf2flt.mk b/package/elf2flt/elf2flt.mk
index aa5595843f..d5a7b9b5fd 100644
--- a/package/elf2flt/elf2flt.mk
+++ b/package/elf2flt/elf2flt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELF2FLT_VERSION = 2023.09
+ELF2FLT_VERSION = 2024.02
 ELF2FLT_SITE = $(call github,uclinux-dev,elf2flt,v$(ELF2FLT_VERSION))
 ELF2FLT_LICENSE = GPL-2.0+
 ELF2FLT_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
