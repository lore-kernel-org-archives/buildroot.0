Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E01C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D75642677;
	Fri, 28 Feb 2025 16:31:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f-Wp6m512tdc; Fri, 28 Feb 2025 16:30:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DFBB4265F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DFBB4265F;
	Fri, 28 Feb 2025 16:30:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 33C8F711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 71BFF80A77
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nAaV94g8VYx3 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C8480547
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9C8480547
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A61DB87A71; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Nov 2024 15:50:32 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b617eb3281ed56aa8ff63af2bb9bccafcd8b7f2b
X-Git-Newrev: 39a54900727a359bb0285a751ff7de857088c1f4
X-Patchwork-Hint: ignore
Message-Id: <20250228162930.A61DB87A71@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/quagga: fetch from
 sources.buildroot.net
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

commit: https://git.buildroot.net/buildroot/commit/?id=39a54900727a359bb0285a751ff7de857088c1f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes https://autobuild.buildroot.org/results/54a/54a165827f536be47cd45c98da3937a1e94a7c65/

Upstream is no longer accessible, so use s.b.n instead.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/quagga/quagga.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 5d8d52263a..dd921552f1 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 QUAGGA_VERSION = 1.2.4
-QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
+# upstream (http://download.savannah.gnu.org/releases/quagga) dead
+QUAGGA_SITE = http://sources.buildroot.net/quagga
 QUAGGA_INSTALL_STAGING = YES
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
