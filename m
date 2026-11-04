Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B663606D4CA
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=pMyAWFkc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD1824089E;
	Wed,  4 Nov 2026 21:01:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc6IiW2S9YXi; Wed,  4 Nov 2026 21:01:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0F7EA40898
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793826080;
	b=aMYyy8Qrx/6yM2+70nXTezTQozEsmwt+AegA6qiNzTHaiZlkbMyrR2cSklsAY669DV5z
	 072+e4EeCBMn9godY4fJWuPY076I3+omUuaIRZKrgMG0sdg6tpuXSdnwuenF+WHoAnrJV
	 oxcu/1plxJmTvoa/muLDGl6pnm7XbYSChQoLNtGUNXz6RWlxhsaOiFeT4LKHZ5ZBvtb+2
	 +PjE6WBkskN/5T9AW+IP/O7hcCgYEhMWFComFWzihNx/2GtOGuXs93RjQds2toujKA0yv
	 b/QBKE2GZwLaw59E6p/bj95qbZctIWeXSQt0mjwED1alGgh4mMaZGuwRk5ZgYnv/2Lw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793826080;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=2ZoysnTs+IypKwnT1RHm6rOG0FVB19aLDmTem5cEpHg=;
	b=BZG8wdyySyq2LZsr+LFOPGSSLefxCUJFi39XSwClW4MyTTEznQxGxmdTXDo5DRUYEZJH
	 x2Q3ji+UjB4L9JyHlPgZMAdYXXoMttP3hWbiM5MPNPSc6sbyVQLMYgv2c5qqbV/jdH3I+
	 4Vwv1sMk0wZwTHd0kttZ5VHQsu6j5Q89BLCyXKjWuQUK4vyk1/hCBaeyfg7+5w/mI7OSR
	 oPl/OSwjfzaDstojYVJ1Sw2t/RgHArhBbyvRfZq2DqX68T+s0w1kjiInQDr0PCGqPN+Vx
	 33WO05XEVbD1TFQIVioygt1A633FMjrASj0nx/Go+amMXWVDrHZHn+0yJUgffbdttGg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793826080;
	bh=2ZoysnTs+IypKwnT1RHm6rOG0FVB19aLDmTem5cEpHg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pMyAWFkcLuYAHrFWCyz++5WNc2Go3EFb49aBatqIjvOQQlzgAKGAjFAf0vvhjogYd
	 Ht444aH+jf/fm5N5U5srxlEhxdqbwS0CQOjKVHqw6DfUpLY5LfMHr5W3U/PAjL9Eku
	 Ln8WLz0Dcc2R8HlH1v5agqdb31jFxqiqkd1HOhtvOJcqVAglJVUpffeBKAe0ayu7Ly
	 WSjd7leEMxqycxcWcdzDGDhAC2o/YdfZnWmQtumh0bEzn46IYoTu7CrCTxi8yg9Qac
	 vRva/itSnL9hMfrd5GwO+3Nau2yLaWEVthuOv0kXcmmVFnAYq18EWRJNJ5hvN2MvIR
	 pmO5FEoijhhjA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F7EA40898;
	Wed,  4 Nov 2026 21:01:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A750B00
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD9B81287
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xa7v1oUTf1ys for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:01:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org ABE9481261
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABE9481261
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:01:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFCE79DE42; Wed,  4 Nov 2026 20:59:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:01:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56052e5877d5cc1316bbc5def6fcc4263f8fa7a7
X-Git-Newrev: 84bfd2ff64f90f7c4f993d017257f1a748792a46
X-Patchwork-Hint: ignore
Message-Id: <20261104205946.BFCE79DE42@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: pass HOSTLD and
 HOSTLDFLAGS
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84bfd2ff64f90f7c4f993d017257f1a748792a46
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since TF-A v2.15, commit 0607fb7f6bd9 ("feat(build): add HOSTLDFLAGS to
pass flags to host links"), the host tools such as fiptool are linked
with $(HOSTLD) instead of $(HOSTCC).

As Buildroot exports HOSTLD=ld, fiptool fails to link (undefined
reference to optind), so pass the host compiler and the host link
flags.

Signed-off-by: Leo DENIEUL <leo.denieul.yoshino@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 798efd5a15..2aaa7e3d19 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -67,7 +67,9 @@ ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
 	$(call qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES)) \
 	PLAT=$(ARM_TRUSTED_FIRMWARE_PLATFORM) \
 	TARGET_BOARD=$(ARM_TRUSTED_FIRMWARE_TARGET_BOARD) \
-	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)"
+	HOSTCC="$(HOSTCC) $(HOST_CFLAGS) $(HOST_LDFLAGS)" \
+	HOSTLD="$(HOSTCC)" \
+	HOSTLDFLAGS="$(HOST_LDFLAGS)"
 
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_SSP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
