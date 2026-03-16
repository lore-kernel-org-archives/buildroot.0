Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2288EF4644A
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 10:54:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A10F860E3E;
	Mon, 16 Mar 2026 10:54:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dceNBhbHNu_o; Mon, 16 Mar 2026 10:54:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9ED0C605F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773658469;
	bh=zx1v+7aUlYfEaHNOpmfz6e9qVmeCB/6q4l31lBs7+Nc=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=THort19Ap0trHor4IO7l1gjgeRl3XWPO34GzLqjRjNiow6QVxL0121SPthSaR8rxd
	 RcxqlOGHmqaCegJNkyo9cze22F+E5m/TxPLfjuBebo79Cs/haIZlIt+4MKRNo8nd2M
	 EvTI+NkT1kZnqzqQqiRWWDCCP4cf9gF1xKhY16Y91AWHXlZ1G0z9XDj6vdx4PgmdPZ
	 OfcB+SpHxPCYx8wXYDo7YTpEyqOPAxb59jDDm1pT/RmRFFBByQlAp9RXhPpGOEL4Su
	 3UGEgdzQtOGg5BZganKu8DZIHVFg6CnQBScvu1xO4/8R+MOaC0xAHS+C116DHYfvm3
	 TF6jq3AgeEmuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9ED0C605F7;
	Mon, 16 Mar 2026 10:54:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BE3761B4
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:54:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A495C82B3E
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:54:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tkbnjRXIN6bw for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 10:54:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 269AA80C32
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 269AA80C32
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 269AA80C32
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 10:54:25 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id 25aZwaJT4clBZ25aawG4h3; Mon, 16 Mar 2026 11:54:24 +0100
Message-ID: <cc8642ba-44aa-4971-b682-52bf3abe5dd8@benettiengineering.com>
Date: Mon, 16 Mar 2026 11:54:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: Petr Vorel <petr.vorel@gmail.com>, Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
References: <20260313211015.4152659-1-giulio.benetti@benettiengineering.com>
 <06e35fabddb8f84102a922b63710ea3d@free.fr> <20260315230743.GB267706@pevik>
 <74d33c7d-ec03-45ef-82ae-f75fb8bc35c7@benettiengineering.com>
Content-Language: en-US
In-Reply-To: <74d33c7d-ec03-45ef-82ae-f75fb8bc35c7@benettiengineering.com>
X-CMAE-Envelope: MS4xfLqutys3GVOzgIE+Dn0f9DsWFNO14KcUkiRsBzqmGzyaicVrh+wk5oP5T1I+81KqJ73pVL8mPMoFwNyVALvbNS/c1r/HB+6zFVIdyQIgYrCVGWgnxOEI
 tW8ATE/maw7J0dXnds8TYyUADZIsqLa/bj3j1XdT9prf2HYvbXXkHpnzlvDB9IQKEfuizH4I6LaT6h4Mg2R2MoYClqbGwEVCVHb2nNBYtjs1DqTllZkDWIJe
 PWazm2tQbAeTd2nzcGCifTlfDlrX1UaePM5rJihBuGE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1773658464; bh=LMK7UO7UAbYzb6K37EuJIbsTDmSDDXH+lxVO6C6rPXE=;
 h=Date:MIME-Version:Subject:From:To:Content-Type;
 b=W7f4HUoXytANs2so+5Cw9IMpf4nJReZ6EOifdL8Waxyy8uCnUfsKbwOgPL5FqTESV
 XZCkdhc3N6/bPU1Ab7XPaLIv7uv7hZizK70Q8aILSk22007rwcMM5m7Ga1GZE1CsW1
 1H0XFxemMdZ4mjJXpkOjZK6ecMsMv5iYp8t/bdJ589tUahfNfm5mYmx+nQ6M6y5q4u
 DYIxDL0T9FVEz1whHwolxJR5QhTGLYZMZvrNDLBPzwbu2pmMoCgizGUKphb431rVcC
 cNaFQFiQG8xmvcdsHMOMm038+9eZLTzhePx5AjQbORZpBX112rLnmh6QQXgZw0AM4D
 zYn72fZnqZEZA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=W7f4HUoX
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: security bump version to
 2.8.7
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

On 3/16/26 11:53, Giulio Benetti wrote:
> Hi Julien and Petr,
> 
> On 3/16/26 00:07, Petr Vorel wrote:
>> Hi Julien,
>>
>>> Hi Giulio,
>>
>>> On 13/03/2026 22:10, Giulio Benetti wrote:
>>>> Release announce:
>>>> https://lore.kernel.org/linux- 
>>>> nfs/4d11b9d7-7b49-4a1e-8c26-29ecb2fefe2f@redhat.com/
>>
>>> The commit title says it is a "security" bump. I can't find any 
>>> reference to
>>> security
>>> fixes in the release note. Could you provide details?
>>
>>> Or is it a copy paste error from the previous bump?
>>> https://gitlab.com/buildroot.org/buildroot/-/ 
>>> commit/7dfd2feb445c2cf83a2b52057fab96e72e42a071
>>
>>> In the later case, no need to send a v2, I'll just remove "security" 
>>> while
>>> applying.
>>
>> I'd also say it's just a copy paste from 2.8.6. 2.8.7 seems to me only 
>> a bugfix
>> release.
> 
> I interpret commit [1] as a security commit, but maybe I'm wrong.
> It's not a CVE or similar but to me it sounds like a security commit,
> this is why subject is " security bump..".

[1]: https://www.kernel.org/pub/linux/utils/nfs-utils/2.8.7/2.8.7-Changelog

> Best regards
> Giulio
> 
>> Kind regards,
>> Petr
>>
>>>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>>
>>> Best regards,
>>
>>> Julien.
> 

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
