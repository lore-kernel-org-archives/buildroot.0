Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD756C433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Apr 2022 17:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FA81840E1;
	Fri, 15 Apr 2022 17:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Xn0EvPqkFgFM; Fri, 15 Apr 2022 17:57:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC2C383FBD;
	Fri, 15 Apr 2022 17:57:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D37001BF83C
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 17:57:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC132419CD
 for <buildroot@lists.busybox.net>; Fri, 15 Apr 2022 17:57:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XpLB-VL6f9Iu for <buildroot@lists.busybox.net>;
 Fri, 15 Apr 2022 17:57:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4822D419C9
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 17:57:52 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id s18so16577841ejr.0
 for <buildroot@buildroot.org>; Fri, 15 Apr 2022 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Cpcepi7kiRANBVvGDbYBEo0BW4w/OFnMxpcRHrb1zMo=;
 b=osZFLkyBvC2LwzvrHkc1iRKOh395A6080cIWslgzqEPndxEJawexRYAt5NM96m1s3a
 Uc/6HDh3dgAyz7WVuE7Ji77XK9nUJFdnUtiHTBXdUCVXwZHBMBio+M06No4juAdf9ss3
 /qbf409UlYQuUQtvZZOI1tj2xo036UBYfkmRJo/3Vl6LmfvSqS6T0bXFUjqhWVVvBjrc
 vIeRXcH0NumaYLMs9+uoMjf7xBtjWGi38qj93MtebjNeL7eoyjjV8Dvw5LV+lCmtL+xB
 IYwyE2CIzgXAmJPBiD2CUDKRaXen/fV1OrALrEAmJKEqzQTr2crBb6CU4kbhMiPUiMlO
 IvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Cpcepi7kiRANBVvGDbYBEo0BW4w/OFnMxpcRHrb1zMo=;
 b=PdJKdzSUgGNtmdRYSZVjJuUhbJmqsgaHNh5DBsEq+ZBRFQpf9SDfKXdBiz7RybSHFj
 yB5VQleL/VIZPIY7PzTqICZouf6D29Pet49YviRhXDIa0n2QbXd3I8HUYJr+Fwa0z68u
 ZB/CAnDPGD86GFq/5tUHVnnQKdcdxkxkDKsBdJ89tscMGy5yQNHP2sv8HUOpC789mkWG
 JzDw6HaWzr91/YW54qqHkE9PlNkSiaiu/E8jYS5C6PdqLvd8MeDumJQF6+hMeu3XL4UQ
 cOWv9jtL0yjU3iHJ08Cbk1ypEQITiQHnwZa3CgJfjgPubrpfsXpd3PAmQvN+7EGVKyJA
 yZdQ==
X-Gm-Message-State: AOAM533ylwKoicP+S2flRHSbew7T9+Voks7Hf5WXmVV8beXxHtgPwd+G
 cN3altx7pEJ3SqngaNzEpD3UMhWGmpsytvm9
X-Google-Smtp-Source: ABdhPJz9Yp8MNfuKSgI1BsZyH7anNu/3ZE9krbW+zjuSkxkJrEI9lj+uAdRByvq0ZIAwvviyd9qShQ==
X-Received: by 2002:a17:906:58c7:b0:6da:955b:d300 with SMTP id
 e7-20020a17090658c700b006da955bd300mr181032ejs.481.1650045470344; 
 Fri, 15 Apr 2022 10:57:50 -0700 (PDT)
Received: from smtpclient.apple (213-47-128-150.cable.dynamic.surfer.at.
 [213.47.128.150]) by smtp.gmail.com with ESMTPSA id
 p14-20020a05640210ce00b00413211746d4sm2968877edu.51.2022.04.15.10.57.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 10:57:49 -0700 (PDT)
From: Marko Stanisic <sankerspace@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 15 Apr 2022 19:57:48 +0200
Message-Id: <29DC8FE4-8840-4235-B78A-AEA800924338@gmail.com>
References: <90f6844e-4ba4-1910-ec2d-bc6606793a5e@mind.be>
In-Reply-To: <90f6844e-4ba4-1910-ec2d-bc6606793a5e@mind.be>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailer: iPhone Mail (19D52)
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhhbmsgeW91IEFybm91dCBmb3IgeW91ciBhbnN3ZXIsIAoKWWVzIEkgdXNlIGEgZ2l0IHJlcG9z
aXRvcnkgLCBidXQgSSBoYXZlIHRvIGJ1aWxkIHR3byB1Ym9vdCBmb3IgZGlmZmVyZW50IHNpdHVh
dGlvbnMgICwgCjEpIG9uZSB1Ym9vdCB3aXRoIGRpc2FibGVkIGNvbnNvbGUgCihyZWxlYXNlIGJ1
aWxkICkKMikgYW5kIGFub3RoZXIgdWJvb3QgZGVidWcgYnVpbGQgd2l0aCBlbmFibGVkIGNvbnNv
bGUuCjMpIGRlcGVuZGluZyBvbiB3aGljaCBidWlsZHJvb3QgZGVmY29uZmlnIEkgdXNlIChyZWxl
YXNlIG9yIGJ1aWxkKQoKSSB3YW50ZWQgdG8gb3JjaGVzdHJhdGUgdGhlIGJ1aWxkcyBvdmVyIGRp
ZmZlcmVudCBkZWZjb25maWdzIChidWlsZHJvb3QpIGFuZCBpbiBjb25zZXF1ZW5jZSBkaWZmZXJl
bnQgdWJvb3QgZGVmY29uZmlncyhvbmUgZW5hYmxlcyBjb25zb2xlLCBhbm90aGVyIGhhcyBzaWxl
bnQgY29uc29sZSkgZmVhdHVyZSBlbmFibGVkLiAKQnV0IGl0IGlzIGFsc28gbmVjZXNzYXJ5IHRv
IHBlcmZvcm0gYSBwYXRjaCBvbiBoZWFkZXIgYW5kIGMgZmlsZSBvZiBhIGN1cnJlbnQgdWJvb3Qg
cmVwbyBvbiB0aGUgZmx5IGFzIHByZXBhcmF0aW9uIGZvciBhIGJ1aWxkLiAKKCBlbnZpcm9ubWVu
dCBzZXR0aW5nIGZvciBzaWxlbnQgY29uc29sZSApIAoKVGhlcmUgaXMgYW5vdGhlciBzb2x1dGlv
biBmb3Igc3VyZSAsIGJ1dCBhIHBhdGNoIHNlZW1zIHRvIG1lIG1vcmUgZWxlZ2FudCB0byBzb2x2
ZSB0aGlzIG11bHRpIHNvdXJjZSBwcm9ibGVtIGNhc2VzOgpDYXNlIEEpIGNvbnNvbGUgb24gKHVi
b290IGRlZmNvbmZpZyBBKQpDYXNlIEIpIGNvbnNvbGUgb2ZmICh1Ym9vdCBkZWZjb25maWcgQiB3
aXRoIHNpbGVudCBjb25zb2xlIGZlYXR1cmUpK2NoYW5nZXMgaW4gc291cmNlIGNvZGUgcmVnYXJk
aW5nIHVib290IGVudmlyb25tZW50IAoKTWF5YmUgZGlyZWN0IHVzZSBvZiBwYXRjaGVzIGluc2lk
ZSB1Ym9vdCB3b3VsZCBiZSBtb3JlIGNvcnJlY3QgLCBidXQgaSBzYXcgbm8gbWVjaGFuaXNtcyBm
b3IgdGhhdC4gCihOb3RoaW5nIGluIFJlYWRtZSwgbm8gaGludCB0byB1Ym9vdCBwYXRjaCBkaXJl
Y3RvcmllcyBvciB1c2luZyBwYXRjaGVzIGJlZm9yZSB1Ym9vdCBidWlsZCkKIApJcyBidWlsZHJv
b3QgYWJsZSB0byBoYW5kbGUgc3VjaCBzaXR1YXRpb25zPwoKQmVzdCByZWdhcmRzLApNYXJrby4K
ClNlbnQgZnJvbSBteSBpUGhvbmUKCj4gT24gMTQuMDQuMjAyMiwgYXQgMjE6MDAsIEFybm91dCBW
YW5kZWNhcHBlbGxlIDxhcm5vdXRAbWluZC5iZT4gd3JvdGU6Cj4gCj4g77u/Cj4gCj4+IE9uIDEz
LzA0LzIwMjIgMTI6NTgsIE1hcmtvIFN0YW5pc2ljIHdyb3RlOgo+PiBIZWxsbywKPj4gV2l0aCBi
dWlsZHJvb3QgaSB0cnkgdG8gYnVpbGQgYW4gdWJvb3Qgd2hpY2ggc2hvdWxkIGJlIHBhdGNoZWQg
YmVmb3JlLCBVYm9vdCBpc3QgYnVpbGQgYnkgYnVpbGRyb290LCBidXQgdGhlcmUgaXMgbm8gcmVh
Y3Rpb24gb24gZm9sbG93aW5nIHNldHRpbmcKPj4gQlIyX1RBUkdFVF9VQk9PVF9QQVRDSD0iJChC
UjJfRVhURVJOQUxfR0lOT19QQVRIKS9wYXRjaGVzL3Vib290Igo+PiBJbnNpZGUgPEJSMl9FWFRF
Uk5BTF9HSU5PX1BBVEg+L3BhdGNoZXMvdWJvb3QgdGhlcmUgaXMgYSAucGF0Y2ggZmlsZSBuYW1l
ZCBhY2NvcmRpbmcgdG8gaHR0cHM6Ly9idWlsZHJvb3Qub3JnL2Rvd25sb2Fkcy9tYW51YWwvbWFu
dWFsLmh0bWwjcGF0Y2gtcG9saWN5IHdpdGgKPj4gfDxudW1iZXI+LXVib290LTxkZXNjcmlwdGlv
bj4ucGF0Y2h8Cj4+IHxQYXRjaGVzIGluc2lkZSBkaXJlY3RvcmllcyBjYW4gYmUgZXhlY3V0ZWQg
YWNjb3JkaW5nIGRvY3VtZW50YXRpb24uCj4+IHwKPj4gfFVib290IGlzIHVzZWQgaW5zaWVkIGEg
c3VibW9kdWwgb2YgbXkgcmVwbyBhbmQgYnVpZGxyb290IGhhc3MgYWNjZXMgdG8gaXQgb3ZlciBV
Qk9PVF9PVkVSUklERV9TUkNESVIuCj4+IHwKPj4gfAo+PiB8Cj4+IHxJIGhhdmUgbm8gY2x1ZSB3
aHkgcGF0Y2hpbmcgaXMgbm90IHBlcmZvcm1lZDp8Cj4+IDEuIHxjaGVja2VkIHdpdGggbWFrZSAt
cyBwcmludHZhcnMgVkFSUz0nQlIyX1RBUkdFVF9VQk9PVF9QQVRDSCd8Cj4+IDIuIGNoZWNrZWQg
bWFrZSAtcyBwcmludHZhcnMgVkFSUz0nVUJPT1RfUEFUQ0hFUycgLCBVQk9PVF9QQVRDSEVTIGlz
IHNldCBpbnNpZGUKPj4gICAgYm9vdC5tawo+PiAzLiBtYWtlIC1zIHByaW50dmFycyBWQVJTPSdV
Qk9PVF9QT1NUX1BBVENIX0hPT0tTJwo+PiAgICBVQk9PVF9QT1NUX1BBVENIX0hPT0tTPVVCT09U
X0FQUExZX0xPQ0FMX1BBVENIRVMgVUJPT1RfRklYVVBfTElCRkRUX0lOQ0xVREUKPj4gNC4gQlIy
X0dMT0JBTF9QQVRDSF9ESVI9IiQoQlIyX0VYVEVSTkFMX0dJTk9fUEFUSCkvcGF0Y2hlcyBpcyBh
bHNvIHNldAo+PiA1LiBJdCBzZWVtcyB0aGF0IGV2ZXJ5dGhpbmcgZmluZSwgbWF5YmUgb25lIHRo
aW4gaXMgbm90IHZlcnkgY2xlYXIgdG8gbWUKPj4gSSB1c2UgKlVCT09UX09WRVJSSURFX1NSQ0RJ
UiphbmQgbWF5YmUgdGhhdHMgbWFrZSB0cm91YmxlcyBoZXJlPyBiZWNhdXNlIG9mIHRoZSBjb21t
ZW50Cj4+IHxXaGVuIEJ1aWxkcm9vdCBmaW5kcyB0aGF0IGZvciBhIGdpdmVuIHBhY2thZ2UsIGFu
ICs8cGtnPl9PVkVSUklERV9TUkNESVIrIGhhcyBiZWVuIGRlZmluZWQsIGl0IHdpbGwgbm8gbG9u
Z2VyIGF0dGVtcHQgdG8gZG93bmxvYWQsIGV4dHJhY3QgYW5kIHBhdGNoIHRoZSBwYWNrYWdlLiBJ
bnN0ZWFkLCBpdCB3aWxsIGRpcmVjdGx5IHVzZSB0aGUgc291cmNlIGNvZGUgYXZhaWxhYmxlIGlu
IHRoZSBzcGVjaWZpZWQgZGlyZWN0b3J5IGFuZCArbWFrZSBjbGVhbisgd2lsbCBub3QgdG91Y2gg
dGhpcyBkaXJlY3RvcnkufAo+IAo+IEluZGVlZCwgYXMgdGhpcyB0ZXh0IHNheXM6IGlmIHlvdSB1
c2UgT1ZFUlJJREVfU1JDRElSLCB5b3UgY2FuJ3QgdXNlIHBhdGNoZXMuCj4gCj4gCj4+ICAgICAg
ICAgICAgIDUuMSBJZiBQb2ludCAoNSkgbWFrZXMgdGhlIHByb2JsZW0gaG93IGNhbiBpIHNvbHZl
IGl0IHRvIGFwcGx5IGEgcHJvcGVyIHBhdGNoIG92ZXIgYnVpbGRyb290LCBvciBkbyBpIGhhdmUg
dG8gcHV0IGl0IGluc2lkZSB0aGUgc3VibW9kdWwgZGlyZWN0bHkgYW5kIGhvdz8KPiAKPiBJZiB5
b3UgaGF2ZSBhIGxvY2FsIGRpcmVjdG9yeSB3aXRoIHRoZSBzb3VyY2UsIGl0J3MgYXNzdW1lZCB0
aGF0IHlvdSBhcmUgYWJsZSB0byBtb2RpZnkgdGhhdCBzb3VyY2UgYW5kIGFwcGx5IHRoZSBwYXRj
aGVzIGRpcmVjdGx5Lgo+IAo+IElmIGZvciB3aGF0ZXZlciByZWFzb24gdGhhdCdzIG5vdCBhbiBv
cHRpb24sIHRoZXJlIGFyZSBhIGZldyBvcHRpb25zOgo+IAo+IC0gbWFrZSBhIHRhcmJhbGwgYW5k
IHBvaW50IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1RBUkJBTEwgdG8gaXQ7IG9yCj4gLSBpZiBp
dCdzIGEgZ2l0IHJlcG9zaXRvcnksIHlvdSBjYW4gcG9pbnQgQlIyX1RBUkdFVF9VQk9PVF9DVVNU
T01fR0lUIHRvIGl0Lgo+IAo+IAo+IFJlZ2FyZHMsCj4gQXJub3V0Cj4gCj4gCj4+ICAgICAgICA2
LiBJIGRpZG4ndCB1c2UgdGhlIGRlcHJlY2F0ZWQgc2V0dGluZyBCUjJfVEFSR0VUX1VCT09UX0NV
U1RPTV9QQVRDSF9ESVIKPj4gICAgICAgIDcuIFRyaWVkIHRvIGJ1aWxkIHVib290IHBhY2thZ2UK
Pj4gfG1ha2UgdWJvb3QtZGlyY2xlYW4gbWFrZSB1Ym9vdC1leHRyYWN0IG1ha2UgdWJvb3QtcGF0
Y2ggIyMgbm90aGluZyB3b3JrZWQgbWFrZSB1Ym9vdC1idWlsZCBtYWtlIHVib290LWluc3RhbGwg
fAo+PiBNYXliZSBpIGZvcmdvdCBzb21ldGhpbmc/Cj4+IHRoYW5rIHlvdQo+PiB8fAo+PiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+PiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
