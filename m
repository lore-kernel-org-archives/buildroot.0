Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5D7C433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 20:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B55C60E34;
	Tue, 19 Apr 2022 20:11:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u0lM2oVmPiFT; Tue, 19 Apr 2022 20:11:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2820A60E49;
	Tue, 19 Apr 2022 20:11:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 849E61BF860
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:11:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80A1182849
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 20:11:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aw5FHBZ1PP41 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 20:11:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7CB582881
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 20:11:15 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p189so11366872wmp.3
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 13:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3RCO2L2AOmsKuyk/bd4vfk6Xk65ioa144YIC8hNiIQ=;
 b=gNC1KwaIupNxKLTgihEW2KWC1xMn/Rm7L7cngHZUNUR9TWkkI1yWR18b7WhnzjiDhV
 Gn4+eh1wZZr2jukqVg2e3Ne3CIOcdMgUhe4y60x+3715m9ccemksXWTx1WozSHjo4nrz
 heuBKjToJM0SkPU2kltN+AIV2CMJFzwwAEkwKJI+AiqNpx8XmN4iy3S00fh7X2quNGEv
 p4LL2hcYGQ2IzAmLoTsd8PR8YhZx+ldaGUwE5GVg0A+HI6HMGFIZr1ObxfvMBUXqjyqm
 SWPzDF+Wiga+bz7o/4IdjzWb/hpIeqlSlrpgcwerX2cYNqHkr5mb+dL5athftQhglcR3
 1Wxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=y3RCO2L2AOmsKuyk/bd4vfk6Xk65ioa144YIC8hNiIQ=;
 b=bb6IE5033qODcj3KonX4dUsp8VpymIr6PXdx2d/fVnf0pHDMCRK3nWmpoB6ZkuVBNk
 2epCudPmby1TEs8+E83TbyUX4mCR4Qt9Yx8rFFDoSchHOA6Sl3IcL/+m8UsKp7VhlxgT
 P9qfY5WfMz9LT7oEkGRgewM1Qj1L0zOXEyP6vH99MAN4Fo9hixR5G8ufT21KCCN+/vMO
 rmc1PsJWoi1dbz5PzPk4kGNT+V/YYDNuQubV6Pmcpmg/fyNvO2Ykw5eau/8cCOvI2DT6
 gkp6zVgL+lAMOI5OCuhlFhCbLDmok3LoXQcPMlrgubMwrokbhaZLvDY/DVSDpTp0DGJ+
 II6Q==
X-Gm-Message-State: AOAM5322dYTSmP7ZwqaZuO0kWgTBofvhtyr+I5wNUsPK34odTWtr0nBi
 hnNcsDj+qM0KISR75PzItmZmL4IqYxPI+w==
X-Google-Smtp-Source: ABdhPJylfnInXAoReJq37s3GLUpQwlhtx0j5zrDiyWLVMaAU2Fh99znpB8bOiXEtGR1ZTxBJmsrx6w==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr234520wmj.39.1650399073994; 
 Tue, 19 Apr 2022 13:11:13 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1cf608000000b0038c8fdc93d6sm19826771wmc.28.2022.04.19.13.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Apr 2022 13:11:13 -0700 (PDT)
Message-ID: <3fabf76a-bf2c-a0f7-09ea-a78514401d95@mind.be>
Date: Tue, 19 Apr 2022 22:11:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Marko Stanisic <sankerspace@gmail.com>
References: <90f6844e-4ba4-1910-ec2d-bc6606793a5e@mind.be>
 <29DC8FE4-8840-4235-B78A-AEA800924338@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <29DC8FE4-8840-4235-B78A-AEA800924338@gmail.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAxNS8wNC8yMDIyIDE5OjU3LCBNYXJrbyBTdGFuaXNpYyB3cm90ZToKPiBUaGFuayB5b3Ug
QXJub3V0IGZvciB5b3VyIGFuc3dlciwKPiAKPiBZZXMgSSB1c2UgYSBnaXQgcmVwb3NpdG9yeSAs
IGJ1dCBJIGhhdmUgdG8gYnVpbGQgdHdvIHVib290IGZvciBkaWZmZXJlbnQgc2l0dWF0aW9ucyAg
LAo+IDEpIG9uZSB1Ym9vdCB3aXRoIGRpc2FibGVkIGNvbnNvbGUKPiAocmVsZWFzZSBidWlsZCAp
Cj4gMikgYW5kIGFub3RoZXIgdWJvb3QgZGVidWcgYnVpbGQgd2l0aCBlbmFibGVkIGNvbnNvbGUu
Cj4gMykgZGVwZW5kaW5nIG9uIHdoaWNoIGJ1aWxkcm9vdCBkZWZjb25maWcgSSB1c2UgKHJlbGVh
c2Ugb3IgYnVpbGQpCj4gCj4gSSB3YW50ZWQgdG8gb3JjaGVzdHJhdGUgdGhlIGJ1aWxkcyBvdmVy
IGRpZmZlcmVudCBkZWZjb25maWdzIChidWlsZHJvb3QpIGFuZCBpbiBjb25zZXF1ZW5jZSBkaWZm
ZXJlbnQgdWJvb3QgZGVmY29uZmlncyhvbmUgZW5hYmxlcyBjb25zb2xlLCBhbm90aGVyIGhhcyBz
aWxlbnQgY29uc29sZSkgZmVhdHVyZSBlbmFibGVkLgo+IEJ1dCBpdCBpcyBhbHNvIG5lY2Vzc2Fy
eSB0byBwZXJmb3JtIGEgcGF0Y2ggb24gaGVhZGVyIGFuZCBjIGZpbGUgb2YgYSBjdXJyZW50IHVi
b290IHJlcG8gb24gdGhlIGZseSBhcyBwcmVwYXJhdGlvbiBmb3IgYSBidWlsZC4KPiAoIGVudmly
b25tZW50IHNldHRpbmcgZm9yIHNpbGVudCBjb25zb2xlICkKPiAKPiBUaGVyZSBpcyBhbm90aGVy
IHNvbHV0aW9uIGZvciBzdXJlICwgYnV0IGEgcGF0Y2ggc2VlbXMgdG8gbWUgbW9yZSBlbGVnYW50
IHRvIHNvbHZlIHRoaXMgbXVsdGkgc291cmNlIHByb2JsZW0gY2FzZXM6Cj4gQ2FzZSBBKSBjb25z
b2xlIG9uICh1Ym9vdCBkZWZjb25maWcgQSkKPiBDYXNlIEIpIGNvbnNvbGUgb2ZmICh1Ym9vdCBk
ZWZjb25maWcgQiB3aXRoIHNpbGVudCBjb25zb2xlIGZlYXR1cmUpK2NoYW5nZXMgaW4gc291cmNl
IGNvZGUgcmVnYXJkaW5nIHVib290IGVudmlyb25tZW50Cj4gCj4gTWF5YmUgZGlyZWN0IHVzZSBv
ZiBwYXRjaGVzIGluc2lkZSB1Ym9vdCB3b3VsZCBiZSBtb3JlIGNvcnJlY3QgLCBidXQgaSBzYXcg
bm8gbWVjaGFuaXNtcyBmb3IgdGhhdC4KPiAoTm90aGluZyBpbiBSZWFkbWUsIG5vIGhpbnQgdG8g
dWJvb3QgcGF0Y2ggZGlyZWN0b3JpZXMgb3IgdXNpbmcgcGF0Y2hlcyBiZWZvcmUgdWJvb3QgYnVp
bGQpCj4gICAKPiBJcyBidWlsZHJvb3QgYWJsZSB0byBoYW5kbGUgc3VjaCBzaXR1YXRpb25zPwoK
ICBJbiBzaG9ydCwgbm8uCgogIEhvd2V2ZXI6CgotIHlvdSBjYW4gc2V0IEJSMl9UQVJHRVRfVUJP
T1RfQ09ORklHX0ZSQUdNRU5UX0ZJTEVTIHRvIGEgY29uZmlnIGZyYWdtZW50IHRoYXQgCmVuYWJs
ZXMgb3IgZGlzYWJsZXMgdGhlIGNvbnNvbGU7Ci0gdGhlIGNoYW5nZSBpbiB0aGUgaGVhZGVyIHlv
dSBjYW4gaGFuZGxlIHdpdGggaWZkZWYgdXNpbmcgdGhlIGNvbmZpZyBzeW1ib2wgc2V0IApieSB0
aGUgYWJvdmUgZnJhZ21lbnQuCgpUaGlzIGlzIElNSE8gYSBtdWNoIGNsZWFuZXIgc29sdXRpb24g
dGhhbiBwYXRjaGluZyB0aGUgc291cmNlIC0geW91IGdldCB0byBrZWVwIApvbmUgc291cmNlIG9m
IHRydXRoLgoKICBSZWdhcmRzLAogIEFybm91dAoKPiAKPiBCZXN0IHJlZ2FyZHMsCj4gTWFya28u
Cj4gCj4gU2VudCBmcm9tIG15IGlQaG9uZQo+IAo+PiBPbiAxNC4wNC4yMDIyLCBhdCAyMTowMCwg
QXJub3V0IFZhbmRlY2FwcGVsbGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKPj4KPj4g77u/Cj4+
Cj4+PiBPbiAxMy8wNC8yMDIyIDEyOjU4LCBNYXJrbyBTdGFuaXNpYyB3cm90ZToKPj4+IEhlbGxv
LAo+Pj4gV2l0aCBidWlsZHJvb3QgaSB0cnkgdG8gYnVpbGQgYW4gdWJvb3Qgd2hpY2ggc2hvdWxk
IGJlIHBhdGNoZWQgYmVmb3JlLCBVYm9vdCBpc3QgYnVpbGQgYnkgYnVpbGRyb290LCBidXQgdGhl
cmUgaXMgbm8gcmVhY3Rpb24gb24gZm9sbG93aW5nIHNldHRpbmcKPj4+IEJSMl9UQVJHRVRfVUJP
T1RfUEFUQ0g9IiQoQlIyX0VYVEVSTkFMX0dJTk9fUEFUSCkvcGF0Y2hlcy91Ym9vdCIKPj4+IElu
c2lkZSA8QlIyX0VYVEVSTkFMX0dJTk9fUEFUSD4vcGF0Y2hlcy91Ym9vdCB0aGVyZSBpcyBhIC5w
YXRjaCBmaWxlIG5hbWVkIGFjY29yZGluZyB0byBodHRwczovL2J1aWxkcm9vdC5vcmcvZG93bmxv
YWRzL21hbnVhbC9tYW51YWwuaHRtbCNwYXRjaC1wb2xpY3kgd2l0aAo+Pj4gfDxudW1iZXI+LXVi
b290LTxkZXNjcmlwdGlvbj4ucGF0Y2h8Cj4+PiB8UGF0Y2hlcyBpbnNpZGUgZGlyZWN0b3JpZXMg
Y2FuIGJlIGV4ZWN1dGVkIGFjY29yZGluZyBkb2N1bWVudGF0aW9uLgo+Pj4gfAo+Pj4gfFVib290
IGlzIHVzZWQgaW5zaWVkIGEgc3VibW9kdWwgb2YgbXkgcmVwbyBhbmQgYnVpZGxyb290IGhhc3Mg
YWNjZXMgdG8gaXQgb3ZlciBVQk9PVF9PVkVSUklERV9TUkNESVIuCj4+PiB8Cj4+PiB8Cj4+PiB8
Cj4+PiB8SSBoYXZlIG5vIGNsdWUgd2h5IHBhdGNoaW5nIGlzIG5vdCBwZXJmb3JtZWQ6fAo+Pj4g
MS4gfGNoZWNrZWQgd2l0aCBtYWtlIC1zIHByaW50dmFycyBWQVJTPSdCUjJfVEFSR0VUX1VCT09U
X1BBVENIJ3wKPj4+IDIuIGNoZWNrZWQgbWFrZSAtcyBwcmludHZhcnMgVkFSUz0nVUJPT1RfUEFU
Q0hFUycgLCBVQk9PVF9QQVRDSEVTIGlzIHNldCBpbnNpZGUKPj4+ICAgICBib290Lm1rCj4+PiAz
LiBtYWtlIC1zIHByaW50dmFycyBWQVJTPSdVQk9PVF9QT1NUX1BBVENIX0hPT0tTJwo+Pj4gICAg
IFVCT09UX1BPU1RfUEFUQ0hfSE9PS1M9VUJPT1RfQVBQTFlfTE9DQUxfUEFUQ0hFUyBVQk9PVF9G
SVhVUF9MSUJGRFRfSU5DTFVERQo+Pj4gNC4gQlIyX0dMT0JBTF9QQVRDSF9ESVI9IiQoQlIyX0VY
VEVSTkFMX0dJTk9fUEFUSCkvcGF0Y2hlcyBpcyBhbHNvIHNldAo+Pj4gNS4gSXQgc2VlbXMgdGhh
dCBldmVyeXRoaW5nIGZpbmUsIG1heWJlIG9uZSB0aGluIGlzIG5vdCB2ZXJ5IGNsZWFyIHRvIG1l
Cj4+PiBJIHVzZSAqVUJPT1RfT1ZFUlJJREVfU1JDRElSKmFuZCBtYXliZSB0aGF0cyBtYWtlIHRy
b3VibGVzIGhlcmU/IGJlY2F1c2Ugb2YgdGhlIGNvbW1lbnQKPj4+IHxXaGVuIEJ1aWxkcm9vdCBm
aW5kcyB0aGF0IGZvciBhIGdpdmVuIHBhY2thZ2UsIGFuICs8cGtnPl9PVkVSUklERV9TUkNESVIr
IGhhcyBiZWVuIGRlZmluZWQsIGl0IHdpbGwgbm8gbG9uZ2VyIGF0dGVtcHQgdG8gZG93bmxvYWQs
IGV4dHJhY3QgYW5kIHBhdGNoIHRoZSBwYWNrYWdlLiBJbnN0ZWFkLCBpdCB3aWxsIGRpcmVjdGx5
IHVzZSB0aGUgc291cmNlIGNvZGUgYXZhaWxhYmxlIGluIHRoZSBzcGVjaWZpZWQgZGlyZWN0b3J5
IGFuZCArbWFrZSBjbGVhbisgd2lsbCBub3QgdG91Y2ggdGhpcyBkaXJlY3RvcnkufAo+Pgo+PiBJ
bmRlZWQsIGFzIHRoaXMgdGV4dCBzYXlzOiBpZiB5b3UgdXNlIE9WRVJSSURFX1NSQ0RJUiwgeW91
IGNhbid0IHVzZSBwYXRjaGVzLgo+Pgo+Pgo+Pj4gICAgICAgICAgICAgIDUuMSBJZiBQb2ludCAo
NSkgbWFrZXMgdGhlIHByb2JsZW0gaG93IGNhbiBpIHNvbHZlIGl0IHRvIGFwcGx5IGEgcHJvcGVy
IHBhdGNoIG92ZXIgYnVpbGRyb290LCBvciBkbyBpIGhhdmUgdG8gcHV0IGl0IGluc2lkZSB0aGUg
c3VibW9kdWwgZGlyZWN0bHkgYW5kIGhvdz8KPj4KPj4gSWYgeW91IGhhdmUgYSBsb2NhbCBkaXJl
Y3Rvcnkgd2l0aCB0aGUgc291cmNlLCBpdCdzIGFzc3VtZWQgdGhhdCB5b3UgYXJlIGFibGUgdG8g
bW9kaWZ5IHRoYXQgc291cmNlIGFuZCBhcHBseSB0aGUgcGF0Y2hlcyBkaXJlY3RseS4KPj4KPj4g
SWYgZm9yIHdoYXRldmVyIHJlYXNvbiB0aGF0J3Mgbm90IGFuIG9wdGlvbiwgdGhlcmUgYXJlIGEg
ZmV3IG9wdGlvbnM6Cj4+Cj4+IC0gbWFrZSBhIHRhcmJhbGwgYW5kIHBvaW50IEJSMl9UQVJHRVRf
VUJPT1RfQ1VTVE9NX1RBUkJBTEwgdG8gaXQ7IG9yCj4+IC0gaWYgaXQncyBhIGdpdCByZXBvc2l0
b3J5LCB5b3UgY2FuIHBvaW50IEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX0dJVCB0byBpdC4KPj4K
Pj4KPj4gUmVnYXJkcywKPj4gQXJub3V0Cj4+Cj4+Cj4+PiAgICAgICAgIDYuIEkgZGlkbid0IHVz
ZSB0aGUgZGVwcmVjYXRlZCBzZXR0aW5nIEJSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1BBVENIX0RJ
Ugo+Pj4gICAgICAgICA3LiBUcmllZCB0byBidWlsZCB1Ym9vdCBwYWNrYWdlCj4+PiB8bWFrZSB1
Ym9vdC1kaXJjbGVhbiBtYWtlIHVib290LWV4dHJhY3QgbWFrZSB1Ym9vdC1wYXRjaCAjIyBub3Ro
aW5nIHdvcmtlZCBtYWtlIHVib290LWJ1aWxkIG1ha2UgdWJvb3QtaW5zdGFsbCB8Cj4+PiBNYXli
ZSBpIGZvcmdvdCBzb21ldGhpbmc/Cj4+PiB0aGFuayB5b3UKPj4+IHx8Cj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
