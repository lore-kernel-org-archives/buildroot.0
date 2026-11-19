Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6A9606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 14:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=atR58dR0
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F048540AA1;
	Thu, 19 Nov 2026 14:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZG5w4FdzbNkB; Thu, 19 Nov 2026 14:32:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1D1BA40AA2
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795098743;
	b=shOQfjyA9yP20ZbJyevem1+jSnDj9yMGN5O0qgN4/HywJRWsRx/ra1+KxncHTPKurnqJ
	 IeHUQkQNkMKtL15hG6Up6FosVL9+a8zZE006uxXcwCWq2drs0G4ls9W9TgJda5+LP0G5M
	 caXogYlWk2M7xgdu8SUWKU0GmqgtXRZK9pR4vBx1qwaXQRQ0wUyPUWkM977YSFJiNR0cv
	 pegWglVWPWy9jXjNz9sE6KcN0HaxLJOhZfDhKrtWVG97KWk0DFwVpHlKnG32V/+arzn0E
	 EerAbLp127hnazARQLQXhj/rk1UrVeco/Pmrx+RL0ANWg5wco67XWY1sfclZKYQe7Uw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795098743;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=zkXMBzBIpouB/Xek70gJy6+ARijR0HcYbyilbrs6sZ0=;
	b=oegh/ghTuL/qe9yEFsiOUfC+FQ1Tjm6WwjLHDgGJlhhEOjp1s7kh0kKVp7Z4WxjlGokn
	 je2pgcXW8o4tWs5q5ywlw8NGmp/TfUqRKE9oY/lZ9nGMAiFFzQHsiBy60FYgbVViSWSV7
	 eSF33dulnIcVPKWmrrbmE17+DMnbG7J2CO2l/zfLzcxQFCFe9hh8Dhm9DDoF2EUGIH2mI
	 GxcpGjTzTNCTp3Bzp2fH/m4E/+AQ6tQJTgOe9HvnM4cZs6bJITY4kcIkSIOkXwDMcxg//
	 7gv9/1HCxjzTBwUvle9CxO1AhHCU4rmC2Uy7dRQO4AlC7NBZZTyOTnyo2yg+neeZp2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795098743;
	bh=zkXMBzBIpouB/Xek70gJy6+ARijR0HcYbyilbrs6sZ0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=atR58dR0RnSFfKwCV/KHG9YO0h2AdR+y4oKTfkecCVwDZ0coHy4s11J5q+oNpBA9t
	 XKaAEyx+FEcmcaukX6PtvmzrBLZHrlnxVDTJsy7QtHLLcSkoa8AdvHDoiTGeCms9RX
	 4hTmXLqNbgZCKC6ripXocUbaU3wLJRqYlCOZWqcjZPcn2CQh9swGrbF8vtwspVvjTv
	 H/c7DwOkASJxPcLEX/cS3csZk8dXedmW2zk6KEuuuWrrI4AnaetCnnEurj4QMQ4BZt
	 MfZ7705fpReBObUow9SEsz4+m3ViRT60el8b2iGvU9bF0Iy8vEj5eo3sbBOzgpaZtw
	 Hczl3nmf1u4+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D1BA40AA2;
	Thu, 19 Nov 2026 14:32:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 236722FB
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1504B81335
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3rxtow9N0iGW for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 14:32:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 358D681310
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 358D681310
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 14:32:17 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 50C202C84E8F;
 Thu, 19 Nov 2026 15:32:15 +0100 (CET)
Message-ID: <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
Date: Thu, 19 Nov 2026 15:32:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20261114140316.956334-1-fiona.klute@gmx.de>
Content-Language: en-US
In-Reply-To: <20261114140316.956334-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/1] package/cgroupfs-v2-mount: allow
 setting mount options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fiona,

On 11/14/26 15:03, Fiona Klute via buildroot wrote:
> Certain cgroup v2 features can be tweaked via mount options [1], so
> those should be configurable. Implement this following the common
> pattern for init scripts: Source /etc/default/cgroupfs2 if it exists,
> and pass MOUNT_OPTS to the mount command as options if defined.
> 
> [1] https://www.kernel.org/doc/html/v7.3/admin-guide/cgroup-v2.html#mounting
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
> ---

The change itself looks good, but I worry about this being not 
discoverable at all. Do you think adding a Config.in help text addition 
that points users to /etc/default/cgroupfs2 and MOUNT_OPTS would be 
helpful here?

Also do you think we could add a test for this package? I think it's 
implicitly tested by the podman test but that doesn't exercise this new 
functionality. Would that would be worth adding?

 > [...]

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
