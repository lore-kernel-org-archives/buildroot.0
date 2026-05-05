Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C781CD3427
	for <buildroot@archiver.kernel.org>; Tue,  5 May 2026 18:53:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1070A60ABF;
	Tue,  5 May 2026 18:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CgOawAskv1R9; Tue,  5 May 2026 18:53:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B6B460AAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778007207;
	bh=CKhmR05wd2JBAEphv4oVVosqO+WPy8+FdJH30+F7uWo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sbRwjxPL7jiKNxnr1FhTsNP5nRNLgzfI7Iz5eGG97Lq/o+rEvFLvSw8Yr8iQxtGfV
	 PJDlWa2w1b+4Ez4b/WG2yTF2sUV7eM7tX2WWmRMn2BPmJe7HgSPtwjES7lOJBkRUb9
	 En6a1+6Q0TrpmCLAUuzjrKro1T5VbPqyr/RnvOV09ci/rrUGOmHSWX0QuGdmkD30FE
	 Eyz2WV/HHlyGbFmjjK4S5Eobn2GVTPh9dfx+HOFgc/LtEXM7Di7AMyaGDrUv4ZdMZ4
	 J75Tf9M4s9CCbO7kURFSZDmRA/D9FE3V4wc7ih9tsewNzJA+XIhOA2/7se0Kv5Vt19
	 GsuBdAOh/+z3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B6B460AAF;
	Tue,  5 May 2026 18:53:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 134B3315
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10CE960AAF
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z6AHa6-VFHvJ for <buildroot@buildroot.org>;
 Tue,  5 May 2026 18:53:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0247960A96
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0247960A96
 for <buildroot@buildroot.org>; Tue,  5 May 2026 18:53:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A20084574; Tue,  5 May 2026 18:53:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 5 May 2026 20:44:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a063c89dc2d3af3f98d9679571a4972210e3390c
X-Git-Newrev: 26dfdcfbbc9f5f1dcf7ffa57273f7fe2c5f6847a
X-Patchwork-Hint: ignore
Message-Id: <20260505185324.2A20084574@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpc: bump to 1.4.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/26dfdcfbbc9f5f1dcf7ffa57273f7fe2c5f6847a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://gitlab.inria.fr/mpc/mpc/-/blob/b8c90939ef1dc32cfbaa1823fe9e676ad5515ef4/NEWS#L1-16

Releases changed from tar.gz to .tar.xz format.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpc/mpc.hash | 3 ++-
 package/mpc/mpc.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/mpc/mpc.hash b/package/mpc/mpc.hash
index f69a5b66ca..c899cb9978 100644
--- a/package/mpc/mpc.hash
+++ b/package/mpc/mpc.hash
@@ -1,3 +1,4 @@
+# Locally calculated after verifying GPG signature
+sha256  91204cd32f164bd3b7c992d4a6a8ce6519511aadab30f78b6982d0bf8d73e931  mpc-1.4.1.tar.xz
 # Locally calculated
-sha256  ab642492f5cf882b74aa0cb730cd410a81edcdbec895183ce930e706c1c759b8  mpc-1.3.1.tar.gz
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/mpc/mpc.mk b/package/mpc/mpc.mk
index 467bed4dbe..b12af613a4 100644
--- a/package/mpc/mpc.mk
+++ b/package/mpc/mpc.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-MPC_VERSION = 1.3.1
+MPC_VERSION = 1.4.1
 MPC_SITE = $(BR2_GNU_MIRROR)/mpc
+MPC_SOURCE = mpc-$(MPC_VERSION).tar.xz
 MPC_LICENSE = LGPL-3.0+
 MPC_LICENSE_FILES = COPYING.LESSER
 MPC_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
