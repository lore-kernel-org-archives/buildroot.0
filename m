Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E10E8C6FA8F
	for <buildroot@archiver.kernel.org>; Wed, 30 Aug 2023 06:10:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 975FF408E2;
	Wed, 30 Aug 2023 06:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 975FF408E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYuhaOn2RLp4; Wed, 30 Aug 2023 06:10:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E02E41578;
	Wed, 30 Aug 2023 06:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E02E41578
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BD38A1BF41D
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9271F60EA6
 for <buildroot@lists.busybox.net>; Wed, 30 Aug 2023 06:10:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9271F60EA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L2CZaYzkbB2u for <buildroot@lists.busybox.net>;
 Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94DF060E09
 for <buildroot@buildroot.org>; Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94DF060E09
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7D3B3864F4; Wed, 30 Aug 2023 06:10:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 30 Aug 2023 08:06:27 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 1f5b0a3691f20367a33d6eac6ddda50d1e0fe2d1
X-Git-Newrev: 90d46e1901ca4106c7235f41f3025326eba4cfdd
X-Patchwork-Hint: ignore
Message-Id: <20230830061005.7D3B3864F4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] {linux,
 linux-headers}: bump 5.15.x / 6.{1, 4}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=90d46e1901ca4106c7235f41f3025326eba4cfdd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 15aae1902a3d47caa29bfb997a82a72194c79396)
[Peter: drop 6.4.x bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/linux/linux.hash b/linux/linux.hash
index 5ffa1825aa..736557f651 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,8 +1,8 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  ea460560e2898022c5f3c4649908694dcd75a094ffde726e8c6ca5e0a09491fb  linux-6.3.13.tar.xz
-sha256  4cddee22fdf657138a06af653492f67cd3a4762c04a34725534bd200d99085b8  linux-6.1.39.tar.xz
+sha256  43eafc2197a07dcdcff7a7ef79ac7502061f7c564744e51626bf5fa2e22587f0  linux-6.1.40.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  6499089eae6b271063cb3e873ab7f4ba0543cfb21dcc9c54d9bcf5357db683f6  linux-5.15.120.tar.xz
+sha256  07e0cebdb00d25459683e9c330a0576349b8c5e5f2abf053b864f9909151c31d  linux-5.15.121.tar.xz
 sha256  1e60296a135d272bb7ce645f6ae68fbd4ffd1972cb4b82c38c6faa1172481be3  linux-5.10.186.tar.xz
 sha256  dc5458462c6edbe3473fc6dee80fbe0841df7c177fe0546c2f131e5918f5351d  linux-5.4.249.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 4a5cfbbcd9..a36ddf02b3 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -400,8 +400,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "4.19.288"	if BR2_KERNEL_HEADERS_4_19
 	default "5.4.249"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.186"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.120"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.39"	if BR2_KERNEL_HEADERS_6_1
+	default "5.15.121"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.40"	if BR2_KERNEL_HEADERS_6_1
 	default "6.3.13"	if BR2_KERNEL_HEADERS_6_3
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
