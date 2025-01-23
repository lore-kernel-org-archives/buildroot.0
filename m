Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC1C02182
	for <buildroot@archiver.kernel.org>; Thu, 23 Jan 2025 17:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F0B284C45;
	Thu, 23 Jan 2025 17:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0iUGh1hYed2N; Thu, 23 Jan 2025 17:31:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC3E84C4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BC3E84C4F;
	Thu, 23 Jan 2025 17:31:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 97268B88
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:31:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7632084C74
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZtQluL5UoqmP for <buildroot@buildroot.org>;
 Thu, 23 Jan 2025 17:31:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4332784C4F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4332784C4F
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4332784C4F
 for <buildroot@buildroot.org>; Thu, 23 Jan 2025 17:31:01 +0000 (UTC)
Received: from localhost (unknown [10.0.8.3])
 by mail.tkos.co.il (Postfix) with ESMTP id E355E440FA3;
 Thu, 23 Jan 2025 19:26:00 +0200 (IST)
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
In-Reply-To: <4b9b3ef0-afbe-4cf2-94c6-966496c4a92f@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Thu, 23 Jan 2025 18:18:28
 +0100")
References: <vmtsjv$aba$1@ciao.gmane.io>
 <4b9b3ef0-afbe-4cf2-94c6-966496c4a92f@mind.be>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Thu, 23 Jan 2025 19:30:58 +0200
Message-ID: <87frl9igj1.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1737653160;
 bh=nxxhIsDRUbEw7fWBYEWCnilATqSlurkO4Z4tS4sPqCQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=X6WNwliyn6IXS9Q/K9W1d3oQIXTorTx0LuANwpuZfq2PK2XIWlCUW2l6jIwHh73gz
 FfjrAs2IXDLlXXRTsXs0aDn8vz/30ZzOjf9JHiJ0yIBIYj65vNVd4PQE8Spk9QIV2T
 BBgkJ6pP6YKxEwxzNNJFVfiPP/5YRNPHTjnnY045/TCh3n9hLrIiybWrJEI/Jwzp0x
 bMMojSw1Dz79O413LGgV+n/evwRLGouu9Bu8UrdsF3+GusVJkHcZtUCN9j5sZ9Y3Po
 D3raWhTqXaHdkcR+VRvWDSn+qEZgiIpxG9WHlhApoHWwPfu9dHHZmyOs4ndlyXoNGx
 uvMj5pqMurg/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=X6WNwliy
Subject: Re: [Buildroot] How to set target system PATH?
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Cc: Grant Edwards <grant.b.edwards@gmail.com>, buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Arnout, Grant,

On Thu, Jan 23 2025, Arnout Vandecappelle via buildroot wrote:
> On 23/01/2025 18:00, Grant Edwards wrote:
>> I've set the desired PATH in the config file:
>>    BR2_SYSTEM_DEFAULT_PATH="/bin:/sbin:/usr/bin:/usr/sbin:/apps/bin"
>> But that only seems to affect login shells, and not daemons started
>> from /etc/init.d.
>> How do I set the _system_ PATH rather than just the login shell PATH.
>
>  Good question! That depends on the init system (because that one is
>  responsible to set the path). I looked in the source, and it looks like both
>  systemd and busybox init hardcode it without any configuration option...

Busybox code indicates that you can extend the default PATH by setting
the BB_ADDITIONAL_PATH macro in CFLAGS.

SysV init appears to hard code the PATH.

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
