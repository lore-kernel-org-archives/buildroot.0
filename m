Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F566C83F38
	for <buildroot@archiver.kernel.org>; Thu, 17 Jul 2025 20:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 25638417E0;
	Thu, 17 Jul 2025 20:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uIGrs6cP-SFq; Thu, 17 Jul 2025 20:33:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1573D417F6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1573D417F6;
	Thu, 17 Jul 2025 20:33:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D838A59
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9E6841545
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Ik_bEdmB9UB for <buildroot@buildroot.org>;
 Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8BCB841160
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8BCB841160
 for <buildroot@buildroot.org>; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8536886673; Thu, 17 Jul 2025 20:32:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 23:06:09 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: ffbe08e6fb766c364b599fe3f24a4e5771aa7958
X-Git-Newrev: 7edc5c5a99be67211465028689e1bfcdfb08e8c5
X-Patchwork-Hint: ignore
Message-Id: <20250717203256.8536886673@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] {linux,
 linux-headers}: bump 6.{1, 6, 12}.x series
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7edc5c5a99be67211465028689e1bfcdfb08e8c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 09880508cb26260f30608137f697b6bdf11483fa)
[Titouan: drop 6.15 not present in buildroot 2025.05]
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index b814c1004a..5104ca1f6f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  3f1ccd0a6dc9c9777cb6fcef357c77e4a2386c84c52b6d5bbcda79c16af33b1b  linux-6.14.11.tar.xz
-sha256  05f4e0b01dde578c3328eb539d305cccec7b84e939f6dd5f21fdaf5f313da748  linux-6.12.35.tar.xz
-sha256  18640ae9a2c952f8f8868324378df1a9e138ad29e6b93a9c38155764ea67ea85  linux-6.6.95.tar.xz
-sha256  dcd26ea135c96bddbb17131f96176bca1a9268ea0e1cb96dfb7d6970780fa3aa  linux-6.1.142.tar.xz
+sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  9ee45843d43adb2e2ac5f6a8cb10a334e39e3e3384af8a0ce383a37f78221bdd  linux-6.6.96.tar.xz
+sha256  e25bdac4d77e6b1079f899e2ecb24c7e850f295e735ea7b5654b900d85c03b0a  linux-6.1.143.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  9c4efdd7ee550d524c017b5dae27725374526311e983661850cd880af671cb2a  linux-5.15.186.tar.xz
 sha256  2dfa422b6bbe65a6b352a38129d27de918c3f0f05c72ecdd39d46d657ca0f0db  linux-5.10.239.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 34f309f2dc..6eedc87c32 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -443,9 +443,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.295"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.239"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.186"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.142"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.95"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.35"	if BR2_KERNEL_HEADERS_6_12
+	default "6.1.143"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.96"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.36"	if BR2_KERNEL_HEADERS_6_12
 	default "6.14.11"	if BR2_KERNEL_HEADERS_6_14
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
