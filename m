Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84920C531DC
	for <buildroot@archiver.kernel.org>; Fri, 23 Aug 2024 14:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264AA81EE1;
	Fri, 23 Aug 2024 14:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yagIH1sHNAjX; Fri, 23 Aug 2024 14:28:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2939D81EF5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2939D81EF5;
	Fri, 23 Aug 2024 14:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6498E1BF2E5
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F28481F01
 for <buildroot@lists.busybox.net>; Fri, 23 Aug 2024 14:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtZl7wcL1vXk for <buildroot@lists.busybox.net>;
 Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 868FF81EE1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 868FF81EE1
 for <buildroot@buildroot.org>; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 710B08632C; Fri, 23 Aug 2024 14:28:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Aug 2024 16:27:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3da3361a1b9cafb274dac776693720fe20f6681b
X-Git-Newrev: 2495630383c4a6659b6b91a58e4f71cdda283f2f
X-Patchwork-Hint: ignore
Message-Id: <20240823142806.710B08632C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: ignore CVE-2024-1048
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

commit: https://git.buildroot.net/buildroot/commit/?id=2495630383c4a6659b6b91a58e4f71cdda283f2f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As explained in:

  https://security-tracker.debian.org/tracker/CVE-2024-1048
  https://www.openwall.com/lists/oss-security/2024/02/06/3

CVE-2024-1048 is related to a tool called grub-set-bootflag which only
exists in the Redhat fork of Grub, and which we don't use in
Buildroot, so this CVE should be ignored.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/grub2/grub2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 6d0d71c47d..19544b6e12 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -25,6 +25,9 @@ GRUB2_IGNORE_CVES += CVE-2019-14865
 GRUB2_IGNORE_CVES += CVE-2020-15705
 # vulnerability is specific to the SUSE distribution
 GRUB2_IGNORE_CVES += CVE-2021-46705
+# vulnerability is specific to the Redhat distribution, affects the
+# grub2-set-bootflag tool, which doesn't exist upstream
+GRUB2_IGNORE_CVES += CVE-2024-1048
 
 ifeq ($(BR2_TARGET_GRUB2_INSTALL_TOOLS),y)
 GRUB2_INSTALL_TARGET = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
