Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC640C433EF
	for <buildroot@archiver.kernel.org>; Sat, 20 Nov 2021 09:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C9E8261C;
	Sat, 20 Nov 2021 09:25:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KEvrnqIG0SWu; Sat, 20 Nov 2021 09:25:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71BB7825FE;
	Sat, 20 Nov 2021 09:25:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D14331BF271
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 09:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFE06606D4
 for <buildroot@lists.busybox.net>; Sat, 20 Nov 2021 09:25:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MEwrfO0DncHn for <buildroot@lists.busybox.net>;
 Sat, 20 Nov 2021 09:25:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8C7196067A
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 09:25:36 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id f18so55048490lfv.6
 for <buildroot@buildroot.org>; Sat, 20 Nov 2021 01:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=DmdhxLoGgrd1p3iFkitl4/157FvMaoI53PMsnbI5nhI=;
 b=kSV/emCxrFt8QzGCHIP998fqb1nmpj/N1PzeLaxIs3abZ5t7x02fRscBt3XbRvOp3a
 XfNHyAhilGU51JiF2jW+cwbPi7hdYZhJJe+RE0OZsrcb+xht02hCMNLoa9k6oHT8KS7t
 a9Bef2A4CIygEeEKueuh/eo51i1hP8MD0pyPOwZCP8Yqh0Uoa6XcR10XLEflApP/Z2tb
 ck7MOXM2JR1pzxDZ7i1wOOaLRIP/0/L8QR68441Gdc9llQH7KCC0TkYw1o/lomuR0AzH
 HtJnXVWCSp/WAFR9zqCYE1YlAWPJ+FeWawnGcGR8Vm8T5Xq8+1Rl+rg3EmtVckmeIrv1
 m2xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=DmdhxLoGgrd1p3iFkitl4/157FvMaoI53PMsnbI5nhI=;
 b=14nxN+adM/P6ywa0GNFO9Aq7WpnSX8jZNYpHAe+hU4UhI+dRMNiW8u/PTp6VUlO3qy
 /PIAbwYXz3v6LaB4r3EKw4eVvPuX5PE6gU9d3Y1mckJFBv4UVkhdUsCFDBa0zXY1D+n8
 X5yq894c0nIhgLGom02ur8gl4lIEKzq/HkBHiwqM/tO3wDos5UkX+LYIyWu+vYiSPYQr
 RuD+3tyiFnb/Lo7A/Xcw6Oko/AYBYdi+OzlBlhISS1OZM1N0Xce3UfOAdgWzjNHF08OI
 KbKjp8TZxW76OuQFDBQxkJ+eXM8KoEiFkTd7eeBvehhEVB8tj68b6OQg4LBRcli7f28H
 YDow==
X-Gm-Message-State: AOAM531j0PRx82eaKmoNm7Og18mHQ0a1X2Xd0j0tSuAkTqbjQavkeYKb
 KhBZtsonxJFfrbAjTE/GryaspP5TRu4YbwJOW8Q=
X-Google-Smtp-Source: ABdhPJxYoRR8IPKjj+oI43ydRR/YCe7t/TfzZPvxSkvp4xTm88a1Jp8cBhH1/ZdKr/M9JIXQmofGqhPNVf7++W9mrtI=
X-Received: by 2002:a2e:b947:: with SMTP id 7mr33506880ljs.89.1637400334410;
 Sat, 20 Nov 2021 01:25:34 -0800 (PST)
MIME-Version: 1.0
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <20211120003256.61693b53@gmx.net>
In-Reply-To: <20211120003256.61693b53@gmx.net>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 20 Nov 2021 10:23:11 +0100
Message-ID: <CAPi7W81xnSeS3w+mswu1ALNKSQVphfyim5jkFDmJgLJmj=dopA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUGV0ZXIsCgpMZSBzYW0uIDIwIG5vdi4gMjAyMSDDoCAwMDozMywgUGV0ZXIgU2VpZGVy
ZXIgPHBzLnJlcG9ydEBnbXgubmV0PiBhIMOpY3JpdCA6Cj4KPiBIZWxsbyBGYWJyaWNlLAo+Cj4g
T24gVGh1LCAxOCBOb3YgMjAyMSAyMjowNjoyMyArMDEwMCwgRmFicmljZSBGb250YWluZSA8Zm9u
dGFpbmUuZmFicmljZUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiBGb3IgYW4gdW5rbm93biByZWFz
b24sIHRoZSBidWlsZCBmYWlscyBzaW5jZSBidW1wIHRvIHZlcnNpb24gMS40LjYwIGluCj4gPiBj
b21taXQgZDYyYjdmNTRmMDAyOTFhNTAyNzQ0MDlmYjU1MTA1MjdmZDcyNWZmZSBvbjoKPiA+Cj4g
PiBhcnJheS5jOjE0MDoyOiBlcnJvcjogJ2ZvcicgbG9vcCBpbml0aWFsIGRlY2xhcmF0aW9ucyBh
cmUgb25seSBhbGxvd2VkIGluIEM5OSBtb2RlCj4gPiAgIGZvciAodWludDMyX3QgaSA9IDA7IGkg
PCBzejsgKytpKSB7Cj4gPiAgIF4KPiA+Cj4gPiBSdW5uaW5nIGF1dG9yZWNvbmYgZml4ZXMgdGhl
IGJ1aWxkLgo+Cj4gVGhlIGRpZmZlcmVuY2UgaXMgZHVyaW5nIHRoZSBjb25maWd1cmUgc3RlcDoK
Pgo+IC0gY2hlY2tpbmcgZm9yIC4uLi9ob3N0L2Jpbi9hcm0tbm9uZS1saW51eC1nbnVlYWJpLWdj
YyBvcHRpb24gdG8gYWNjZXB0IElTTyBDODkuLi4gbm9uZSBuZWVkZWQKPiArIGNoZWNraW5nIGZv
ciAuLi4vaG9zdC9iaW4vYXJtLW5vbmUtbGludXgtZ251ZWFiaS1nY2Mgb3B0aW9uIHRvIGVuYWJs
ZSBDMTEgZmVhdHVyZXMuLi4gLXN0ZD1nbnUxMQo+Cj4gQW5kIHRoZSB1c2Ugb2YgdGhlICctc3Rk
PWdudTExJyBmbGFnIGZvciB0aGUgY29tcGlsZSBzdGVwcy4uLiwgYW55IG1vcmUKPiBsaWdodHdl
aWdodCBvcHRpb24gdG8gZW5hYmxlIEMxMT8KVGhlbiwgSSBhc3N1bWUgdGhhdCB1cHN0cmVhbSBm
b3Jnb3QgdG8gcmVnZW5lcmF0ZSB0aGUgY29uZmlndXJlIHNjcmlwdCBhZnRlcgpodHRwczovL2dp
dGh1Yi5jb20vbGlnaHR0cGQvbGlnaHR0cGQxLjQvY29tbWl0LzczODY1MDI1NzI5ODk3ZDExNDk0
ZGU1NmEyOWM3N2M0ZmM4ZTU3MDIKSSBvcGVuZWQgYW4gaXNzdWUgaGVyZTogaHR0cHM6Ly9yZWRt
aW5lLmxpZ2h0dHBkLm5ldC9pc3N1ZXMvMzExNgoKPgo+IFJlZ2FyZHMsCj4gUGV0ZXIKPgo+ID4K
PiA+IEZpeGVzOgo+ID4gIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMv
MDM0OWQ4ZmVkMzViMDc2Njc5NmRkOWJhM2I4ZGU2ZmY4YmQ2OGZlNwo+ID4KPiA+IFNpZ25lZC1v
ZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgo+ID4g
LS0tCj4gPiAgcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tayB8IDIgKysKPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGln
aHR0cGQvbGlnaHR0cGQubWsgYi9wYWNrYWdlL2xpZ2h0dHBkL2xpZ2h0dHBkLm1rCj4gPiBpbmRl
eCA5YzE4YTYwMzhlLi5jMzlhNWRiMjBmIDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS9saWdodHRw
ZC9saWdodHRwZC5tawo+ID4gKysrIGIvcGFja2FnZS9saWdodHRwZC9saWdodHRwZC5tawo+ID4g
QEAgLTEyLDYgKzEyLDggQEAgTElHSFRUUERfTElDRU5TRSA9IEJTRC0zLUNsYXVzZQo+ID4gIExJ
R0hUVFBEX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HCj4gPiAgTElHSFRUUERfQ1BFX0lEX1ZFTkRP
UiA9IGxpZ2h0dHBkCj4gPiAgTElHSFRUUERfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCj4g
PiArIyBJc3N1ZSBpbiBjb25maWd1cmUgc2NyaXB0IHByb3ZpZGVkIGluIHRhcmJhbGwKPiA+ICtM
SUdIVFRQRF9BVVRPUkVDT05GID0gWUVTCj4gPiAgTElHSFRUUERfQ09ORl9PUFRTID0gXAo+ID4g
ICAgICAgLS13aXRob3V0LXdvbGZzc2wgXAo+ID4gICAgICAgLS1saWJkaXI9L3Vzci9saWIvbGln
aHR0cGQgXAo+CkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
