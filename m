Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5467FC43219
	for <buildroot@archiver.kernel.org>; Mon, 25 Apr 2022 20:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A2B740B10;
	Mon, 25 Apr 2022 20:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jyv3e8gz-g76; Mon, 25 Apr 2022 20:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EC5A40B04;
	Mon, 25 Apr 2022 20:22:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5260C1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 40F8060F35
 for <buildroot@lists.busybox.net>; Mon, 25 Apr 2022 20:22:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AX9Ifrpgk0UO for <buildroot@lists.busybox.net>;
 Mon, 25 Apr 2022 20:22:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E295360EA3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 20:22:21 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id a1so14187152edt.3
 for <buildroot@buildroot.org>; Mon, 25 Apr 2022 13:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=5CM/ZRBxNiPTkWfXbZzhqrKuUGs5qkDtwvQph0Mh7o8=;
 b=LxB0XK7rmAYTfOkYN70U5Exbod9y5fz/mnHrTnsZtZufQPzw1h8kW35AxwbjT7IUto
 +DXkqivOJfFgxzx/gANahIZIo33Pmowio7k6K2tAQOz0MJGC8lQpOHSVY7/LWVg1A/iw
 ogpbURsOtYJBnc0Qj6y16qF9CpJw1SDko+optpyASqeuuEByaSJBkv4eVITl9TuL1NB+
 QItgAxmVsDMahhy6EUT2iSnAc8W8ISGydsAiNMkw8Ye7dZUSZ6rQfublApkNrWTZQr0H
 OAUq3lmuxMRyVfy5rYH8HFCjor4JkkrsM39I/W/vnb2Q/CESZ6i5nMTyUMeiPZBuAOUm
 PFNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=5CM/ZRBxNiPTkWfXbZzhqrKuUGs5qkDtwvQph0Mh7o8=;
 b=Msx4vZ0TALnT5pfxFYG4uyR83ooAk1uvzYs8I059nhyKD6cKGvBi/eXx5NOkXQF7GF
 CHX+o7bZwDGf5pgpCMguU9M+LQC14JNKEs0oGDVhXCGXF3uVZ25jA3IR00cUE1cwxmT1
 /NP9q1IF8GrCyLIp9yuWQucpEC+O5Zm7dEZdAzphoU9AIR3LziJOkO2wxlgw5ZoOoflQ
 dRM4BakLkIyiFL1m6aBYCLd9ZwOk204ePjUhnNvDsQba6HbIo105px25M/pu2F5a43O4
 yc/cPk34S/lm+TxDtAev3CnCqY+nVrwRWPJTYtjm8dhlmMu/yIQrGq8IcjbfsR6MB+9k
 nzUw==
X-Gm-Message-State: AOAM530A5LDebtVxFeLsLQdF4lRnEBqzed+MPgIRfyJ1LfxC/cscL4iZ
 2ar16OxQShbVXl7x7QvSxlB78w==
X-Google-Smtp-Source: ABdhPJzeGIRmEdIvDMoN7FxduEIGh/mAYiSy4VNcUR0clb3kCUTfpXhPUejq3sqm9JVzkhpEe7/LDw==
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id
 en6-20020a056402528600b00425f0fb5d23mr4559030edb.243.1650918140105; 
 Mon, 25 Apr 2022 13:22:20 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 el14-20020a056402360e00b0042121aee887sm4777324edb.77.2022.04.25.13.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 13:22:19 -0700 (PDT)
Message-ID: <41194648-11ba-c12f-ab86-f748025c4b49@mind.be>
Date: Mon, 25 Apr 2022 22:22:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: =?UTF-8?Q?Vincent_Stehl=c3=a9?= <vincent.stehle@laposte.net>,
 buildroot@buildroot.org
References: <20220423164641.28675-1-vincent.stehle@laposte.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220423164641.28675-1-vincent.stehle@laposte.net>
Subject: Re: [Buildroot] [PATCH] configs/arm_foundationv8: bump to Linux
 5.16.20
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAyMy8wNC8yMDIyIDE4OjQ2LCBWaW5jZW50IFN0ZWhsw6kgdmlhIGJ1aWxkcm9vdCB3cm90
ZToKPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9z
dGUubmV0Pgo+IENjOiBNYXNhaGlybyBZYW1hZGEgPHlhbWFkYS5tYXNhaGlyb0Bzb2Npb25leHQu
Y29tPgoKICBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKICBSZWdhcmRzLAogIEFybm91dAoK
PiAtLS0KPiAKPiBIaSwKPiAKPiBJIGhhdmUgdGVzdGVkIGl0IHN1Y2Nlc3NmdWxseSB3aXRoIGJv
dGggRlZQIHY4IEZvdW5kYXRpb24gUGxhdGZvcm1zIDExLjEyIGJ1aWxkCj4gMzggYW5kIDExLjE0
IGJ1aWxkIDIxLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBWaW5jZW50Lgo+IAo+ICAgY29uZmlncy9h
cm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZyB8IDYgKysrLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9jb25maWdz
L2FybV9mb3VuZGF0aW9udjhfZGVmY29uZmlnIGIvY29uZmlncy9hcm1fZm91bmRhdGlvbnY4X2Rl
ZmNvbmZpZwo+IGluZGV4IDM2M2YyODhiODcuLjNjNjNmNWRjNzYgMTAwNjQ0Cj4gLS0tIGEvY29u
Zmlncy9hcm1fZm91bmRhdGlvbnY4X2RlZmNvbmZpZwo+ICsrKyBiL2NvbmZpZ3MvYXJtX2ZvdW5k
YXRpb252OF9kZWZjb25maWcKPiBAQCAtMSwxMCArMSwxMCBAQAo+ICAgQlIyX2FhcmNoNjQ9eQo+
IC0jIExpbnV4IGhlYWRlcnMgc2FtZSBhcyBrZXJuZWwsIGEgNS45IHNlcmllcwo+IC1CUjJfUEFD
S0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfOT15Cj4gKyMgTGludXggaGVhZGVycyBz
YW1lIGFzIGtlcm5lbCwgYSA1LjE2IHNlcmllcwo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hF
QURFUlNfQ1VTVE9NXzVfMTY9eQo+ICAgQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZX1BPUlQ9InR0
eUFNQTAiCj4gICBCUjJfTElOVVhfS0VSTkVMPXkKPiAgIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9N
X1ZFUlNJT049eQo+IC1CUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI1Ljku
MTEiCj4gK0JSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjUuMTYuMjAiCj4g
ICBCUjJfTElOVVhfS0VSTkVMX1VTRV9BUkNIX0RFRkFVTFRfQ09ORklHPXkKPiAgIEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQo+ICAgQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05B
TUU9ImFybS9mb3VuZGF0aW9uLXY4LWdpY3YzLXBzY2kiCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
