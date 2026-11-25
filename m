Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B7B606A31E
	for <buildroot@archiver.kernel.org>; Wed, 25 Nov 2026 09:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dsFGn+jS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADADB60664;
	Wed, 25 Nov 2026 09:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wZAhdz-52SQZ; Wed, 25 Nov 2026 09:33:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0CF6606EF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795599217;
	b=rNZVRz8dykfFvFWpsotqdnT6VmfWAcEL52eyeiUs5vKaLEAvwC63CoKb7RkxES21SGvL
	 ZN/764zi7dPwicvV6TxIT0mu/Xals8ja2fPx/4TecVtfl9GPY8c2N9uOcw/x2fYqrfWkB
	 8e60jEK0uG3rzGT1kWqra1xb+mqUXM2g5McQGMwTb4QKGSUS3HOmNEREL0oo58hqOVOxh
	 rf8nGend35Qp0yjauWE6AAqeQvlAFp5y/+KZ+EC3nsxTaxiO0yMd7GA3B3tv82R7chm06
	 Z+CGEH/+0ZG8iwzGkQ6xJpg4SQdO4dksTkWPIQfQBLzMCN/QW8tMR2NMrE3z7qNt63Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795599217;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=BdqRdEOkznScCjZmaQZLZ59lq//oEh642Gh49r9d0WE=;
	b=IwPoR3p+eU6vhEZYuIhRYkq9roCO7K+ZEhJ9R6c9K1aoNVWRox4cWYq4JWA+sgsu3eI+
	 yOc1WCoZkhaZaBx50wWj0I1IFUkUCXjDLsNmi330edlkQdLV/0YlRcWA6gemJWPH3p4eq
	 K7HAeFL1uage7xya6sZwGelPQGehOa6JRklQYUamdeBxJpybS2f/Zhyal2Ssy7CHLmaBi
	 XreY2kSaEpWbhDBqoDthjre1G+FywQ2OnpSNTYOq/9LWx0c9TZZiYGdAG72q4JFATrBqc
	 EOTboFVlFUdD/OoVA/9XL0Cgazy3V8ToVGs5BvKv6TkS/hXJ/yT+m8yRcsLGvrc6MJw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795599217;
	bh=BdqRdEOkznScCjZmaQZLZ59lq//oEh642Gh49r9d0WE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=dsFGn+jSdcjYYnRf8mBducBWaEcCpqz5QXs8NcvUK7gxFnttwXlYEOVymVsp82Bfl
	 fqAiluuDhlKC+bF7ZQjgmO05kcypTCk9OdTEnxJUTyp+eI1aMDFeiJU7Sl1COIpkSM
	 CNxR80/3picyB6jaOjAA5kKQLFhumYMConkG1BldwvQkNAKybvUehdo0BPwOS5E1IY
	 o6LlM9Lunl/fhJqYD+VCJUEjpbAZ7G7+UgLPeFofZDCI2onRi5+Vq4ILRhCcoTHNqh
	 hqPkDRet2r67s1oXknrNnG+K96phCqMcb0UirKXccgDLSOJrJouLGRnSzEWWP0ZSOp
	 0Zsbe+CLYvqwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0CF6606EF;
	Wed, 25 Nov 2026 09:33:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BC427325
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A20D240199
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id geiMjRGZ8Z94 for <buildroot@buildroot.org>;
 Wed, 25 Nov 2026 09:33:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 67FF740180
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::631; helo=mail-ej1-x631.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 67FF740180
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 09:33:32 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-c5126505cb3so711931366b.0
 for <buildroot@buildroot.org>; Wed, 25 Nov 2026 01:33:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795599211; x=1796204011;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=YMh4jyPfVYyeq7XfsHMT8oXYlG5LwFT9+U82I4H9u0A=;
 b=g3cLb2vh2D6Nm3twdJ6Bi3zth99RxfBKJiTBb9Tbcv5cILvXzw+tP9TvZkLRkvrIlw
 4yFl1eVC4LA59r7g2dx2dTfaKQFkAGtfBee4MLaaLG2A4QJt/7DTgwYfKOdp537CTxZ7
 RxBOOEoYggecXOqPDxR+G41GIqMAYsBXuR6x4ITr3oSaQm/AcCqaz/JDzsnTKT2juQEE
 15QTWwaZTx2yYYHeGA2xfk0YM7rdWgFPSLWLBatmdYeAIDIZUkHOLOGtttsPmVDQaFgR
 tBueQbszj7vcQvE3D1C8um6WT1jwl3lwitVp7y0QK2c0x0aCLF8VWmAoJO5OZ4XAnJ3d
 0ddg==
X-Gm-Message-State: APuU4Z8R9jQxn4dgz+7h+QU79j0Fj+UVpQItJlY3ss3xwOJeNG2uxbbM
 FAR1UkqwggbInfkjwWp47lIKXg/80wK/GFUiu77lUqoZXK5TQRf6nER4NQ/s1w==
X-Gm-Gg: AZFdTZfEgAuSebiY138Ww936RkGDJJ/SCr6rwgJ4zfk1QqZS3mBmQfuenl2AY5DZ7f5
 e95K8RS8Rs8nYmSDMUf8rNViFf/xrMeEsvSRilgkxSgAuW+HjCAcgYrRcQgbPWyiO++klLvLcpC
 6YjVaMolRLhGpOz7SImlieq/1ZU0RIV728+LBskeHpWPjXbfVqpi4TzRTiZgUnyqyR3l8BOu8xj
 QU+lFFTiAP64T5bi+eKLNg4l4qSXz4qbCLBHd9KNLBdUNPcdTyv4HALHBWAhKwYOQ6DDlbfKMTx
 UnjaDc7/eQYqXNYIdRwewqpAEoYT9UZJKJahGVslgI0YxS6LQu8D12oGc6K14GRX9K567TAZkg7
 hkOeXGuciYoojZoV/RTxSu8qq1HWPdzJEFaRgjHSW3ORoTIwo5uEnLkjGOGpxEn0DChHsIYJ4JC
 E+OILlIp7m2J48xDB6X8/mTFGFYXCmjQMtLwOLQv1fQnfvNjFYn+QhcMewozPGK0SCVAJnRIHgE
 vsj2jIrqzpzr+XKmriwVd1G19FGW/WKNpwfLQpsPdeui6D+huhhpazMXO6F97D80uQ9GzMuW49A
 sVDJg72uG/rUgzwpgxAQbEF9vrsVouZNiJI+iAUrPrtbXB5eksl1Ne3zkAjj62n8sUtn1d0HHtw
 XweBhHO38
X-Received: by 2002:a17:907:1b1a:b0:c42:102f:15e8 with SMTP id
 a640c23a62f3a-c513a999e27mr1359289666b.14.1795599210949; 
 Wed, 25 Nov 2026 01:33:30 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513afec08asm614774866b.73.2026.11.25.01.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2026 01:33:30 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 25 Nov 2026 10:33:30 +0100
Message-Id: <20261125093330.194145-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/alchemy: don't copy the C library into
 the Alchemy staging
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With BR2_ROOTFS_MERGED_USR=y and a glibc toolchain, ulog fails to link:

  SharedLib: libulog => alchemy-out/build/libulog/libulog.so
  .../ld: cannot find /lib64/libm.so.6: No such file or directory
  .../ld: cannot find /lib64/libmvec.so.1: No such file or directory

For eglibc/musl targets, Alchemy copies the C library from the toolchain
sysroot (lib/libc.so*, lib/libm.so*, ...) into its own staging
directory, and passes that directory to the linker with -L. Normally
sysroot/lib only holds the runtime libraries. With merged /usr,
sysroot/lib is a symlink to usr/lib, so the glibc libc.so and libm.so
linker scripts are copied as well. ld then finds alchemy-out/staging/lib/
libm.so first. As that script is outside of the sysroot, ld does not
prefix its absolute paths (/lib64/libm.so.6) with the sysroot and fails.

Buildroot already provides the C library in the sysroot, so there is no
need for Alchemy to install it. Pass an empty TOOLCHAIN_LIBC to Alchemy
to skip this step. It has to be passed on the command line, as Alchemy
overrides the environment variable. This fixes all Alchemy-based
packages (ulog, libfutils, libshdata).

This issue has been present since commit 7f1f3f87868f ("package/alchemy:
new host package"), which added Alchemy with the libc installation
enabled. It therefore affects 2022.02 and later, including 2026.02.x.

Fixes:
https://autobuild.buildroot.org/results/60397b107a5c09de5fd444babae8db538690ef33

Fixes: 7f1f3f87868fa333833dbba9f4f07adc338b34ed ("package/alchemy: new host package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/alchemy/alchemy.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
index 10d1068ac4..ae3efa67d5 100644
--- a/package/alchemy/alchemy.mk
+++ b/package/alchemy/alchemy.mk
@@ -23,7 +23,15 @@ $(eval $(host-generic-package))
 
 # Variables used by other packages
 
-ALCHEMY_MAKE = $(ALCHEMY_HOME)/scripts/alchemake
+# Alchemy copies the C library from the toolchain sysroot into its own
+# staging directory, and adds that directory to the linker search path.
+# With BR2_ROOTFS_MERGED_USR, sysroot/lib is sysroot/usr/lib, so this
+# also copies the glibc libc.so/libm.so linker scripts. ld then finds
+# them outside of the sysroot and doesn't prefix their absolute paths
+# (/lib64/libm.so.6) with it. The libc is provided by Buildroot anyway,
+# so tell Alchemy there is none to install. This has to be passed on the
+# command line, as Alchemy overrides the environment variable.
+ALCHEMY_MAKE = $(ALCHEMY_HOME)/scripts/alchemake TOOLCHAIN_LIBC=
 
 # TARGET_ARCH is set to 'xxx' to avoid Alchemy managing the architecture.
 # When Alchemy manages the architecture, it can add some flags to CFGLAGS and
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
