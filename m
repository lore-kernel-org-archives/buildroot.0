Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F219EC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:21:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B671140749;
	Tue,  4 Feb 2025 15:21:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VWN3qN-_GCV6; Tue,  4 Feb 2025 15:21:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DB5E4063C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DB5E4063C;
	Tue,  4 Feb 2025 15:21:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DD22C185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CDABA820D3
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:21:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SdHglbzLEty0 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:21:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C102820CC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C102820CC
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:21:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A81D86E21; Tue,  4 Feb 2025 15:21:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 16:20:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 674b190cc3cda26e487312e3507ff60adceb17b3
X-Git-Newrev: 99140408b490f8450af368b2837a61ff2c9871ca
X-Patchwork-Hint: ignore
Message-Id: <20250204152145.1A81D86E21@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libbsd: make available for arc
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

commit: https://git.buildroot.net/buildroot/commit/?id=99140408b490f8450af368b2837a61ff2c9871ca
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ARC support was added in 0.10.0 by
https://gitlab.freedesktop.org/libbsd/libbsd/-/commit/4997efa59a607a2b4aa2519a50f9e51017b667d2
so drop the architecture dependency on !BR2_arc.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libbsd/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libbsd/Config.in b/package/libbsd/Config.in
index 9f4b30f68c..fd05a2a208 100644
--- a/package/libbsd/Config.in
+++ b/package/libbsd/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
 	default y
 	# libbsd does not support those architectures (see src/local-elf.h)
 	depends on !BR2_microblaze
-	depends on !BR2_arc
 	depends on !BR2_xtensa
 
 config BR2_PACKAGE_LIBBSD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
