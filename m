Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD730C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 10:01:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B79840B35;
	Mon, 23 May 2022 10:01:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J1kBsG7sGXV3; Mon, 23 May 2022 10:01:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 076B640B0D;
	Mon, 23 May 2022 10:01:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 783661BF378
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:01:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 673E483FEF
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 10:01:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvuZ6D2ny5rX for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 10:00:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 918C183FEC
 for <buildroot@buildroot.org>; Mon, 23 May 2022 10:00:59 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 h205-20020a1c21d6000000b003972dda143eso5104168wmh.3
 for <buildroot@buildroot.org>; Mon, 23 May 2022 03:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=47itLou7cHzKc0SM9tB7lyLPOef2smkNjgijUgCE0aI=;
 b=CWL0rimHI4fESnrT+HJ7/2oC5vglkEp3YcpX+bILIMN2q8W5Gpmf2b7VyASjCsihiK
 vK4neFE1RSHGb/G6FT2kYADuY48E00ic95/xmuotkAd4lrUU/Py2vnYixZx77GlRZfYe
 cvURYySixTBnXNATFLtOlkHS83Pt/vt0PjCZ8CxwrfOl06Yl7AyVLSg3U4bJUMN5b/ct
 xyAXi/wr/UBSjf5B+GwzsCKsxNmYc0wgfxNKROOkDBAMxO3jnD56GSHvgvC9aUWIfLec
 N5U198mnY1WvhSKiP1p8/gVhGWNgneRCNrSX1iX3iXJLSmG0FVwZy4FfXbJ3YRkXBy6Q
 Iv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=47itLou7cHzKc0SM9tB7lyLPOef2smkNjgijUgCE0aI=;
 b=6zg4CDGRfKgSChB7Vr9qJxc4NkcXKBR58sqJBj7/+IGOyfxrAW2hW/hhdx9qO3PndL
 /+i+t33wwa4DpZAtryw9M47ayVm4eM2YF0ZDA6wlwjw4V01bMUOpSFA1X0vJZckSmkiT
 F4Zmt2yg+nusZFfhhhO3sRwlEjwoEQGkHl0PNamGgIEYiBgchlM/H1V6JqHVnhY78gTi
 QcPIJ4CNmnfTbCGaZTEfFnhfKCzq5212Zeg9u40TDT0Hfbhj6U1rnZqORzC7N/G23UaH
 WnQ8Er/8Y4pgvEv8P5rc36ifUDqC3X/0QsfS/+Hy3gGe6rQrkz8JogRbUznSmUw9sR/Q
 deZA==
X-Gm-Message-State: AOAM533HK2ukSX4X3GAM0b4o5qvixts7TFCH9GQ0jB4s8IuLlBIQYjIp
 f3sOTN4bXU2BUXx0VBOTqVMDIfEoDCy14A==
X-Google-Smtp-Source: ABdhPJzXzWG9b/gxy+hq7n7Zu1CXz/c4DGVrFFdQkl3echkeH0pVMDshE83JsV2gW29wY15X32LhfA==
X-Received: by 2002:a7b:c082:0:b0:394:3a45:bcc5 with SMTP id
 r2-20020a7bc082000000b003943a45bcc5mr19452680wmh.138.1653300057682; 
 Mon, 23 May 2022 03:00:57 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f?
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id
 ay13-20020a05600c1e0d00b003944821105esm8402661wmb.2.2022.05.23.03.00.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 03:00:57 -0700 (PDT)
Message-ID: <324b5350-5b37-2f4f-b206-12fe65bf7e58@smile.fr>
Date: Mon, 23 May 2022 12:00:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Nicolas Tran <nicolas.tran@smile.fr>, buildroot@buildroot.org
References: <20220519082800.926607-1-nicolas.tran@smile.fr>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220519082800.926607-1-nicolas.tran@smile.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/hyperfine: new package
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

SGVsbG8gTmljb2xhcywKCkxlIDE5LzA1LzIwMjIgw6AgMTA6MjgsIE5pY29sYXMgVHJhbiBhIMOp
Y3JpdMKgOgo+IGh5cGVyZmluZSBpcyBhIGJlbmNobWFyayB0b29sIHdyaXR0ZW4gaW4gUnVzdC4g
SXQgZXZhbHVhdGVzCj4gZXhlY3V0aW9uIHRpbWUgb2YgYSBjb21tYW5kIHBhc3NlZCBpbiBhcmd1
bWVudHMgYW5kIG1ha2UKPiBhIHJlbGF0aXZlIGNvbXBhcmlzb24gaWYgbXVsdGlwbGUgYXJndW1l
bnRzIGFyZSB1c2VkIGF0IHRoZQo+IHNhbWUgdGltZS4KPiBJdCBjYW4gYmUgY29udmluaWVudCBm
b3IgcHVycG9zZXMgb2YgUnVzdC13cml0dGVuIHN5c3RlbXMgYXMKCi9jb252aW5pZW50L2NvbnZl
bmllbnQKCj4gaXQgcnVucyBpbiBhIHN0YWJsZSB2ZXJzaW9uIG9mIFJ1c3QuCgpGb3Igbm93LCBC
dWlsZHJvb3Qgb25seSBzdXBwb3J0IHN0YWJsZSB2ZXJzaW9uIG9mIFJ1c3QuCgo+IAo+IFRoZSBw
YWNrYWdlIGhhcyBiZWVuIGNoZWNrZWQgd2l0aCBjb3JyZWN0IGZvcm1hdHRpbmcgYW5kCj4gd2l0
aG91dCB0eXBvczoKPiAuL3V0aWxzL2NoZWNrLXBhY2thZ2UgcGFja2FnZS9oeXBlcmZpbmUvKgo+
IAo+IEEgQ0kgdGVzdCB3YXMgcnVuIG9uIGdpdGxhYi5jb20gdG8gdmVyaWZ5IHRvb2xjaGFpbiBj
b21wYXRpYmlsaXRpZXMuCgpJZiBwb3NzaWJsZSwgcHJvdmlkZSB0aGUgdXJsIG9mIHRoZSBnaXRs
YWItY2kgcGlwZWxpbmUuCgpodHRwczovL2dpdGxhYi5jb20va3VidTkzL2J1aWxkcm9vdC8tL3Bp
cGVsaW5lcy81NDIzNDI0MzUKCj4gCj4gU2lnbmVkLW9mZi1ieTogTmljb2xhcyBUcmFuIDxuaWNv
bGFzLnRyYW5Ac21pbGUuZnI+Cj4gLS0tCj4gdGVzdC1wa2cgY29uZmlnOgo+IEJSMl9QQUNLQUdF
X0hZUEVSRklORT15Cj4gLS0tCj4gIHBhY2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwg
IDEgKwo+ICBwYWNrYWdlL2h5cGVyZmluZS9Db25maWcuaW4gICAgICB8IDExICsrKysrKysrKysr
Cj4gIHBhY2thZ2UvaHlwZXJmaW5lL2h5cGVyZmluZS5oYXNoIHwgIDQgKysrKwo+ICBwYWNrYWdl
L2h5cGVyZmluZS9oeXBlcmZpbmUubWsgICB8IDEyICsrKysrKysrKysrKwo+ICA0IGZpbGVzIGNo
YW5nZWQsIDI4IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaHlw
ZXJmaW5lL0NvbmZpZy5pbgo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9oeXBlcmZpbmUv
aHlwZXJmaW5lLmhhc2gKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvaHlwZXJmaW5lL2h5
cGVyZmluZS5tawo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0NvbmZpZy5pbiBiL3BhY2thZ2Uv
Q29uZmlnLmluCj4gaW5kZXggODg5MjEzNDEzMy4uNDg3NWY5OGE4ZCAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvQ29uZmlnLmluCj4gQEAgLTEwNCw2ICsx
MDQsNyBAQCBtZW51ICJEZWJ1Z2dpbmcsIHByb2ZpbGluZyBhbmQgYmVuY2htYXJrIgo+ICAJc291
cmNlICJwYWNrYWdlL2Z3dHMvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdlL2dkYi9Db25m
aWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2UvZ29vZ2xlLWJyZWFrcGFkL0NvbmZpZy5pbiIKPiAr
CXNvdXJjZSAicGFja2FnZS9oeXBlcmZpbmUvQ29uZmlnLmluIgo+ICAJc291cmNlICJwYWNrYWdl
L2lvem9uZS9Db25maWcuaW4iCj4gIAlzb3VyY2UgInBhY2thZ2Uva2V4ZWMvQ29uZmlnLmluIgo+
ICAJc291cmNlICJwYWNrYWdlL2tleGVjLWxpdGUvQ29uZmlnLmluIgo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL2h5cGVyZmluZS9Db25maWcuaW4gYi9wYWNrYWdlL2h5cGVyZmluZS9Db25maWcuaW4K
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjRhNjdhMDcxYzMKPiAt
LS0gL2Rldi9udWxsCj4gKysrIGIvcGFja2FnZS9oeXBlcmZpbmUvQ29uZmlnLmluCj4gQEAgLTAs
MCArMSwxMSBAQAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfSFlQRVJGSU5FCj4gKwlib29sICJoeXBl
cmZpbmUiCj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0hPU1RfUlVTVENfVEFSR0VUX0FSQ0hf
U1VQUE9SVFMKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IT1NUX1JVU1RDCj4gKwloZWxwCj4gKwkg
IGh5cGVyZmluZSBpcyBhIGJlbmNobWFyayB0b29sIHdyaXR0ZW4gaW4gUnVzdC4gSXQgZXZhbHVh
dGVzIAo+ICsJICBleGVjdXRpb24gdGltZSBvZiBhIGNvbW1hbmQgcGFzc2VkIGluIGFyZ3VtZW50
cyBhbmQgbWFrZSAKPiArCSAgYSByZWxhdGl2ZSBjb21wYXJpc29uIGlmIG11bHRpcGxlIGFyZ3Vt
ZW50cyBhcmUgdXNlZCBhdCB0aGUgCj4gKwkgIHNhbWUgdGltZS4KClRoaXMgZGVzY3JpcHRpb24g
aXMgc2xpZ2h0bHkgYmV0dGVyIHRoYW4gIkNvbW1hbmQtbGluZSBiZW5jaG1hcmtpbmcgdG9vbCIg
dXNlZApvbiBnaXRodWIgb3Igb3RoZXIgcGFja2FnaW5nLgoKPiArCj4gKwkgIGh0dHBzOi8vZ2l0
aHViLmNvbS9zaGFya2RwL2h5cGVyZmluZQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2h5cGVyZmlu
ZS9oeXBlcmZpbmUuaGFzaCBiL3BhY2thZ2UvaHlwZXJmaW5lL2h5cGVyZmluZS5oYXNoCj4gbmV3
IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi41MGNjNzY5NGIzCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvaHlwZXJmaW5lL2h5cGVyZmluZS5oYXNoCj4gQEAgLTAs
MCArMSw0IEBACj4gKyMgTG9jYWxseSBjb21wdXRlZAo+ICtzaGEyNTYgIDI4ZmNkNzJjNTU2YjRj
YTIxNTA1NzcyMTdhNGQ3ZDUxOTA3YjdlMDBmZjg2Yjc2NDk0M2QwNjgyMDJhOTJhY2UgIGh5cGVy
ZmluZS0xLjE0LjAudGFyLmd6Cj4gK3NoYTI1NiAgYzcxZDIzOWRmOTE3MjZmYzUxOWM2ZWI3MmQz
MThlYzY1ODIwNjI3MjMyYjJmNzk2MjE5ZTg3ZGNmMzVkMGFiNCAgTElDRU5TRS1BUEFDSEUKPiAr
c2hhMjU2ICAxZGZlZTE4YzJmZjA3Y2U1NTFkZTRkNmExZDJkYjE1OGMwMzgwNzQ2YjQ4OGE3ZjBk
MDhjOGUwZDM1NjhiN2MzICBMSUNFTlNFLU1JVAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2h5cGVy
ZmluZS9oeXBlcmZpbmUubWsgYi9wYWNrYWdlL2h5cGVyZmluZS9oeXBlcmZpbmUubWsKPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjYyMjQ2ZjAwMmUKPiAtLS0gL2Rl
di9udWxsCj4gKysrIGIvcGFja2FnZS9oeXBlcmZpbmUvaHlwZXJmaW5lLm1rCj4gQEAgLTAsMCAr
MSwxMiBAQAo+ICsjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwo+ICsjCj4gKyMgaHlwZXJmaW5lCj4g
KyMKPiArIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiArCj4gK0hZUEVSRklORV9WRVJTSU9OID0g
MS4xNC4wCj4gK0hZUEVSRklORV9TSVRFID0gJChjYWxsIGdpdGh1YixzaGFya2RwLGh5cGVyZmlu
ZSx2JChIWVBFUkZJTkVfVkVSU0lPTikpCj4gK0hZUEVSRklORV9MSUNFTlNFID0gQXBhY2hlLTIu
MCBvciBNSVQKPiArSFlQRVJGSU5FX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFLUFQQUNIRSBMSUNF
TlNFLU1JVAoKUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZy
PgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+ICsKPiArJChldmFsICQoY2FyZ28tcGFja2FnZSkp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJv
b3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
