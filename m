Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B87CFE8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DBAE608FD;
	Tue,  3 Feb 2026 22:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AhC-hc-orepa; Tue,  3 Feb 2026 22:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A13160901
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770156101;
	bh=wQZE5f1eNKok+X/9N/z0oQXgd55/Gawqx+7oT+v7ipM=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Fhu9nv7LHeHDzuHot6OVXFtb+1gifHfNM8dx4iRnR6WSvNy7fkYlldfAV4o3qt8b/
	 Riy8lJl1VjGDfjOXSRxqTH3Xx+B/H0HtjUrXie0tZEaHOx8nlYPA5Gl/3IXZnJu9kZ
	 SqnN/GbmWzumo6tsW/ZIEoKtd8cp+Sjepxeq4zL6Xyq76WiKe642EszL0kfGTpSIhB
	 Zx6afVaMZfwT+kCbFcPWgIBNvBWu5hpqJQRn8m4SAb9hjhl7zmC8Dhr5XQy02y1oTp
	 hinore6rZ/j4jov/Y5eYN4SfmowCyxvcksGlB8Pgr7SKpkR9Utb0X4gbGnUVDAwWCl
	 9jNpY0xgqmQKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A13160901;
	Tue,  3 Feb 2026 22:01:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 796F3F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5823440185
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZuPd7pLOa6fo for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7250540081
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7250540081
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7250540081
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:01:38 +0000 (UTC)
Received: from [10.11.4.248] (220.211-78-194.adsl-static.isp.belgacom.be
 [194.78.211.220])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 2D8DA2C80CC5;
 Tue, 03 Feb 2026 23:01:36 +0100 (CET)
Message-ID: <84fd9a45-f6ce-46c8-a3bf-747fd6808880@bubu1.eu>
Date: Tue, 3 Feb 2026 23:01:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Florian Larysch <fl@n621.de>, buildroot@buildroot.org
References: <20250527152342.4288-1-fl@n621.de>
 <20250531143928.25446-2-fl@n621.de>
Content-Language: en-US
In-Reply-To: <20250531143928.25446-2-fl@n621.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1770156096; bh=A8GPExOlpQK87wKgmIz187REJCCy3TJKOQz5QkiCy64=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=rpnYUAqkw+a3EzJE/VEessee4IGddH0JqPEcSbjtOLlbHKDtiBRbmV2dY6GNxvhEU
 T3mymEo2bC9x1NvOz/kJmovSg37Tw7tNK2/m3OhOM7RLDFVK4voGi2O8F43F0P5lEm
 JswXLVIlWp5NTpSgsT1zQNf7BELu2fgR9r9T7NrXpfU2sCFbZq/z/axkoJc9RdCXxb
 tek90H5vFpoiaBK0imYFBAG/WaUDs5LVamxjl6zZescvutkjsgy/39+7Y7nBLzxKg+
 eB2d0qsh+JE8r+5P3kjAJZV3TRdQFiOWpQrtKiH9ryRO2fQZqc7+rxcw0SaA/Ioua2
 9alBB7IbNyFZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=rpnYUAqk
Subject: Re: [Buildroot] [PATCH v2 1/2] package/network-manager: make crypto
 library optional
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

On 5/31/25 16:39, Florian Larysch wrote:
> The network-manager package currently pulls in either gnutls or libnss,
> neither of which are very common and it might be the only reason why
> they are present on a system.
> 
> However, most of NetworkManager works just fine without any cryptography
> support, it only seems to be used in test cases and 802.1X support code.
> 
> Remove the dependency but use a library if it is present.
> 
> Note that this changes the default behavior. If network-manager was the
> only package pulling in gnutls, it won't do this anymore and use the
> "null" backend. Add a note about this to the manual.
> 
> Signed-off-by: Florian Larysch <fl@n621.de>
Series applied to master, thanks!

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
