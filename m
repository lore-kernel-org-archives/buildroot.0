Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1ABBC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 14:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01BA384649;
	Sat,  1 Jun 2024 14:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1m1f3d7dbbfT; Sat,  1 Jun 2024 14:53:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFE568464A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFE568464A;
	Sat,  1 Jun 2024 14:53:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 046C81BF4DD
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:53:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E3DB18464A
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 14:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ZPIbgiT5OVn for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 14:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12B4A84649
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12B4A84649
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 14:53:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8140878AB; Sat,  1 Jun 2024 14:53:03 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 1 Jun 2024 16:48:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 584ebdea6e2edb415b6a3c96bea490a0d2beea78
X-Git-Newrev: a6784999b23cbe156d63177bf283b844d76aa4e6
X-Patchwork-Hint: ignore
Message-Id: <20240601145303.E8140878AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 4.19.x, 5.4.x,
 5.10.x, 5.15.x, 6.1.x, 6.6.x, 6.8.x series
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
Content-Type: multipart/mixed; boundary="===============7840039417816923090=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7840039417816923090==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=a6784999b23cbe156d63177bf283b844d76aa4e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gero Schwäricke <gero.schwaericke@grandcentrix.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 linux/Config.in                      |  2 +-
 linux/linux.hash                     | 14 +++++++-------
 package/linux-headers/Config.in.host | 14 +++++++-------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index d3d4c42910..194a24f391 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -134,7 +134,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.8.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.8.12" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index af82148e80..b972557fc0 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,13 +1,13 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  f905f1238ea7a8e85314bacf283302e8097006010d25fcea726d0de0ea5bc9b6  linux-6.8.9.tar.xz
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
-sha256  83a3d72e764fceda2c1fc68a4ea6b91253a28da56a688a2b61776b0d19788e1d  linux-6.1.90.tar.xz
+sha256  19b31956d229b5b9ca5671fa1c74320179682a3d8d00fc86794114b21da86039  linux-6.8.12.tar.xz
+sha256  aaa824eaf07f61911d22b75ff090a403c3dd0bd73e23933e0bba8b5971436ce1  linux-6.6.32.tar.xz
+sha256  9019f427bfdc9ced5bc954d760d37ac08c0cdffb45ad28087fc45a73e64336c9  linux-6.1.92.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  f9071c83a4fd8b80af026b48cfc1869bfa25883f9148b92b5dc1e1e1e26dd5c6  linux-5.15.158.tar.xz
-sha256  e310588c4b23f0959614e60f007afc20e9b1a8f296d682b041fa129f96fbe151  linux-5.10.216.tar.xz
-sha256  dad2b068946f0ca0026130d7ab17601d5074d90b381379c4479314d4edf4304c  linux-5.4.275.tar.xz
+sha256  f41e718e33b88f269a6b6a7653e5e9824c4ba541f6ffe5bf26ecc37c540a1b05  linux-5.15.160.tar.xz
+sha256  9c36b243e8c3ec1d5963366618f336710b84340bf95be2037b26c452392cb2d6  linux-5.10.218.tar.xz
+sha256  7e1f5b28588e49ddfd18e7772476e4e8b52bdc9c3e19beafcbb7c103e6c01f51  linux-5.4.277.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v4.x/sha256sums.asc
-sha256  a8145e2ecf8437b6d06400c3358a595c47a74443b164890cf12a07d8722539c8  linux-4.19.313.tar.xz
+sha256  6c5e4d3c87feadbfdb9f7d2e46f3f120b00286ba380491c5956708e0b94232c8  linux-4.19.315.tar.xz
 # Locally computed
 sha256  fb0edc3c18e47d2b6974cb0880a0afb5c3fa08f50ee87dfdf24349405ea5f8ae  linux-cip-5.10.162-cip24.tar.gz
 sha256  b5539243f187e3d478d76d44ae13aab83952c94b885ad889df6fa9997e16a441  linux-cip-5.10.162-cip24-rt10.tar.gz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index d8f48ed0b7..48101783b9 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -415,13 +415,13 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "4.19.313"	if BR2_KERNEL_HEADERS_4_19
-	default "5.4.275"	if BR2_KERNEL_HEADERS_5_4
-	default "5.10.216"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.158"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.90"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.30"	if BR2_KERNEL_HEADERS_6_6
-	default "6.8.9"		if BR2_KERNEL_HEADERS_6_8
+	default "4.19.315"	if BR2_KERNEL_HEADERS_4_19
+	default "5.4.277"	if BR2_KERNEL_HEADERS_5_4
+	default "5.10.218"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.160"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.92"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.32"	if BR2_KERNEL_HEADERS_6_6
+	default "6.8.12"	if BR2_KERNEL_HEADERS_6_8
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \

--===============7840039417816923090==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7840039417816923090==--
