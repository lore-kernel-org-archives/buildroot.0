Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17C9CC433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 19:00:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A52AD41812;
	Thu, 14 Apr 2022 19:00:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ag5KqYeZBBVm; Thu, 14 Apr 2022 19:00:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5910E417E0;
	Thu, 14 Apr 2022 19:00:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12FE91BF397
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3BDC417E0
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 19:00:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5PPxaT8_APo4 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 19:00:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7CAE841751
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 19:00:43 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id i27so11763664ejd.9
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 12:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=iCLJVezIxhitmr44A0507Oeg8L56kz8dXa4liIJ68Uc=;
 b=dy1gMz9V3f+Y+QqVuMGMtCEuJBcqYb40eZn2TdRo2G63XoL9VlVc0/hTM3Tpkds9VT
 S9E7ExseU4tlWXKJRe5uBiiELMPQtNVmwcK36YZL/Wj++kkHiH5QIF2xkaoHSjsFYf6r
 MyosUaIhYFQ1q5Vx8a3wTECmLY4R2XghJ7F/xrxkdmtZy+yMLEs6BIfrn8LQWn9nDpDS
 rRbQdxvciK9qQQ7LKkPfyQR6T2gPurug5saZGB0+kj3dtmvI+VgP3ccOWvjxq65c60F4
 HNXO8aQk/QUml9+iVDGiinGCOubGcWL2s3tXZTuhs/Rr5qTlUEfvrdzGWQH9iFuNkd4s
 fjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=iCLJVezIxhitmr44A0507Oeg8L56kz8dXa4liIJ68Uc=;
 b=TlJnt775DWnFkKnf5K0qHOskG8g2XjzljO/VOS0HuCh7cV9gwa4nFDVPjYSaPTOhcW
 IMpWAtkje5Wk+HuX2l3DKfair2BVnJsOnCX9xR3vnRIOWJLjIfeFRa9Qy9TG4p8FI/V5
 fwbzJ/u0UUxgzgGpug6vUo/4dRIbyHci1602uqfkmnJoMEYzpia+VuJBmGTkfuYewG/P
 QTZdSC8RmQW5LLXfREkywP9+PUNQ2smC09+forOcJVac0vwT7eIgPwtsBiYRR6z+qzQi
 m7Ed+9y0rPx1SxoW9Z0V7DmNcgMMLEpf+QOj2bK+U43TCK7fzi/8vApUE0shMCkIUKqr
 Hdcg==
X-Gm-Message-State: AOAM533RFfM4mNDXF6qy7CXGawhZuBkSIIsJPZeXbjcuKJwH2CYC0Qan
 89/FQl7dPCsMbs0K0o0k7ddY1Q==
X-Google-Smtp-Source: ABdhPJzGaH3vYR6FsK9ywYVOjxJlb98+GxQuyJVV2DkDdKsLHbxgIdDouexdIZOeY3X5t6y4Wf6ruA==
X-Received: by 2002:a17:906:19c6:b0:6ce:98a4:5ee6 with SMTP id
 h6-20020a17090619c600b006ce98a45ee6mr3500497ejd.567.1649962841644; 
 Thu, 14 Apr 2022 12:00:41 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056402090600b0041d8c2f9e61sm1429129edz.31.2022.04.14.12.00.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Apr 2022 12:00:40 -0700 (PDT)
Message-ID: <90f6844e-4ba4-1910-ec2d-bc6606793a5e@mind.be>
Date: Thu, 14 Apr 2022 21:00:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Marko Stanisic <sankerspace@gmail.com>, buildroot@buildroot.org
References: <8c0d3886-4d40-bbf5-c8da-dcc6e162ac43@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <8c0d3886-4d40-bbf5-c8da-dcc6e162ac43@gmail.com>
Subject: Re: [Buildroot] BR2_TARGET_UBOOT_PATCH setting not working
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

CgpPbiAxMy8wNC8yMDIyIDEyOjU4LCBNYXJrbyBTdGFuaXNpYyB3cm90ZToKPiAKPiBIZWxsbywK
PiAKPiBXaXRoIGJ1aWxkcm9vdCBpIHRyeSB0byBidWlsZCBhbiB1Ym9vdCB3aGljaCBzaG91bGQg
YmUgcGF0Y2hlZCBiZWZvcmUsIFVib290IGlzdCAKPiBidWlsZCBieSBidWlsZHJvb3QsIGJ1dCB0
aGVyZSBpcyBubyByZWFjdGlvbiBvbiBmb2xsb3dpbmcgc2V0dGluZwo+IAo+IEJSMl9UQVJHRVRf
VUJPT1RfUEFUQ0g9IiQoQlIyX0VYVEVSTkFMX0dJTk9fUEFUSCkvcGF0Y2hlcy91Ym9vdCIKPiAK
PiBJbnNpZGUgPEJSMl9FWFRFUk5BTF9HSU5PX1BBVEg+L3BhdGNoZXMvdWJvb3QgdGhlcmUgaXMg
YSAucGF0Y2ggZmlsZSBuYW1lZCAKPiBhY2NvcmRpbmcgdG8gaHR0cHM6Ly9idWlsZHJvb3Qub3Jn
L2Rvd25sb2Fkcy9tYW51YWwvbWFudWFsLmh0bWwjcGF0Y2gtcG9saWN5IHdpdGgKPiAKPiB8PG51
bWJlcj4tdWJvb3QtPGRlc2NyaXB0aW9uPi5wYXRjaHwKPiAKPiB8UGF0Y2hlcyBpbnNpZGUgZGly
ZWN0b3JpZXMgY2FuIGJlIGV4ZWN1dGVkIGFjY29yZGluZyBkb2N1bWVudGF0aW9uLgo+IHwKPiAK
PiB8VWJvb3QgaXMgdXNlZCBpbnNpZWQgYSBzdWJtb2R1bCBvZiBteSByZXBvIGFuZCBidWlkbHJv
b3QgaGFzcyBhY2NlcyB0byBpdCBvdmVyIAo+IFVCT09UX09WRVJSSURFX1NSQ0RJUi4KPiB8Cj4g
Cj4gfAo+IHwKPiAKPiB8SSBoYXZlIG5vIGNsdWUgd2h5IHBhdGNoaW5nIGlzIG5vdCBwZXJmb3Jt
ZWQ6fAo+IAo+ICAxLiB8Y2hlY2tlZCB3aXRoIG1ha2UgLXMgcHJpbnR2YXJzIFZBUlM9J0JSMl9U
QVJHRVRfVUJPT1RfUEFUQ0gnfAo+ICAyLiBjaGVja2VkIG1ha2UgLXMgcHJpbnR2YXJzIFZBUlM9
J1VCT09UX1BBVENIRVMnICwgVUJPT1RfUEFUQ0hFUyBpcyBzZXQgaW5zaWRlCj4gICAgIGJvb3Qu
bWsKPiAgMy4gbWFrZSAtcyBwcmludHZhcnMgVkFSUz0nVUJPT1RfUE9TVF9QQVRDSF9IT09LUycK
PiAgICAgVUJPT1RfUE9TVF9QQVRDSF9IT09LUz1VQk9PVF9BUFBMWV9MT0NBTF9QQVRDSEVTIFVC
T09UX0ZJWFVQX0xJQkZEVF9JTkNMVURFCj4gIDQuIEJSMl9HTE9CQUxfUEFUQ0hfRElSPSIkKEJS
Ml9FWFRFUk5BTF9HSU5PX1BBVEgpL3BhdGNoZXMgaXMgYWxzbyBzZXQKPiAgNS4gSXQgc2VlbXMg
dGhhdCBldmVyeXRoaW5nIGZpbmUsIG1heWJlIG9uZSB0aGluIGlzIG5vdCB2ZXJ5IGNsZWFyIHRv
IG1lCj4gCj4gSSB1c2UgKlVCT09UX09WRVJSSURFX1NSQ0RJUiphbmQgbWF5YmUgdGhhdHMgbWFr
ZSB0cm91YmxlcyBoZXJlPyBiZWNhdXNlIG9mIHRoZSAKPiBjb21tZW50Cj4gCj4gfFdoZW4gQnVp
bGRyb290IGZpbmRzIHRoYXQgZm9yIGEgZ2l2ZW4gcGFja2FnZSwgYW4gKzxwa2c+X09WRVJSSURF
X1NSQ0RJUisgaGFzIAo+IGJlZW4gZGVmaW5lZCwgaXQgd2lsbCBubyBsb25nZXIgYXR0ZW1wdCB0
byBkb3dubG9hZCwgZXh0cmFjdCBhbmQgcGF0Y2ggdGhlIAo+IHBhY2thZ2UuIEluc3RlYWQsIGl0
IHdpbGwgZGlyZWN0bHkgdXNlIHRoZSBzb3VyY2UgY29kZSBhdmFpbGFibGUgaW4gdGhlIAo+IHNw
ZWNpZmllZCBkaXJlY3RvcnkgYW5kICttYWtlIGNsZWFuKyB3aWxsIG5vdCB0b3VjaCB0aGlzIGRp
cmVjdG9yeS58CgogIEluZGVlZCwgYXMgdGhpcyB0ZXh0IHNheXM6IGlmIHlvdSB1c2UgT1ZFUlJJ
REVfU1JDRElSLCB5b3UgY2FuJ3QgdXNlIHBhdGNoZXMuCgoKPiAgwqDCoMKgIMKgwqDCoCDCoMKg
wqAgNS4xIElmIFBvaW50ICg1KSBtYWtlcyB0aGUgcHJvYmxlbSBob3cgY2FuIGkgc29sdmUgaXQg
dG8gYXBwbHkgYSAKPiBwcm9wZXIgcGF0Y2ggb3ZlciBidWlsZHJvb3QsIG9yIGRvIGkgaGF2ZSB0
byBwdXQgaXQgaW5zaWRlIHRoZSBzdWJtb2R1bCBkaXJlY3RseSAKPiBhbmQgaG93PwoKICBJZiB5
b3UgaGF2ZSBhIGxvY2FsIGRpcmVjdG9yeSB3aXRoIHRoZSBzb3VyY2UsIGl0J3MgYXNzdW1lZCB0
aGF0IHlvdSBhcmUgYWJsZSAKdG8gbW9kaWZ5IHRoYXQgc291cmNlIGFuZCBhcHBseSB0aGUgcGF0
Y2hlcyBkaXJlY3RseS4KCiAgSWYgZm9yIHdoYXRldmVyIHJlYXNvbiB0aGF0J3Mgbm90IGFuIG9w
dGlvbiwgdGhlcmUgYXJlIGEgZmV3IG9wdGlvbnM6CgotIG1ha2UgYSB0YXJiYWxsIGFuZCBwb2lu
dCBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9UQVJCQUxMIHRvIGl0OyBvcgotIGlmIGl0J3MgYSBn
aXQgcmVwb3NpdG9yeSwgeW91IGNhbiBwb2ludCBCUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9HSVQg
dG8gaXQuCgoKICBSZWdhcmRzLAogIEFybm91dAoKCj4gCj4gIMKgwqAgwqDCoMKgIDYuIEkgZGlk
bid0IHVzZSB0aGUgZGVwcmVjYXRlZCBzZXR0aW5nIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1BB
VENIX0RJUgo+IAo+ICDCoMKgwqAgwqDCoCA3LiBUcmllZCB0byBidWlsZCB1Ym9vdCBwYWNrYWdl
Cj4gCj4gfG1ha2UgdWJvb3QtZGlyY2xlYW4gbWFrZSB1Ym9vdC1leHRyYWN0IG1ha2UgdWJvb3Qt
cGF0Y2ggIyMgbm90aGluZyB3b3JrZWQgbWFrZSAKPiB1Ym9vdC1idWlsZCBtYWtlIHVib290LWlu
c3RhbGwgfAo+IAo+IE1heWJlIGkgZm9yZ290IHNvbWV0aGluZz8KPiAKPiB0aGFuayB5b3UKPiAK
PiB8fAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
