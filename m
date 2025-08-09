Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F327FC87FDB
	for <buildroot@archiver.kernel.org>; Mon, 11 Aug 2025 14:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2A8741341;
	Mon, 11 Aug 2025 14:13:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dPo28mdrvsed; Mon, 11 Aug 2025 14:13:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2725413B9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2725413B9;
	Mon, 11 Aug 2025 14:13:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCB8138
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 968DB83E2F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ISosSTbg0qnR for <buildroot@buildroot.org>;
 Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B979483D6F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B979483D6F
 for <buildroot@buildroot.org>; Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9F6287400; Mon, 11 Aug 2025 14:13:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 9 Aug 2025 19:33:18 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: e69822b2dce2db4e79227231a55a270ef02e3594
X-Git-Newrev: 176fed6cc006629ecd43b9930ab975db54a8f850
X-Patchwork-Hint: ignore
Message-Id: <20250811141326.A9F6287400@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc-bare-metal:
 fix symlink to gcc 14.3.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=176fed6cc006629ecd43b9930ab975db54a8f850
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

With gcc bump to version 14.3.0 in [1]. The gcc-bare-metal version
was not aligned to the same version which led to the following error in
the autobuilder:

```
make[1]: Leaving directory '/workdir/instance-0/output-1/build/host-mpc-1.3.1'
ERROR: No hash found for gcc-14.2.0.tar.xz
make: *** [package/pkg-generic.mk:179: /workdir/instance-0/output-1/build/host-gcc-bare-metal-14.2.0/.stamp_downloaded] Error 1
```

This patch align gcc-bare-metal with the version of gcc 14.

[1] 1e8c1e0ef0 package/gcc: update to 14.3.0

Fixes: https://autobuild.buildroot.org/results/3a2/3a228e885cb04e0c91eee470f9622e0e44eec3d7
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/gcc-bare-metal/14.2.0            | 1 -
 package/gcc-bare-metal/14.3.0            | 1 +
 package/gcc-bare-metal/gcc-bare-metal.mk | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gcc-bare-metal/14.2.0 b/package/gcc-bare-metal/14.2.0
deleted file mode 120000
index 0737236850..0000000000
--- a/package/gcc-bare-metal/14.2.0
+++ /dev/null
@@ -1 +0,0 @@
-../gcc/14.2.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/14.3.0 b/package/gcc-bare-metal/14.3.0
new file mode 120000
index 0000000000..429ecf8646
--- /dev/null
+++ b/package/gcc-bare-metal/14.3.0
@@ -0,0 +1 @@
+../gcc/14.3.0/
\ No newline at end of file
diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-metal/gcc-bare-metal.mk
index ec245db35b..a69d86057e 100644
--- a/package/gcc-bare-metal/gcc-bare-metal.mk
+++ b/package/gcc-bare-metal/gcc-bare-metal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GCC_BARE_METAL_VERSION = 14.2.0
+GCC_BARE_METAL_VERSION = 14.3.0
 GCC_BARE_METAL_SITE = $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VERSION)
 GCC_BARE_METAL_SOURCE = gcc-$(GCC_BARE_METAL_VERSION).tar.xz
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
