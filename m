Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DBC606A31F
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KgvOlpso;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mrkvy6w3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BFA3280E5D;
	Mon, 23 Nov 2026 17:47:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7f13L5pvDls5; Mon, 23 Nov 2026 17:47:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D7E2C80E3A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795456052;
	b=Bn8gbEJC/7riiFwQSbDSCA3fXCgkfnXsc3IZ1oqCokLnnTd+bWtK7AP/Y6PLcE4bTF/X
	 g4popnNHhKFndvtI+rY1r7pkexalioHEmIWgNEW1GpJJppkzqhym+kEsiH0iMvbjXqp8f
	 uMSny8adnsWib9DexU2OXvKsXr0YK6nscyHszpmb8k9bbcnX9FrfLKes3MJMhERI0bHdc
	 TU8es3lVhGqMOkxZ3AC8K63qqT7VrvqRidp/BabUvxBAD5crOCYGhJah/Jsi67XFTScNa
	 M53eivUutASmsd9agHfjTXnjBqsGCyVs13hWkLqM31JvRUDPe1rPKIBnlvFRoJ64yjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795456052;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CTfVfuOwWvPYXOMBIu9MykF84d4n1zWqAj3bPJwUEwc=;
	b=U8TR6oDD/T/sydq/JaaBwPICqpmzgowllKbr4a0L8XQQ8jPQxNhyaB2WffXEFSD/d40+
	 eTwFcQsO+Zrox34/VMzXiT1c3VQi9zP0AZSFnCABqiH8JkzV4BsXA6dTelVX6/2j2hMw/
	 +IdoDKB9eJlrZ6EvfEHkfkWhNoCsShoEgPBmOIb7l3wKWAbN0y7r8mUeUwrx+c2DwwPRS
	 mitah149yKVcYl91R1RaV1CYtoCr4FVUqeIz8zCXIIcCS0XyfC8RYVYGJoF8G8AnqEwpD
	 aEtgFo5HxdKnI6eBXe1FqMmK5gy1jrmV1k1snlJErM+B5JBlytgesrDH6nwzBcr9dLw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795456051;
	bh=CTfVfuOwWvPYXOMBIu9MykF84d4n1zWqAj3bPJwUEwc=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KgvOlpsougSygErQjlJ9s2k89/LjTUnavKdzB3ZOZHjHyNjA33yu/utFPPUGCoH/0
	 98uI6ltODY4Q9ncJ7DHDvvEsmbrR3icEhf1Yk/G9L9T8w1ABwFhM+syj+RVqZDTHCb
	 Tz9eXu6MB1bZ/Lzc0cZ8ZSmltFOyhPst48dz12w5BluhFlZgqHFi3FR2O93RHtS9YQ
	 GNK+lIIMhOihc2DMn5UebYZ/U99YjE8JjmL4axhbvB0/iZUkDuAHYy3m+yWTKnYbj9
	 XaaG86WkfYqfTzi2e63/gtmBYXpsYcepo9ukPu8j/uqvqBlTD2gi9rMKLqpoyX8Hiw
	 Tmecz1jOEa3tA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7E2C80E3A;
	Mon, 23 Nov 2026 17:47:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 24728371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 162854075C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ogTMrnwvPzT for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:47:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E2B0E40738
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::336"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Mrkvy6w3
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2B0E40738
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:47:29 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso44095325e9.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795456047; x=1796060847; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=naP7uECDOQck/a6rpC8sxZxqEErv7yvtr5U6JjCeyp0=;
 b=Mrkvy6w3Ve3lqPYprKnxwEo9qSRZ0oIvJTS36/fzbw5DgMij3uoGXZH7uotVLH5UYP
 +KMD351Crjtn2lbEK2gL/lETHcAllCSfDxBsLlU0RggGHc4g8PizBabx0acSx+c069VD
 KG/Tqisq6GweQgdWyLIIDLRBt2uK8RrtCPFs76yaQbObIWdZi1ze6bXZ1gqUpB5oFYc3
 IbruCAdtGkYEOMJPylUoakVgF0l9OIZ4ogMsb5c6ES/mWH4Lh+yj6YgujoOZDOiuykCh
 FwXCMVYFIP/uQ4ByCPADQ6CG8gZwvJTiNMfx14/rpD2xhW1YnCgQVrHSaMel/JTBmJjO
 1ikg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795456047; x=1796060847;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=naP7uECDOQck/a6rpC8sxZxqEErv7yvtr5U6JjCeyp0=;
 b=H+x5c05l6RksVByIr+E+q3/SdbI6FJc6oDORZzPMxTvcIke0k62LlxWaGsu+SZgPoF
 59fYylekKgiW06JDFg/EEQXsEFcoMcdjPvsT5suqMF2gB21zJWZ/q38qmXsGIkSjruD3
 41tBdC/Xols8X6kUC5VcnO+WOtO8oL62H5f08vzsFW8LxYnJU0k7yCGNsEsBUFFPKYHm
 HY8L364XhG8IwCP9z3dRP8eqlMDIiQpIwy/tamT36hRW+sDiELsalRZ7xHqAamrn/mel
 PdQ/w2optzSlKvGGEjZm6F2UIuf1hJF7++EroR/4WqHRAM77RAb8J+5hJtMyS6KnJas4
 Ow4w==
X-Gm-Message-State: APuU4Z8f1+51EKjMk05jx/dYOkr+WEowF0J4UFabvsvklsR0DR5MGG/j
 ypPTf7828JItTPoR6mPrx1wDEzkDbCIAytWaUgMi4GMRDipRgHRQlcJzqacRYWps
X-Gm-Gg: AZFdTZdfJJ5keBkafID6jyP5VYUiFvsX251mh8pZu8OPucw2FMFo+XB0RMIgFf4w4P7
 0zgdEQeBaeoCV1wNX6e8lLvCvzMx+gVB/CQFfEB6optSsyRwA09swS3JqxqKoamOlm1cy3qS6hO
 u2Wk87cAC9vsAIAUNIycK6mTLbA+OLVjtE4oTHJGuEdvtX7qcQz4/23gbAC8GHFhmt/BZ6Mp6/B
 WR+GDh5ghHgRrlEICC7Y7VBPKrHtQpPYWdi5X4AB2pXqXzV8sUjglDpl17CBbKpHc25W2Z6B/D3
 S3cFgvfwF4TPkVdGX6l7lWRIgbgQT20HrFVLZeBHKuLWmxz2SxG97XQONHg6+8zWwm6CMCH4zKQ
 EZ26ObFgj13xTvJbAVyk1t/OuSpRoczqtaV0xsrWo2vWnixAmrHc/4Do3Vxkjpd8WEKILL1WC5u
 k1kD2qZASotuzCpS5J/8iYVIMeekYr30FDIiedL5bOiDgG8JSUf03cTn2mB+xp3fzYHYG+LJmjZ
 DLrnUUpxacQUnJ9pxtpDbWBKsDI8t30q7kB50E0TdiazuSGLXWN9OlD4CHiOIFp+z4s0dmZ+pyP
 4TIBGy3xmUPlgr8A0oAqcCYBVyI4rhLcNPXs/lc3lia4kiYM7E4=
X-Received: by 2002:a05:600c:37c9:b0:4a4:4d57:8487 with SMTP id
 5b1f17b1804b1-4bb887fe7f7mr221182725e9.5.1795456047360; 
 Mon, 23 Nov 2026 09:47:27 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb8849247asm367376555e9.7.2026.11.23.09.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 09:47:26 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Corentin Labbe <clabbe@baylibre.com>,
 Arnout Vandecappelle <arnout@rnout.be>
Date: Mon, 23 Nov 2026 18:47:25 +0100
Message-ID: <20261123174725.2554738-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20231106123705.311899-1-clabbe@baylibre.com>
References: <20231106123705.311899-1-clabbe@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] linux: Use the choosen rootfs compression
 type when rootfs is builtin
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Corentin Labbe <clabbe@baylibre.com>

I have built a buildroot with:
BR2_TARGET_ROOTFS_CPIO_XZ=y
BR2_TARGET_ROOTFS_INITRAMFS=y
With this buildroot produces an images/rootfs.cpio.xz but the kernel still use gzip (CONFIG_INITRAMFS_COMPRESSION_GZIP)
as compression for a plain rootfs.cpio

Setting CONFIG_INITRAMFS_COMPRESSION_XZ in a linux.fragment does not
work as it seems the fragment is setup before buildroot set
CONFIG_INITRAMFS_SOURCE which reset the CONFIG_INITRAMFS_COMPRESSION
choice.

So buildroot have to change CONFIG_INITRAMFS_COMPRESSION after setup
CONFIG_INITRAMFS_SOURCE.

Without cpio compression, the kernel keeps its own default, as before.
So the defconfigs with a built-in initramfs, which use no cpio
compression and often boot an uncompressed kernel image, don't change.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Co-authored-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Tested-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - keep the kernel default when the cpio image is not compressed,
    instead of CONFIG_INITRAMFS_COMPRESSION_NONE: the 20 defconfigs
    with a built-in initramfs use no cpio compression, and most of them
    boot an uncompressed kernel (vmlinux, linux.bin, XIP), so their
    images would grow [Arnout Vandecappelle]
  - only enable the chosen option, don't disable the others
    [Arnout Vandecappelle]
  - also enable the CONFIG_RD_* option the choice depends on
  - add bzip2
  - rebase on master

Supersedes v1: https://patchwork.buildroot.org/project/buildroot/patch/20231106123705.311899-1-clabbe@baylibre.com/

 linux/linux.mk | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 49325a3a07..72624fff59 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -420,7 +420,26 @@ define LINUX_KCONFIG_FIXUP_CMDS_ROOTFS_CPIO
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_SOURCE,"$${BR_BINARIES_DIR}/rootfs.cpio")
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_UID,0)
 	$(call KCONFIG_SET_OPT,CONFIG_INITRAMFS_ROOT_GID,0)
+	$(LINUX_KCONFIG_FIXUP_CMDS_INITRAMFS_COMPRESSION)
 endef
+
+# Compress the built-in initramfs like the cpio image. Setting
+# CONFIG_INITRAMFS_SOURCE above resets this choice, so a kernel
+# configuration fragment can't set it. Without cpio compression, the
+# kernel keeps its own default.
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_BZIP2) = BZIP2
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_GZIP) = GZIP
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_LZ4) = LZ4
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_LZMA) = LZMA
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_LZO) = LZO
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_XZ) = XZ
+LINUX_INITRAMFS_COMPRESSION_$(BR2_TARGET_ROOTFS_CPIO_ZSTD) = ZSTD
+ifneq ($(LINUX_INITRAMFS_COMPRESSION_y),)
+define LINUX_KCONFIG_FIXUP_CMDS_INITRAMFS_COMPRESSION
+	$(call KCONFIG_ENABLE_OPT,CONFIG_RD_$(LINUX_INITRAMFS_COMPRESSION_y))
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INITRAMFS_COMPRESSION_$(LINUX_INITRAMFS_COMPRESSION_y))
+endef
+endif
 endif
 
 # Since kernel >= 6.15.y, x86 and x86_64 kernels requires a toolchain
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
