Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99F5ECAAA2
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 17:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70F254026A;
	Mon, 29 Aug 2022 17:45:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70F254026A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0fwmUtbgG9T; Mon, 29 Aug 2022 17:45:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94E4E401B7;
	Mon, 29 Aug 2022 17:45:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94E4E401B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7359E1BF280
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EBFC401B7
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 17:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4EBFC401B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJh7r3ibmP9x for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 17:45:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61D95400DA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61D95400DA
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 17:45:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bu22so10791642wrb.3
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 10:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=CtJ4q18JNopCzdK8HaLmwBlr5QuzBcKdZx5+wFtJ4QM=;
 b=uv1SUU+io148N05p0ogaMXgCE+P0EbH3+9643+B3tZQr6U4mH+KCvMBHTg2bPsZKAT
 LhnvGif/fGi/gokJTtrFMkHaYQNOUYqNDa+/PKCzowoqX8fYl1PVYr9FJpS0kUvOkBb/
 m+NPjRVIRMAq6gB4P0FYzERGQDHzpPly6jJyoeLjmdnQ2FCduxcmoDOtHZYIIEnaZhRE
 vMa7GlGih/1c1CxwIlSjMnM7BIEyU2cH68XtvT6CBR9DE0OL+qPeuMCCpl6sNIY8NIAu
 v5S5uSIupHGROZqSRJOfJDCTuTD0rtTHcEu5yyYJl5gJloD/JT4GT0BUydght33Tpnea
 ALTw==
X-Gm-Message-State: ACgBeo0jG1Pr1LtJszzbpHlcmZLA2GFt/Pb/wYXoMhmhAOlIQwYzk/7r
 ewL3l2RqEmjk7jTBJGjDDTl+nwtcySM=
X-Google-Smtp-Source: AA6agR6p1jfJkgxtGADCVd5H+VIaPGQ6dPoRRUdwmzdY4MjQbBlVYGcrG5DTdSXEDAzJp5ptbu4RzQ==
X-Received: by 2002:a5d:528d:0:b0:226:cff2:869 with SMTP id
 c13-20020a5d528d000000b00226cff20869mr6683538wrv.586.1661795106611; 
 Mon, 29 Aug 2022 10:45:06 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521?
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a05600c23c900b003a6125562e1sm9420551wmb.46.2022.08.29.10.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Aug 2022 10:45:06 -0700 (PDT)
Message-ID: <970c1ae5-66dc-6154-669e-7872441fda9b@gmail.com>
Date: Mon, 29 Aug 2022 19:45:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220827161431.333659-1-romain.naour@gmail.com>
 <20220827161431.333659-2-romain.naour@gmail.com>
 <20220829154642.60430d08@windsurf>
From: Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20220829154642.60430d08@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=CtJ4q18JNopCzdK8HaLmwBlr5QuzBcKdZx5+wFtJ4QM=;
 b=dZcW1z6mRb7PQqNXdlij5KsFGy1dEPnAY5Zu4WKrvcgjoyA8vaFUYj9jEphMcVR230
 EBvC2AsVgVgzoTcn/Go6VbuRey4UTXRzI/aOJv2rrK3gOuF4ffZxPr1HMgxBepFGepJg
 xPbSUf8JEi0qUFN52w6trlN8VqyV0TG8kKFGUPaUOn3uy2mdp1bGl3YtV8tdlbEvn7T8
 rHckAtIlK4pYed+kLvHJvPOKKBqNdW5MjK64GMGpSwMNVsp+KDzzFJAxlxtJKwLKZaPL
 fl1b6cYeyRDe4+HCYFcRu6GnMT5u2xE2LCTbuvdwi1mxaP/8Ptw3BKHZsOrlEeZLeBlS
 Gb9w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dZcW1z6m
Subject: Re: [Buildroot] [for-master 2/2] package/gdb: prevent gdbserver
 being selected for or1k builds
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
Cc: Stafford Horne <shorne@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKTGUgMjkvMDgvMjAyMiDDoCAxNTo0NiwgVGhvbWFzIFBldGF6em9uaSBh
IMOpY3JpdMKgOgo+IEhlbGxvIFJvbWFpbiwKPiAKPiBPbiBTYXQsIDI3IEF1ZyAyMDIyIDE4OjE0
OjMxICswMjAwCj4gUm9tYWluIE5hb3VyIDxyb21haW4ubmFvdXJAZ21haWwuY29tPiB3cm90ZToK
PiAKPj4gVGhlcmUgaXMgY3VycmVudGx5IG5vIHZlcnNpb24gb2YgZ2Ric2VydmVyIGZvciBvcjFr
LiBVbnRpbCB0aGlzCj4+IGlzIGltcGxlbWVudGVkIHdlIHdpbGwgcHJldmVudCBib3RoIHRoZSBk
aXJlY3QgYW5kIGluZGlyZWN0Cj4+IHNlbGVjdGlvbiBvZiBnZGJzZXJ2ZXIgZm9yIG9yMWsgYnVp
bGRzLiBJbiBwcmFjdGljZSB0aGlzIG1lYW5zCj4+IHRoYXQgJ2Nyb3NzIGdkYiBmb3IgdGhlIGhv
c3QnIGNhbm5vdCBiZSBzZWxlY3RlZCBhbmQgdGhhdAo+PiAnZnVsbCBkZWJ1Z2dlcicgbXVzdCBi
ZSBhdXRvbWF0aWNhbGx5IHNlbGVjdGVkIGZvciB0aGUgZ2RiIHRhcmdldAo+PiBwYWNrYWdlCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQGdtYWlsLmNvbT4K
Pj4gQ2M6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21haWwuY29tPgo+PiAtLS0KPj4gZ2Ric2Vy
dmVyIGZvciBvcjFrIHJlcXVpcmVzIGdkYiAxMi4xIFsxXSBidXQgdGhpcyB2ZXJzaW9uIGlzCj4+
IG5vdCBhdmFpbGFibGUgaW4gQnVpbGRyb290IDIwMjIuMDggYW5kIG9ubHkgaW4gdGhlIG5leHQg
YnJhbmNoCj4+ICh1cGNvbWluZyAyMDIyLjAxMSkuCj4gCj4gQnV0IGluOgo+IAo+IGNvbW1pdCA5
OTFiN2I5OTBhZDhjZDRhMzc1NjRjZDkxZDViYjBlZTdlMWU5ZjExCj4gQXV0aG9yOiBTdGFmZm9y
ZCBIb3JuZSA8c2hvcm5lQGdtYWlsLmNvbT4KPiBEYXRlOiAgIFNhdCBKdWwgMzAgMDc6MDc6NDgg
MjAyMiArMDkwMAo+IAo+ICAgICBwYWNrYWdlL2dkYjogRW5hYmxlIE9wZW5SSVNDIEdEQiBzdXBw
b3J0Cj4gICAgIAo+ICAgICBUaGUgT3BlblJpU0MgZ2RiIHBvcnQgaGFzIHN1cHBvcnRlZCBuYXRp
dmUgZGVidWdnaW5nIHNpbmNlIHZlcnNpb24gOC4zCj4gICAgIGFuZCByZW1vdGUgZGVidWdnaW5n
IHNpbmNlIGJlZm9yZSB0aGF0LiAgU28gaXQgaXMgbm93IHNhZmUgdG8gZW5hYmxlZAo+ICAgICB0
aGlzLgo+ICAgICAKPiAgICAgVGhpcyBwYXRjaCByZW1vdmVzIHRoZSBjb25kaXRpb25zIGJsb2Nr
aW5nIGdkYiBmcm9tIGJlaW5nIGJ1aWx0IG9uIG9yMWsKPiAgICAgYXJjaGl0ZWN0dXJlIGJ1aWxk
cy4KPiAgICAgCj4gICAgIFNpZ25lZC1vZmYtYnk6IFN0YWZmb3JkIEhvcm5lIDxzaG9ybmVAZ21h
aWwuY29tPgo+ICAgICBTaWduZWQtb2ZmLWJ5OiBZYW5uIEUuIE1PUklOIDx5YW5uLm1vcmluLjE5
OThAZnJlZS5mcj4KPiAKPiBTdGFmZm9yZCBzYWlkIHRoYXQgInJlbW90ZSBkZWJ1Z2dpbmciIHdv
cmtzLgoKSSdtIG5vdCBzdXJlIGFib3V0ICJyZW1vdGUgZGVidWdnaW5nIiBidXQgdGhlIGNvbW1p
dCBJJ20gcmVmZXJyaW5nIGlzIHRpdGxlZAoiZ2RiOiBvcjFrOiBpbXBsZW1lbnQgZ2RiIHNlcnZl
ciIKCkkgbm90aWNlZCB0aGF0IG9yMWsgZW50cnkgaXMgbWlzc2luZyBpbiBnZGJzZXJ2ZXIvY29u
ZmlndXJlLnNydiB1bnRpbCBnZGIgMTIuCgo+IAo+IFNvLCB3aGF0IGlzIGNvcnJlY3Q/IDotKQoK
SSBndWVzcyBnaXQgaGFzIHRoZSBhbnN3ZXI6CgokIGdpdCB0YWcgLS1jb250YWlucyA0OTMzMjY1
YzNmNzFiOTEzNDM2M2QwYzA1ZjA5NTQyZDVjYzY3N2Y0CmJpbnV0aWxzLTJfMzgKYmludXRpbHMt
Ml8zOQpnZGItMTItYnJhbmNocG9pbnQKZ2RiLTEyLjEtcmVsZWFzZQoKQmVzdCByZWdhcmRzLApS
b21haW4KCj4gCj4gVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
