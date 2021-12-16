Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 151B6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ABB904046B;
	Thu, 16 Dec 2021 20:03:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ooVEUGyt7hCn; Thu, 16 Dec 2021 20:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D319640465;
	Thu, 16 Dec 2021 20:03:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0E851BF3DD
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ADE4583EE2
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 20:03:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kNH5T0b6Ksag for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 20:03:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DC34483EDC
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 20:03:30 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id t5so90904126edd.0
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 12:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=7VnEYc+16UAzu7dc7epTBQzATmLsWxqgxDR4L87kSO4=;
 b=E8RNNdk7F8sd14EkJQTEY7QeTmUbFJK1WOK4/lnso5nCIdXcBrjyGoyCWA9I3DuOlk
 jGTrb/VXt1CFKmfV9ZqriQExsw0mafIWRRGfyypkl7/xjIomuPOPC0FZL3a65DN0GITq
 6ObrCU94cvyXGoTg+8Ml2XFgMKU9HDm8xvYtpks6Nz3eBy8hUqR1V8DxY4NjHhFQ8oGm
 4Z3u/5XHhBOuGbVCLDAsQvVbamHgUF6X0usEQMaQNY2A6JR0/2u508iVzneHDycJ+KS8
 4Ibhh+zwUHgNHpIZ8+Ih1pOaXFIUaacGKBo9KIcGsZLZooshXaTj9/CoVxEr5RybijwA
 AIZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:cc:in-reply-to
 :content-transfer-encoding;
 bh=7VnEYc+16UAzu7dc7epTBQzATmLsWxqgxDR4L87kSO4=;
 b=qef/7WqxhtFg9jk4MYYTSgSDLgpH0NAerv7kSrVaW708ok5tuXhxTCFt57zzT6TAYA
 +m+g7vVzk9vPh0/1452Gn+1EabIsSyeGJBkXQkxQVVqauP8n8PBX/aoH77iw6UM/ifU0
 /qqCY27AT0QZ0UbzhMA9ZOyiJx/Gp3aimbCeS+IqPB3odnXMxbj7w9Ww0xbeRbyMXyRB
 cJIe/3KESJXt5VCxGJsa1b3uE7uDa7ACuG/HBbhmbNj9V7/3QOv0flRBOAMqkwHTq06q
 F9wW1JUvLyLV29GzvfboFvDk2fH1r78EjikhxyqQnKDLZTUVXQw7n1SlfP2vfTXIoio7
 JYfw==
X-Gm-Message-State: AOAM532ocKCSEiGREFYwaH6/pYMD/j74Cgil547l34l5LEBqvhIu1SHP
 vtk4hUuNM6T724JL+RuH8jSwRGbJeD3s/A==
X-Google-Smtp-Source: ABdhPJyJIRYuhZIYNlk3eL7padsvXecZ5FferSIA1cbfUrTAkj9Gwh6c4Q2BhpwA9bg5TU3ZRSgvvA==
X-Received: by 2002:a17:907:c29:: with SMTP id
 ga41mr17555811ejc.676.1639685009143; 
 Thu, 16 Dec 2021 12:03:29 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id hc33sm2155478ejc.93.2021.12.16.12.03.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 12:03:28 -0800 (PST)
Message-ID: <f1f9e092-9b0d-880b-bdd7-7e6a50f2382d@mind.be>
Date: Thu, 16 Dec 2021 21:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-GB
To: =?UTF-8?Q?Ignacy_Gaw=c4=99dzki?=
 <ignacy.gawedzki@green-communications.fr>, buildroot@buildroot.org
References: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
Subject: Re: [Buildroot] [PATCH] package/fakedate: fix finding the right
 date executable
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8xMi8yMDIxIDE4OjM0LCBJZ25hY3kgR2F3xJlkemtpIHdyb3RlOgo+IElmIHRoZSBQ
QVRIIGluaXRpYWxseSBjb250YWlucyBob3N0L2JpbiwgdGhlbiB0aGUgcmlnaHQgZGF0ZQo+IGV4
ZWN1dGFibGUgaXMgdG8gYmUgZm91bmQgYWZ0ZXIgdGhlICpmaXJzdCogb2NjdXJyZW5jZSBvZiBm
YWtlZGF0ZSBpbgo+IG5vcm1hbCAoZm9yd2FyZCkgUEFUSCBvcmRlci4gIEZpeCB0aGUgd3JhcHBl
ciBzbyB0aGF0IHRoYXQgZmlyc3QKPiBvY2N1cnJlbmNlIGlzIGZvdW5kIGluZGVlZC4KCiAgSnVz
dCB0byBiZSBjbGVhcjogdGhlIHByb2JsZW0gaXMgdGhhdCBpZiB5b3UgZG8KClBBVEg9JFBBVEg6
JFBXRC9vdXRwdXQvaG9zdC9iaW4gbWFrZQoKdGhhdCBpdCBkb2Vzbid0IGZpbmQgdGhlIHJlYWwg
ZGF0ZSBwcm9ncmFtLCByaWdodD8KCj4gCj4gU2lnbmVkLW9mZi1ieTogSWduYWN5IEdhd8SZZHpr
aSA8aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgo+IC0tLQo+ICAgcGFj
a2FnZS9mYWtlZGF0ZS9mYWtlZGF0ZSB8IDkgKysrKysrKy0tCj4gICAxIGZpbGUgY2hhbmdlZCwg
NyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L2Zha2VkYXRlL2Zha2VkYXRlIGIvcGFja2FnZS9mYWtlZGF0ZS9mYWtlZGF0ZQo+IGluZGV4IDli
ZWYxMTMzNTcuLjAzYTRmMDQwNzkgMTAwNzU1Cj4gLS0tIGEvcGFja2FnZS9mYWtlZGF0ZS9mYWtl
ZGF0ZQo+ICsrKyBiL3BhY2thZ2UvZmFrZWRhdGUvZmFrZWRhdGUKPiBAQCAtMjEsMTMgKzIxLDE4
IEBACj4gICBEQVRFX0JJTj1mYWxzZQo+ICAgIyBEbyBub3QgY2FsbCBhbnkgJ2RhdGUnIGJlZm9y
ZSB1cyBpbiB0aGUgUEFUSCwgb3IgdGhhdCB3b3VsZCBjcmVhdGUKPiAgICMgYW4gaW5maW5pdGUg
cmVjdXJzaW9uLgo+ICtsYXN0X2RhdGU9ZmFsc2UKPiAgIGZvciBkYXRlIGluICQod2hpY2ggLWEg
ZGF0ZSB8dGFjKTsgZG8KPiAgICAgICBpZiBbICIke2RhdGV9IiAtZWYgIiQwIiBdOyB0aGVuCj4g
LSAgICAgICAgYnJlYWsKPiArCURBVEVfQklOPSRsYXN0X2RhdGUKPiAgICAgICBmaQo+IC0gICAg
REFURV9CSU49IiR7ZGF0ZX0iCj4gKyAgICBsYXN0X2RhdGU9IiR7ZGF0ZX0iCj4gICBkb25lCgog
IEFsdGhvdWdoIHRoaXMgd29ya3MsIHdvdWxkbid0IGl0IGJlIHNpbXBsZXIgdG8gdGhyb3cgYXdh
eSB0aGUgdGFjIGludm9jYXRpb24gCmFuZCBpbnN0ZWFkIGp1c3QgdGFrZSB0aGUgZmlyc3Qgb25l
IGFmdGVyIG91cnNlbHZlcz8gSS5lLiwgc29tZXRoaW5nIGxpa2U6Cgpmb3VuZD1mYWxzZQpmb3Ig
ZGF0ZSBpbiAkKHdoaWNoIC1hIGRhdGUpOyBkbwogICAgIGlmIFsgIiR7ZGF0ZX0iIC1lZiAiJEAi
IF07IHRoZW4KICAgICAgICAgZm91bmQ9dHJ1ZQogICAgIGVsaWYgWyAiJGZvdW5kIiA9IHRydWUg
XTsgdGhlbgogICAgICAgICBEQVRFX0JJTj0iJHtkYXRlfSIKICAgICBmaQpkb25lCgooYXMgdXN1
YWwsIHVudGVzdGVkKS4KCiAgWWFubj8gUmVtZW1iZXIgd2hhdCB3YXMgdGhlIHJlYXNvbiBmb3Ig
dGhlIHRhYz8KCiAgUmVnYXJkcywKICBBcm5vdXQKCgo+ICAgCj4gK2lmIFsgIiREQVRFX0JJTiIg
PSBmYWxzZSBdOyB0aGVuCj4gKyAgICBEQVRFX0JJTj0kbGFzdF9kYXRlCj4gK2ZpCgo+ICsKPiAg
IGlmIFsgLW4gIiRTT1VSQ0VfREFURV9FUE9DSCIgXTsgdGhlbgo+ICAgICAgIEZPUkNFX0VQT0NI
PTEKPiAgICAgICBmb3IgaSBpbiAiJEAiOyBkbwo+IApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo=
