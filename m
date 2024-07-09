Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45079C3DA41
	for <buildroot@archiver.kernel.org>; Tue,  9 Jul 2024 09:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22D7A409F7;
	Tue,  9 Jul 2024 09:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D_vQ9D1szZPA; Tue,  9 Jul 2024 09:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C3F740B3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3F740B3C;
	Tue,  9 Jul 2024 09:42:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36ECF1BF29A
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:42:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E412409F2
 for <buildroot@lists.busybox.net>; Tue,  9 Jul 2024 09:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8y0p6IeR3q93 for <buildroot@lists.busybox.net>;
 Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E5F7409F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E5F7409F1
 for <buildroot@buildroot.org>; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25564842E4; Tue,  9 Jul 2024 09:42:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Jul 2024 11:42:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7e270bf65b3c8e6de3b419bd31f1dd8e770ea6b
X-Git-Newrev: c87964564e130bb8eb6140c66880e4e489aae8bb
X-Patchwork-Hint: ignore
Message-Id: <20240709094242.25564842E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nvidia-driver: update the patches
 to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=c87964564e130bb8eb6140c66880e4e489aae8bb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, nvidia-driver fails to build with output:

    Applying 0001-use-LDFLAGS.patch using patch:
    patching file kernel/nvidia/nvidia.Kbuild
    Hunk #1 FAILED at 87.
    1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia/nvidia.Kbuild.rej
    patching file kernel/nvidia-modeset/nvidia-modeset.Kbuild
    Hunk #1 FAILED at 70.
    1 out of 1 hunk FAILED -- saving rejects to file kernel/nvidia-modeset/nvidia-modeset.Kbuild.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/nvidia-driver/0001-use-LDFLAGS.patch | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/nvidia-driver/0001-use-LDFLAGS.patch b/package/nvidia-driver/0001-use-LDFLAGS.patch
index 7b7df80988..9ce237f959 100644
--- a/package/nvidia-driver/0001-use-LDFLAGS.patch
+++ b/package/nvidia-driver/0001-use-LDFLAGS.patch
@@ -17,6 +17,8 @@ Add use of $(LDFLAGS) when doing the link, as the kernel provides the
 proper emulation in those.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 ---
 Issue reported upstream:
@@ -25,8 +27,8 @@ Issue reported upstream:
 diff -durN nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild
 --- nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild	2016-08-09 01:57:50.000000000 +0200
 +++ nvidia-driver-370.23/kernel/nvidia/nvidia.Kbuild	2016-08-20 12:25:02.780233423 +0200
-@@ -87,7 +87,7 @@
- always += $(NVIDIA_INTERFACE)
+@@ -93,7 +93,7 @@
+ always-y += $(NVIDIA_INTERFACE)
  
  $(obj)/$(NVIDIA_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_OBJECTS))
 -	$(LD) -r -o $@ $^
@@ -37,8 +39,8 @@ diff -durN nvidia-driver-370.23.orig/kernel/nvidia/nvidia.Kbuild nvidia-driver-3
 diff -durN nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild
 --- nvidia-driver-370.23.orig/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-09 01:43:19.000000000 +0200
 +++ nvidia-driver-370.23/kernel/nvidia-modeset/nvidia-modeset.Kbuild	2016-08-20 12:25:39.596772662 +0200
-@@ -70,7 +70,7 @@
- always += $(NVIDIA_MODESET_INTERFACE)
+@@ -75,7 +75,7 @@
+ always-y += $(NVIDIA_MODESET_INTERFACE)
  
  $(obj)/$(NVIDIA_MODESET_INTERFACE): $(addprefix $(obj)/,$(NVIDIA_MODESET_OBJECTS))
 -	$(LD) -r -o $@ $^
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
