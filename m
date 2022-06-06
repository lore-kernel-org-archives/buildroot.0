Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B3CC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 18:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B03140584;
	Mon,  6 Jun 2022 18:09:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aWQNEoX1--4n; Mon,  6 Jun 2022 18:09:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2A5A4403E9;
	Mon,  6 Jun 2022 18:09:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0729F1BF2E3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EBB41BFF
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 18:09:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sqtmNk-50v-l for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 18:09:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 585CE41BFB
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 18:09:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id v25so19906809eda.6
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 11:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hVBrcR3wPi+z4DGI5vXcxpnK6f4ojMkszmtdlvkMYsw=;
 b=KhUqhNuuyf5TJGjyfHKojMuUBBs3PSefspRMM+vhO/D5kFyqnCVW4q3BeZ2GwkYY/s
 otx2Rmie5iuV6BDncp10BjeG6FGnhB/LVLt+YfL+PdkgDn73zbmOLJiDNU2exlHJ9qYG
 gpxdNfK61kaU2m9A+Q0ZTYRv+b1nAcC0iXObs2Jl2PzlIK7QM9UWDeqUjm9cQ5PK2VKS
 8sWoN8b/4jp+9UG09j4qRE9VTWwOZMt/TaLGLDSJ+15kEP6W7fL8eWPdAwxFpy6uXEhr
 OUbVn8Ent9neVS/pO3umEmk3jL0CIklDt5lmVtLfb6w23cG9GYq0cG0ll5lbEcyQLxMt
 84+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hVBrcR3wPi+z4DGI5vXcxpnK6f4ojMkszmtdlvkMYsw=;
 b=TnnEQVeQMzYuJzx5m2ZkYK39cx8R8PLSb61PNm9ZJ1cHhj9qIi8WBthNdczyDEJIe8
 dYA5iT4MXY5K5vMG4VdASID323beWIpqYBJHTPWqg0K3/pIXJDk1M3EdndMyGhh//8UR
 oZR1gJjlF85H5GiPhbTpyD8HzfTqW6vuXViiNsUAINhzufqSlQLSpGQEOp6kKOIdDI5q
 5o+4lTDGuD8k5nxd0+Ez23nJKDjtcvFgTQob6HrSC0+aWtr2OtHWNg+o8fWSFJkrol91
 Hen4gt8X3nZHkEtS+LDO7gCTvE4uMUKrRegyh4I/jwHe3yk12HbzUC2tlbk53bZ30CN5
 iUwg==
X-Gm-Message-State: AOAM5313Z1QT8WwI5tWxzGcWAy86t7o05HYiJVbqOZp8QiIW1zyS4LLx
 +0cRCZam6V9ZxnlJ1c2gnwy+ww==
X-Google-Smtp-Source: ABdhPJysVwdROePBJOBHfqVZsNmMgKIFUz8A/92IIFrXorKdw2rnpgGsgSkVi9rFUo9PRh0fU7DkJA==
X-Received: by 2002:a05:6402:322a:b0:42e:1778:1f1f with SMTP id
 g42-20020a056402322a00b0042e17781f1fmr25939031eda.115.1654538977200; 
 Mon, 06 Jun 2022 11:09:37 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 u21-20020a1709064ad500b006f3ef214e14sm6479764ejt.122.2022.06.06.11.09.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Jun 2022 11:09:36 -0700 (PDT)
Message-ID: <f2008676-c6d7-a5fd-7430-19e884c000e3@mind.be>
Date: Mon, 6 Jun 2022 20:09:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
To: Tim Hammer <Tim.Hammer@orolia.com>, Romain Naour
 <romain.naour@gmail.com>, Andreas Ziegler <br015@umbiko.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <mailman.2413.1654341347.130377.buildroot@buildroot.org>
 <190f6507af24e5ee5e8797fbfaa3b7e3@umbiko.net>
 <20220605090620.63a7375c@windsurf>
 <d6a1f4d7ec93800f240b7457984040b9@umbiko.net>
 <012501bd-2055-6850-f00a-40e73e5cfa25@gmail.com>
 <DU0P251MB077973A25F7238F7D310BBE3E3A29@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <DU0P251MB077973A25F7238F7D310BBE3E3A29@DU0P251MB0779.EURP251.PROD.OUTLOOK.COM>
Subject: Re: [Buildroot] ulog compilation issue with buildroot 2022.02.2
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
Cc: Herve Codina <herve.codina@bootlin.com>,
 Buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgpPbiAwNi8wNi8yMDIyIDE2OjI3LCBUaW0gSGFtbWVyIHdyb3RlOgo+IAo+IEdyZWV0aW5ncyBh
bGwgLQo+IAo+IE9uIFN1biwgSnVuIDA1LCAyMDIyIGF0IDA0OjAxOjE3UE0gKzAyMDAsIFJvbWFp
biBOYW91ciB3cm90ZToKPj4gSGVsbG8sCj4+Cj4+IExlIDA1LzA2LzIwMjIgw6AgMTM6NDYsIEFu
ZHJlYXMgWmllZ2xlciBhIMOpY3JpdMKgOgo+Pj4gSGkgVGhvbWFzLAo+Pj4KPj4+IE9uIDIwMjIt
MDYtMDUgMDc6MDYsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6Cj4+Pj4gSGVsbG8gQW5kcmVhcywK
Pj4+Pgo+Pj4+IE9uIFN1biwgMDUgSnVuIDIwMjIgMDY6MDU6MDkgKzAwMDAKPj4+PiBBbmRyZWFz
IFppZWdsZXIgPGJyMDE1QHVtYmlrby5uZXQ+IHdyb3RlOgo+Pj4+Cj4+Pj4+IFRoaXMgaXMgdGhl
IGVudmlyb25tZW50IHdoZW4gYWxjaGVteSBpcyBjYWxsZWQgZnJvbSBCdWlsZHJvb3Q6Cj4+Pj4+
Cj4+Pj4+IEFMQ0hFTVlfVEFSR0VUX0VOViA9IFwKPj4+Pj4gIMKgwqDCoMKgJChUQVJHRVRfTUFL
RV9FTlYpIFwKPj4+Pj4gIMKgwqDCoMKgQUxDSEVNWV9IT01FPSQoQUxDSEVNWV9IT01FKSBcCj4+
Pj4+ICDCoMKgwqDCoEFMQ0hFTVlfV09SS1NQQUNFX0RJUj0iJChARCkiIFwKPj4+Pj4gIMKgwqDC
oMKgQUxDSEVNWV9UQVJHRVRfT1VUPWFsY2hlbXktb3V0IFwKPj4+Pj4gIMKgwqDCoMKgUEtHQ09O
RklHX0JJTj0kKFBLR19DT05GSUdfSE9TVF9CSU5BUlkpIFwKPj4+Pj4gIMKgwqDCoMKgVEFSR0VU
X09TPWxpbnV4IFwKPj4+Pj4gIMKgwqDCoMKgVEFSR0VUX09TX0ZMQVZPVVI9YnVpbGRyb290IFwK
Pj4+Pj4gIMKgwqDCoMKgVEFSR0VUX0NST1NTPSIkKFRBUkdFVF9DUk9TUykiIFwKPj4+Pj4gIMKg
wqDCoMKgVEFSR0VUX0FSQ0g9eHh4IFwKPj4+Pj4gIMKgwqDCoMKgVEFSR0VUX0dMT0JBTF9DWFhG
TEFHUz0iJChUQVJHRVRfQ1hYRkxBR1MpIiBcCj4+Pj4+ICDCoMKgwqDCoFRBUkdFVF9HTE9CQUxf
TERGTEFHUz0iJChUQVJHRVRfTERGTEFHUykiIFwKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXiBMREZMQUdTIGFyZSB1c3VhbGx5IGVt
cHR5Cj4+Pj4+ICDCoMKgwqDCoFRBUkdFVF9HTE9CQUxfRkZMQUdTPSIkKFRBUkdFVF9GQ0ZMQUdT
KSIgXAo+Pj4+PiAgwqDCoMKgwqBUQVJHRVRfR0xPQkFMX0ZDRkxBR1M9IiQoVEFSR0VUX0ZDRkxB
R1MpIgo+Pj4+Pgo+Pj4+PiBBbGNoZW15IGFkZHMgbW9yZSBzZXR0aW5ncyB0byBMREZMQUdTLCB0
aGlzIGlzIHRoZSBmaW5hbCBjb250ZW50Ogo+Pj4+Pgo+Pj4+PiArIFRBUkdFVF9HTE9CQUxfTERG
TEFHUyA9IC1PMiAtV2wsLU8xCj4+Pj4+IC1MYWxjaGVteS1vdXQvc3RhZ2luZy9saWIvYXJtLWxp
bnV4LWdudWVhYmloZiAtTGFsY2hlbXktb3V0L3N0YWdpbmcvbGliCj4+Pj4+IC1MYWxjaGVteS1v
dXQvc3RhZ2luZy91c3IvbGliL2FybS1saW51eC1nbnVlYWJpaGYKPj4+Pj4gLUxhbGNoZW15LW91
dC9zdGFnaW5nL3Vzci9saWIKPj4+Pj4gLVdsLC1ycGF0aC1saW5rPWFsY2hlbXktb3V0L3N0YWdp
bmcvbGliL2FybS1saW51eC1nbnVlYWJpaGYKPj4+Pj4gLVdsLC1ycGF0aC1saW5rPWFsY2hlbXkt
b3V0L3N0YWdpbmcvbGliCj4+Pj4+IC1XbCwtcnBhdGgtbGluaz1hbGNoZW15LW91dC9zdGFnaW5n
L3Vzci9saWIvYXJtLWxpbnV4LWdudWVhYmloZgo+Pj4+PiAtV2wsLXJwYXRoLWxpbms9YWxjaGVt
eS1vdXQvc3RhZ2luZy91c3IvbGliCj4+Pj4+Cj4+Pj4+IEFkZGluZyB0aGUgQnVpbGRyb290IHN0
YWdpbmcgbGlicmFyeSBwYXRoIHRvIExERkxBR1MgbWFrZXMgdGhlIGJ1aWxkCj4+Pj4+IHN1Y2Nl
ZWQ6Cj4+Pj4+Cj4+Pj4+ICDCoMKgwqDCoC4uLgo+Pj4+PiAgwqDCoMKgwqBUQVJHRVRfR0xPQkFM
X0xERkxBR1M9IiQoVEFSR0VUX0xERkxBR1MpIC1MJChTVEFHSU5HX0RJUikvdXNyL2xpYiIgXAo+
Pj4+Cj4+Pj4gVGhhbmtzIGZvciB5b3VyIGludmVzdGlnYXRpb24hCj4+Pj4KPj4+PiAtTCQoU1RB
R0lOR19ESVIpL3Vzci9saWIgc2hvdWxkIG5vcm1hbGx5IG5vdCBiZSBuZWVkZWQsIGJlY2F1c2UK
Pj4+PiAkKFNUQUdJTkdfRElSKS91c3IvbGliIGlzIGluIHRoZSBkZWZhdWx0IHNlYXJjaCBwYXRo
IG9mIHRoZQo+Pj4+IGNyb3NzLWNvbXBpbGVyLCBhcyB0aGUgY29tcGlsZXIgaGFzICQoU1RBR0lO
R19ESVIpL3VzciBhcyBpdHMgc3lzcm9vdC4KPj4+Pgo+Pj4+IFNvIGZyb20gYSBjcm9zcy1jb21w
aWxlciBwZXJzcGVjdGl2ZSwgLUwkKFNUQUdJTkdfRElSKS91c3IvbGliIHNob3VsZAo+Pj4+IG5v
cm1hbGx5IG5vdCBiZSBuZWVkZWQsIGFuZCB0aGF0J3Mgd2h5IGl0J3Mgbm90IGluICQoVEFSR0VU
X0xERkxBR1MpLgo+Pj4KPj4+IEFuZCBzeXNyb290IGlzIGRldGVjdGVkIGJ5IGFsY2hlbXk6Cj4+
Pgo+Pj4gKyBUQVJHRVRfVE9PTENIQUlOX1NZU1JPT1QgPQo+Pj4gL2hvbWUvZGF0YS90ZXN0L2F1
dG9idWlsZC9ob3N0L2FybS1idWlsZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QKPj4KPj4g
WWVzIGJ1dCBhbGNoZW15IHRyeSB0byBjb3B5IHNvbWUgZmlsZXMgZnJvbSBzdGFnaW5nIGRpcmVj
dG9yeSB0bwo+PiB1bG9nL2FsY2hlbXktb3V0L3N0YWdpbmcKPj4KPiAKPiBBbmQgaXQgc2VlbXMg
dGhhdCB0aGUgZmlsZXMgY29waWVkIGlzIGRpZmZlcmVudCBiZXR3ZWVuIHRoZSB3b3JraW5nICh3
L28gc3lzdGVtZCkKPiBhbmQgbm9uLXdvcmtpbmcgKHcvIHN5c3RlbWQpIGJ1aWxkcy4KPiAKPiBM
b29raW5nIGF0IHN5c3Jvb3QgaW4gYSB3b3JraW5nIGJ1aWxkLCBpdCBvbmx5IGNvcGllcyB0aGUg
dHdvIGZpbGVzIGZyb20gdGhlIGxpYi8gZGlyZWN0b3J5Ogo+ICAgICAgLi9ob3N0L2FybS1idWls
ZHJvb3QtbGludXgtZ251ZWFiaWhmL3N5c3Jvb3QvdXNyL2xpYi9saWJwdGhyZWFkX25vbnNoYXJl
ZC5hCj4gICAgICAuL2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91
c3IvbGliL2xpYnB0aHJlYWQuc28KPiAgICAgIC4vaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdu
dWVhYmloZi9zeXNyb290L3Vzci9saWIvbGlicHRocmVhZC5hCj4gICAgICAuL2hvc3QvYXJtLWJ1
aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC9saWIvbGlicHRocmVhZC0yLjI1LnNvCj4g
ICAgICAuL2hvc3QvYXJtLWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC9saWIvbGli
cHRocmVhZC5zby4wCj4gCj4gV2hlcmVhcyBpbiB0aGUgbm9uLXdvcmtpbmcgYnVpbGQsIHRoZSBm
aWxlcyBhcmUgYWxsIGluIHRoZSB1c3IvbGliLyBkaXJlY3Rvcnk6Cj4gICAgICAuL2hvc3QvYXJt
LWJ1aWxkcm9vdC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3IvbGliL2xpYnB0aHJlYWRfbm9u
c2hhcmVkLmEKPiAgICAgIC4vaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNy
b290L3Vzci9saWIvbGlicHRocmVhZC0yLjI1LnNvCj4gICAgICAuL2hvc3QvYXJtLWJ1aWxkcm9v
dC1saW51eC1nbnVlYWJpaGYvc3lzcm9vdC91c3IvbGliL2xpYnB0aHJlYWQuc28KPiAgICAgIC4v
aG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290L3Vzci9saWIvbGlicHRo
cmVhZC5hCj4gICAgIC4vaG9zdC9hcm0tYnVpbGRyb290LWxpbnV4LWdudWVhYmloZi9zeXNyb290
L3Vzci9saWIvbGlicHRocmVhZC5zby4wCj4gCj4gSW4gdGhpcyBjYXNlLCBpdCBhbHNvIGNvcGll
cyB0aGUgbGlicHRocmVhZC5zbyBmaWxlIHdoaWNoIGlzIGFuIGxkIHNjcmlwdCB3aGVyZSBJIHRo
aW5rIGl0Cj4gaXMgZ2V0dGluZyB0aGUgYmFkIHBhdGg6Cj4gICAgICAvKiBHTlUgbGQgc2NyaXB0
Cj4gICAgICAgICBVc2UgdGhlIHNoYXJlZCBsaWJyYXJ5LCBidXQgc29tZSBmdW5jdGlvbnMgYXJl
IG9ubHkgaW4KPiAgICAgICAgIHRoZSBzdGF0aWMgbGlicmFyeSwgc28gdHJ5IHRoYXQgc2Vjb25k
YXJpbHkuICAqLwo+ICAgICAgT1VUUFVUX0ZPUk1BVChlbGYzMi1saXR0bGVhcm0pCj4gICAgICBH
Uk9VUCAoIC9saWIvbGlicHRocmVhZC5zby4wIC91c3IvbGliL2xpYnB0aHJlYWRfbm9uc2hhcmVk
LmEgKQoKICBXaXRoIHN5c3RlbWQsIHlvdSBhdXRvbWF0aWNhbGx5IGdldCBCUjJfUk9PVEZTX01F
UkdFRF9VU1IsIHdoaWNoIG1lYW5zIHRoYXQgCi9saWIgaXMgYSBzeW1saW5rIHRvIC91c3IvbGli
LiBTbyAvbGliL2xpYnB0aHJlYWQuc28uMCBzaG91bGQgc3RpbGwgYmUgYSBjb3JyZWN0IApwYXRo
LgoKCj4gSXMgdGhlcmUgc29tZXRoaW5nIGluIHRoZSBzeXN0ZW1kIGNvbmZpZ3VyYXRpb24vYnVp
bGQgdGhhdCBpcyBjcmVhdGluZyB0aGlzIHNjcmlwdAo+IGZpbGU/CgogIE5vLCBpdCdzIG5vcm1h
bCB0aGF0IGxpYnB0aHJlYWQuc28gaXMgYSBsaW5rZXIgc2NyaXB0LiBJdCBnZXRzIGluc3RhbGxl
ZCBpbiAKL2xpYiBieSBnbGliYyAtIGJ1dCB3aXRoIHN5c3RlbWQsIHNpbmNlIC9saWIgaXMgYSBz
eW1saW5rIHRvIC91c3IvbGliLCBpdCBlbmRzIAp1cCB0aGVyZS4KCgogIEkgY2FuJ3QgZmluZCBi
YWNrIHRoZSBvcmlnaW5hbCBpc3N1ZSwgYnV0IEkgc3VzcGVjdCB0aGUgcHJvYmxlbSBpcyB0aGF0
IAp1bG9nL2FsY2hlbXkgY2FsbHMgbGQgZGlyZWN0bHkgKGkuZS4gbm90IGdjYyksIHdoaWNoIGJ5
cGFzc2VzIHRoZSB0b29sY2hhaW4gCndyYXBwZXIgYW5kIHRoZXJlZm9yZSBieXBhc3NlcyB0aGUg
c2V0dGluZyBvZiBzeXNyb290LiBBbHRob3VnaCB0aGF0IGRvZXNuJ3QgCmV4cGxhaW4gd2h5IGl0
IHdvdWxkIHdvcmsgb24gbm9uLXN5c3RlbWQgKG9yIG5vbi1tZXJnZWQtdXNyKS4uLgoKICBSZWdh
cmRzLAogIEFybm91dAoKPiAKPiAKPiAuVGltCj4gVGltIEQuIEhhbW1lcgo+IHRpbS5oYW1tZXJA
b3JvbGlhLmNvbQo+IAo+IAo+PiBTZWUgX2xpYmNfaW5zdGFsbGVkX2ZpbGUgdGFyZ2V0IGluIG91
dHB1dC9ob3N0L29wdC9hbGNoZW15L3Rvb2xjaGFpbnMvbGliYy5tay4KPj4KPj4gSWYgd2UgaGFj
ayBpbnRvIF9saWJjX2luc3RhbGxlZF9maWxlIHJ1bGUgdG8gbm90IGNvcHkgYW55IGZpbGVzIGZy
b20gc3RhZ2luZywKPj4gdGhlIGJ1aWxkIHN1Y2NlZWQuCj4+Cj4+Pgo+Pj4+IEFsc28sIHRoZXJl
IGlzIGEgY3VyaW91cyB0aGluZyBpbiB0aGUgcmVwb3J0IGZyb20gTmljb2xhczogdGhlIGVycm9y
Cj4+Pj4gaGFwcGVucyB3aGVuIHN5c3RlbWQgaXMgZW5hYmxlZCwgYnV0IGRvZXNuJ3QgaGFwcGVu
IHdoZW4gc3lzdGVtZCBpcwo+Pj4+IGRpc2FibGVkLgo+Pj4KPj4+IEkgY2FuIGNvbmZpcm0gdGhp
cy4gQWRkaW5nIEJSMl9JTklUX1NZU1RFTUQ9eSBicmVha3MgdGhlIGJ1aWxkICh1c2luZyBtYWtl
IGNsZWFuCj4+PiAmJiBtYWtlIHVsb2cpLgo+Pgo+PiBJIGRpZCBhIHRyeSB3aXRob3V0IHN5c3Rl
bWQgYnV0IHRoZSBidWlsZCBmYWlsZWQuCj4+Cj4+IEJlc3QgcmVnYXJkcywKPj4gUm9tYWluCj4+
Cj4+Cj4+Pgo+Pj4gS2luZCByZWdhcmRzLAo+Pj4gQW5kcmVhcwo+Pj4KPj4+PiBUaG9tYXMKPj4+
PiAtLSAKPj4+PiBUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCj4+
Pj4gRW1iZWRkZWQgTGludXggYW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKPj4+
PiBodHRwczovL2Jvb3RsaW4uY29tCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+Pj4gYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo+Pgo+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4+IGJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
