Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6105C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 09:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB1B9417C2;
	Fri, 12 Jul 2024 09:49:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlA9bmxJ8fE6; Fri, 12 Jul 2024 09:49:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B3DC417ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B3DC417ED;
	Fri, 12 Jul 2024 09:49:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 42D551BF5A9
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ECB381446
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 09:49:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R__8sn-A1Fu4 for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 09:49:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CA56E818B5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA56E818B5
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CA56E818B5
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 09:49:18 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.120.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbivG-1rwiAP29hG-00lZhS; Fri, 12
 Jul 2024 11:49:15 +0200
Message-ID: <5c9a2ece-b4a6-4e44-af3e-e635d3101547@gmx.de>
Date: Fri, 12 Jul 2024 11:49:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@mind.be>
References: <20240705094449.8550-1-fiona.klute@gmx.de>
 <20240705094449.8550-2-fiona.klute@gmx.de> <20240708231151.2606b9ff@windsurf>
 <40102a9d-6674-4a11-bf18-a4ea41164095@gmx.de>
 <20240709113704.65a5c956@windsurf>
 <a11a2bc2-cc24-421d-8333-2f0b622368b4@mind.be>
 <20240709135717.6f0f69d0@windsurf>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240709135717.6f0f69d0@windsurf>
X-Provags-ID: V03:K1:MIljSymkcXy/tUlzJ8XsG8HV0qdDjIr6sU51HjqRdrJX7zJCXsU
 8JGpAw6BEqPCHIT/CQ+qGFZ8J3nUCytIprNBBJbs5V9ifgQ4XUrxv9mi3lzzX+68nXsgaS8
 Tk0oswwiN+bGR+wVZlqBo3apMpvAAyXbKeorQYT2v1DmX927e0wQmAiYARLPJ7jO8oH4yl4
 suDMQYf5KVJnoGTTbWuqA==
UI-OutboundReport: notjunk:1;M01:P0:dURunNTUOpU=;788W4JmM4P4jUdM5YfUjUT7kmQt
 eQhm97zEFB+Uvy+NCgYz7eSh+KNV555mU97IGu+Om4yq+VEIJ/jMafXQh6MxXyEocCLfoFcMD
 K36h0pX4h/EhDef5KeKX0gvRXA2UtPvmtvvEEvGtBhn+PxJ+jiRsqkPX5GUM9a26jeKEEoUVJ
 O7BhYVmBzOyEJrZuxQ8GaWZC8wA0QnC3CuxGpaeISfq+nEho42v/ui93QQxekqdSiiDzlDoug
 l8yPwD63xFN2yqjGHM4T5y5AvV0N/sfOw3oiw6ambRHsqfesyxIWvUzk1ittU7P5D72Ku5uwm
 KhyJMua94MhFZYfwb7GVSW0LO4NJKu8q5ub/DbPeJk25vpfRb4YHx5ZfSD06whwjgU73ur5/D
 CD4Mxk5QyMB0u/FTsMjFQzrQeA2INQIJab5Uirt+vS0ZhWBVlhAA8QJzWHODBAmUI7A5HUDcW
 4vPq9h3+h2iJ2G+v6EIHzsiB0zVqE94+OcI3sNNcKbbQNfQyBIhZ6EPjcKMlDdbf9t5fkC2R1
 M9rwg8PoA+vzUwuyr+pHefpZs6biADJzNCdL7s3DkQm83YEMdxJsAvEA89jSw2CLwVCzjY8tS
 BZmfUN49rST/HOUkZI3E34rElnAnCOoi9gDtQ+ui0ClY1h/Yc4YdUkaq0x13BbnZ/QbEIXf9M
 5kgiRQ9NEFKXcN/lXdJhXZLcM3RmVmBNTRfbpaYxziLc8DtK7pPSrRszxDnWumlD7JoH5ZJyU
 Ut7LP+rNE+YFZEQXkQB2xrjT/psx4PYz/pJH1IEAtza77feAPsq5CatzTyVyUcQ9l/I9O3Zyz
 tTXzg2dAjl+kbycv3LYzlJHg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1720777755; x=1721382555; i=fiona.klute@gmx.de;
 bh=ISY++0R5Ov6C0Zh01CsO+31xcaI99SWbzIT8pGUL4Gk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=KXGYoS0XUvS8QbSgZbNqfGw1KfIoSAg2Ed12ngzE3/tp1+npGVR2cQSY/g5/ntHN
 DhX6aK+3GF7U6wLguiUDs7wY+qgcrbvQ1u/nNWdX87nyVtAFswUUoqNVigHplgFXL
 nt/Ew0Pw8Bp4QTXIE+pGkABMzX+vPhqT4XpUS8i1/QcEHfD06Ztoe0bBim3E60p8t
 2bU/RDvAcQCjml+cwnc/8u/tdc2EFOjBhW2F4Wljvaq8E0brBOdE1cBeYKsndmFGE
 YML2PeOUkgVvjD3Zqqge3g3EJvpeSS+KG1YTdoaYsXjQAduDfjGWxx3lrC3dGZOnT
 pkP2Z/iCfxClI8bCxA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=KXGYoS0X
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: describe relying on
 default options
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute via buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 09.07.24 um 13:57 schrieb Thomas Petazzoni:
> On Tue, 9 Jul 2024 12:13:08 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
>>> I don't have a strong opinion, but I think
>>> section https://buildroot.org/downloads/manual/manual.html#adding-packages-start-script
>>> makes more sense, as it's actually close to where it matters. Arnout?
>>
>>    The init scripts are just an example here, the principle applies more in
>> general. It also applies to e.g. ifupdown scripts, or even systemd unit files
>> (e.g. if a systemd unit file needs some ExecStartPre command). That's why I
>> thought that the start script was not the most appropriate place.
>
> ACK. But then perhaps the discussion can be extended beyond Busybox.
> For example for uClibc-ng, we also assume it is built with our default
> configuration, and don't try to support the myriad of possible
> uClibc-ng configurations.

I've tried to make clearer that it's a general thing, with Busybox being
an example (patch 1 in the "Update init script style" series I just
sent). I hope that works.

Best regards,
Fiona

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
