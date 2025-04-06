Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE1C3600C
	for <buildroot@archiver.kernel.org>; Sun,  6 Apr 2025 10:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABDE6406AF;
	Sun,  6 Apr 2025 10:22:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3sf_DxYq7p9x; Sun,  6 Apr 2025 10:22:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E22F540704
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E22F540704;
	Sun,  6 Apr 2025 10:22:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 766341F1
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:22:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67AC840704
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tGxIQyWTzIpU for <buildroot@buildroot.org>;
 Sun,  6 Apr 2025 10:22:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C6369406AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6369406AF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6369406AF
 for <buildroot@buildroot.org>; Sun,  6 Apr 2025 10:22:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DA272780502;
 Sun,  6 Apr 2025 12:22:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 06 Apr 2025 12:22:07 +0200
MIME-Version: 1.0
Date: Sun, 06 Apr 2025 12:22:07 +0200
From: Julien Olivain <ju.o@free.fr>
To: Nayab Sayed <nayabbasha.sayed@microchip.com>
Cc: buildroot@buildroot.org, Etienne Carriere <etienne.carriere@foss.st.com>
In-Reply-To: <20250404-optee-4-5-0-v1-1-704dadae3f5b@microchip.com>
References: <20250404-optee-4-5-0-v1-0-704dadae3f5b@microchip.com>
 <20250404-optee-4-5-0-v1-1-704dadae3f5b@microchip.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <906e9f199ac17012b6d33dde1151d51d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743934930;
 bh=Hqd5B3ej2yivfVCmul4j9hubm/vuNTgAA3QgCnRFhl0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=O+nVq4MJBTz79//YgPv211gWusxBDAplB53SUNkSIjR3W2L25mPzAOZeWP6LUfPmm
 gAJqb1Y3Z7xZpQs7crEeAWcxsuiLmUF5DPy48FDgEoNLcH3xZ0u5+0JcRvRtSRC0DR
 qG+G7XvdloUxO09SSrLrkvCawrG7PsQY2vLkdOvSVeJqJ0Shqq3ZjVw+YhJV+2Ui3t
 gVcTZ02tRYyGcqVzJdSnwEW2WhqPNIvm8GbTbw/O4PaNWaPZwnrrzzfKh/8iOuLAHI
 y4RBhwsekp5rDqePp8ZyaAFVjudZbtS24J6kx3leGnS7fGcKMmQGMyPel+zr0x0pAa
 7O71af3vuCJTA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=O+nVq4MJ
Subject: Re: [Buildroot] [PATCH 1/4] boot/optee-os: bump to 4.5.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Nayab,

On 04/04/2025 13:07, Nayab Sayed via buildroot wrote:
> Update OP-TEE to its latest tag
> 
> Signed-off-by: Nayab Sayed <nayabbasha.sayed@microchip.com>

I applied the series to master, thanks.

I moved all package archive hashes to the "Locally computed" section
of the hash file. I did that, because in Buildroot, the "From: URL"
comment generally points to a location where the hashes themselves
are published. Here, those URLs were pointing to the actual archives.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
