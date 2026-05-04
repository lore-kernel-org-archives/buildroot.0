Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A837DFF886F
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 13:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 684AB41A7B;
	Mon,  4 May 2026 13:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uAoQ6s5zQeAi; Mon,  4 May 2026 13:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BE0D41A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777900363;
	bh=to9/b+XlLQUkxdPJmN2UEq5h0NtmkCFs3SVSQcKvRms=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=pWva+HuazWoW0R5XicbENoa73nL9rScpE++RBAjoo2ZzxAxR/+c+UjV3oDhLpNhJy
	 ApKiSDQwzzic+bwJPzPyweNdSowTTmICGvaNKbnnrq+wot1ecDNmV1f47CKJkOVHdn
	 JFJS/N26Yrivp6gv8qXgegtVCsVlM3yDcP/mgJysjLnPutQiG5HtqeMZAFpUHBa0Qg
	 43mTwXS1xsaDGzxSi2V2/LpvREICmkkr0H9NZ5G3yDYoZ7JTtQt9pGR5tyViLQw8mU
	 ZkGhOKlh9uKEn9GWE80Pw2VDhSGCIRa2ErKG29q5bJzbaA7sFIvJwBu5CANSgpx52b
	 DiH9Ws6JnB32A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BE0D41A3F;
	Mon,  4 May 2026 13:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C744B190
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8E5C40D0C
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:12:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Oo_kFo-3zSV for <buildroot@buildroot.org>;
 Mon,  4 May 2026 13:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F1DE840CD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DE840CD5
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F1DE840CD5
 for <buildroot@buildroot.org>; Mon,  4 May 2026 13:12:40 +0000 (UTC)
Received: from [192.168.178.20] (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id 9195C2C833E6;
 Mon, 04 May 2026 15:12:38 +0200 (CEST)
Message-ID: <c22beab4-f849-49dd-9da4-fb1d5f3858a1@bubu1.eu>
Date: Mon, 4 May 2026 15:12:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fiona Klute <fiona.klute@gmx.de>, buildroot@buildroot.org
References: <20260503232504.3712616-1-fiona.klute@gmx.de>
 <f8a85faa-8626-4f5e-9555-00eb794b23df@bubu1.eu>
 <6def6813-6abe-4412-a0b1-d99b75b45db1@gmx.de>
Content-Language: en-US
In-Reply-To: <6def6813-6abe-4412-a0b1-d99b75b45db1@gmx.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1777900358; bh=jo/yS76Fy4a4pqYcfLsFMSHk6SRdGerbTDu5ANU47Vk=;
 h=Date:Subject:To:References:From:In-Reply-To;
 b=NEMRwPMAXp2o6pMvGjkH/ObRbqtWGQ4QVbwaxN/44yXIngaEtSFiA7fHEp9IKVtL9
 QXuMeySR5Wb8+/mh0/0tAB6olpJpgGapwtUgUtRiUQq24R56+A41x54X2QDu5M0aO0
 LYNcqZ91nKGJx0Ay0c2jgFKJ5DVLgo1Shj87Ys0H34Q+QT2hJvf7mXVbtLwd2DeWXa
 h+kGWH4mhVBZ2zMSTH6JT5zzjv8/gF1R9LTopCCxYIVoG2O5x6W0gv9hKrtf+KhDMM
 Z0wxquSl6NMSy/LoYqGFeJLEtqWf5wnuXOoJ17+0mD5b7I4lv5R4a9uyItlW/FSJ+F
 d86Tn+SCqA11w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bubu1.eu header.i=@bubu1.eu header.a=rsa-sha256
 header.s=bubu header.b=NEMRwPMA
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: explicitly configure
 PID file directory
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

On 5/4/26 14:56, Fiona Klute wrote:
> Hi Marcus!
> 
> Am 04.05.26 um 14:34 schrieb Marcus Hoffmann:
>> Hi Fiona,
>>
>> this looks sensible, but ideally I'd like a bit more clarity of what 
>> is going on in the commit message.
>>
>> On 5/4/26 01:25, Fiona Klute via buildroot wrote:
>>> OpenSSH checks during ./configure if the default location /var/run
>>> exists on the build host, and defaults to ${sysconfdir} if not
>>> (/etc/ssh in Buildroot), leading to confusing errors. 
>>
>> The errors are at build time or at runtime?
> 
> At runtime, see below.
> 
>> (I'm generally a fan of including the relevant error message sequence 
>> that's fixed by a commit in the commit message; if anyone else 
>> encounters this later, they can google/grep for the error.)
>>
>>> This can break
>>> e.g. in a sandbox with its own mount namespace where there is no
>>> reason to create a /var.
>>
>> This is would be on the build host in this case, I assume?
> 
> Yes. I was running the build in bwrap, primarily to test if there's no 
> network access needed after "make source".
> 
>>> Explicitly setting --with-pid-dir=/var/run overrides either default,
>>> and only logs a warning if /var/run does not exist.
>>
>> If it does not exist on the build machine or in the target?
> 
> If /var/run does not exist on the build machine, without this patch the 
> target sshd will place its PID file at /etc/ssh/sshd.pid. That then 
> causes errors in the init script, which expects the PID file at /var/ 
> run/sshd.pid if sshd is running.
> 
> Because of that there's no *one* error message to quote, but a "stop" 
> (including as part of "restart") or "reload" will always fail with
> 
> no /usr/sbin/sshd found; none killed
> 
> from start-stop-daemon, even though sshd is running (because the PID 
> file doesn't exist where start-stop-daemon tries to read it).
> 
> On the other hand, a "start" command will try to start sshd even if it 
> is already running, because it cannot detect the running instance. 
> Unfortunately sshd does not fail directly in that situation (so the init 
> script completes), but something like the following appears in the log:
> 
> [May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on 0.0.0.0 
> failed: Address in use.
> [May 04 14:48:05] auth sshd[4592]: error: Bind to port 22 on :: failed: 
> Address in use.
> [May 04 14:48:05] auth sshd[4592]: fatal: Cannot bind any address.
> 
> Not sure if all of that should be in the commit message?

Yes! :)

I think I can piece this together from here when applying now.

> 
> Best regards,
> Fiona
> 

Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
