Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E12CFD352
	for <buildroot@archiver.kernel.org>; Mon, 24 Nov 2025 19:58:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ECB5283CE7;
	Mon, 24 Nov 2025 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nTPwmU4Hjo7d; Mon, 24 Nov 2025 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F337681919
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F337681919;
	Mon, 24 Nov 2025 19:58:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F524E4
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 615B340CE9
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:58:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wNirsKAfk12K for <buildroot@buildroot.org>;
 Mon, 24 Nov 2025 19:58:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6583A404E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6583A404E7
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6583A404E7
 for <buildroot@buildroot.org>; Mon, 24 Nov 2025 19:58:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B9E3B780383;
 Mon, 24 Nov 2025 20:58:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 24 Nov 2025 20:58:45 +0100
MIME-Version: 1.0
Date: Mon, 24 Nov 2025 20:58:45 +0100
To: "Frager, Neal" <neal.frager@amd.com>
Cc: buildroot@buildroot.org
In-Reply-To: <SA1PR12MB5615A7D122E482ED698D115AF0D0A@SA1PR12MB5615.namprd12.prod.outlook.com>
References: <20251123173952.837145-1-ju.o@free.fr>
 <SA1PR12MB5615A7D122E482ED698D115AF0D0A@SA1PR12MB5615.namprd12.prod.outlook.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <7b94dde865d40b768b815c81c75d9871@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764014326;
 bh=Mng/bWpYFi9dc5kaYzz1nLpljuQsfcKleoscT3iK014=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TKaTl1QWQ/jwLcTTq1LybX2odxKWhNCI+zIkygF+JSxB5XnOTRg2PdX+2zcGmeHeq
 zvy/+710f6IDOxOcP0MB+hn+vuO19czBH1V23Dr1yzGkC/ImZ76pnxFe0As9tndRNO
 iMlz/xemrcpGO0l6DbTuvxyccvCBLI5zY3v2gPtNskrv/5wNNG+wxA8SjviftIwUBG
 zs/uTClSney+eI4ED9JsxUif4d8S2MWhATOKGFYrowG69qjvdBgvyo1WMNxy6yXsdS
 A48I+kSQJB/nHnGYfukP0m3ol7fMDylllz1avVtJNOWpkxCAUQTZNUQDlCmA6LWq6z
 FaWS0SODCKw7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TKaTl1QW
Subject: Re: [Buildroot] [PATCH 1/1] package/gnutls: add patch to fix build
 with gcc < 11
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

On 24/11/2025 08:49, Frager, Neal via buildroot wrote:
> [AMD Official Use Only - AMD Internal Distribution Only]
> 
> Hi Julien,
> 
>> Since Buildroot commit [1] (package/gnutls: security bump to
>> version 3.8.11), gnutls fails to build with gcc or host-gcc
>> version < 11, with error:
> 
>>    In file included from audit.h:22,
>>                     from audit.c:26:
>>    crau/crau.h:255:23: error: missing binary operator before token "("
>>         __has_c_attribute (__maybe_unused__)
> 
>> This commit adds a patch fixing the issue.
> 
>> [1] 
>> https://gitlab.com/buildroot.org/buildroot/-/commit/81dbfe1c2ae848b4eb1f896198d13455df50e548
> 
>> Reported-by: Neal Frager <neal.frager@amd.com>
>> Signed-off-by: Julien Olivain <ju.o@free.fr>
>> ---
>> Neal,
> 
>> Could you test on your side if this patch fixes your issue?
> 
> Yes, I confirm this fixes the build issue.  Thank you for handling this 
> so
> quickly!
> 
> Reviewed-by: Neal Frager <neal.frager@amd.com>
> Tested-by: Neal Frager <neal.frager@amd.com>

Thanks for testing.
Applied to master.

> Best regards,
> Neal Frager
> AMD
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
