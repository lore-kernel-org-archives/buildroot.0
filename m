Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D45FF8867
	for <buildroot@archiver.kernel.org>; Wed, 29 Apr 2026 08:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A930A613AC;
	Wed, 29 Apr 2026 08:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQHSDQAt261e; Wed, 29 Apr 2026 08:46:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0FC6613A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777452401;
	bh=VZaCEw5fE9H9uXTya30zbP7jUIOcUDjySS/Ku+Awbh0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SN0nizgT3pXBrgL56Gdl8BkKkLVuRdHkTzyIcT/ZePzPm5AMNzOAg/bgqfkNp4rEZ
	 S5cM8BVmYtbZYng9dm4bsCzUGr244KaqDLzaFkUNcxKkPmT2JMnm702j1cDnepn2yp
	 58Ywc2rbEfpK5ns5QEBU8+sgxAdciazifdDZyV6552BkRphb21FzvO0pxWCCFnTLtS
	 8e+5ciPcb1e0DzBRyyW1ATbfP2dWiWcIZC64WPcHduLf4NkS6UsSnqWM6X2igW1vR6
	 3QHLqpFXFxOAN4HqUQ/8fS3EylsVl4KQRnOvLOjGN5iFRdMbI2lSSfs0JY+0pl87Rf
	 4pPhe7F2BLRJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0FC6613A1;
	Wed, 29 Apr 2026 08:46:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A43E23D
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67F4C41FDC
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_wRaZnFN91C for <buildroot@buildroot.org>;
 Wed, 29 Apr 2026 08:46:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B1ED4135A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B1ED4135A
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B1ED4135A
 for <buildroot@buildroot.org>; Wed, 29 Apr 2026 08:46:39 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id D8CC82C86F14;
 Wed, 29 Apr 2026 10:46:36 +0200 (CEST)
Message-ID: <c3643492-36fb-47d4-b517-fb28cf59f4e7@bubu1.eu>
Date: Wed, 29 Apr 2026 10:46:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
References: <20260421184831.2576691-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260421184831.2576691-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777452397; bh=k8VwWGJ68wQYGENK+7BVSxJj8yUmd2srXqFsQDSs13o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To;
 b=g+KlabEHFqxCznb37unIB91o2SVLCZNxhTvbLIpGuNrHNMwsxlWn5p9b4ir3u9RCn
 bAupl73x1UzRtBn2vSwAFEhPc2D6RL2loAjaqxMGmpZqzxME7hJDNBaeqbK0YbFRzP
 NgDUn3SHzfTbXZ+Up8FCwrNDLC9fOt7XzmTge3TXiQ/gxHqZ8nrlbqTtw2Db8Wc2zR
 keBqKM0VSgyXDtKZQGGnj8urU6nC8/t9h/Ad6pwSoV0mqu6f58bMOPI260nVA4RH9W
 pltsvtOqVZ8T/dK2aMZB1oNZyBMn1q6FtcvjF/BETFO5wikJm/dfkL8HMKgwUmDMac
 2FzGEuhH6RSrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=g+KlabEH
Subject: Re: [Buildroot] [PATCH 1/2] package/opensc: security bump version
 to 0.27.1
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 4/21/26 20:48, Bernd Kuhls wrote:
> https://github.com/OpenSC/OpenSC/blob/0.27.1/NEWS
> 
> Switched to sha256 tarball hash provided by upstream.
> 
> Removed patch which is included in this release.
> 
> Fixes the following CVEs:
> * CVE-2025-13763: Several uses of potentially uninitialized memory
>                    detected by fuzzers
> * CVE-2025-49010: Possible write beyond buffer bounds during processing
>                    of GET RESPONSE APDU
> * CVE-2025-66215: Possible write beyond buffer bounds in oberthur driver
> * CVE-2025-66038: Possible read beyond buffer bounds when parsing
>                    historical bytes in PIV driver
> * CVE-2025-66037: Possible buffer overrun while parsing SPKI
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
Applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
