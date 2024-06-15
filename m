Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C57C27C4F
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 06:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C854018B;
	Sat, 15 Jun 2024 06:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRPsyIG9e3OL; Sat, 15 Jun 2024 06:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55D0840174
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55D0840174;
	Sat, 15 Jun 2024 06:54:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0E01BF30D
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 06:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8836E403F8
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 06:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y0Pdmh24Zu-H for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 06:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.116;
 helo=smtpcmd03116.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 691E84027A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 691E84027A
Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 691E84027A
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 06:54:10 +0000 (UTC)
Received: from [192.168.50.221] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id INIbsdsdWL6IKINIbsQ1RV; Sat, 15 Jun 2024 08:54:07 +0200
Message-ID: <00df5e12-8db4-460a-b1fd-7c5c8c4f317e@benettiengineering.com>
Date: Sat, 15 Jun 2024 08:54:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Adrian Perez de Castro <aperez@igalia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20240208095531.99049-1-aperez@igalia.com>
 <20240208112940.6fa6e89b@windsurf> <20240615024513.GB58848@igalia.com>
Content-Language: it
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20240615024513.GB58848@igalia.com>
X-CMAE-Envelope: MS4xfCaxK7rjdxB6z4uU/ze3R6lwleEu5YQBrawuDhU7E+JfR+pKKLjZGVROL2lHscECp0E1QqA1MVLP6w0igMRRDQurwHdM+50KE+9bYwu78xr2F+u70yVi
 RvIXTbA5b/Z+1h1wbbFufeUll2ckzP1NYolaopIP3VdSz5Rabz1QECu79j/340OSa6PkcxD7jEJJS18ERF1JXhszOL8RNs7MWKy6JOSAZvMS0eWNvt86RvjY
 DxF9r0uACxnIYvVn6AYpf4UrVGXZWZr5RwNQJvfG7BB2MHs9sbZe37+GUcNfkCwGGgf1FDSJzfqDUc4Nrfqlxw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1718434447; bh=5JQ9X0ox8BhR00MtywWzbAw0/m6B7Tfpt375GG0Hqg4=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=icKqEoXYkixxji24kSptdA0zbwIHrtx+MrMn24LBuQmWHp3cKQOoAhRbnk9gNBaYU
 NRuZ5O2p+yQuegjDKDnszvdR6MshdlPwop2fiY3+bs7X8TGw46TZlOe1s6Vgrcsbd+
 +PYupScmK3kBJ2CajxVkqTPo0fjhITSNz7loinUC3OX+d8r19StGu/H3nJRUtNpKvR
 Y1hdp6mvQ9OH9r1jhMr64Ka6fbFlUTgp1waZdcFD8NyDOQ1EUmqdtvMQpuDMBoFhZI
 DkpAvl5QonOhOrsPK3rVyrkcLTPemjLFz9YN7W4ZekgAi8mprDUMG+B9kDgGJ5rufW
 m+gDk03Npdixw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=icKqEoXY
Subject: Re: [Buildroot] [PATCH 0/3] Add support for the WPE WebKit RDK
 backend
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello All,

On 15/06/24 01:45, Adrian Perez de Castro wrote:
[ SNIP ]

>> We also have twice the same (?) patch from Giulio:
>>
>> https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-1-giulio.benetti@benettiengineering.com/
>> https://patchwork.ozlabs.org/project/buildroot/patch/20230221161522.3749804-2-giulio.benetti@benettiengineering.com/
>>
>> is it relevant?
> 
> I think these two shouldn't be needed anymore, Giulio sent a PR to
> upstream WebKit which ended up being merged [1] and it was included
> in the 2.44.x releases as well.
> 

I have missed Github notification on merge 1 year ago. Anyway I've
marked both patches as rejected on Patchwork since they are upstreamed.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
