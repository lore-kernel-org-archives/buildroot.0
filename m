Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 211BC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LdRtu3xH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0B57810AF;
	Sat, 24 Oct 2026 21:23:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffH6DGzvSswv; Sat, 24 Oct 2026 21:23:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA7B580F8B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877010;
	b=k2knTdA6WOnxW6izSBoKJjg2YgyJqFiKJ3Q5Dv2Hv1uf8ud6znnjbmbjPAGSfuesRkfh
	 8TOr1qh2U5XhIGUykVAyXnEVoE9CK4ZaeM/kC/JyHDEzaQA30MGQQW1q4hoUfl30712KX
	 5H6UrGXlOzqwwMwHvVUHHTDiGOETDnKaOJvUhSyrigXmV2QrfvNwYXqzSZ0G+IS9DRaAC
	 Zv5SlwBMWcWQV03rgze4vhks8UjNWh3VdU/iy7hlRZWdja5qu83z7fcnLWauq1MLm3nqk
	 m7A6csQO3CXBegl8RxVIDUSpJ+E87xDR5zoy4x1jGZPkwOyoRdEgBByBLyz185B8tCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877010;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Content-Language:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=qS7BSEWcDJAaSRIDTsN1laMi0iNh/f0c+xeljWHVvwk=;
	b=radCzun4uXc9rxZQZ3fSHAkfmCi4GYO1ToWzjrudX8+8gX+zbdNuJ0pEjc8nscHt0Swx
	 HmTKBlWK3GfPJtL5+lUcHKLTN93HD1OmwXhh1VV6dBneTZeg3+RtkkSeyGcEcuRXR4qPZ
	 TrQz4+dlcrgKOQ7CIu90M9PpfMxkF9ve33UuZXHHgOGszR3Gc4TvRYEW1DgRDcWuK5CI0
	 mPLbmh0iMKZQpPG8BPL1Pn8tnouaZFR4wWHQ4mkpYBJUPw4UK6eTTEVfcmv0JjwM6AM46
	 BJ7TSWORDArsvmMZIalxXr/VrpyrYMvx5wp5ztVXKGLD4NrrCxWL/nkV4bnYiLaS7UA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877010;
	bh=qS7BSEWcDJAaSRIDTsN1laMi0iNh/f0c+xeljWHVvwk=;
	h=Date:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LdRtu3xHAVoT0TFbtx2g/k3pf4MFh7sbApoBoaq1Ak7GMaQSa5OnK+s6Yz/wQqq5d
	 5XBlC9/tXf3MV1dBVN34zuFxgtIq9OxF1x8gC7e4K7Igso5UhYMhrj9jhMYr5u/L5w
	 ML8pHyUxZ/WzzfFCFjY8M8pNdnXdoVy3qVbNw2Oua75ztwfLvWfslHHzNZtIj9f6n+
	 ZqWrurqe1pBjRyIzwzGZsoFH6l+ureJBxZfsMD35XAvt90yQVs/qywzIBJuRMC79DA
	 96kdwcfplTvXeZHqp8u8Qc5wfew36vBohevvJ/+LF6iHC+VZnChFWtabpUYdtirz6j
	 8H/9SMv0yzN9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA7B580F8B;
	Sat, 24 Oct 2026 21:23:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CF2692F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C10134006B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PihC6aySloBk for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:23:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 9D8E040079
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877005;
 b=iVwV7fLVO5Q+nmmVgmiDKEqJn/JszwusboyYIgQQ0xFi/v5zsjcDAfCYvyes0Z3Gn1r2
 tNpX+4JzkUqT8BDBO4ygca/M/dsoVHWgSfVLFqLnzgLhGRGeQyZQahv5p7pyqEZO46pFy
 i6KoP3okjBtT8NRbkJYLVOmEoF8qaonltWgA7MhlaZ54YGOy2tHqDvLy82NXjv9rH4dNo
 vycEwk66Qu+JAdh2bB026uNXz78p0arLhy2kOXq8+3MARUwbVOw18q+mOiPJJGrpD0qWv
 NvYta8vIVfgJyf36nZiQ7xX4XeN6+nL7+B2IYwFTR84yl5OmojSVRdKHU9WjDaORIQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877005;
 h=X-Greylist:Received-SPF:DKIM-Signature:Received:Message-ID:Date:
 MIME-Version:User-Agent:Content-Language:To:Cc:From:Subject:
 Content-Type:Content-Transfer-Encoding;
 bh=pzNCLD+LOhWS8IE2Zd7xqWtgQGVRXs801xE/2kcljmA=;
 b=Qy6lBm5DEGzEfxqK6HEK+fX5dqSIyFHfFDC9Tu/EssVacmYrLsmNt/MMWB8TyVnn3KLS
 ciyPbvxMUjDP0WXOu7I7CRJzse5waWfU/0rflBhYRpcHZpqx5/SL4m7os3zjov0yWu6M0
 pDEyiAl9fXX/s7i80a2GbjsxRXxfhfhkUB3H+A6cQ3wKa4Kg45Q23k6sw83QlnOcG3r8g
 XWs3NYXKpffIkvqYzZ+Rsh1odBVBBhwgfe3joVl185rDRd9Pss2qst7N3ZVN4W1pfnfwD
 descAgNlPoAoUdjxU/56740TLOXTU3gv9VoulrcO+4zeRneWvSA3fzQKR+J83bW+Iqw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=grenoble.cnrs.fr;
 dkim=pass header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=iMWDEzqN; 
 arc=none smtp.remote-ip="2001:660:530d:201::44"
X-Greylist: delayed 510 seconds by postgrey-1.37 at util1.osuosl.org;
 Sat, 24 Oct 2026 21:23:24 UTC
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9D8E040079
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:23:24 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b] (unknown
 [IPv6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 24BB7181157;
 Sat, 24 Oct 2026 23:14:49 +0200 (CEST)
Message-ID: <843438d5-7e61-4c15-9629-e6d4e56f105d@grenoble.cnrs.fr>
Date: Sat, 24 Oct 2026 23:14:48 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
Subject: [Buildroot] [PATCH 2025.02.x 1/1] configs/acmesystems_acqua_a5_*:
 bump to Linux 6.12.114
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,TVD_SPACE_RATIO,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 2 +-
 configs/acmesystems_acqua_a5_512mb_defconfig        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 6ce8a07bdc..205c68a00a 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  a62b6a2d207ff72510e5f47156b7078e1e71797357412411b8e4fff97fc8f4c7  linux-6.12.98.tar.xz
+sha256  7a8589912bd7a8adb07fed074283652cf482a35facef8954554654f0154b4af3  linux-6.12.114.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 71a559df96..683b7744be 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 32d7692ce4..7fc8083a9c 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.98"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.114"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
