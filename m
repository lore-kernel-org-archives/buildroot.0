Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C06C5AC67
	for <buildroot@archiver.kernel.org>; Sat,  8 Aug 2026 07:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE144407E5;
	Sat,  8 Aug 2026 07:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTvA_IBPQB2u; Sat,  8 Aug 2026 07:14:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E836D407D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786173246;
	bh=TsjeDtMz7qG4gadGU519WhnOlTNq5w4t8Sk7fzNsAuM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rZP47PWhu0dk25Acmsxgms1aJ+tAdc5613Re0Y5rF1+FMJLacNSu127W5ZVvO+5RO
	 X0iMtcBRlpKaCEUXGuMnC+ZmLhZhSfTiAGIftraGQV2aixrmbTSnI2WtPws6/582MI
	 SJ0DeISHy+BxKyRUd0OFWmdkpRBt6jkNAcG/KkE3eqznx4vtAMrl7joyCqMce03hTH
	 wPhgUuTPacBuNOIinPv6vI8Jp6KBryIoYpnsn/9QnXW4/dWIBRFBr9YajsTiwMmxzq
	 5FRYmdpvaNmosSpUTojGw1aFIACM/asZfrZa1b9/QL98GB1ahJUGL5j7053zaKoCi5
	 ACYI/47HUH55Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E836D407D2;
	Sat,  8 Aug 2026 07:14:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A477210E
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:14:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A0D3407D2
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:14:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1vZiSDjzaYeI for <buildroot@buildroot.org>;
 Sat,  8 Aug 2026 07:14:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B452A407D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B452A407D0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B452A407D0
 for <buildroot@buildroot.org>; Sat,  8 Aug 2026 07:14:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8D439B0055A;
 Sat,  8 Aug 2026 09:13:57 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 08 Aug 2026 09:13:57 +0200
MIME-Version: 1.0
Date: Sat, 08 Aug 2026 09:13:57 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Philippe MONTCHO <philippemontcho@gmail.com>, buildroot@buildroot.org
In-Reply-To: <0c800033-96f8-4e1b-9a80-2c6472512ded@gmx.de>
References: <20260805141803.1647733-1-philippemontcho@gmail.com>
 <0c800033-96f8-4e1b-9a80-2c6472512ded@gmx.de>
User-Agent: Webmail Free/1.6.17
Message-ID: <63f6f888cc951c77cca6a3be6cf2da00@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786173239;
 bh=NO/SBWEXfNeOa37GDTiIOkwUp6vU2ftXc+IPV5JwHSs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pZgKaTYZO8fyvswjpubL6v4lb0MTGgyI9cfimPQ4qNFbnRtyflEjZv7qXEatNtfqC
 vx9BBYEOX/oH1XG3ArO/ZCfwc9EJ0zs83UtUTQQ/xwwx7Id4GN8oVNp+NTcrBwQ9pF
 2VB8Jb3QtgIUtBMq5D7PoclC2Gz4MPC6WHdA1gJe7Lxc/AdUE78wovDbhYgVBbagYs
 /BqyCMm2TJ+UdX65R4ZhEkcGMcKFvzRlEFm3WQh4zbAZmvHpAk6oq7zpQHJFioQJNj
 jJEXRN3w2NC4NqM6xJipcUQdkFYZXg2QQjLzrWl+Tc7pG3rQCaF4vocNHInAmbyqpB
 uXvCtDeEIlCww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pZgKaTYZ
Subject: Re: [Buildroot] [PATCH 1/1] package/dtc: bump version to 1.8.1 and
 switch to meson build
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Fiona,

On 07/08/2026 22:02, Fiona Klute wrote:
> Hi Philippe,
> 
> I mostly agree with Julien's comments, but two additional points below.
> 
> Am 05.08.26 um 16:17 schrieb Philippe MONTCHO:
>> Release note:
>> https://github.com/dgibson/dtc/releases/tag/v1.8.1
> 
> The primary repository is clearly the one on git.kernel.org (the manual 
> doesn't even mention the Github one), so please link there instead 
> [1,2]. Also it's probably the more stable source. ;-)

I would have accepted this Github URL because it is mentioned in 
CONTRIBUTING.md:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/CONTRIBUTING.md?h=v1.8.1#n9
and libfdt/sbom.cdx.json:
https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tree/libfdt/sbom.cdx.json?h=v1.8.1#n39

It seems the project is using both, so I'm fine with one or the other.

[...]
> [1] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.8.0
> [2] https://git.kernel.org/pub/scm/utils/dtc/dtc.git/tag/?h=v1.8.1
> [3] 
> https://git.kernel.org/pub/scm/utils/dtc/dtc.git/commit/README.license?h=v1.8.1&id=205fbef17b7b2f410e34ac79aa1559a8d492b66c

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
