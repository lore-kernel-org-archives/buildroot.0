Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCB0C433EF
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 08:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7896183EAF;
	Fri, 25 Feb 2022 08:30:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QN_ZJgukxZEZ; Fri, 25 Feb 2022 08:30:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B570683EA2;
	Fri, 25 Feb 2022 08:30:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5F4621BF384
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 08:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BE0983EA2
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 08:30:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yaktZ0UVijQk for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 08:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 601E983E9F
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 08:30:44 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d28so3293350wra.4
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 00:30:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gmj/E0HJ2+xV3v9+s2Y377sPHqvievaXY1Cevw8pE0U=;
 b=Xnaejpzkdw/sjKuPJ8B2ZGA2lmYPU6euhxIhdnFwnV3B4rmqVZt0nnE5XvVjSxvHBl
 8C0pip0DrT1FDiLAZrm4V5mXI/U1xnVKIKd1OGeucdoZKL3s66oOZzbW3p4DvMkTznM0
 UWvdPvVxK8DxP6f6eg9Ux8+ML0EFPlWaa7NFp/2gk8O1JKTlLN+f8MeRZkC9nPi52777
 DmZ0Q4bvfSQBeGOKjgYdtQilng+YWNFJKWXrXFVTC/hw+x2pWdyjEcR0LMAByFslcHG8
 3XeUO0+iXM3AxHEqkjnHi93nuBg0/X3y1ur8piAIL7tfXVyYc2f0duiVTus33kiljt7Q
 HyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gmj/E0HJ2+xV3v9+s2Y377sPHqvievaXY1Cevw8pE0U=;
 b=jAD3ocw8DdGTKljSFn9VsO/cNVS5ZCu+K8fHqs7LYkq1Ay9TzDSr+k0TXG3expC8N+
 FqspUtj/xqaj7kzjrDrLFMpwKrmf3SJ5M5/6nLqvyZqsVMMiJJvZbpfNCYxheN1xRSAA
 AiQL7HapTklrXH63S41WrBD5DXtmQd568Y1CtXc80hvNxqUD1okcqlwBgFg02y5vyaee
 Dy4Xdz4zTI/1C3UAPth1i18sAGzAWfKQgnwC1u7tjk2+WBnbYWcxsJRcTjGaqVW9c8TJ
 Kh/89i1ByA3b3R4bc+nz3FVBY7BljG9KOCGGzVObwiDQaa8cLudiNnHDKb4lmwX8ClTL
 u9xQ==
X-Gm-Message-State: AOAM532yiCfK/hLzz6cwKK/SQShDJ0CJie7tzoSmRvCr8BEa83+t908b
 DSNQ1UQYLP8UGLGR1mVcItqhB3jnAsI=
X-Google-Smtp-Source: ABdhPJzpCUW2CbGHidzTpuRo6k/1SbPgDLmEiCrLI7vXAepljMEEugklvAADRKlnQUcCv9llIlr9Vg==
X-Received: by 2002:adf:ec47:0:b0:1e4:a380:bb73 with SMTP id
 w7-20020adfec47000000b001e4a380bb73mr5279682wrn.86.1645777842467; 
 Fri, 25 Feb 2022 00:30:42 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b0038114228b81sm3720071wme.2.2022.02.25.00.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 00:30:41 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 09:30:37 +0100
Message-Id: <20220225083037.229109-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/rust: set musl-root for musl toolchains
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Without musl-root in config.toml the build stop with the following error:

thread 'main' panicked at 'couldn't find libc.a in musl libdir: output/host/arm-buildroot-linux-musleabihf/sysroot/lib/lib', src/bootstrap/sanity.rs:192:25

musl-root is needed to provide the path to libc.a and libunwind.a because
rust link them statically into the standard library and liblibc [1].

For other libc, musl-root is not used and ignored [2].

[1] https://github.com/rust-lang/rust/commit/cd980b3bee5bd48e8a6cd4c0d7c8e0fb0fdb64dd
[2] https://github.com/rust-lang/rust/blob/1.58.1/src/bootstrap/sanity.rs#L181

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Runtime tested with TestRust with ripgrep and bat packages.
---
 package/rust/rust.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 4a6b04dc8c..c2e0a361dd 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -56,6 +56,7 @@ define HOST_RUST_CONFIGURE_CMDS
 		echo 'sysconfdir = "$(HOST_DIR)/etc"'; \
 		echo '[rust]'; \
 		echo 'channel = "stable"'; \
+		echo 'musl-root = "$(STAGING_DIR)"' ; \
 		echo '[target.$(RUSTC_TARGET_NAME)]'; \
 		echo 'cc = "$(TARGET_CROSS)gcc"'; \
 		echo '[llvm]'; \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
