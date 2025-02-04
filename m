Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6106FC02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 18:36:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CCD5804E7;
	Tue,  4 Feb 2025 18:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDgOCVkeFfS8; Tue,  4 Feb 2025 18:36:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35FEA80B66
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35FEA80B66;
	Tue,  4 Feb 2025 18:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D43C8185
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C25AE40DBF
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zV6i4qKUpN3m for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 18:36:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 156AD40D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 156AD40D9F
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 156AD40D9F
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 18:36:15 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.123]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hvb-1tFuLk067T-010NkM; Tue, 04
 Feb 2025 19:36:11 +0100
Message-ID: <d8942b7b-a7f2-49ef-b9c2-f0c3d46c6b17@gmx.de>
Date: Tue, 4 Feb 2025 19:36:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com
References: <20250204143227.1233163-1-fiona.klute@gmx.de>
 <Z6IodGr39h7X02e1@yd-6wlzhs3>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <Z6IodGr39h7X02e1@yd-6wlzhs3>
X-Provags-ID: V03:K1:fTxdIWsu+Nlwgm0c3g/K+nfx6wiSV1ds/W1rQFSLxJI1Elp/wrt
 vauQEryxwknrojk0bG4X25biSYWI9SoIgtsI8TtdKjdrr1RSw9T9qtqbTYPagF1/ysIluGa
 TPuf1x082M0LZirDPS5QqF1emFaz2VEhCMWukjAvnsbk+GE5JqTEaP0eXQ4D+gM8Tj6iU+5
 M394i97K8TvEcYDFZFjhA==
UI-OutboundReport: notjunk:1;M01:P0:uq5SHvzyguA=;+ahmsOSuaAu2YF0nbVmJUdIjyiR
 /QTu1LlTTcs8mHCbMpU5SOx5XKGNdtv4qS4myc7Y4zRji/ZPqkTVLLMu+MMcSxMscqJ1ZGqZM
 J/spCSVK3RfTat+Evn/zL+71En2FwI/vtg5AdUKIHD6nxD/5SQPkH4EYPMWJMFCCz54QGxuz8
 xd7LYLaPN1FEwDiY3m8tIxYABQXxIm/rSAqt7iCux7SpZW+qU6F8NKmIoOpdxvow1ywFaX/Nd
 xC60rEmcbeKsVb4W2CbSNpiM9ia2nCM5q/AkpojQmpHq58EOox300twoYvoeAf3LfprPoj6Il
 OL4/42ldHOKMfFZ086kDcaMvhfq1LJxHQKg+7naT5Jj+DXd2Dt8fuQeh8QU15pL2Dn504pUZs
 vGb2VAkci2s4KT+KyYwAhQSPAKGkZtwHpIhyD9EAQnfjiZIrST1uvfHFqFGjRgbCmAzLnKiCO
 7KcKE6ZvZqXeSg5NHThIyEyZwHK23NNkJAimL3OLWeFruU8fQPBxI29YNCIKty0mnxlVQLmqC
 76REQA3/NpfD7AsethN3stt2yTwgJZSI4m4OYtJMnzwfdV6e44Mv9xQ26EzfygaMqmZibEaxt
 SE62FO850UZ5pSvxH6Mm7+p363AZrylCObHMpWp4SpB0k55xCUKi2zl34s1t2SbTOMgKIvTIH
 eCF7+yaWmwQCKAt7vM5J/Wbjlk13f1997oBs6JiRXsq4vVS5MocH7hPN26+ZMck3uFGR0ygwl
 NaTsr85U4ucOK2n65VCVVLW2+QsH3OmWKxGmEdlvymbjuQ4ooKxt3dfticSkezhlO2Uj42iif
 67FNBQsvS98PmA5rzhFzFsbZmDqETsDkI9FhuIt/ZFiHXgurojuRstUWk2xTvmQrTUMC9sbRc
 M/n4tpdfI2XKB6csViNC4It0rOoCNBEUoioK1a2j7s7HlkhtJAWMUzsxnQwyP1EcFqKvK28Df
 xDKa3jWlNxsWEk00duW9kZcOtu80IPqP8oMAmEoZvENeI6toJ02Z07S4vTb/Ho+x1bUQYSHak
 yw+B7RPikqm0Ik1r3hF8a9wci5RtjRsYO8DrNqn75R/QsuYQ6esUpp1kXPnVpOCzLfZjKB5G2
 ZCqE5zLfJVv3c3AsKgFMdbgYh3LSye27Dq6iqBVYSbpj5QK//15sCYaij5wD8sTke+QAXQ50p
 fkYt3l0H//Z4c2OLQbLMa6COjV638geKlVek7ITimbNldGQYQyjzTAETbN/+aLluIe5scWv2m
 79ZRPzm8R705/vi+H0gcWNIQixZ30QHXpx8X4Uz2CLXj6Hh0v1oGJWMcSIKHFxjuPA8wo1XOM
 Kg09zZGuduSodeR4w6WLhuU1rJ/o0jXwtZ8+b9zWSBygPQbVysrgtSCk0S6phfcequkKC+E7l
 /TK7CVAI9k8f7yeLV1pMUN9Ai0CNOFlieBzUg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738694171; x=1739298971; i=fiona.klute@gmx.de;
 bh=v9coycS5syLez5uR0ADqvHt11G0pqimn09zq9eBxOrA=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=RX/CONT2T5S9HmFv9/dJsrB2leuBcc0uBgei5MCTRB/VXxgfWKQ5ShYNKOcD3eJY
 pjNYmmAKjXbymyJ6d2fDrCXzOkPecRhksX2QEkEZ59nO3fByTfW/M1DMW6Z34rlD6
 O7cL849mzenDMUUL+Kfp2HN4i4cdd1RvvWaTl7ed1fzX8DOdDzpC2F+Uy7zdv4LyE
 SFOMJdaKAp5nH0cMEQOREvoW8j0/ZgGG9mSA+Gdmr477X9God4o1DErNoDO04ZfC+
 qhsKU87/tNwmrxh4ef5dmBhwqsiYwD9IUg+sPetihzELKb7Z2FMb1coSbG9h3PNns
 tsagLpggKzO/VTbxVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RX/CONT2
Subject: Re: [Buildroot] [PATCH 1/1] package/containerd: fix build with
 toolchain without Gold linker
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
Cc: Thomas Perale <thomas.perale@mind.be>,
 Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann!

Am 04.02.25 um 15:47 schrieb yann.morin@orange.com:
> Fiona, All,
>
> On 2025-02-04 15:32 +0100, Fiona Klute spake thusly:
>> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> [--SNIP--]
>> Additionally disable PIE on musl to fix "read-only segment has dynamic
>> relocations" errors during linking [2].
> [--SNIP--]
>> +ifeq ($(BR2_aarch64),y)
>> +# Go forces use of the Gold linker on aarch64 due to a bug in BFD that
>> +# is fixed in Binutils >= 2.41 (so all versions provided by
>> +# Buildroot). Forcing Gold will break with toolchains that don't
>> +# provide it, so override the flag and use BFD.
>> +# See: https://github.com/golang/go/issues/22040
>> +CONTAINERD_EXTLDFLAGS += -fuse-ld=bfd
>> +ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
>> +# Go exe build with PIE doesn't work with musl.
>> +# See: https://github.com/golang/go/issues/17847
>> +CONTAINERD_EXTLDFLAGS += -Wl,--no-pie
>> +endif
>> +endif
>
> Is the PIE issue really only hapenning on Aarch64? The upstream issue
> 17847 does not make it that obvious, but at least mips64 is said to have
> the issue as well, and someone even mentioned amd64 (aka x86_64).
>
> I.e. don't we need the musl workaround out of the aarch64 condition?
I'm not sure. The Go code has a check if PIE works with the given
compiler & linker and disables it otherwise [1], and I didn't run into
this problem when patching the forced --fuse-ld=gold out of Go, so I
*assume* the --fuse-ld=bfd override breaks that check in some way and we
don't need --no-pie it if we don't override the linker.

It definitely would be good to actually test that. I'll see if I can fit
a build in, though I'd appreciate if someone who can actually test the
result gives it a try. Note that the bug will only show with a toolchain
that builds PIE by default.

Best regards,
Fiona

[1]
https://github.com/golang/go/blob/46fd6b4e37f043b57a2d426a633f61ffd4c40931/src/cmd/link/internal/ld/lib.go#L1879-L1894

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
