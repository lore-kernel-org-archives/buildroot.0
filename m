Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A61C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A462B83E79;
	Thu, 16 Dec 2021 18:52:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mmCdJmIbequo; Thu, 16 Dec 2021 18:52:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E555E83E74;
	Thu, 16 Dec 2021 18:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9934E1BF36F
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8846583E74
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 18:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id arLTVpsxSed7 for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 18:52:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A204A83E48
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 18:52:55 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id g14so89375638edb.8
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 10:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qEdS/FTqfmOi73MUTo50v0lt/Gtn/YFIe1KTAIUCs0Y=;
 b=XaJogA569EAaOEIx+8mCwn4PSCtsleqiwoQEz0yK8k9EuMRN/TnzouERPVkZtIbzrn
 Ke9nOTOIMyHl7jjXlsWDdEO1NcTQ8QJjrHCFdApm2ErHH8sj1sFSrj2xPHPN/uz6mtKH
 Pyx15b2DI2G+dXOkzwGPa5s46uWLluYey+/3BI3bZ3hWVkjG2XhyEfwOMjwkBallA0n3
 k4SrAzSOTrIWYDhF1hj+YifyytVgGq5oBPUOYbIO2jyJMFGDEMgUtgVzOpLaZiQJkmeT
 w556Mapykkw5x8lvpi3rViIP5tarrNJiC5NOm1HRlN+898BZupLtTDe2ADZefWJEvgu5
 6U2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=qEdS/FTqfmOi73MUTo50v0lt/Gtn/YFIe1KTAIUCs0Y=;
 b=d/j9SkoaGNLzzwOoBcMS6MVJG4EFAZr8m2hwInmXG+tiLHxp7BcSv3PbI8UtWHCfCU
 +ddwu8wbMbiRFFuLg1DwWUb0oSkyInzS7GupCQwVFy6EN1eJrEbz+KhAubv4oJYrdzsO
 AmPrEBcpRMtHdkq4/31TDPqUzIXLJaa+TG/jJUCKChqPEICo+HG95bTSn9ZLJ57CuJbI
 38YWh6wDYpI63/bhL30ropbvMZka2jBwVkgjmOPSM7dcQ8zZT/V/zF/zj/ivCgd4DDIy
 N1l1SYV2LL/QLxfP4LH7DHk5+/Y9+mDFDEwMi+1aC23sUCGFJOPl+dugPBQL2/jePZsl
 /mQw==
X-Gm-Message-State: AOAM533rOR32Mf9brFqdsMeBUMneYhG1LF0VxNefyVg/jo47vCP6+RVE
 0aa27i2lJd+wBCN8oypLJd0/yg==
X-Google-Smtp-Source: ABdhPJztNbkLQzSjZlulp4FprcikLB+uU5b6v0S+NXcz/nWtNc4xM2EP07LA6veaxVbsj72i+7hDXw==
X-Received: by 2002:a17:907:2ce3:: with SMTP id
 hz3mr20570ejc.737.1639680773919; 
 Thu, 16 Dec 2021 10:52:53 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id c13sm2084960ejj.144.2021.12.16.10.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 10:52:53 -0800 (PST)
Message-ID: <348e15d4-8c24-65df-723d-136e2f762144@mind.be>
Date: Thu, 16 Dec 2021 19:52:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: Andreas Ziegler <br015@umbiko.net>, buildroot@buildroot.org
References: <20211215135421.1168030-1-br015@umbiko.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215135421.1168030-1-br015@umbiko.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: add missing
 static_assert macro
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
Cc: Matt Weber <matthew.weber@collins.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBBbmRyZWFzLAoKT24gMTUvMTIvMjAyMSAxNDo1NCwgQW5kcmVhcyBaaWVnbGVyIHdyb3Rl
Ogo+IEZpeGVzIGJ1aWxkIGZhaWx1cmUgaW4gdG9vbGNoYWlucyB1c2luZyB1Q2xpYmM6Cj4gCj4g
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4uL3NyYy9hbGdvX3h4aGFzaC5jOjQ4Ogo+IC4uL3NyYy9h
bGdvX3h4aGFzaC5oOiBJbiBmdW5jdGlvbiDigJhYWEgzMl9jYW5vbmljYWxGcm9tSGFzaOKAmToK
PiAuLi9zcmMvYWxnb194eGhhc2guaDoxNTY2OjU0OiB3YXJuaW5nOiBpbXBsaWNpdCBkZWNsYXJh
dGlvbiBvZiBmdW5jdGlvbiDigJhzdGF0aWNfYXNzZXJ04oCZIFstV2ltcGxpY2l0LWZ1bmN0aW9u
LWRlY2xhcmF0aW9uXQo+ICAgMTU2NiB8ICMgICAgZGVmaW5lIFhYSF9TVEFUSUNfQVNTRVJUX1dJ
VEhfTUVTU0FHRShjLG0pIGRvIHsgc3RhdGljX2Fzc2VydCgoYyksbSk7IH0gd2hpbGUoMCkKPiAg
ICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+fn5+fn4KPiAuLi9zcmMvYWxnb194eGhhc2guaDoxNTcyOjMyOiBub3RlOiBp
biBleHBhbnNpb24gb2YgbWFjcm8g4oCYWFhIX1NUQVRJQ19BU1NFUlRfV0lUSF9NRVNTQUdF4oCZ
Cj4gICAxNTcyIHwgIyAgZGVmaW5lIFhYSF9TVEFUSUNfQVNTRVJUKGMpIFhYSF9TVEFUSUNfQVNT
RVJUX1dJVEhfTUVTU0FHRSgoYyksI2MpCj4gICAgICAgIHwgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IC4uL3NyYy9hbGdvX3h4
aGFzaC5oOjIyODI6NTogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmFhYSF9TVEFUSUNf
QVNTRVJU4oCZCj4gICAyMjgyIHwgICAgIFhYSF9TVEFUSUNfQVNTRVJUKHNpemVvZihYWEgzMl9j
YW5vbmljYWxfdCkgPT0gc2l6ZW9mKFhYSDMyX2hhc2hfdCkpOwo+ICAgICAgICB8ICAgICBefn5+
fn5+fn5+fn5+fn5+fgo+IAo+IC4uLiBhbmQgbGF0ZXI6Cj4gCj4gLi4vc3JjL2FsZ29feHhoYXNo
Lmg6MjI4MjogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgc3RhdGljX2Fzc2VydCcKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBBbmRyZWFzIFppZWdsZXIgPGJyMDE1QHVtYmlrby5uZXQ+Cj4gLS0tCj4gICAu
Li5sZ29feHhoYXNoLWFkZC1taXNzaW5nLXN0YXRpY19hc3NlcnQtbWFjcm8ucGF0Y2ggfCAxMyAr
KysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+ICAgY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGlnaHR0cGQvMDAwMi1hbGdvX3h4aGFzaC1hZGQtbWlz
c2luZy1zdGF0aWNfYXNzZXJ0LW1hY3JvLnBhdGNoCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bGlnaHR0cGQvMDAwMi1hbGdvX3h4aGFzaC1hZGQtbWlzc2luZy1zdGF0aWNfYXNzZXJ0LW1hY3Jv
LnBhdGNoIGIvcGFja2FnZS9saWdodHRwZC8wMDAyLWFsZ29feHhoYXNoLWFkZC1taXNzaW5nLXN0
YXRpY19hc3NlcnQtbWFjcm8ucGF0Y2gKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAw
MDAwMDAwMDAuLjFmYzhjYTNhZmUKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9saWdo
dHRwZC8wMDAyLWFsZ29feHhoYXNoLWFkZC1taXNzaW5nLXN0YXRpY19hc3NlcnQtbWFjcm8ucGF0
Y2gKPiBAQCAtMCwwICsxLDEzIEBACgogIFRoZSBwYXRjaCBzaG91bGQgaGF2ZSBhIGNvbW1pdCBt
ZXNzYWdlIGluY2x1ZGluZyBhIHNpZ25lZC1vZmYtYnksIGFuZCAKcHJlZmVyYWJseSBiZSBnaXQg
Zm9ybWF0dGVkLiBJdCBzaG91bGQgYWxzbyBoYXZlIGEgcmVmZXJlbmNlIHRvIHRoZSB1cHN0cmVh
bSBidWcgCnJlcG9ydCBvciBNUiBvciBjb21taXQuCgogIEkndmUgYWRkZWQgdGhhdCBhbmQgYXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KCiAgUmVnYXJkcywKICBBcm5vdXQKCj4gKy0tLSBsaWdo
dHRwZC0xLjQuNjMvc3JjL2FsZ29feHhoYXNoLmgJMjAyMS0xMi0wNCAxNTo0MDoyNC4wMDAwMDAw
MDAgKzAxMDAKPiArKysrIGxpZ2h0dHBkLTEuNC42NC9zcmMvYWxnb194eGhhc2guaAkyMDIxLTEy
LTE1IDEwOjUwOjE3LjgwMTE1NTAwNyArMDEwMAo+ICtAQCAtMTU2Myw2ICsxNTYzLDEwIEBACj4g
KyAjaWZuZGVmIFhYSF9TVEFUSUNfQVNTRVJUCj4gKyAjICBpZiBkZWZpbmVkKF9fU1REQ19WRVJT
SU9OX18pICYmIChfX1NURENfVkVSU0lPTl9fID49IDIwMTExMkwpICAgIC8qIEMxMSAqLwo+ICsg
IyAgICBpbmNsdWRlIDxhc3NlcnQuaD4KPiArKy8qIHVDbGliYyBkb2VzIG5vdCBkZWZpbmUgc3Rh
dGljX2Fzc2VydCAqLwo+ICsrIyAgICBpZm5kZWYgc3RhdGljX2Fzc2VydAo+ICsrIyAgICAgIGRl
ZmluZSBzdGF0aWNfYXNzZXJ0IF9TdGF0aWNfYXNzZXJ0Cj4gKysjICAgIGVuZGlmCj4gKyAjICAg
IGRlZmluZSBYWEhfU1RBVElDX0FTU0VSVF9XSVRIX01FU1NBR0UoYyxtKSBkbyB7IHN0YXRpY19h
c3NlcnQoKGMpLG0pOyB9IHdoaWxlKDApCj4gKyAjICBlbGlmIGRlZmluZWQoX19jcGx1c3BsdXMp
ICYmIChfX2NwbHVzcGx1cyA+PSAyMDExMDNMKSAgICAgICAgICAgIC8qIEMrKzExICovCj4gKyAj
ICAgIGRlZmluZSBYWEhfU1RBVElDX0FTU0VSVF9XSVRIX01FU1NBR0UoYyxtKSBkbyB7IHN0YXRp
Y19hc3NlcnQoKGMpLG0pOyB9IHdoaWxlKDApCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
