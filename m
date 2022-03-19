Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997C1C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 14:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6E5607D0;
	Sat, 19 Mar 2022 14:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qdYAQKTwm38g; Sat, 19 Mar 2022 14:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66AFB6070A;
	Sat, 19 Mar 2022 14:34:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0B3271BF3A4
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 14:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE878819E6
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 14:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8HZQlBrtz342 for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 14:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72BAE81970
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 14:34:00 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u16so14220016wru.4
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 07:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=TxEJZvz+gQoH5ueMpeaQeXQx4xcUhZM4Mu0OPe4xo8o=;
 b=RKT6rD76O8QNs7v02dqFJ5Ozox71pwn79RHnFXydZ6wTHLxafBlA+mC71olbWNIBdi
 IqIP0OFUehA9cqEphGcwPlx/JywzQ2G6r1gBufzIsoWs7woz4r8Uvt2k7KEFuifDAEIv
 H1jc6W8MoZC28EoVuEdsqN5U2O5afDENh64Z7Z7RsCuqerYwMWdGfiw3kyK+X+a7xIp2
 t6Hg+fp8LXOjVxC9RwWfdcMFQCoLRuOepjBS6dbRX1hWLF4Bc0mLgjXXL604JYFId/8E
 wD7sXasvR7vPP254ZTZQKskLFhTpIz1Cm2trkaReTZHNR+lAzp/8d//4zwdE1VxTPKhV
 k0EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TxEJZvz+gQoH5ueMpeaQeXQx4xcUhZM4Mu0OPe4xo8o=;
 b=35F5w6EfsdbGyFJShxquZmVBQNFFECESryR1i0Xbwpt10j58Cv3vopGrL+S5U0bsk6
 SZwBH9QCtk41KSqSvhRU7Q9zs48H5DOM5ySbEn43UH3HhWhFm1XhucXGOLI6ZbarGiqt
 ybItcdqQW2nuim91gq8MHJXgzsIgC9qxtcIE0Ibi0/FtpxL2SvtYOwIsfhcPpYkt6tz/
 nAdCPaMkJlVyR+hLg4INOxnb/MxRq/fDWCAzBWjdej8suxZrM+Zeix6SEQavTkUGaRnU
 ITw8WUlecOOrDesgalOboN54KEfdFVRKE3yP+HsxMSMgx3JNms/7/M/jpu8Kn+mKzrqR
 bN+Q==
X-Gm-Message-State: AOAM531kwszHQwWTBHUNZzpsFaCKGAFbk2PDhWx7xVA/9cNGT+zMVkPl
 Q0J38NNW9LTxOVKT87FxTWM=
X-Google-Smtp-Source: ABdhPJwLU9q3BsS7gxM+l8JldefQJseKnvqGz8JmTu7oGbmrrk0R7uFYIuxIl09uOOv3Ce9E/Qc2TA==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id
 p15-20020adfba8f000000b001e94afb179bmr12154010wrg.57.1647700438579; 
 Sat, 19 Mar 2022 07:33:58 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 v188-20020a1cacc5000000b00384b71a50d5sm9129620wme.24.2022.03.19.07.33.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Mar 2022 07:33:58 -0700 (PDT)
Message-ID: <81bdd0ce-f8e6-4ad0-409f-5ba40a568bbe@gmail.com>
Date: Sat, 19 Mar 2022 15:33:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20220224154513.220976-1-romain.naour@gmail.com>
 <3897f71d-5622-b118-09a7-b23da8eb87c7@mind.be>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <3897f71d-5622-b118-09a7-b23da8eb87c7@mind.be>
Subject: Re: [Buildroot] [PATCHv2 1/2] support/testing: TestRust{Bin} use
 ripgrep package for testing
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgMTUvMDMvMjAyMiDDoCAyMjoxMywgQXJub3V0IFZhbmRlY2FwcGVsbGUgYSDDqWNyaXTCoDoK
PiAKPiBPbiAyNC8wMi8yMDIyIDE2OjQ1LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4+IFRlc3RSdXN0
IGFuZCBUZXN0UnVzdEJpbiBoYXMgYmVlbiBpbnRyb2R1Y2VkIGF0IHRoZSB0aW1lIHdoZW4gdGhl
cmUgd2FzCj4+IG5vIGNhcmdvIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgb3IgYW55IHBhY2thZ2Ug
dXNpbmcgcnVzdCBjb21waWxlcgo+PiAoQnVpbGRyb290IDIwMTguMDIpLgo+Pgo+PiBTaW5jZSB0
aGVuIHRoZSByaXBncmVwIHBhY2thZ2UgaGFzIGJlZW4gaW50cm9kdWNlZCwgaW5pdGlhbGx5IHVz
aW5nCj4+IHRoZSBnZW5lcmljIHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgYW5kIGNvbnZlcnRlZCBs
YXRlciB0byB0aGUgY2FyZ28KPj4gcGFja2FnZSBpbmZyYXN0cnVjdHVyZS4KPj4KPj4gRHVlIGEg
cmVjZW50IGNoYW5nZSBpbiBydXN0L2NhcmdvIHJlbW92aW5nIHRoZSBjYXJnbyBjb25maWcgZmls
ZSBbMV0KPj4gdGhlIHRlc3QgVGVzdFJ1c3QgYW5kIFRlc3RSdXN0QmluIG5vdyBmYWlsIHRvIGNv
bXBpbGUgc2luY2UgdGhleSBidWlsZAo+PiBhbiBoZWxsby13b3JsZCBjcmF0ZSBvdXRzaWRlIG9m
IHRoZSBjYXJnbyBwYWNrYWdlIGluZnJhc3RydWN0dXJlCj4+IHdpdGhvdXQgdGhlIGNvcnJlY3Qg
ZW52aXJvbm1lbnQgZm9yIGNyb3NzLWNvbXBpbGluZy4KPj4KPj4gUmVwbGFjZSB0aGUgJ2hlbGxv
LXdvcmxkJyBjcmF0ZSBieSByaXBncmVwIHBhY2thZ2UgYW5kIGNoZWNrIGlmIGl0Cj4+IGNhbiBy
dW4gcHJvcGVybHkgaW4gUWVtdS4KPj4KPj4gRml4ZXMgdGVzdHMucGFja2FnZS50ZXN0X3J1c3Qu
VGVzdFJ1c3RCaW46Cj4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9v
dC8tL2pvYnMvMjExNjIwMjU0NQo+Pgo+PiBCdXQgZG9lc24ndCBmaXhlcyB0ZXN0cy5wYWNrYWdl
LnRlc3RfcnVzdC5UZXN0UnVzdCBkdWUgYW5vdGhlciBidWc6Cj4+IGh0dHBzOi8vZ2l0bGFiLmNv
bS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2pvYnMvMjExNjIwMjU0NAo+Pgo+PiBbMV0gYjYz
Nzg2MzFjMjYwOTc0MjM4Mjk4NGY2ZjdiOTNjMWQ5ZDJjZGI3OAo+Pgo+PiBTaWduZWQtb2ZmLWJ5
OiBSb21haW4gTmFvdXIgPHJvbWFpbi5uYW91ckBnbWFpbC5jb20+Cj4+IENjOiBFcmljIExlIEJp
aGFuIDxlcmljLmxlLmJpaGFuLmRldkBmcmVlLmZyPgo+IAo+IMKgVGhpcyBpbnRyb2R1Y2VkIGEg
ZmV3IGZsYWtlOCBlcnJvcnMsIHdoaWNoIEkgZml4ZWQgbm93LiBJbiB0aGUgZnV0dXJlOiBydW4K
PiBmbGFrZTghIChJIGFsc28gYWx3YXlzIGZvcmdldCA6LSkpCgpUaGlzIGlzIGNvbXBsZXRlbHkg
dW5leHBlY3RlZCwgc29ycnkgZm9yIHRoYXQuCgpCZXN0IHJlZ2FyZHMsClJvbWFpbgoKCj4gCj4g
Cj4gwqBSZWdhcmRzLAo+IMKgQXJub3V0Cj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
