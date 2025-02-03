Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE3FC02193
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 11:56:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 031D8605EE;
	Mon,  3 Feb 2025 11:56:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CI8GAUFLv2tl; Mon,  3 Feb 2025 11:56:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 138756071D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 138756071D;
	Mon,  3 Feb 2025 11:56:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FC531A1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7195413AF
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:56:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GuRwsxJCDaZ0 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 11:56:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A2BBF41339
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A2BBF41339
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A2BBF41339
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 11:56:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id AE29D19F732;
 Mon,  3 Feb 2025 12:56:46 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:36288])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 03 Feb 2025 12:56:46 +0100
MIME-Version: 1.0
Date: Mon, 03 Feb 2025 12:56:46 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <7feul6kncgumhskzwxycuwafzplu3fcc67wc2kd6cwsfnw722c@7fuhy3go2tpn>
References: <20241231185346.180096-1-ju.o@free.fr>
 <7feul6kncgumhskzwxycuwafzplu3fcc67wc2kd6cwsfnw722c@7fuhy3go2tpn>
User-Agent: Webmail Free/1.6.9
Message-ID: <604482d44645fabb90d70550670c06e7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1738583807;
 bh=UZ/cEcXGHcjEFDwQshgAJEq8ukjNAD68WUf+0KlBZgs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=qu9ZUn97A6E64d7Fqtx5OCSAEjGiCLKDpIFiqrNUhHYZ5VYcFGuYIuWmu06hIRv6b
 sJC+TDwd2BAnHbrdNF/UcDYm2UQhkSXzXLpqK9FcTAE0uJ4AdSPhWPxcsBfgJXWwRF
 ePXjRc4hKlx1KaIR7idHQZm5AunL+XcxsRdNml7whFb2Q8muG/M0W5tWWtDdWsU7bX
 6NO4Hf8IZSyKiFL9Os816EehFd7kxSclSdeY+b/olJEpCK6lU6R34Bay+DELrlBFN8
 101t7F4GvdjVbjo1Zoh77djYKcyQ00178Te51dlI25nBg0LuaevFyAvB8jL1br4ao1
 qMHMOyH4y+s3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=qu9ZUn97
Subject: Re: [Buildroot] [PATCH 1/1] configs/nvidia_bf3: set BR2_cortex_a78
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

Hi Vincent,

On 03/02/2025 12:49, Vincent Jardin wrote:
> On Tue, Dec 31, 2024 at 07:53:46PM +0100, Julien Olivain wrote:
>> The nvidia BlueField-3 DPU includes Arm Cortex-A78 Hercules
>> processors. See [1].
>> 
>> The Cortex-A78 support was added in Buildroot in commit [2].
>> 
>> This commit adds BR2_cortex_a78=y in nvidia_bf3_defconfig to enable
>> optimisations for this processor.
>> 
>> [1] 
>> https://www.nvidia.com/en-us/networking/products/data-processing-unit/
>> [2] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/f4690c2bfd7d51c614d09ff470e725c795bab980
>> 
>> Cc: Vincent Jardin <vjardin@free.fr>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
> 
> Tested-by: Vincent Jardin <vjardin@free.fr>

Thank you for testing!  I applied this patch.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
