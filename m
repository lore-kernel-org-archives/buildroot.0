Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4A5C61CE7
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 18:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6592740D70;
	Wed,  4 Jun 2025 18:28:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kWAEW2nOOVXW; Wed,  4 Jun 2025 18:28:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E10440CB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E10440CB8;
	Wed,  4 Jun 2025 18:28:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 02A42DA
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2129B40086
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-B1ly0Sms8z for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B368840050
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B368840050
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A013B876CD; Wed,  4 Jun 2025 18:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 May 2025 18:25:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: acae273134d0d2a9fba3ffc6b29fd106a7537d98
X-Git-Newrev: c07f2fb05108a0b0ddc3c36a9484fc110479e5ec
X-Patchwork-Hint: ignore
Message-Id: <20250604182757.A013B876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] boot/grub2: drop stale
 IGNORE_CVES entries
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

commit: https://git.buildroot.net/buildroot/commit/?id=c07f2fb05108a0b0ddc3c36a9484fc110479e5ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

CVE-2020-15705 is only applicable to grub versions up to 2.04, and
we're using a more recent version, so it is no longer needed to ignore
it.

CVE-2021-46705 is only applicable to grub versions up to 2.06, and
we're using a more recent version, so it is no longer needed to ignore
it.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 06afaf53473bfb5df273e6e70db2778d10224dd3)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
