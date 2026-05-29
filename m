Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8422CD6E45
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 889D842183;
	Fri, 29 May 2026 08:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fEIxiq-EuczA; Fri, 29 May 2026 08:28:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91DCF421C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043322;
	bh=7mf4u0o+0zwxVe2cjKX9s1sgIuY+et605w4VTEv55qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jdmF6cO/LTfjkjuXhzFPzz6hKyBMeoKDF9pdmbI8xQ5mpHbVymctEcZ6TYYaE/gYu
	 5BeGCUtR83cwTnd+k8D2QWPPGfXKUuAqQCShMYTzuKWg5lA6EQg1QZ0bIJ3xAbbyKW
	 JEIJ6yKsuXGO0HOQzADLuYlF3t9gUh2KQE5YqjaufUJruQm0DP4povtQvYY8w2wtZN
	 arNZiUpIik0iYMFN/S7cWWsb6Y3fJq/cL4M70F65AdBicFmLWLM+MO9uZ5r2cz/3rL
	 V581XeqdujUYC15y5skamrnuoV8k1j1itNGx7mL6G8e7aeWuk1w33P4pIuIStUvWtz
	 raOA2DEiBealw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DCF421C4;
	Fri, 29 May 2026 08:28:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15093288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5DEF66136A
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NpZnaYHI8Mdx for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4732D60E10
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4732D60E10
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D916B868A0; Fri, 29 May 2026 08:27:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:27:10 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 6c722cafd2c76e4b46b59f2db4e66d16ce2d742d
X-Git-Newrev: d40bb7279334fba78a6852cfa7f05923add0ec5e
X-Patchwork-Hint: ignore
Message-Id: <20260529082749.D916B868A0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] {linux,
 linux-headers}: bump 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, 6.18.x series
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d40bb7279334fba78a6852cfa7f05923add0ec5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Update the latest kernel releases to:
 - 6.12.90 -> 6.12.91
 - 6.6.140 -> 6.6.141
 - 6.1.173 -> 6.1.174
 - 5.15.207 -> 5.15.208
 - 5.10.256 -> 5.10.257
 - 6.18.32 -> 6.18.33

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 linux/before-6.17/linux.hash         | 10 +++++-----
 linux/from-6.17/linux.hash           |  2 +-
 package/linux-headers/Config.in.host | 12 ++++++------
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index 19dc977938..c0b37d02de 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -1,10 +1,10 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  1f1a1ff057468b8a6284d3ce1d181278259beb5670ea16724c46dbf8820fa2a8  linux-6.12.90.tar.xz
-sha256  d67c9674a2d4307f3747183935a5d434391df0fc5f5bf0e00691e059f664b7db  linux-6.6.140.tar.xz
-sha256  c4f32c6cfbe8c31478f18a4b2a50f89e73f8641ba1d683d80efc16c898876d98  linux-6.1.173.tar.xz
+sha256  0ff2ab9e169f9f1948557471fbb450d3018f8c5b77caf288e1a3982582597969  linux-6.12.91.tar.xz
+sha256  3bc2652eb62ab90a90a8b0aa156b91d276f92eb84702971df62fe1a3f1eb7fe1  linux-6.6.141.tar.xz
+sha256  ed88346df623ae9150d11b5feb16ddb52c25aef563bb7803ab160bb4493fe06e  linux-6.1.174.tar.xz
 # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
-sha256  50eb7fa307745f30e5cae4c17e188fc42ce6a72f7d925d5ea7e3c2135de6148e  linux-5.15.207.tar.xz
-sha256  f1e9dac8ec41e5bd7b1811158c7b72269696ce1c37fbdd17a898b293b54d8e5f  linux-5.10.256.tar.xz
+sha256  b53d7036e327a627595f42349cb5c9d55b4db8262ab473e08274bd8d3028b172  linux-5.15.208.tar.xz
+sha256  08b1fde1b563d7f5b0f429b283105b8a0e255463590e50fdce0abbc07a66f0d1  linux-5.10.257.tar.xz
 # Locally computed
 sha256  93408e0c5d70ff0ab63dcf9edec6fda2b8524281d611a88e56590436bda43914  linux-cip-5.10.246-cip66.tar.gz
 sha256  b3454708b98016f02604433e41060be2c1feb595c2bddeb25292596f047f0915  linux-cip-5.10.246-cip66-rt29.tar.gz
diff --git a/linux/from-6.17/linux.hash b/linux/from-6.17/linux.hash
index e401c64996..068fe418f3 100644
--- a/linux/from-6.17/linux.hash
+++ b/linux/from-6.17/linux.hash
@@ -1,6 +1,6 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
 sha256  cde8bf6739be4a0777fedbbba5330b8188c55680c45a922a4dfa289cbec6f185  linux-6.19.14.tar.xz
-sha256  067dadd445578284ea6158f312f7970d8940fed3e094dbe49cff66d188d3bda4  linux-6.18.32.tar.xz
+sha256  6f16ff302599f6fe34742890322cf0775703105fbd8767449682fca6af0fb782  linux-6.18.33.tar.xz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 12b44624c1..756548b266 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -464,12 +464,12 @@ endchoice
 
 config BR2_DEFAULT_KERNEL_HEADERS
 	string
-	default "5.10.256"	if BR2_KERNEL_HEADERS_5_10
-	default "5.15.207"	if BR2_KERNEL_HEADERS_5_15
-	default "6.1.173"	if BR2_KERNEL_HEADERS_6_1
-	default "6.6.140"	if BR2_KERNEL_HEADERS_6_6
-	default "6.12.90"	if BR2_KERNEL_HEADERS_6_12
-	default "6.18.32"	if BR2_KERNEL_HEADERS_6_18
+	default "5.10.257"	if BR2_KERNEL_HEADERS_5_10
+	default "5.15.208"	if BR2_KERNEL_HEADERS_5_15
+	default "6.1.174"	if BR2_KERNEL_HEADERS_6_1
+	default "6.6.141"	if BR2_KERNEL_HEADERS_6_6
+	default "6.12.91"	if BR2_KERNEL_HEADERS_6_12
+	default "6.18.33"	if BR2_KERNEL_HEADERS_6_18
 	default "6.19.14"	if BR2_KERNEL_HEADERS_6_19
 	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
 	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
