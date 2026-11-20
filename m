Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A780606A326
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 00:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=p9HhKPab
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B28B6066D;
	Fri, 20 Nov 2026 00:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T1xUleDGnaYX; Fri, 20 Nov 2026 00:22:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6E2BA60E02
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795134154;
	b=CbR/ZV00or8v8cIx4oBVUP/7lFm17rNKryVsjsaYo25mqW6osZmQ6nYmNTATisQU7p3Y
	 Ty9a5vYBYA+4xhrsuY2yX/NlG2I9XU/ksVRPZTdI1PiZMeC+dpely2LE5MlozvX+bJHNX
	 XF8IOf93aLLasKbhMmgcMzVDTc0Ec2YR1Y50NmkNJD5j+tMOhoA1RYSa/0qZ0/3/0uxEc
	 qZ0YNtQZqttfFaDtwLU6zYx4hV/oZGhqhXcVFPtLVJL9+vU3V366cOKF2795I/EfQ6/Wk
	 jOtDwQUb6va8Tf7CtPecDAHruN3NRRCD4t7K5+XZaZ3jENt9h0X63LkKe6khT5GE2wg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795134154;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM2-Signature:Message-Instance:X-UI-Sender-Class:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:UI-OutboundReport:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=pTw3VZz2aJA5V6nVG3GJGnYDuJmGL1zQuVdOIdAnnx4=;
	b=kJbI1dPPb0QErIh7lkGYJYMz56Ufzh+XH5cbsf6KQFvklFlk0XlBgT4ybHwu9LipLfUD
	 sKXmrV0h//9Fgdd0capaWmop7zo7Tm7NCefxHRCpscuxtlX0tMyIGw3dPfTSCpYbXX8KD
	 G/3Inq1+hu6Q+SI9jJSrUWBHjmEWx6C9FnjzY/HCUuwtkfzYigWkSYC1B+BGiXL0pYOlX
	 JgF2xfTZTVWDr8AS1RmE54toNwXOzumRc5n3loumQV55+/XWqHj6zdUJALa0fnaEazfpf
	 NVVkDwSdcWeHZzzFQaWtOa9owwnEXWNLBa1zycicAus7C84X264kujeXlkZLxJbdHRQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795134154;
	bh=pTw3VZz2aJA5V6nVG3GJGnYDuJmGL1zQuVdOIdAnnx4=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=p9HhKPabaNUnjm9F5fHm6Coyg7vP6Gx8+RkG6UeQOqd/9Teaj6t4Da5uIddOXnZHA
	 9Qi297771/jP2qOI17J7TyTgGUrT6fWkiJu5gXEWm6gWBqUp31IPnpVExu184Rm7On
	 tov72/Sd/5rX9rYTsCd5g3qBcdCe0o/na+HluUI1SxbBE4tyJlYIyB+38P5aZK4mSp
	 uQE7nG7JbPvjVX5ejdV9v4aE/Q2RJnUMxBS2TxTEyuQzvWWfZ/qpsyBYMOmDc+OziP
	 s1erGJt9V4Zc1hDkY9ww2YXa6Nt8/AWv/TRjqNLL8Txvg5yrrrA8k3Sv4CQ7oDl3UA
	 O68VKXJsrPdnQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E2BA60E02;
	Fri, 20 Nov 2026 00:22:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 74F121C9
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:22:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C8B040079
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:22:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VswhHrMqEWuL for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 00:22:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BF8B440063
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF8B440063
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 00:22:29 +0000 (UTC)
DKIM2-Signature: i=1; m=1; t=1795134147; mf=PGZpb25hLmtsdXRlQGdteC5kZT4=;
 rt=PGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPg==; d=gmx.de;
 s=s31663417:rsa-sha256:J+xVqrXI0DIT6bcQSxxKFTYzsc8H
 +Nhq6c3XJeorowlABvzDP65lyfJYgS5adySiZLozCgHf9ALMPCfKsHjbJk79zCOaY7lvj2SK5L7
 ki17B4KLvpUfXGpfI+fQT2T1xkHPivhbHw8zbU4q9An2UpBxSQESJvW5sblZ+j2IDMwXajZUCRS
 tCmwigt5mm5TkppOTNrMVQlkU//dm138Y3GKO6BT9jO2ktuOTllimQ6Bn40Sq+WXHno83C23p0G
 rmrIk6zbWOoMegGjvHRwEN8BfFR4vmUFNoU5PiH/rfWEMhodpUkZ3xBm4NXnQO9iM1tXnjalPFU
 LQQkR3hZE1tOmA==;
Message-Instance: m=1; h=sha256: 4i9Bqg0WoruxNoUjjtiA7LSzePYH8WNnOfhnbpUzxqQ=:
 r5nwY+Y28YLkm6bk2/3amFMalnn01L2yNsv02HgBZgw=, sha512:
 WyaM+rzbfQGxVkZxul7PCfGdsCzP+oBSuHMBYUiHtEY3/Crxad50K6zKSNLzoJxhi6aXO7C4uNgWf85CnUWjDQ==:
 /N//ZvRbEAmsv+NBCPGVI1njjNyEt3t0lt/HLI6ZeRJspLer+aEhm9n6qtntBmG+RZsSc3GwYHE68bmU7TeYnA==;
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2wGs-1xQubv1zsC-006PX5; Fri, 20
 Nov 2026 01:22:27 +0100
Message-ID: <f22d6e61-cfd2-4625-a75d-c455d3f93a3f@gmx.de>
Date: Fri, 20 Nov 2026 01:22:26 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Marcus Hoffmann <buildroot@bubu1.eu>, buildroot@buildroot.org
References: <20261114140316.956334-1-fiona.klute@gmx.de>
 <47f92296-e71d-459c-adff-6f1bfe9e863d@bubu1.eu>
 <630c8dd9-a8fe-40dd-b4c6-7cdafb5d5ddb@gmx.de>
 <dd3904e2-b2db-4aa3-afba-9952ded1cde3@bubu1.eu>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <dd3904e2-b2db-4aa3-afba-9952ded1cde3@bubu1.eu>
X-Provags-ID: V03:K1:U30lUm+dzvSrp1o8DnHAYL6+Po8cdtmMF+nHITKOsSN2KuGLoiU
 QaVWYGPbgb6ReKoNN89+5Hle45B0fjySg/Szu8wP1XVKaR7MnBar1rlH2GlNayIrkiSQ+Uz
 OoiBoPDpcrN5t5oYhDSklBNZd5+V8OibXaw3+2ABs44lw85PDkVQJxqKti9jqxlrNKxdwZP
 Z6/b9qPQBIX/WUI3iZC3g==
UI-OutboundReport: notjunk:1;M01:P0:BQos2CSscfw=;pwZtTh8mwKxgYbTnFP3tQ2lmsSx
 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
 3/N5qhvHACylwU8uB56FI3v8IfNA==
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-7.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 19.11.26 um 16:41 schrieb Marcus Hoffmann:
> On 11/19/26 16:23, Fiona Klute wrote:
>> Am 19.11.26 um 15:32 schrieb Marcus Hoffmann:
>>> Hi Fiona,
>>>
>>> On 11/14/26 15:03, Fiona Klute via buildroot wrote:
> [...]
> 
>>
>> We don't test config via /etc/default/$DAEMON for other scripts 
>> either, and I don't think it makes sense to: The only thing we could 
>> really test is if the config snippet is actually sourced. That doesn't 
>> seem worth the CI time. Testing all possible options and other fun 
>> things someone might do in a script snippet (related: I've recently 
>> used it to put services into cgroups) isn't really possible.
> 
> It would test a bit more i.e. that the variable expansion works 
> correctly in whatever shell the test uses.
> But I agree that it is a bit marginal... :)
The syntax is standard POSIX [1, "Use Alternative Value"], if it doesn't 
work that's a bug in the shell. Which admittedly would be relevant, but 
maybe a test for a different package. :D

Best regards,
Fiona

[1] 
https://pubs.opengroup.org/onlinepubs/9799919799/utilities/V3_chap02.html#tag_19_06_02
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
