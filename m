Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB6BD12675
	for <buildroot@archiver.kernel.org>; Tue,  2 Dec 2025 22:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2B66132F;
	Tue,  2 Dec 2025 22:01:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovlnTHGBV0By; Tue,  2 Dec 2025 22:01:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A71076134C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764712870;
	bh=FwYELRPuAetPA+X3K/Lq2vjneRklPePPkknh3Eud9+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Xtd9dhad1GrFD3kn930LZVgmayH5CYkpoUSbIEPQDucmA4ubwtj6mwsEh7VZhXpQb
	 wTTARsILK0BjujGvKIhTJpvgnRhX4mdGds15y0uLuHGJHN8InpThcg6baxFIOvV2uL
	 5Eu+Q/e0h6JNYmDWdQq6WylPDhJ/ZMJnCNxw87H8XGuDxenIGHnD/2S02hM8BoF4a6
	 tTYez/LPqbvFVi6JHaN0K5fx5k0ucc7Lj0m3ANnJVFdqKvJ9Hq3xGQeUNxr9TTDwEY
	 m7+W6M18iWcM9j2wz0PmhZIBvNXDyYgKzIM8UKR7MOdhrHg/Da3LeJmslLNpbjUwll
	 xmJ/2x7dObo4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A71076134C;
	Tue,  2 Dec 2025 22:01:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 42863E7
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2176C83F18
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:01:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sItNrtrtb4s3 for <buildroot@buildroot.org>;
 Tue,  2 Dec 2025 22:01:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E899A83F10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E899A83F10
 for <buildroot@buildroot.org>; Tue,  2 Dec 2025 22:01:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D6F7C8640C; Tue,  2 Dec 2025 22:01:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Dec 2025 22:46:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f9f3e6ccc66cd4f2becfc29e6b2b74beaddf14e6
X-Git-Newrev: b41c6b21d53218e09321e6fe137d5439e90aeb85
X-Patchwork-Hint: ignore
Message-Id: <20251202220107.D6F7C8640C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] {linux, linux-headers}: bump 6.{6, 12,
 17}.x series
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b41c6b21d53218e09321e6fe137d5439e90aeb85
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/Config.in                      | 2 +-
 linux/linux.hash                     | 6 +++---
 package/linux-headers/Config.in.host | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index c7b313516a..305cc34968 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -141,7 +141,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "6.17.9" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "6.17.10" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.162-cip24" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.162-cip24-rt10" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
diff --git a/linux/linux.hash b/linux/linux.hash
index a01162c3b5..4df1c5696a 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  6d08803b953c509df48d44d3281ed392524321d8bb353eb21c0555790c8f8e06  linux-6.17.9.tar.xz
-sha256  a1d2cd7327f10eec022615c1bb12c06439bd110d2020164be97f698f43ca58be  linux-6.12.59.tar.xz
-sha256  643b31079222fdbda70cfdd0b68c514f05a3926104be4762a4685f62818b43d1  linux-6.6.117.tar.xz
+sha256  fa7f344f3a50dad0af2e0066d51bd3b9183fd24587861042343ded3d1fd5c8cd  linux-6.17.10.tar.xz
+sha256  a63096b2147411d683cecbf87622bb2ff4885bac2b3641d3d4f10250c89cdcf8  linux-6.12.60.tar.xz
+sha256  4bdddce35474afc8d26f74ebfbcd0e1045ecd15f69e60f53529dba143374b17d  linux-6.6.118.tar.xz
 sha256  ad068bfdb604ec0f4f7de385c8e7ab944008aa78a4aeeca94f53206e6726bfda  linux-6.1.158.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
 sha256  83157953598b026fb721c906c60dfdfd8e986f25ecb9910f3504f690e2770e05  linux-5.15.196.tar.xz
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index dc68e71b58..4ab3516d61 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -462,9 +462,9 @@ config BR2_DEFAULT_KERNEL_HEADERS
 	default "5.10.246"	if BR2_KERNEL_HEADERS_5_10
 	default "5.15.196"	if BR2_KERNEL_HEADERS_5_15
 	default "6.1.158"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.117"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.59"	if BR2_KERNEL_HEADERS_6_12
-	default "6.17.9"	if BR2_KERNEL_HEADERS_6_17
+	default "6.6.118"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.60"	if BR2_KERNEL_HEADERS_6_12
+	default "6.17.10"	if BR2_KERNEL_HEADERS_6_17
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
 	default BR2_KERNEL_HEADERS_CUSTOM_REPO_VERSION \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
