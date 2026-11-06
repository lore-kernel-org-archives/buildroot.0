Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC4606A335
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LFfKDRxL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=UDUzJqFn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E408128B;
	Fri,  6 Nov 2026 15:21:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J709nqFrZIIg; Fri,  6 Nov 2026 15:20:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3ACC881279
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793978459;
	b=Z2ZZyln2CR77NlJZ+hc38/x4e9ozKts5Q0MscK2namIUmip0+qyVoyVNGczFz9IxtMJe
	 8QT7MXqf0ICmUCvVJz4pJYKPGt+YJTgLDAZUhqV+pdxWQWwJeQpdhReS4tKAilbj6anhu
	 bLHhhh3Ch0FUTn0lEX9fwrm9EHYvcbHg9mrbjNOhzAwDzwvjrTFO21NeMr25dtAXv46MC
	 bzt3LLZ1Is7VwxTwGb8y6fEyLItHhw6hRFyqeV7JHECMFdVmgoUIBLxa++E4ohRcY/zgI
	 OS4Xfkr7fZ3iKdcTMb4lgPcXw15fhegTkcz4l0l0O7HKjg3jk0z56CHFiD0yh+uA87w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793978459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=XPRMf4p5RqrScXAHZfMN43YFm1ZwXPJGeks4kGmy4Kk=;
	b=tbo3ZoPdk5kwBY1vTlz8eJP7NIImJwL/w2vaKJJJ29CphGjWyicSdAnmveFXT2hxaH62
	 rkrWVlowLk51vefwcL8kskIXeghdumXLq4tM04vk5yiB7RoBQV6O8+ansLlEVNCRNnaH/
	 1k0XqEyyknian+A1KhVt/QtM6GF+MNS+A1uR046PGaPIGNJ2Km1+xrxvPPyPTG1+zCVC/
	 vZAnvxq8HOy77bgOXw8rllQt9Rzu1NS2iZ8fu7cw4n/q/FvXXLOlQuljSDdIv5EEhHTj/
	 TPcxH8k0bZPy3VVuV6HUFbpqzHrRpuXQFSGHS9BAqSSHSjxB5eG6A00ZsOjqnskjdRg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793978459;
	bh=XPRMf4p5RqrScXAHZfMN43YFm1ZwXPJGeks4kGmy4Kk=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=LFfKDRxLyPaH641cg/icLKD3Itwm0L+Vy4tE/GYLZyuJhDW2T9isV72E2eCTrf6TU
	 JGFN24Pvbf3Vy5AXfPOD64axplrPlqIaX4/nARMhwS3WCp4WhXWE11zzW7ETrQtC8x
	 DjbPdIgLLoUX25rP5D18UrYFywPznybaIznDV9Hh8enBvtAA+SrbeNXCO6TqTVuReU
	 dqzNJlpNh06sOdEdkAT00WvuuzBKsY6BRa/0Prztnzvt0xZVi7An6T7EL4ooG4hpTg
	 gCi/gevlVcbMV/SbylXQJ2nlcL/khUHf/K87JC2NRKqjMwnX0Pc0oYQaEVGPglv/NK
	 /SRoHTLDS50fg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3ACC881279;
	Fri,  6 Nov 2026 15:20:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1602F34D
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 07521608A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9sixrHNf6gE for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:20:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D130E60640
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=UDUzJqFn
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D130E60640
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:20:56 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b1dae0febeso1015731a12.2
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 07:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1793978454; x=1794583254; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=lu2mz6BYwxuW62tbmh1lBKGdHiGpsc8WhQ2tuPyAAwU=;
 b=UDUzJqFnQzoP7d4cRB20BemJf+40oHXJYFdeJr682kWKzEiX0pK9UNs4T6S6n9j14z
 ZBDPdwmk7uSjisAIaXCuIxDSNoE+diwLXkmn2bfH7dDidKmZqpA8yD5aUg/xSx/mpPvO
 1jIwEaCK8pdWLI7Ioj0PFGmQmdVbz+hpIm1M58X/dx6muDkGAYUrIZQxEemQsF0L4Ng/
 EVMRmiOrPVx5UxyGopA5zmJwpnONwANwUkSMGnCRbNY6aUkjgajA0o9/yf8xeReDxh4p
 x8mZGRp2zXuYrHVRoMHhuNN7Glwja8R8yk5smaprnR89XuXD9Aw/EBBXSxZtou2bUmcn
 Ybng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793978454; x=1794583254;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=lu2mz6BYwxuW62tbmh1lBKGdHiGpsc8WhQ2tuPyAAwU=;
 b=EqNG++MOdIXoux58fq4o5D9Hw+plILCyrdeRkjS+yIpayeGkDjkbfFkO0XJPs6NV+w
 zYzSTW5x+ZdnmyFTpkTdPeVD7nfqZrlCkbeVhKhYutPS0+8i3syjH7Ehdfvv7RevtDZg
 5Mc3upSKidYTfu4kEMQFtXkA5szIXFQYLD+QfhvxkHA9vU5a76+pwvahqwu8B6NRoxna
 WUUF/NCP5rL4DF4tOaBZBGS1Tv3V/k6HO9WMSC8uppm9qgmPEUPluj4hkrsoaqxSU78G
 h2dLwzHdfrQkke8wCUjxHI0Pz/qHQNiwGuQInLiE734q1h+EilTvvyc4L4DVP6Viqq0t
 fxOg==
X-Gm-Message-State: APuU4Z87U455GdAcQM7u2GM/N9ioMr6a03H7nMXDE+N8VxPRBxmOMy9a
 OsxAwtBmAsy48rPprt/SlDYEqsT13mn5vtkXjIBADxoPblL1j3Vy5/gMqL7Rxg==
X-Gm-Gg: AYBFou2mbpouQIY5iagXI3Z6XVLa3r1yp7w3wPCee7FkZtiPTBbYQ9pQut+aV85yOqL
 faReqoCeCTdIOAcv7cwkUWyWYghP6C3aAMyJ8Uzf6sbtZhTeE+0QFlX0efQIufaKB8HzNIQ5evU
 5WA0F9pOqrkCxzLhgXW4aBi+UHbL0Ktokh60cYpHkulG+4QexWLfx/JoPxkSUEh7uxBNqFEhPH1
 Wo1lUa/41QW0UJwKZTjrquo4zyEWjRfJAHeOL6V9F1lscetjfgynRN57Ynaxf2b7QKzOcsx6/M8
 Pc2ZXgBIlbcjG5b/XpWOgIu94IdQaVM4kKze2iXes3fRIoBeGXB7oAoR5E7tB6kfNsOA0OKb2JF
 2zTw1HR08id8qi3/MA9hkwoAc/DgVS1BPvVYde8lZJL7aXMI/B0KdEVmWfPjwrutvDnm8jgAaeh
 JTuc0ICu4D68AKP2NUILkXnvtgnizDA+JYHBWsTeiAl7BKTdOuHKaG7VQoz9qo+2Mya0UGF1zB0
 TJ+DSwASx/jWHuYaWnNn/SSnmtzt1xp1NAXbZU9exBCcHSVb0MS2OhjfpT1Hw2Q4dZ9Ht45U1Ac
 qfr+H+KMLTw1R0jfWdGk0P9KbBgKyNFdJX+yOqGU3SGXAgEtqdQMBlD036rWHgJW2M+cbsl/CvE
 uJhNkOjgwnA==
X-Received: by 2002:a17:907:9446:b0:c4c:999e:e6f1 with SMTP id
 a640c23a62f3a-c4d35559ad1mr252079166b.46.1793978454146; 
 Fri, 06 Nov 2026 07:20:54 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d3562ec79sm89928766b.25.2026.11.06.07.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 07:20:52 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 16:20:51 +0100
Message-Id: <20261106152052.3856860-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] toolchain: add
 BR2_TOOLCHAIN_HAS_GCC_BUG_127142
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT,WEIRD_PORT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

GCC 16 switched hppa from reload to LRA by default (upstream commit
389a023fd416 "hppa: Enable LRA as default"). LRA is unable to handle
overlapping live ranges of the %r1 register, used by addil to load the
high part of symbolic operands in non-PIC code, and fails with:

  error: unable to find a register to spill

This is GCC PR rtl-optimization/127142. It is still open: the first
fix was partially reverted as GNU ld cannot fix up the replacement
ldil/addl sequence, and the subsequent proposals were abandoned.

Going back to reload with -mno-lra is not an option, as reload is no
longer working on hppa with GCC 16 (e.g. glibc fails with "internal
compiler error: in gen_reg_rtx, at emit-rtl.cc:1193").

This issue has been present since commit 1b290781cf37 ("package/gcc:
add version 16.1.0"), as GCC 16 was the first version to use LRA by
default on hppa. It therefore affects 2026.08 and later.

Fixes: 1b290781cf3782576091dbeacdd7d1a30b051856 ("package/gcc: add version 16.1.0")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 toolchain/Config.in | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 5f4c5f5fb7..a966a473e3 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -249,6 +249,15 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_111001
 		   BR2_OPTIMIZE_2 || \
 		   BR2_OPTIMIZE_3
 
+# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=127142
+# ICE: on hppa: unable to find a register to spill, since LRA is
+# the default register allocator on hppa (gcc >= 16).
+# This bug still exists in gcc = 16.2.0
+config BR2_TOOLCHAIN_HAS_GCC_BUG_127142
+	bool
+	default y if BR2_hppa
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_16
+
 config BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	bool
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
