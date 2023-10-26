Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5EC4C25B67
	for <buildroot@archiver.kernel.org>; Thu, 26 Oct 2023 16:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9083F42CB1;
	Thu, 26 Oct 2023 16:40:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9083F42CB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9m26wQSW6EU; Thu, 26 Oct 2023 16:40:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB92142DDD;
	Thu, 26 Oct 2023 16:40:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB92142DDD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 78A231BF98E
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5E411416F1
 for <buildroot@lists.busybox.net>; Thu, 26 Oct 2023 16:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E411416F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CCf16FNJWLJH for <buildroot@lists.busybox.net>;
 Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31A8E42462
 for <buildroot@buildroot.org>; Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 31A8E42462
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12F9785F2B; Thu, 26 Oct 2023 16:40:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 26 Oct 2023 18:36:20 +0200
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: 3b5e9e24c4419b8d78281a64d98bec73a5cc990f
X-Git-Newrev: 89a71e4222f7047f9c9f0e5e204d4fc45a8e19ce
X-Patchwork-Hint: ignore
Message-Id: <20231026164040.12F9785F2B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] {linux,
 linux-headers}: bump 6.1.x series
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89a71e4222f7047f9c9f0e5e204d4fc45a8e19ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2e1890db65fe0e08d626770e226e399309d33fe5)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 2 +-
 package/linux-headers/Config.in.host | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 283c07693f..b1e5d4963a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  9626ec84a39ecb009bf11a271dd520941159c165d4e62f82e3a77b79d20ff27d  linux-6.4.16.tar.xz
-sha256  f9ebfe3ddc5152d87b37e33be30e31875d137433be10a57ce29d2eae7b6e91b1  linux-6.1.57.tar.xz
+sha256  ce987ed3d2f640b3a2a62a0a8573d538a36dfd3cc31e2d7a239ce5a16c1c21ad  linux-6.1.58.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  14835e629e237f136cfed484fdb533c95242429809bdcdb2a2d66dfcb7447170  linux-5.15.135.tar.xz
 sha256  2b141fce994364fbbf137b01e7910d3518b8cdbdf18f1811b48470ab4ce2fa05  linux-5.10.198.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index ed32b32ea4..64c6820a28 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -405,7 +405,7 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.258"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.198"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.135"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.57"	if BR2_KERNEL_HEADERS_6_1
+	default "6.1.58"	if BR2_KERNEL_HEADERS_6_1
 	default "6.4.16"	if BR2_KERNEL_HEADERS_6_4
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
