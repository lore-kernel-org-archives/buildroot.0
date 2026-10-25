Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F15606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=c8oYeKAa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5A9460607;
	Sun, 25 Oct 2026 20:23:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtVk94Yyx6cS; Sun, 25 Oct 2026 20:23:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13E0860601
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792959794;
	b=T51LvDjZPKNvGq+83maAE39hyaty0T6PgEVJI6+AKIFB3VzBe9oUSDnRgXKVZwP/h1Wm
	 oPfMXTkmJXT5QfofbRQtxxl7YnZzTysBPH7sJ+apf3YcheFOthpBm84WxQ5V7A/RnJND6
	 OcYHe5vQaOFxoaivIzTG6k+jZeNGgsXKOQvbb3VnlvPUyT7vUQlDGnjYG7EN+1sTrFgVm
	 He8vM31xX1AuA1U2CvWlkeVlPE0e3z/JEcAta8DHA2WjL9gTydIp+q1iqbejzv8ggCAsV
	 PhZ1ANK7v1u5/TpmG7/JS9rkWNwvHBg19qB7yI/VwjNKVkVLpBzNjt0OSkmqOSpikxw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792959794;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=K0yTjFPhKm/Xp0p3N75RYOZ0IyXJd0SL4VwtSPkkwsQ=;
	b=Xebskm1WuxBIic6KtmDsVbTpCh+FEN4w0I8sdnkrRTnYROwrBvw4BpUV0hN4zBLqg4rs
	 6c8QTWF3jOz1isJiFxMC4Ms2i9+1SB7BMLmmTtJ999c2xL8poFt1FlNIeMO2lZBwPKm9G
	 acoIbbLPsk1f/tbr6h6NB45vQequnYGEpEFn09m8gD/rDkhKebHIeGuUXok+JIU47zowe
	 UZkraQbk1uTtXTaP4R3LZfX3+5TGH25mJB649cGbBzKwnld+F8J6eYKa4tj9NHHU2z7bY
	 l4goEf4IpdD46IMu26v7AsbINO/ST6fd/6DOAAk9Y0DqyOtwbgtKYQQDHltjyqyC7Kg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792959794;
	bh=K0yTjFPhKm/Xp0p3N75RYOZ0IyXJd0SL4VwtSPkkwsQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=c8oYeKAakUF40ulDgGDPDdOVfWNJCjVkRnJjxFr2mzKpHFl09RGd47of8n3uTrM6Q
	 o5hjxqnU79gtjPz5wrX6Xn/smYfwP6MbV5l8HJrwIYnd+Lx0+wx4uxLhA4RuV48wXd
	 r1xn34SW99KRsKmP7T2eB/Wt9m/3e4O+GF0Lgs3yDy/lO+WtW9Q4rJqAJ3vmljFElq
	 kmDfoHPsxfPUbesT1EopBj++XiYP+UCBTeUUoeyLTCYlt7BBkHpIX9UQENZkF4k/AR
	 UK0B4XNoTArCx8MiMrhRYAdnfGa0w1aTqbm/JC/oWo91PETV+aAItV9VgzaaD3E7Oq
	 b/DPyreVVifCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13E0860601;
	Sun, 25 Oct 2026 20:23:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 712FE380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 570A660601
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0q6gmTJaKp4A for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:23:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 76C5F605FC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792959791;
 b=nh2j4UQ+jNNxKLpmqT9AFh7r1UoAw8nnhCFgTdqdzELxkASuW4uWzPEkLQgPmHCMJRAO
 Ed2EGQ4IOz++hXJL+MtbZDj5uth5L9EG8M2iu+OHIF8sEQK05QVf2K68ysKbUddf0vMh+
 bcC9BOjyeaNOqNQm6nJQuPY7yj5vC2w3XpW7O87f3Su9rsG40RUp95oQGHZIKg0CY32OP
 5vr7sM1fzALtQAwC2iiCG1O3QjHaOHw9heleEZJouCXabzJdRO8Mrcrcbj5zngXMwsKIc
 fMHTc5oXInrYtiioHvspWCGkJnkyTPiBycWPszNlVuS3aNFPi7cJsZ8tMbMiAklnj2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792959791;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=OGgqOONXNY/8sI+InNogslpY8Mt1X8PJ1FvRkRyg2bA=;
 b=q3IIx6ZcywCBE5jjv2HCmKNOhQKhZKYk/HkYFo17AT0ffFkEZzJ0PoLDKiAPfNitUUnZ
 GotNml1Z4VBnCVWB/cLXg10XkoEplgnw0vtx4v1o3uY1Mvmt4QTklIbysjKHnFeJjzacR
 JbSVnEA1c9an0Ub6qTTQWEH03DTa0PjCaWasjXS30KiMfkIRMVIlct/1LGYT66CwtzU5M
 MtChMpArJuPSDQ5EOhoSgIuLEabO3wMKSQ1AFcBpCD76Ga7expf5q0tEXn6AJktF1feIT
 u9cjq+mK2gg5bd8WqWuddtG8KIoir5vofMfBn575EVqvl0k8a8RpjGx9XVcEWmoZjfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76C5F605FC
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:23:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE9269C641; Sun, 25 Oct 2026 20:21:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:22:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb0438aaf67da07027b1d9e734450ae5a333da23
X-Git-Newrev: 0f94566c11a85e54c5262c371eff076886c9c34a
X-Patchwork-Hint: ignore
Message-Id: <20261025202145.CE9269C641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chawan: or1k is not supported
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f94566c11a85e54c5262c371eff076886c9c34a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
 - https://autobuild.buildroot.org/results/2aa8986b4161c9ce25d4bddf8c29d1b204893e0b

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chawan/Config.in | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/chawan/Config.in b/package/chawan/Config.in
index 220c81a16d..7a7e982b47 100644
--- a/package/chawan/Config.in
+++ b/package/chawan/Config.in
@@ -1,6 +1,12 @@
+config BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
+	bool
+	default y
+	depends on BR2_USE_MMU
+	depends on !BR2_or1k
+
 config BR2_PACKAGE_CHAWAN
 	bool "chawan"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_PACKAGE_BROTLI
 	select BR2_PACKAGE_LIBSSH2
@@ -11,5 +17,5 @@ config BR2_PACKAGE_CHAWAN
 	  https://chawan.net/
 
 comment "chawan needs a toolchain w/ gcc >= 11"
-	depends on BR2_USE_MMU
+	depends on BR2_PACKAGE_CHAWAN_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_11
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
