Return-Path: <SRS0=/RLo=NT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253DCC432BE
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:28:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 953B460EE7
	for <buildroot@archiver.kernel.org>; Sat, 28 Aug 2021 11:28:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 953B460EE7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48D36400CB;
	Sat, 28 Aug 2021 11:28:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a58dtXqJXM9M; Sat, 28 Aug 2021 11:27:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1522B40122;
	Sat, 28 Aug 2021 11:27:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 67A751BF417
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D2560720
 for <buildroot@lists.busybox.net>; Sat, 28 Aug 2021 11:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AwSethYEaqFv for <buildroot@lists.busybox.net>;
 Sat, 28 Aug 2021 11:27:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D3766071F
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 11:27:51 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id q11so14505442wrr.9
 for <buildroot@buildroot.org>; Sat, 28 Aug 2021 04:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSiMGiFhWPtghq7Whc9OetrsKp8o0FphCl7V6Yyk6kc=;
 b=TvZAq+2fAnpQnrjpHcyhG1nzmV5JbfnUQLAJP/DDVtH29295X40J7HG3lcZ6q8Ik5r
 dRPWnoxDhLJAICKk5Y8EVUxIyvwhjoEsA73Fh5QJ0ZN7FUQRm2l4eBS4r5c79VR1m4wI
 HmLqKueXEbPX9uqGjwgesdKYemarawY/1A7Lh54LUsAI2edft1gD8fOIevx4r1a5nkNF
 Na4jp6rt/AIluQVWBtxlxIJ2HrV7BIhV3hF+FmV3wV1osq0AuQrXCL6P5nozeUUKzP8v
 tLeztbyFKIgFAua+CznFnD29vtvGWANiam9LlG2yJqa9RLwS66ryZjWaYaNURLUvOVpj
 f1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=dSiMGiFhWPtghq7Whc9OetrsKp8o0FphCl7V6Yyk6kc=;
 b=qYy90h5LiCbp1yjfKkVayjyj/wV7jrdQvCuVoe8dXNLSCmpJsAjWA4gFRbRarNI39H
 SSMJcO0XHJcJ6Ounivf9v7yFBr+ulzaLUzzrr1FtHm+rF+Y2PPSNBY4kuKAw/FUIHYZA
 szSrzLmTgr/LbHIc9WsKcLZOtNok99FJUoLg1NTTys4eD6AFFw0cLrEz487k9cv0QAIV
 w2keC62ZSMbEzIpkjBQLzK0B6Ro/+KWecK+Swh7H1E2n0yUm2wk5PHUi5jaRdtA+HpgW
 7Hx5oUqjqpqpoImtmouEUGRfT9OvQMkw7vpjD3uE6ho2q5kiCSGWaoxsxq4+gkaI11rc
 OEsg==
X-Gm-Message-State: AOAM531isDCwAuBuXGSqiIYAE2GuY3u4jbim58gGRl+hr+Mtunbytv7t
 rscLa4DmdqxEjewt7+PV17HxemfY3bfpgQ==
X-Google-Smtp-Source: ABdhPJxdmymDhC2RHmLmBLwCxrnOYDEmcMaLesJkDiYjEly0cvBj3U0IpD48mYoqPvjueasHjdjUWw==
X-Received: by 2002:a5d:4c4c:: with SMTP id n12mr15769669wrt.19.1630150069500; 
 Sat, 28 Aug 2021 04:27:49 -0700 (PDT)
Received: from [10.73.0.168] ([213.219.130.152])
 by smtp.gmail.com with ESMTPSA id r16sm4877341wrg.71.2021.08.28.04.27.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 28 Aug 2021 04:27:48 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20210827091743.2516027-1-romain.naour@gmail.com>
 <20210827204819.GE2661@scaer>
 <75eb3db4-01a4-a335-f997-6ef81456682d@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <1433accf-3050-0f2e-9701-3da87c8c7c12@mind.be>
Date: Sat, 28 Aug 2021 13:27:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <75eb3db4-01a4-a335-f997-6ef81456682d@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCHv2] package/zfs: Fix
 cross-platform-compilations
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: =?UTF-8?Q?Jos=c3=a9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

CgpPbiAyNy8wOC8yMDIxIDIzOjI3LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gWWFubiwK
PiAKPiBMZSAyNy8wOC8yMDIxIMOgIDIyOjQ4LCBZYW5uIEUuIE1PUklOIGEgw6ljcml0wqA6Cj4+
IFJvbWFpbiwgSm9zw6ksIEFsbCwKPj4KPj4gT24gMjAyMS0wOC0yNyAxMToxNyArMDIwMCwgUm9t
YWluIE5hb3VyIHNwYWtlIHRodXNseToKPj4+IEZyb206IEpvc8OpIEx1aXMgU2FsdmFkb3IgUnVm
byA8c2FsdmFkb3Iuam9zZWx1aXNAZ21haWwuY29tPgo+Pj4KPj4+IFRoaXMgcGF0Y2ggZml4ZXMg
dGhlIGBtYWtlYCBleGVjdXRlZCBmcm9tIHRoZSBga2VybmVsLm00YCBpbgo+Pj4gY3Jvc3MtcGxh
dGZvcm0tY29tcGlsYXRpb25zIGVudmlyb25tZW50czoKPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9v
cGVuemZzL3pmcy9ibG9iL3pmcy0yLjAuNS9jb25maWcva2VybmVsLm00I0w1ODgKPj4+Cj4+PiBG
aXhlczoKPj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9rdWJ1OTMvYnVpbGRyb290Ly0vam9icy8xNTIy
ODQ4NDgzCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxz
YWx2YWRvci5qb3NlbHVpc0BnbWFpbC5jb20+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFv
dXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+PiAtLS0KPj4+IHYyOiBhZGQgYSBwYXRjaCB0
byByZW1vdmUgREVTVERJUiB1c2VkIHdpdGggSU5TVEFMTF9NT0RfUEFUSAo+Pj4gICAgIFVzZSBM
SU5VWF9NQUtFX0ZMQUdTIGZvciBaRlNfTUFLRV9FTlYgYW5kIFpGU19DT05GX0VOVgo+Pj4gICAg
IGh0dHA6Ly9saXN0cy5idXN5Ym94Lm5ldC9waXBlcm1haWwvYnVpbGRyb290LzIwMjEtQXVndXN0
LzYyMTM1MC5odG1sCj4+IEkndmUgb25seSBoYWQgYSBjdXJzb3J5IGxvb2sgYXQgdGhlIHByZXZp
b3VzIGRpc2N1c3Npb24sIHNvcnJ5Li4uCj4+Cj4+IEhvd2V2ZXIsIEkgYmVsaWV2ZSB0aGlzIGlz
IGluY29ycmVjdCB0byBwYXNzICQoTElOVVhfTUFLRV9GTEFHUykgaW4gdGhlCj4+IGVudmlyb25t
ZW50IGZvciBjb25maWd1cmUgYW5kIG1ha2UuCj4+Cj4+IEluZGVlZCwgJChMSU5VWF9NQUtFX0ZM
QUdTKSBzaG91bGQgcmVhbGx5IG9ubHkgYmUgdXNlZCB3aGVuIGFjdHVhbGx5Cj4+IGJ1aWxkaW5n
IGtlcm5lbCBtb2R1bGVzLCBub3QgdXNlcmxhbmQgc3R1ZmYsIGJlY2F1c2UgaXQgY29udGFpbnMK
Pj4gdmFyaWFibGVzIHRoYXQgYXJlIG5vdCB2YWxpZCBvdGhlcndpc2UuCj4+Cj4+IEZvciBleGFt
cGxlLCBpdCBvdmVycmlkZXMgSE9TVENDIHdpdGggYSB2YWx1ZSB0aGF0IGlzIG5vdCBjb3JyZWN0
Cj4+IG91dHNpZGUgb2YgYnVsZGluZyB0aGUga2VybmVsLiBJdCBhbHNvIGNvbmRpdGlvbmFsbHkg
Y29udGFpbnMgdGhlCj4+IHVuc2NvcGVkIHZhcmlhYmxlIExPQURBRERSLCB3aGljaCBuYW1lIGlz
IHRvbyBnZW5lcmljLgo+Pgo+PiBBbHNvLCBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHdlIG5lZWQg
dGhlc2UgYXQgY29uZmlndXJlIHRpbWUsIGJlY2F1c2Ugd2UKPj4gYXJlIHVzaW5nIHRoZSBrZXJu
ZWwtbW9kdWxlIGluZnJhIHRvIGJ1aWxkIHRoZSBrZXJuZWwgbW9kdWxlLi4uIEFuZAo+PiBiYXNp
Y2FsbHksIHRoZSB0d28gYXJlIG1vc3RseSBtdXR1YWxseSBleGNsdXNpdmUuLi4KPiBUaGUgY29u
ZmlndXJlIHNjcmlwdCBpcyB0cnlpbmcgdG8gYnVpbGQgYSBrZXJuZWwgbW9kdWxlIHRvIGNoZWNr
IGlmIGl0cyBhYmxlIHRvCj4gYnVpbGQgemZzIG1vZHVsZXMuIFdpdGhvdXQgTElOVVhfTUFLRV9G
TEFHUywgaXQgdHJ5IHRvIGJ1aWxkIHRoZSBtb2R1bGUgZm9yIHRoZQo+IGhvc3QgbWFjaGluZSB0
aGF0IGZhaWwgdG8gYnVpbGQgd2l0aCBvbGQgY29tcGlsZXIvZGlzdHJpYnV0aW9uLgo+IAo+IEkg
aGF2ZW4ndCBsb29rZWQgZGVlcGx5IHRvIHRoZSBidWlsZHN5c3RlbS4uLgoKIEkgdG9vayBhIHF1
aWNrIGxvb2suIEkgdGhpbmsgeW91IGNhbiBzZXQgS0VSTkVMX01BS0UgaW4gdGhlIGVudmlyb25t
ZW50CihaRlNfQ09ORl9FTlYpIGFuZCB1c2UgdGhlIGxpbnV4IGZsYWdzIHRoZXJlOgoKWkZTX0NP
TkZfRU5WICs9IEtFUk5FTF9NQUtFPSIkKExJTlVYX01BS0VfRkxBR1MpIgoKIFdoZW4gZG9pbmcg
dGhhdCwgdGhlIGxpbnV4IGZsYWdzIHNob3VsZG4ndCBiZSBwYXNzZWQgdG8gbWFrZSBhdCBhbGwg
YW55IG1vcmUKZWl0aGVyLgoKIFVudGVzdGVkLCBvYnZpb3VzbHkgOi0pCgogUmVnYXJkcywKIEFy
bm91dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVzeWJveC5uZXQKaHR0cDovL2xpc3RzLmJ1
c3lib3gubmV0L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
