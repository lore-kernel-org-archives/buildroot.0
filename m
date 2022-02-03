Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E407C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 08:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7B2E83385;
	Thu,  3 Feb 2022 08:11:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 45Wza_UajbV1; Thu,  3 Feb 2022 08:11:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2803383276;
	Thu,  3 Feb 2022 08:11:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4C8E81BF403
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 08:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A15960B8A
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 08:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=orange.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YW4E66592z0 for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 08:11:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EFBF605EA
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 08:11:38 +0000 (UTC)
Received: from opfedar04.francetelecom.fr (unknown [xx.xx.xx.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar26.francetelecom.fr (ESMTP service) with ESMTPS id 4JqBG003Q6zFphP; 
 Thu,  3 Feb 2022 09:11:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.com;
 s=ORANGE001; t=1643875896;
 bh=abQRuml1RwmanlhLuZ/WXBoqqrAn9kGh9+637bIY43M=;
 h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 b=i9k7aLqpkGXVokUIaOjIKpkqDFN71XTpwVnx4i57uQHITgBbfYqzScpGE3mQ81Eei
 CeCoviSxXyTuVG+Q3+U3gmp8nIdse2mUWn6tTFlGtygsDFySp6jqFbbqvIGwi/i8J2
 +i7hujwIE+i/64mXUNixvEeIbrNhSaSHO5YBUJW7xetNsTkFELzg6Ed60cDr/acviB
 wnwE+o6zFhnjWwwaSf/jScILqRgdwdtq2Y1lfdmCOmRrK+D9WUMJZ4McfTc4RWRtLH
 WBi3Jb7o8OjQOaHcsZGIwzpDKqB9pDA43kCCNhoj99b9PgtOpmnDx+sZ1UEx4U3CdT
 RKxzalrvb6oZA==
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Thu, 03 Feb 2022 09:11:33 +0100
Date: Thu, 3 Feb 2022 09:11:33 +0100
From: <yann.morin@orange.com>
To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Message-ID: <2371_1643875895_61FB8E37_2371_137_1_20220203081133.GA3479@tl-lnx-nyma7486>
References: <19291_1643809720_61FA8BB8_19291_487_24_41ca9ce22939ce2ed0c41973db7d612542850824.1643809712.git.yann.morin@orange.com>
 <MWHPR1201MB02399448DED9B92CC064520CA1279@MWHPR1201MB0239.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <MWHPR1201MB02399448DED9B92CC064520CA1279@MWHPR1201MB0239.namprd12.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Originating-IP: [10.115.27.50]
X-ClientProxiedBy: OPE16NORMBX404.corporate.adroot.infra.ftgroup
 (10.115.26.17) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
Subject: Re: [Buildroot] [PATCHv2] package/glibc: allow runing on kernels
 older than used for the headers
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxleGV5LCBBbGwsCgpPbiAyMDIyLTAyLTAyIDE3OjAwICswMDAwLCBBbGV4ZXkgQnJvZGtpbiBz
cGFrZSB0aHVzbHk6Cj4gPiBXZSBhZGQgYW4gb3B0aW9uIHRvIGdsaWJjIHRvIGFsbG93IHRoZSB1
c2VyIHRvIGVuYWJsZSBjb21wYXRpYmlsaXR5Cj4gPiBzaGltcy4gVG8gc2ltcGxpZnkgdGhlIGNh
c2UsIHdoZW4gdGhhdCBvcHRpb24gaXMgZW5hYmxlZCwgd2UganVzdCBsZXQKPiA+IGdsaWJjIGVu
YWJsZSBhcyBvbGQgY29tcGF0aWJpbGl0eSBzaGltcyBhcyBzdXBwb3J0ZWQgYnkgdGhlIGN1cnJl
bnQKPiA+IGFyY2hpdGVjdHVyZS4KPiBMb29rcyByZWFzb25hYmxlIHRvIG1lLiBJIG1lYW4gdG8g
bm90IGhhdmUgYWxsIHRoZSBmbGV4aWJpbGl0eSBwcm9wb3NlZAo+IGluaXRpYWxseSwgaW5zdGVh
ZCBhZGRpbmcgYW4gb3B0aW9uIHRvIGZhbGwgYmFjayB0byBzb21ldGhpbmcgbXVjaAo+IG9sZGVy
IGNvbXBhcmVkIHRvIHVzZWQgaGVhZGVycy4KPiAKPiBJZiBtb3JlIG9wdGlvbnMgYXJlIG5lZWRl
ZCBsYXRlciwgd2UnbGwgZ2V0IHRvIGtub3cgaXQgYXQgc29tZSBwb2ludCA7KQo+IAo+IEFuZCB0
aGFua3MgZm9yIGRvaW5nIHRoYXQsIGFzIEkgbWVhbnQgdG8gZG8gc29tZXRoaW5nIHNpbWlsYXIg
YSB3aGlsZSBhZ28sCj4gYnV0IG5ldmVyIHBvc3RlZCBteSBsb2NhbCBjaGFuZ2VzLgoKV2lsbCB0
aGF0IGJlIGZvbGxvd2VkIHVwIGJ5IGEgcmV2aWV3ZWQtYnkgb3IgbWF5YmUgYSB0ZXN0ZWQtYnkg
dGFnPyA7LSkKClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLCBieSB0aGUgd2F5LiDwn5GNCgpSZWdh
cmRzLApZYW5uIEUuIE1PUklOLgoKLS0gCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBfX19fX19fX19fX18KLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tOiAgICAgICBfICAgIDotLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4gIHwg
UmVhbC1UaW1lIEVtYmVkZGVkIHwgICAgX18vICkgICB8IC8iXCBBU0NJSSBSSUJCT04gfAp8ICsz
MyA1MzQuNTQxLjE3OSB8IFNvZnR3YXJlICBEZXNpZ25lciB8ICBfLyAtIC8nICAgfCBcIC8gQ0FN
UEFJR04gICAgIHwKfCArMzMgNjM4LjQxMS4yNDUgJy0tLS0tLS0tLS0tLS0tLS0tLS0tOiAoXyAg
ICBgLS0sIHwgIFggIEFHQUlOU1QgICAgICB8CnwgICAgICB5YW5uLm1vcmluIChhdCkgb3Jhbmdl
LmNvbSAgICAgIHxfPSIgICAgLC0tJyB8IC8gXCBIVE1MIE1BSUwgICAgfAonLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS06X19fX19fL19fX19fOi0tLS0tLS0tLS0tLS0tLS0t
LScKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCgpDZSBtZXNzYWdlIGV0IHNlcyBwaWVjZXMgam9pbnRlcyBwZXV2ZW50IGNv
bnRlbmlyIGRlcyBpbmZvcm1hdGlvbnMgY29uZmlkZW50aWVsbGVzIG91IHByaXZpbGVnaWVlcyBl
dCBuZSBkb2l2ZW50IGRvbmMKcGFzIGV0cmUgZGlmZnVzZXMsIGV4cGxvaXRlcyBvdSBjb3BpZXMg
c2FucyBhdXRvcmlzYXRpb24uIFNpIHZvdXMgYXZleiByZWN1IGNlIG1lc3NhZ2UgcGFyIGVycmV1
ciwgdmV1aWxsZXogbGUgc2lnbmFsZXIKYSBsJ2V4cGVkaXRldXIgZXQgbGUgZGV0cnVpcmUgYWlu
c2kgcXVlIGxlcyBwaWVjZXMgam9pbnRlcy4gTGVzIG1lc3NhZ2VzIGVsZWN0cm9uaXF1ZXMgZXRh
bnQgc3VzY2VwdGlibGVzIGQnYWx0ZXJhdGlvbiwKT3JhbmdlIGRlY2xpbmUgdG91dGUgcmVzcG9u
c2FiaWxpdGUgc2kgY2UgbWVzc2FnZSBhIGV0ZSBhbHRlcmUsIGRlZm9ybWUgb3UgZmFsc2lmaWUu
IE1lcmNpLgoKVGhpcyBtZXNzYWdlIGFuZCBpdHMgYXR0YWNobWVudHMgbWF5IGNvbnRhaW4gY29u
ZmlkZW50aWFsIG9yIHByaXZpbGVnZWQgaW5mb3JtYXRpb24gdGhhdCBtYXkgYmUgcHJvdGVjdGVk
IGJ5IGxhdzsKdGhleSBzaG91bGQgbm90IGJlIGRpc3RyaWJ1dGVkLCB1c2VkIG9yIGNvcGllZCB3
aXRob3V0IGF1dGhvcmlzYXRpb24uCklmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMgZW1haWwgaW4g
ZXJyb3IsIHBsZWFzZSBub3RpZnkgdGhlIHNlbmRlciBhbmQgZGVsZXRlIHRoaXMgbWVzc2FnZSBh
bmQgaXRzIGF0dGFjaG1lbnRzLgpBcyBlbWFpbHMgbWF5IGJlIGFsdGVyZWQsIE9yYW5nZSBpcyBu
b3QgbGlhYmxlIGZvciBtZXNzYWdlcyB0aGF0IGhhdmUgYmVlbiBtb2RpZmllZCwgY2hhbmdlZCBv
ciBmYWxzaWZpZWQuClRoYW5rIHlvdS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
