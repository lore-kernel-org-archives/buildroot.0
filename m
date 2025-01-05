Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C96E77197
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 11:30:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 881E1606AA;
	Sun,  5 Jan 2025 11:30:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1ZCtH8UEuHT; Sun,  5 Jan 2025 11:30:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92E68606A9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92E68606A9;
	Sun,  5 Jan 2025 11:30:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AFA6E6B
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:30:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D509402D9
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:30:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DXxaCGXc2jOH for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 11:30:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0ABDF4028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0ABDF4028C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0ABDF4028C
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 11:30:00 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.24] ([84.249.220.44]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MpUUw-1tpPEA03FE-00qfts; Sun, 05
 Jan 2025 12:29:58 +0100
Message-ID: <d2e86197-9f6c-44c5-81f1-457d081144d1@gmx.de>
Date: Sun, 5 Jan 2025 13:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Nikita Kiryushin <kiryushin@ancud.ru>
Cc: buildroot@buildroot.org
References: <20241121140134.3476-1-kiryushin@ancud.ru>
 <20250103234012.2bc31c96@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20250103234012.2bc31c96@windsurf>
X-Provags-ID: V03:K1:eFAT3+VC//LFnrNFhg75N0e8ZUddWmhgWulmtV48r/E6Zlzoz5t
 fGgP2TgZmjfIyoqVVNWQipLRSP5OtnYuVezDu9t63vRtnXzDnmdpfZonnT8vQ9O6mnbIojo
 gTyie4AbF2p4jMSSVMIGGCx0oA3c+2SF9CdGBvj/wxFNgH75M+i/U9s0njZWOZZuaDnxrjm
 dtLEc/MObRTVQQdJS3hAA==
UI-OutboundReport: notjunk:1;M01:P0:phazFSC00EY=;rrkmEiROE39jhkrZSLO1yHe1Dzl
 GeCu5YsxLKJdt3XwJihnrpcShIeEb61sqDpIWMURab2QT0zPQNB2JvcKgKkeDvvsOLN/Oz0no
 4l5HdNTJQpFhdZwvRzWLY+arwFRtVJHgk93liPbHx6X+6KUZA0s9a8hFiXn4sSfSEeoNmsquU
 hhzWEiwgjo0FDQLajlSVA+u175UHyQeV9jv3A93PtaH9oAyLlsG1guij9mBhY3tEab4knpJbx
 zeAipk6usdnALiDW7FskdO60VAMl8BDkwHHZv9073ZRr0ra2l9lzM5ssl336dzuanIpi9Ulxb
 z3uF3Auvhqo/T/mWAuOybseMmu6EXLhYGUPIJ+x76RWnGGrO28uqV0ZSm4S4VJUxo6n1EqdZS
 Q1v4t3loIFvsYEPhFL5VdSmh9dBLwzm60UFk5lFdTIp89lOoo2bU4kc6rvf7mBi5NJyNr59CI
 Pu3UmkKmcZEfckzO6n1tRUcUB7LIC3vI0H3BCDe1OM+ZxlEL00rBLzHBSoN6HzBudoIeUeAVn
 K25pwImDXFaGe6RAmATdqVCaFTsaES098yhhLEbE23Ye3DpHP4bRT/YFGgBG0IF7GuJFhW6nj
 rbahZs78GWIlK/iaXaSNvQXex2DYTX3Olk0ouorRF+U/HGKin5qiW26qGqi+uPMsy8JJaq6Vu
 60bilU3UzS+uvLu/yMEC/SGaSG7yrmwVYcCv/rlhW9kEBwg73Y3pXiHIhLLusBbqYAstFIGsL
 P8mzUdOQVzgqFFAFLFw5btzENJBNp/yCnRPjYImMVYkM9sZeHyrQYuiUsfa0jqqwK4dSUIyPX
 k6/97aneytElADIjC7AbMM5QLUQvSajOEfK4XXqbtiNjysDZkqaEG7yKLobnDHj3L6mCC5J8x
 3kWtjDFOVTO5TvYymAQrfyXPLJ0unePRrsQ2kF+znWo31FJpBtnySNW4nnff6As/lA1cFzJv9
 w2tHBt38h/tKutFRcJ81hf6I+oarXAzk1tMaaQ8Abca8c355+R6VQMoBx8kP/NgY+sv2QU2hc
 6Uv6MVO7g61h7oKYHhLjjTLMqVFe1gMavWwZCnHnIiVM7sKal/Z8P1Uegyi3ltfqJtusi3TEC
 9UXQG4uf33BtG7ijr6EEYpgY9ZrGcS
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1736076598; x=1736681398; i=fiona.klute@gmx.de;
 bh=jUTKzpx+IK9E+GvVd1eQKSbY2XzqLD+Cs/jqXz53Wb8=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=FE7fER4A/3A8U6QAotXkA8fd/aNk+6zW7Ko96rGQ7G+xsSP0QLXBlkQ2UcUy5nlL
 UwqBM8UGZRRqK2qUYsx5b9zDU1tG99Nz49aFw3yqX5MQddCWLGwTyvQmk8xmcF0Bj
 uH9+dhZMieH/eWy6i+r4ZI5aba0skIrvDFVEUODdmYyakAVEM200S6YEo5Mb1JuE+
 J6XB3DGCE6216kDPm5wbaCvTTAQFPBTe5Li9tixs4qwG9+ttYYz9nc8jeJKjKHaOg
 opqg/zsdRDcQ64Ms/dFWLfgvsKUq16lRd1UkZQINnFGujSLgUfokn4NNZ8qIOgXN2
 y6d0wcQWRj8VAOd17A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=FE7fER4A
Subject: Re: [Buildroot] [PATCH 1/1] package/dbus: set session-socket-dir to
 /tmp
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 04.01.25 um 00:40 schrieb Thomas Petazzoni:
> Hello Nikita,
>
> +Fiona in Cc.
>
> On Thu, 21 Nov 2024 17:01:34 +0300
> Nikita Kiryushin <kiryushin@ancud.ru> wrote:
>
>> dbus has a session socket directory configuration setting,
>> that, if not set, will be autodeducted based on env vars
>> during configuration time.
>>
>> Becuse of that, builder's environment variables may be used,
>> which will lead to an image with a broken session bus while
>> leaking builder's details to the image.
>>
>> Add an explicit setting of session-socket-dir to /tmp dir.
>>
>> Signed-off-by: Nikita Kiryushin <kiryushin@ancud.ru>
>
> This looks reasonable to me. It also fixes
> https://gitlab.com/buildroot.org/buildroot/-/issues/67 where a
> few more details are given.
>
> Fiona, could you review this patch, and give your opinion? It would be
> much appreciated!

Looks reasonable to me, all it does is set the default (see
DEFAULT_SOCKET_DIR in dbus' configure.ac) explicitly so it won't be
overwritten by environment variables of the build system. Allowing
override from environment in the first place seems like an odd choice to
me, but that's an upstream decision, maybe it's convenient during
development.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
