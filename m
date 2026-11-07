Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79F3606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=kIIc30d1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Nt9VxTad
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90D17811FC;
	Sat,  7 Nov 2026 16:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQaTQUP5YDij; Sat,  7 Nov 2026 16:34:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A25C88116F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794069282;
	b=Ucw34VXuEEwf3wlq0zscW5SMeFNrgGOWoseFjKXGB1bJQfSGAoQ9Ns1Rj3+fVG4WG9Wh
	 bve0H2+8Vb9swWLXuS/LlZ5SwNz/dPxahFYxrq0+0H8voWkJmPW0DM6HWBTkMaWQMMQ2m
	 35ro7Y30+nZPy/kHP8ihwk4kFrEs5JfbUJB5OG4BFHfyG9H3OlVHKq3rnvYH3r1bNJ2Pa
	 9GAMgSfc36Q5CXoOhonrPDYDp0KdIJ9UxvQTMXqXDrDyeSaTB1Rg1mYkpu97pPMsXM9X1
	 c6tGO7c0DlWm/Ir7DLOp4m3BR2y7h6hbZSPbQ3BrV7cb55Vl718Wx1fWB2CS63mgh/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794069282;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=j3+ZsStRg8rWObjm50lgxZDsMW4Ekr2ZkEpHVNdkFZY=;
	b=bRivdiwC/hWOIyhU80sxu0Ay2UGpBbHeKljufCA5FSyQbzxYLKoUHfr3WMTbOfqEgwRE
	 ++neo925S9FKdSfE77DifRd7x20uxuCZQtYjT8ZMtdh75/eEiQJfoXEM8CicDfZeDf9wR
	 zqO9FT2wXOngZU3pT2MgObgAQPqGkyEHMTHoVLgVdVvKSLAgO6VTHkcLE2D7XHcr32UqJ
	 41s/4qR37cgDpi9yRFW5QWzDhzYLLukV/NZf9wK1EmANFWqgSsLzLIs9vTO5/fSCeJlIh
	 57MPmmpJtFvrGbQGFYSdjyUG/HpQ5QmhaikgCeSq9hqPghpNsXX50KMO6ex3hiKYdwg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794069282;
	bh=j3+ZsStRg8rWObjm50lgxZDsMW4Ekr2ZkEpHVNdkFZY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kIIc30d1523EZWK4oFY20qWZIn5Xbyb+/51AvmFbipA5eff9K0JQKnDj3ZjUPDpl7
	 867raJS3nbi0tSna0ep7qcIK/Ra+4mJfOz0JDXMk6r/z3qTj/C6bLOFfUReGxYxW/j
	 gR2n+AWpG6PveT/gHFN0OSdhCjN4gx8Ny0FCXsxrpJO6C/+tjCojBCbzL1Igp091yK
	 qG1g+VbJ/alRWV/YRyBLFrZEM8R/efJb5Ch6vQM0PB7flFvIRaB5VEnEBHEf+CWK8w
	 P6lDOL/voGR3QtgAjKzi3Tnwh42RGt3+s1dNlbXQ6tKd4e6I5nPTiS/BsrXCvR2uw7
	 crQiqIzLJo1sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A25C88116F;
	Sat,  7 Nov 2026 16:34:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADC0A34D
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DB9140859
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g4kRtWbv-kdQ for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 16:34:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4DD8D40732
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Nt9VxTad
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4DD8D40732
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 16:34:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4a1fbd52ab6so11043545e9.0
 for <buildroot@buildroot.org>; Sat, 07 Nov 2026 08:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794069277; x=1794674077; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=8qQAvu/JWkQ+IywwbrvB8fI62K8UeK2cpGu6qBPZ4QY=;
 b=Nt9VxTadPLLRIuyv+njuP2CBAxlpzEkbzL5hOpTvAmjxxS1dcV1AtDyMLbdV4LssLl
 0vg/dhGtp7gbg93mILpzdhUgPyQcGL0/kJzogDoEAdr6rf6yh3G7lOjudFWy+ud0m+76
 WD+54oF9cb/MzftzrNLCaSQTBR07QQV0Ox2NVeeDm7PTmCsKhYiUkGV2GJ0pxPWy/F1t
 PqQEwitAnvDp6TSqvSVkNgDlIPsOCWUxRDxXZkQ4U5W1Kty/vNV6hf6E4IqTI8xujA4z
 e7o469Qrzh5+W8o5L3tHApYORd6cfJLuwfDzCWz8fKWc7RNB5g4QVmr9ehjG1YZJEqLb
 dVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794069277; x=1794674077;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=8qQAvu/JWkQ+IywwbrvB8fI62K8UeK2cpGu6qBPZ4QY=;
 b=AC5UNGVNz92i2MAasC/wy3ggMH6cG38yHGNu/pMEksp7KSsRHY++k95cDHSdQ5PxM2
 GMsig8LynZ5GLZCdUhxlcCO3CylIHBCd7SxPzFOw3U8L7Mdklj68IQ1HhF1irrSaVYJd
 8kL/Zu9Ji5pAfWPkn+d0Tz/j+YJjWlGBVj21GV/hSu35dWkylxWk1q9TCATXX0HYJ5nQ
 tx5cKy1slkviEu7ZnYOiGGzjsTLfsCp0DumNtGPsvLxHhIT4C2bkU5C0c7rIZd9sCi/A
 F0hdu1koWEUTe2koF/M3KrJal1OoD/eyWI6AwhsTs0CTUi2NNhHvVSuK1ybdxiB25RJp
 xAjg==
X-Gm-Message-State: APuU4Z++qZFs8qLfgvFNTVychm60RVh9s7Sb4FvxfBgv6qmlLsU9Q6Dp
 8JLRwo73BHMah9LyYQxUwzRYqAMH7xZIXJoJGIbqIlS9MNDLfWFs3rJgzbz7meUg
X-Gm-Gg: AYBFou0+huJecXolJ7ojzvdFPsxigZWScKEajEyfQFyIgO5Uxa11CNffOCmemOK0U5y
 z5qZLeAE3SonOvjuuj0QevB+BGzfybrinVnHBLtenHryWD0uWwxdFwTcoFJbclzg31R5ZXx0vul
 w0/8lyRHU/K1mjX3iQ2xnfPeNecF4zAEeE9IGxlyvDsYzuuN2fL1oEHRpbDHo8vRnE+TbxGUi42
 WUQO+gO+T44Flroq0lQ6PiOzHfMiM3daWX0uZiWSAf1/kmk/0gAZU4ALOmB4AY8llhNB87vSq7a
 g+WJgHbBoARY6qzZLgMpTp5DCS68nlCQAOOj7bj9/Zb9xv45r4JWUDt8Z+4qeIPLpmcue/ouC6O
 5pXZeU4hoRw5nLoDRMdyKL57vx4KIFp7ddDuYaFK0zAoVHda+VpzAfQrWQ3GlqAN4ANDwv+Y1x/
 qVfcRYu8yDMNTR4MjAoTEGYaS7QhmFmYXtgUN7kmYW0QtH+ZNHNiA32lFY0ijuecJsp3041g6F8
 tvBpIey5A9b4XY5uKS4MuSxSODFdtW29YhAOOHX7ZjJFTC3NvbV7PA6x472duhHp6sY8TSHJDXr
 9FVe8PuB5g7Z96fHYyNXU+0c8CDHv2dakgsdl7vVQyr1j/anL7lk
X-Received: by 2002:a05:600c:37c3:b0:4a2:cbe:beac with SMTP id
 5b1f17b1804b1-4b6de6916c1mr100695825e9.23.1794069276953; 
 Sat, 07 Nov 2026 08:34:36 -0800 (PST)
Received: from angelo-Precision-7550 ([94.154.175.53])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4b7e6eca30asm82268255e9.7.2026.11.07.08.34.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Nov 2026 08:34:36 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  7 Nov 2026 17:34:08 +0100
Message-ID: <20261107163414.560896-10-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107163414.560896-1-angelo.compagnucci@gmail.com>
References: <20230903163509.614740-1-ricardo.martincoski@gmail.com>
 <20261107163414.560896-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 09/15] package/zfs: drop the unused module
 subdirectories
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Leo Yu-Chi Liang <ycliang@andestech.com>,
 Romain Naour <romain.naour@gmail.com>, Antoine Tenart <atenart@kernel.org>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?= <salvador.joseluis@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Maxim Kochetkov <fido_max@inbox.ru>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Knight <james.d.knight@live.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ZFS_MODULE_SUBDIRS is not used since 41493cae71 ("package/zfs: not
using kernel-module infra"): the kernel modules are built by the
autotools build system of zfs, and the variable was only read by the
kernel-module infra. Drop it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v3 -> v4:
  - new patch: fix a file warned about by the package infra checks
    added at the end of the series.

 package/zfs/zfs.mk | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/package/zfs/zfs.mk b/package/zfs/zfs.mk
index 071557bf3e..6c20939da5 100644
--- a/package/zfs/zfs.mk
+++ b/package/zfs/zfs.mk
@@ -63,18 +63,6 @@ ZFS_MAKE_ENV += \
 	ARCH=$(KERNEL_ARCH) \
 	CROSS_COMPILE="$(TARGET_CROSS)"
 
-# ZFS userland tools are unfunctional without the Linux kernel modules.
-ZFS_MODULE_SUBDIRS = \
-	module/avl \
-	module/icp \
-	module/lua \
-	module/nvpair \
-	module/spl \
-	module/unicode \
-	module/zcommon \
-	module/zstd \
-	module/zfs
-
 # These requirements will be validated by zfs/config/kernel-config-defined.m4
 define ZFS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_DEBUG_LOCK_ALLOC)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
