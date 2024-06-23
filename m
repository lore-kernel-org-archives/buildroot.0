Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5058EC2BD09
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 07:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2309880CB4;
	Mon, 24 Jun 2024 07:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qk1CZKAQItTE; Mon, 24 Jun 2024 07:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2097680C9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2097680C9A;
	Mon, 24 Jun 2024 07:43:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1F201BF4D5
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB70540363
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 07:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4qnI5PEOqGoV for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BA6474032E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id BA6474032E
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A80D782A8A; Mon, 24 Jun 2024 07:43:36 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Jun 2024 17:50:14 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1f4c382e1faeb8c24609634276a14add8b605cd7
X-Git-Newrev: dda4387b2c742562d0418a55b6411322a1929d0b
X-Patchwork-Hint: ignore
Message-Id: <20240624074336.A80D782A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] {linux,
 linux-headers}: bump 6.{1, 6}.x series
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

commit: https://git.buildroot.net/buildroot/commit/?id=dda4387b2c742562d0418a55b6411322a1929d0b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7dd7a6820551278d6c002d2bda394364f9932946)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 4 ++--
 package/linux-headers/Config.in.host | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 47a3292fe8..2facb65db8 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -128,7 +128,7 @@ endif
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.6.32" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.6.33" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index 0e1d3c92da..60de2ac34f 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
-sha256  9019f427bfdc9ced5bc954d760d37ac08c0cdffb45ad28087fc45a73e64336c9  linux-6.1.92.tar.xz
+sha256  a13ebc20dc2a75722699949af74aa86a4ce5d544d6daaa6a7de4e8c81b40de97  linux-6.6.33.tar.xz
+sha256  df31af2ef5923d61fadd68bfd991f50f2e42a913895eb4b03214ee78f8720bcf  linux-6.1.93.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
 sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 33f2f00918..45b172693a 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -407,8 +407,8 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
 	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.92"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.32"	if BR2_KERNEL_HEADERS_6_6
+	default "6.1.93"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.33"	if BR2_KERNEL_HEADERS_6_6
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
