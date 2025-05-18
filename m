Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DF7C3ABD8
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 12:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FC3240811;
	Sun, 18 May 2025 12:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1tMrw_N6LtMA; Sun, 18 May 2025 12:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3707940868
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3707940868;
	Sun, 18 May 2025 12:16:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6B6F1BA
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CBBE340868
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1j8NNsOXPOe for <buildroot@buildroot.org>;
 Sun, 18 May 2025 12:16:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26EF84024F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26EF84024F
 for <buildroot@buildroot.org>; Sun, 18 May 2025 12:16:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1275786879; Sun, 18 May 2025 12:16:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:15:50 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3271ce10f2b00dd548a78537346f523ffab8abc4
X-Git-Newrev: 06afaf53473bfb5df273e6e70db2778d10224dd3
X-Patchwork-Hint: ignore
Message-Id: <20250518121639.1275786879@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/grub2: drop stale IGNORE_CVES entries
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=06afaf53473bfb5df273e6e70db2778d10224dd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2020-15705 is only applicable to grub versions up to 2.04, and
we're using a more recent version, so it is no longer needed to ignore
it.

CVE-2021-46705 is only applicable to grub versions up to 2.06, and
we're using a more recent version, so it is no longer needed to ignore
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 boot/grub2/grub2.mk | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 0896029322..22d609c004 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -19,14 +19,6 @@ GRUB2_INSTALL_IMAGES = YES
 # doesn't exist upstream, but is added by the Redhat/Fedora
 # packaging. Not applicable to Buildroot.
 GRUB2_IGNORE_CVES += CVE-2019-14865
-# CVE-2020-15705 is related to a flaw in the use of the
-# grub_linuxefi_secure_validate(), which was added by Debian/Ubuntu
-# patches. The issue doesn't affect upstream Grub, and
-# grub_linuxefi_secure_validate() is not implemented in the grub2
-# version available in Buildroot.
-GRUB2_IGNORE_CVES += CVE-2020-15705
-# vulnerability is specific to the SUSE distribution
-GRUB2_IGNORE_CVES += CVE-2021-46705
 # vulnerability is specific to the Redhat distribution, affects a
 # downstream change from Redhat related to password authentication
 GRUB2_IGNORE_CVES += CVE-2023-4001
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
