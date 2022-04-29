Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D82C433F5
	for <buildroot@archiver.kernel.org>; Fri, 29 Apr 2022 07:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBACC4090E;
	Fri, 29 Apr 2022 07:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vaV8hw_sJzxU; Fri, 29 Apr 2022 07:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C3BEC408E2;
	Fri, 29 Apr 2022 07:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 918C71BF380
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 07:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D8666110B
 for <buildroot@lists.busybox.net>; Fri, 29 Apr 2022 07:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6qwsRLPqW6hv for <buildroot@lists.busybox.net>;
 Fri, 29 Apr 2022 07:05:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6005A60D60
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 07:05:33 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r1so7512794oie.4
 for <buildroot@buildroot.org>; Fri, 29 Apr 2022 00:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tj/cOQjHly8jUhWighS719VvWiFUth/nTbyHbfpmJ5s=;
 b=f/gXgvT8uFVSoxzhQxKD9mZG20016iYA3jj9gynQYhcL6E3PfPFauHCDVERsRVuyQ4
 rL3FgA7XrdkGfuQD1eduK4xHApIJFwg8XDLp0Fpr4dqy1T1DGlndRG25zh9HGJjNcBcb
 OMPG0aiQ5fjsyBCWimPLNHCrEfPrytMJsu1yaZa4skMsrUkGAjjFnj/uHhf5jVH/iw0v
 T3JATDYKwiagkc8ARwsDibQuDVj6uHQRlzfAtv1v+oi1Sm1xLdyvY9oVgkn3KPXlQrnO
 6AYWRdd91fURQOOuErHXeU+dQ3iMOh/BALlt7B3joKxS9Pv1yEvRTNsyccSCYaV9jIyH
 XzEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tj/cOQjHly8jUhWighS719VvWiFUth/nTbyHbfpmJ5s=;
 b=t30nLWNrUFBKTABn6wIx83C3QwESgr1PwODFBQ57dytyiBSwQhBh/5lHwUe/I+QxQv
 AwmPThY6MYMgjCGPOHHd8pxFBtds4ddU6VUWlm/7vjy0hxbMPVyD3Yx2K0KWsXp9BbPp
 u6Wf2ARUA0OCXM8dB/2RU8UHGkoQn7uMLuMhz8tVLBa/KPEP/byw6TkFBvo2PNsnZzpb
 6ZsBm+hfTCyKUI6X01DDpo4QjX+j0uHMa1DrAKv7VIEa4L9fPI2AyeE9otI2toN/EFk0
 h5K+NJRCwJpXNdaCtMpELIHCTEs8IqP1il9M3zcsmXsYchMHWMxGJIPdkexdkknw8oPe
 Lblg==
X-Gm-Message-State: AOAM531l/JwWEtVRCsBtSf15rDXmrT2eEFmLB3fdJ+O1bZC/V7IRv2P+
 5gK82vn11XkXwt5BkgcS6HUY5dEvdIN/seJuVlcI3uW4
X-Google-Smtp-Source: ABdhPJzhRmSiZzhNHP/vPk5lnYhEG44gDqTeb1qs7fomaT4ROw69VsMW9nKsjhO4eoh+IqpxmbNPVSFgszlVy8oSAvY=
X-Received: by 2002:aca:c182:0:b0:2ef:8fd4:7523 with SMTP id
 r124-20020acac182000000b002ef8fd47523mr893684oif.148.1651215932355; Fri, 29
 Apr 2022 00:05:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220427205057.4044072-1-fontaine.fabrice@gmail.com>
 <20220428234527.3c5bb3b9@windsurf>
In-Reply-To: <20220428234527.3c5bb3b9@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 29 Apr 2022 09:05:21 +0200
Message-ID: <CAPi7W80-tGgUc_PibQtzVpRbKNz1+RmXqkALF5x_ZScEgAM=ww@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/numactl: needs atomic
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TGUgamV1LiAyOCBhdnIuIDIwMjIgw6AgMjM6NDUsIFRob21hcyBQZXRhenpvbmkKPHRob21hcy5w
ZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoKPgo+IE9uIFdlZCwgMjcgQXByIDIwMjIg
MjI6NTA6NTcgKzAyMDAKPiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWls
LmNvbT4gd3JvdGU6Cj4KPiA+IG51bWFjdGwgdW5jb25kaXRpb25hbGx5IHVzZXMgX19hdG9taWNf
ZmV0Y2hfYW5kIHJlc3VsdGluZyBpbiB0aGUKPiA+IGZvbGxvd2luZyBidWlsZCBmYWlsdXJlIG9u
IG1pY3JvYmxhemUgc2luY2UgY29tbWl0Cj4gPiA0ZWQ1NDBkZGY1OWJlYzRiMzg5YmU0NGQ3ZjQy
ODIwZDI0NjY5MDRmOgo+Cj4gVGhpcyBleHBsYW5hdGlvbiBpcyB1bmZvcnR1bmF0ZWx5IGluY29y
cmVjdC4gSXQgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aAo+IG1pY3JvYmxhemUsIGJlY2F1c2UgQlIy
X1RPT0xDSEFJTl9IQVNfQVRPTUlDIGlzIHRydWUgb24gbWljcm9ibGF6ZToKPgo+IGNvbmZpZyBC
UjJfVE9PTENIQUlOX0hBU19MSUJBVE9NSUMKPiAgICAgICAgIGJvb2wKPiAgICAgICAgIGRlZmF1
bHQgeSBpZiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzggJiYgXAo+ICAgICAgICAgICAg
ICAgICAhQlIyX1RPT0xDSEFJTl9FWFRFUk5BTF9DT0RFU09VUkNFUllfQUFSQ0g2NCAmJiBcCj4g
ICAgICAgICAgICAgICAgIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgJiYgXAo+ICAgICAgICAg
ICAgICAgICAhQlIyX0JJTkZNVF9GTEFUCj4KPiBjb25maWcgQlIyX1RPT0xDSEFJTl9IQVNfQVRP
TUlDCj4gICAgICAgICBib29sCj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIyX1RPT0xDSEFJTl9I
QVNfTElCQVRPTUlDCj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIyX1RPT0xDSEFJTl9HQ0NfQVRf
TEVBU1RfNF83ICYmIEJSMl9hcm0KPiAgICAgICAgIGRlZmF1bHQgeSBpZiBCUjJfVE9PTENIQUlO
X0dDQ19BVF9MRUFTVF80XzcgJiYgQlIyX2FybWViCj4gICAgICAgICBkZWZhdWx0IHkgaWYgQlIy
X1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1RfNF83ICYmIEJSMl94dGVuc2EKPiAgICAgICAgIGRlZmF1
bHQgeSBpZiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF80XzcgJiYgQlIyX0FSQ0hfSVNfNjQK
Pgo+IEhvd2V2ZXIsIHRoZSBrZXkgdGhpbmcgaXMgdGhhdCB0aGUgYnVpbGQgZmFpbHVyZQo+IGh0
dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRzL2UyMjVjYjgzZGFlMzkwZDlkYzU0
M2Q0ZGE4NWM1MjE4MGVmYmQ0MGEKPiBoYXMgdGhyZWFkIHN1cHBvcnQgZGlzYWJsZWQsIGFuZCB3
aGVuIHRocmVhZHMgYXJlIGRpc2FibGVkLCBsaWJhdG9taWMKPiBpcyBub3QgYnVpbHQsIGFuZCB0
aGVyZWZvcmUgQlIyX1RPT0xDSEFJTl9IQVNfTElCQVRPTUlDIGlzIGZhbHNlLgo+Cj4gSG93ZXZl
ciwgSSBkb24ndCBzZWUgYW55d2hlcmUgaW4gdGhlIG51bWFjdGwgYnVpbGQgc3lzdGVtIHdoZXJl
Cj4gLWxhdG9taWMgaXMgcGFzc2VkLiBEb2VzIGl0IGJ1aWxkIG9uIGFyY2hpdGVjdHVyZXMgdGhh
dCBuZWVkIHRvIGxpbmsKPiBhZ2FpbnN0IGxpYmF0b21pYyB0byBnZXQgYXRvbWljIGludHJpbnNp
Y3M/CgpMaW5raW5nIHdpdGggLWxhdG9taWMgaXMgZG9uZSB0aGFua3MgdG8gMDAwMi1saW5rLXdp
dGgtbGF0b21pYy1pZi1uZWVkZWQucGF0Y2guClRoaXMgcGF0Y2ggd2FzIGFkZGVkIHRvIGZpeCB0
aGUgYnVpbGQgb24gYXJjaGl0ZWN0dXJlcyBzdWNoIGFzIHNwYXJjdjguCkhvd2V2ZXIsIEkgZG9u
J3QgdW5kZXJzdGFuZCB3aHkgdGhlIGJ1aWxkIGZhaWxzIG9uIG1pY3JvYmxhemUgd2l0aG91dCBs
aWJhdG9taWMuCkFyZSB3ZSBzdXJlIHRoYXQgbWljcm9ibGF6ZSByZWFsbHkgc3VwcG9ydHMgYXRv
bWljIHdpdGhvdXQgbGliYXRvbWljPwoKPgo+IENvdWxkIHlvdSBkb3VibGUgY2hlY2sgdGhpcywg
YW5kIHJld29yayB0aGUgY29tbWl0IG1lc3NhZ2U/Cj4KPiBUaGFua3MhCj4KPiBUaG9tYXMKPiAt
LQo+IFRob21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRl
ZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9v
dGxpbi5jb20KCkJlc3QgUmVnYXJkcywKCkZhYnJpY2UKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
