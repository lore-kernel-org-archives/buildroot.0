Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CACE606A31D
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CgQxmT/5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B5BE6064D;
	Sat, 24 Oct 2026 21:30:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t_UKCTtXfBLt; Sat, 24 Oct 2026 21:30:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9C7336061C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792877405;
	b=CGlYdpN/i32NsQEwp0O0s+YJfY5QWyg7hKP9WP4sNWL/VZ6R81CIQoxrOSIwb2e4Xpkm
	 9Jfy05ySLHjixAHRtAsIvOKx9OJsyGD34xWFKNMBLJ8Ip2y5R+a+tWEO2bRAMe821odlk
	 Peh+vd1UXYtG++W+Wqk5MuroXc5IYKx24fVVD/f/NmHlYQIHYONb4jUTfkEadcGkdMUU6
	 s3rAJ3UJW8DqpekScVwoc7aNBY5V+RZpAgwdXc1RCnSZwtS/g9uffo0QfjgcJFuXepoli
	 wTW+Jyq6WWU2zNW4Zn2yhdqpTopvcjS2lm/LYE5hiSzCqTUoU3o2Op4P6LjLi8nqOjg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792877405;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:References:Content-Language:
	 To:Cc:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=hXYRAEkpKL1kbuK6RoXTyLtBZeOpd41IV7XMSvbD12A=;
	b=HRaeMMl6mZW8saGEv6qHLq5ccF0+fndSv0gn189XCAtPiAhwESb3WVGLeiDfJP/X3Vlg
	 c39MYjfZp3vR41oYWu7jqL8C3MrZlCPDClsUP6LLBWS5new90HSMClbF3VTqEYlm5Iiwk
	 51WsT/5/AuWyLmaPQxEgYGvNAxSHORy5pgLi/OLf6BE8TgQrKZ47tRnCqPo5Bn0yHVrJz
	 +FM6a+Hq+PduNW4bIsNYzSivnFRlQvE1aPUq15VaCW4mCMQZKAY5P/CK2QC2q81Qk1MJx
	 94lIue70oXzlcIxz+RbyDwyk95FdjTzDL/59CME9mWJklLV5VV2NmgiTz7cdNoe4UCQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792877405;
	bh=hXYRAEkpKL1kbuK6RoXTyLtBZeOpd41IV7XMSvbD12A=;
	h=Date:References:To:Cc:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CgQxmT/5CiHyqv5WRD5gSf0Auzwtveg+6Cm1zilPkYTjnzfSUuQTkNsEXhNfyCPT/
	 fYwXe0el1T78XFquVqWMQZQppRSb92HIMJ9FhUFnRsDyOFQiZo8777fvuN00cslvG1
	 +muTZh8tkqMtocnjBBzdIfkrOxONMLNxi6zIVzTPhr9Xzi3tHfWD60gDuOkodpo4Te
	 uv6WJCDez+05ALIkeJtJ+NA5LeD4axAoL0lO+8ojRtPG8i1uBSKrWdN3N5MrUxz3kq
	 TBKw2IwIDSpEzz9bDmF1X1cVt7YayfsbSQQGPgqKAf4U7joU9knEafSFnzUOcN0SrS
	 e116f55CbQTtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7336061C;
	Sat, 24 Oct 2026 21:30:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCF433D9
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CEC5C406E1
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sopZ8-gJatQl for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:30:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F129840531
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792877403;
 b=jHKnZUIT1tjqSoX6wQoZM8qSq1hM0RCktdPBeUU/WR1QvY0HOOJJWCVsNW3CqO5fM6pa
 x4JbPcH3zKmP8J2mlNbAUZSug/VYCDB7pt0lN/k2dWd3iPxFr8duSmoFOKajPEEVPqp67
 cUtUes8NwmTlBZb6V0ts2l43DbtWAMmnq+zW+z0TwDD3zphkPeJTRHf4xZKhcGQNYN5WQ
 5dfc/yFsrMkTR+ahwoUz2jPQIw3RCiC4MVeJfogv61YnqF4HXwK84Kb6ebXQ3Hy1HCwXf
 D06NpqQvEFWkJyWBirUxid2Q9MWxL3mezTtB09TLwpADBBiuArn9NS5N8HUoisZBCDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792877403;
 h=Received-SPF:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
 User-Agent:Subject:References:Content-Language:To:Cc:From:In-Reply-To:
 Content-Type:Content-Transfer-Encoding;
 bh=Qrd383xGME4IKocRym3viV9jsBsZo4calpIlTOVoyAM=;
 b=QvhW9GPKrxngDiuetEGajx+w3263SAPrnS0TGZ1XmrVSdLmZJV+Vlcn9ZwG6T25+I/oU
 jmAHWulsLO3VH6FpJec4//21yJe8UQBE+ixBdxfWf3db/GTrrOq10U+oKdy/t/9lhLUHQ
 Mjl1evC73EaYlsBmw4sDC0XyhnK/jAMZqLdM394j1L5ZZ0IFku4p8tgvoIRtMcTdcV6pe
 15SdDjq3Gw1Pwlr4/7C/IHYN05ZJQtT6O230xFZvli5GCwwXIsdHrYgKLygCp8cpDVFWD
 leIsvISxbVjmvwZXg3Ygm/UVsJKOmpdDJk/7KqJmEKBEKKujvMdcl+ILiTvIm8IUTpA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=grenoble.cnrs.fr;
 dkim=pass header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=PhJUhbQi; 
 arc=none smtp.remote-ip="2001:660:530d:201::44"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F129840531
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:30:02 +0000 (UTC)
Received: from [IPV6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b] (unknown
 [IPv6:2a01:e0a:1164:dba0:18b1:c327:2b47:590b])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519) (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id DD647180ED4;
 Sat, 24 Oct 2026 23:30:00 +0200 (CEST)
Message-ID: <806809bd-ef78-4c6f-9ed0-9e9855f1659c@grenoble.cnrs.fr>
Date: Sat, 24 Oct 2026 23:30:00 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
References: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
Content-Language: en-US, fr
To: Buildroot development <buildroot@buildroot.org>
Cc: Biagio Montaruli <biagio.hkr@gmail.com>
In-Reply-To: <f90ec3b4-bd18-4f71-b4fc-eb2c385a9978@grenoble.cnrs.fr>
Subject: [Buildroot] [PATCH 3/3] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.18.58
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
index 67e419e2f0..fba0e6ea80 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
-sha256  3712fc1ec839e4daac981176c8518912e8f452650aaedfe4381da4419613a431  linux-6.18.40.tar.xz
+sha256  069b19f9032c4dac8149ae4b6520c35debca0f42a9f6d52ee55ba6ca9b818013  linux-6.18.58.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index 164132daa8..5b31f4c692 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.58"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index add3ad9f6f..ed74dd30d6 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -13,7 +13,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.40"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.58"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.43.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
