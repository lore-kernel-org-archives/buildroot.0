Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3AC606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ZGqcpKwb
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DF33640531;
	Sat, 24 Oct 2026 21:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aG3an1CYMPIR; Sat, 24 Oct 2026 21:28:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 085B84053C
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877332;
	b=fQMjlVQzVkVyAkjI9qdbvyxqQ5jxPzivZkhYoojadJBbTIoOGND5DZjRGQtnib+CjYhg
	 8OcAtJbz0H2txgQARlUGaF+Bo+VyAZLgZBieUYlDz8eWHqdv9kC9QRijeCd583xnTyGdP
	 IDRw9ZQwu33Yk8RWkAOpT9HEeindJfJUyGrX/IM1/SC2NIHk+Sb1P/t7n44eGczhLxyRa
	 Tebc4Jh702gyFud4WlfKs0oyVK+EFBPsg66331/xMFJah3Tgyiikh1NJFtfraEXNryUrO
	 ItVzpKtCMdLSoiqJgS0jD0hro9/rimXRn/DvMreP2mWZkkvP3jp+MYvoBt65XfN6z+A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877332;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:References:Content-Language:
	 To:Cc:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=51bntpCFLIjZ8UDUMRpM6HzslutoJYfQEULA/gAbMtw=;
	b=UsiGwZHaZB1yVuVhwdc5nYNlexM9SMEJYRU99mweUM4F2OyVcYSYyL3u9foO812nbmwc
	 Z9/LKeeEraJLJJGaNDJgEx1mSP5f4lhz08y0qN4weipFtQiOU6qEBFOXAs3qLYABKzjFp
	 VMQVUGCPrT1AVFJI7UULqMuCLNIX7J9RwPb09qutaZW3K4IZcq/ByJqhlzAiuBWCW0iv5
	 qzqvY8zddNuLOYPAdRYREQJirHa2nCizmzcV5xFtNvIaEI+n/ZhuAzU6mtntYrrLfLYzk
	 6WHFeV18yBXGmnkljt1v+WIFg3YRxXOSJserXACME24r8mzrxn7/lp/jVs07CO2gyIg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877332;
	bh=51bntpCFLIjZ8UDUMRpM6HzslutoJYfQEULA/gAbMtw=;
	h=Date:References:To:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZGqcpKwb/D2C/OTwvt//4FWXbqariYJGCr15JbmONm2IzfWF/cTYu63WkQn01/jIU
	 36iZ7TYFg+zbL1Xn+5xdqgfllOEERFZ9fjp1TQNznpbzV006Dvrrgr2lmS1q7q1i6X
	 BMk5jdHV1HeB444+ZXP46xn2d5cEGn1TqxRxfKTHnrhW8P2cgGNEh+liQTT4udk32y
	 QPfNDZlLDfwhXF2CRBZYmP7nngmLo2/+t3Jh4azspqwFsa8trYJCBSuEvJ0740P7jT
	 qfa8VP2bBY0MEVqesghKWNI37gwvvpzUzAv3m+7n3YxDmk1lZZeqmYQzSlnh6XCdLu
	 1f/egROoTt2Kg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085B84053C;
	Sat, 24 Oct 2026 21:28:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85B3D2F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6ACC34053C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nEULytfv5W5A for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:28:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFEDF40531
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877330;
 b=Xec1lyhK0MsFCR26V60s30LfJzvtoFtaTC9i8TeksF+URo/1dBukDxjlsaabxX9+MyK+
 Buw7/lXuF4j4SeMS9LYCcsBr94CVk9ajXG3fICgvlR47LwiAjveuL94Ws64bN7caVKxuE
 eP46/tBQ/MT9gN85t/TQX+sYxq9D/x437M86822T7pzqPXSGEtugOCc6pNulqaxWUfz38
 etYegUhqcznRRucrgMBEDlfEatP5cy1oSPRT/CLz3IoGb5pfDRWSqwAa4CkPe4BP4lcFQ
 fBsT3n3tqzih9T3I87qmmMSBQAthMrqqS7kmTMe3gU0mf4er6Sed+RTstFbEcqjDDgQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877330;
 h=Received-SPF:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:References:Content-Language:To:Cc:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 bh=zuXR0W3iJhLTS8SejA4GmgB1xpUD97GUOvxSIYvk9Ro=;
 b=UDDhvuFz1P79rlXRCuS2lOZTvagS36WkW6trCmAiy9qhj9gLweP2FZ5jq4VyYdtyCvNp
 OKL6M12vpviQRlinsUcDPZ/4aGSNL3C0sB546yuvoUO/WkJb4Ns9F36FZkNPseMUnUbIS
 6Ew0hTVB9eWgGYfeke+5j/+pqmIAwH+9DQPV0DpE/Rau6Ghkod4tbZX14UOsL8wuPLwBJ
 auVqn/TsYVC9LDHPn5wPcX5wK70S4xM27Q0abY0QalFU6BaSCqoyEXao4djW1JKOkbG38
 mlf51n9/8BqSgxiby/SpoaqYT9j1qxLVgfp3+esHmfIXByWPjEysPgCSzWjpN0A1x6Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=grenoble.cnrs.fr;
 dkim=pass header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=nbjk9vXW; 
 arc=none smtp.remote-ip="2001:660:530d:201::44"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFEDF40531
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:28:49 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b] (unknown
 [IPv6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id BE15D180ED4;
 Sat, 24 Oct 2026 23:28:47 +0200 (CEST)
Message-ID: <9aeb8e61-7edb-42c0-8c21-3f4ca12fc3c0@grenoble.cnrs.fr>
Date: Sat, 24 Oct 2026 23:28:47 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
In-Reply-To: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
Subject: [Buildroot] [PATCH 2/3] configs/acmesystems_acqua_a5_*: set issue
 and hostname
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Name the board type both on the welcoming banner and the hostname.

Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
 configs/acmesystems_acqua_a5_256mb_defconfig | 2 ++
 configs/acmesystems_acqua_a5_512mb_defconfig | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 3eb805b530..164132daa8 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -6,6 +6,8 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="acqua"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Acqua A5"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index 0664a268b0..add3ad9f6f 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -6,6 +6,8 @@ BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="acqua"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Acqua A5"
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
