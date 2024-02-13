Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E499DC4829A
	for <buildroot@archiver.kernel.org>; Tue, 13 Feb 2024 16:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6362060C27;
	Tue, 13 Feb 2024 16:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoSACqqkfc1h; Tue, 13 Feb 2024 16:43:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 27F9160C08
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27F9160C08;
	Tue, 13 Feb 2024 16:43:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 349101BF34C
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 16:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E80B415B9
 for <buildroot@lists.busybox.net>; Tue, 13 Feb 2024 16:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8SciluqemKx for <buildroot@lists.busybox.net>;
 Tue, 13 Feb 2024 16:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E5B24415B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E5B24415B7
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E5B24415B7
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 16:43:33 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2d090c83d45so60428401fa.3
 for <buildroot@buildroot.org>; Tue, 13 Feb 2024 08:43:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707842611; x=1708447411;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qup9/pnlAU9cS3VoJn3phn8uwPwDzNng2ENb4YluzPg=;
 b=gjm5XT92W+9wp8qRFaFZwvM+tkkyNIVwQgpBXZzGcH3Noh+z7r7DMTeIa5YYy8fyM/
 INlsHf9Nar+JImzn6U5DMVjM8kyd1XPG8MSZ/EiJKejqVS9I7qSTe+/LZjL9W2zu4FRL
 W08fSisLOZGI3Aeg+ouVg5HD1ZoCbiW3UXH/C26o7FRollXbEymxRDG0hGIRcDnH1rlf
 98We1n62FBFNHcLFTIUmUtmKXqAiFcMM7xVVpPMdoW8OfoVRTMPuMdsZfThBm/WndPe9
 uoB6eEvLS2gFL+eYvspExd0x0/mCC9r5kKubBuiqSLLK7bK1/wXArF+oleeQNf4nKsOS
 6r8g==
X-Gm-Message-State: AOJu0YyqL6rSRcNM28qVvA4MXOJjvlKvN3Y0vCTk8pI/9rVQBqCPa4fl
 W0RzeSgD6mTf4ClNl4U4SUUcYwrXCjiY2okzveR3yq3TijFDpgi8dU/ACLhQXUc=
X-Google-Smtp-Source: AGHT+IF7FcjUsao4MpDZ0xg3/46xuLexr/RAzltU9kRBbZxZlGb4+TiXpLm9ZvL1S0oiiRN5c9QfFQ==
X-Received: by 2002:a2e:98c3:0:b0:2d0:d609:d2 with SMTP id
 s3-20020a2e98c3000000b002d0d60900d2mr136291ljj.5.1707842611201; 
 Tue, 13 Feb 2024 08:43:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXr7Prtc7aKwalIYsYwW0U4hEs4YW51bdjALCyX3BUg3i1D6VV0H7HkTFdxNF6miRXF/ZaqNy3AQ+v4Ks91EhYuhzXqy+1DnszJygobM1LfJt/zAmjk2E2rVAUnE78FP5I/WdAqdJ/UhRnCq5J0pR9E6kNS8YvGTKk6AaizdVR2/YglsCdXvZEdkuSQeyd9OaKs6OJLQtpx3JZhnO4ZYe873QohaE0V/TBAIULdwqsiTakP2x58AoYxILWRF9vhqSlNtOHqYhKkax7Fg1Y9XVsO/ytAm/OSk/HpPR8cRpocrx5Ja2he7Z8/VCIS/EQrJl/yzVmszenLSg==
Received: from ?IPV6:2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31?
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 jw21-20020a05600c575500b004101543e843sm12069235wmb.10.2024.02.13.08.43.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 08:43:30 -0800 (PST)
Message-ID: <626bdd42-18ae-4d6a-90d8-b7c9b84bf966@smile.fr>
Date: Tue, 13 Feb 2024 17:43:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: fr
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20231218081958.506691-1-dario.binacchi@amarulasolutions.com>
 <20231218081958.506691-3-dario.binacchi@amarulasolutions.com>
 <bfe1b04f-2f7c-4e3f-b6ce-d96d84905160@smile.fr>
 <3d674bd1-a53f-4f82-93c1-58cbe14ab1db@smile.fr>
 <CABGWkvoQEN81R6Z0S-c9CX1S+BAt_LPjk=pS6-ZsV3_sXhd1FQ@mail.gmail.com>
From: Romain Naour <romain.naour@smile.fr>
In-Reply-To: <CABGWkvoQEN81R6Z0S-c9CX1S+BAt_LPjk=pS6-ZsV3_sXhd1FQ@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1707842611; x=1708447411;
 darn=buildroot.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qup9/pnlAU9cS3VoJn3phn8uwPwDzNng2ENb4YluzPg=;
 b=RaswSfyiBCcXkJkS45qyXgyQpbxwcO6mS4qExky07vWfyQ5Wtg6dR12AuF+R5LcbZg
 LNVF56xx7dAq8QK5s/6WHrNqKsWQUbRni0k2ZlXiureWWSDfAW7fQszD0nJAi2myI744
 wam1SunOrpx2IxHDEJTB7Zxrh/YYS6PijkouO1oZ0UTXoXCl9R0QH5kjsX8/eM4vcQVp
 jojVifebPHL4UAjMgAf0cuGCHZY4FtysblLiW8F/adrG+3OVi/D5zBtuuSV2PiE/HSrk
 DBlK9k7Z8l2kukpU+V/Uu5dpC82jq1q0G3KHJO1DkD/eQxBxEwqCtei+LJsCAVwXUxsm
 q4Eg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=RaswSfyi
Subject: Re: [Buildroot] [PATCH v3 02/11] boot/ti-k3-image-gen: manage HS
 hardware
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
Cc: Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 bryce@redpinelabs.com, Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGFyaW8sCgpMZSAwOS8wMi8yMDI0IMOgIDE0OjU4LCBEYXJpbyBCaW5hY2NoaSBhIMOp
Y3JpdMKgOgo+IEhpIFJvbWFpbiwgQWxsCj4gCj4gT24gV2VkLCBGZWIgNywgMjAyNCBhdCAxMTow
NOKAr0FNIFJvbWFpbiBOYW91ciA8cm9tYWluLm5hb3VyQHNtaWxlLmZyPiB3cm90ZToKPj4KPj4g
SGVsbG8gRGFyaW8sIEFsbCwKPj4KPj4gTGUgMDYvMDIvMjAyNCDDoCAxODo1MCwgUm9tYWluIE5h
b3VyIGEgw6ljcml0IDoKPj4+IEhlbGxvIERhcmlvLAo+Pj4KPj4+IExlIDE4LzEyLzIwMjMgw6Ag
MDk6MTksIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0IDoKPj4+PiBUaGUgcGF0Y2ggc2V0cyB0aGUg
Y29uZmlndXJhdGlvbnMgcmVxdWlyZWQgYnkgVEkgSFMgc3lzdGVtcy4gU29tZSBvZiB0aGVzZQo+
Pj4+IGNvbmZpZ3VyYXRpb25zIChpLiBlLiBIUyBTWVNGVyBpbWFnZSBzaWduaW5nIGtleSwgSFMg
U29mdHdhcmUgUmV2aXNpb24pCj4+Pj4gYXJlIHByb3ZpZGVkIGJ5IHRoZSB0aS1rMy1jb3JlLXNl
Y2RldiBwYWNrYWdlIGluIHRoZSBiaW5hcmllcyBkaXJlY3RvcnkuCj4+Pgo+Pj4gQUZBSUsgdGhl
IHRpLWszLWltYWdlLWdlbiB0b29sIGlzIGRlcHJlY2F0ZWQgYW5kIG11c3QgYmUgcmVwbGFjZWQg
YnkgYmlubWFuIHRvb2wKPj4+IHByb3ZpZGVkIGJ5IHVwc3RyZWFtIHUtYm9vdC4KPj4+Cj4+PiBJ
cyBhbGwgazMgU29DIG1pZ3JhdGVkIHRvIGJpbm1hbiBpbiB0aGUgbGF0ZXN0IHUtYm9vdCByZWxl
YXNlIDIwMjQuMDE/Cj4+Pgo+Pj4gU2VlIHRoZSBGT1NERU0gdGFsazoKPj4+Cj4+PiBodHRwczov
L2Zvc2RlbS5vcmcvMjAyNC9ldmVudHMvYXR0YWNobWVudHMvZm9zZGVtLTIwMjQtMzA2Ny1zdGFu
ZGFyZGl6aW5nLXRoZS1nZW5lcmF0aW9uLWFuZC1zaWduaW5nLW9mLWJvb3QtaW1hZ2VzL3NsaWRl
cy8yMTkxOS9GT1NERU0yNF9TcGVha2VyX1NsaWRlc195N0ZzSUtNLnBkZgo+Pj4KPj4+IEJlc3Qg
cmVnYXJkcywKPj4+IFJvbWFpbgo+Pj4KPj4+Cj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBEYXJp
byBCaW5hY2NoaSA8ZGFyaW8uYmluYWNjaGlAYW1hcnVsYXNvbHV0aW9ucy5jb20+Cj4+Pj4gLS0t
Cj4+Pj4gIGJvb3QvdGktazMtaW1hZ2UtZ2VuL0NvbmZpZy5pbiAgICAgICAgICB8ICAxICsKPj4+
PiAgYm9vdC90aS1rMy1pbWFnZS1nZW4vdGktazMtaW1hZ2UtZ2VuLm1rIHwgMTYgKysrKysrKysr
KysrKystLQo+Pj4+ICAyIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4+Pj4KPj4+PiBkaWZmIC0tZ2l0IGEvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmln
LmluIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4+Pj4gaW5kZXggZDc2Y2VmODJl
OTExLi4zOGQxNTk4ZDlmYzAgMTAwNjQ0Cj4+Pj4gLS0tIGEvYm9vdC90aS1rMy1pbWFnZS1nZW4v
Q29uZmlnLmluCj4+Pj4gKysrIGIvYm9vdC90aS1rMy1pbWFnZS1nZW4vQ29uZmlnLmluCj4+Pj4g
QEAgLTIsNiArMiw3IEBAIGNvbmZpZyBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTgo+Pj4+ICAg
ICAgYm9vbCAidGktazMtaW1hZ2UtZ2VuIgo+Pj4+ICAgICAgZGVwZW5kcyBvbiBCUjJfVEFSR0VU
X1RJX0szX1I1X0xPQURFUgo+Pj4+ICAgICAgc2VsZWN0IEJSMl9UQVJHRVRfVElfSzNfQk9PVF9G
SVJNV0FSRQo+Pj4+ICsgICAgc2VsZWN0IEJSMl9UQVJHRVRfVElfSzNfQ09SRV9TRUNERVYgaWYg
QlIyX1RBUkdFVF9USV9LM19JTUFHRV9HRU5fU0VDVFlQRV9IU19GUyB8fCBCUjJfVEFSR0VUX1RJ
X0szX0lNQUdFX0dFTl9TRUNUWVBFX0hTCj4+Cj4+IERvZXMgaXQgbWVhbnMgdGhhdCBjdXJyZW50
bHkgVEkgSFMgY29uZmlndXJhdGlvbiBhcmUgbWlzc2luZyB0aGUKPj4gdGktazMtY29yZS1zZWNk
ZXYgdG9vbCB0byBidWlsZCBwcm9wZXJseT8KPiAKPiBZZXMsIHlvdSBhcmUgcmlnaHQuIEN1cnJl
bnRseSwgdGhlIGNvbXBpbGF0aW9uIHdpdGgKPiBCUjJfVEFSR0VUX1RJX0szX0lNQUdFX0dFTl9T
RUNUWVBFX0hTX0ZTIGVuYWJsZWQgaXMgYnJva2VuOgo+IAo+IC4vdG9vbHMvazNfZ2VuX3g1MDlf
Y2VydC5zaCAtYyAxNiAtYiBzcGwvdS1ib290LXNwbC5iaW4gXAo+IC1vIHRpYm9vdDMuYmluIC1s
IDB4NDNjMDAwMDAgLXIgMSAtayAiIgo+ICBTV1JWID0gMQo+Pj4+IHRpLWszLXI1LWxvYWRlciAy
MDIyLjEwIEluc3RhbGxpbmcgdG8gdGFyZ2V0Cj4+Pj4gdGktazMtcjUtbG9hZGVyIDIwMjIuMTAg
SW5zdGFsbGluZyB0byBpbWFnZXMgZGlyZWN0b3J5Cj4gY3AgL2hvbWUvZGFyaW8vcHJvamVjdHMv
YnVpbGRyb290L291dHB1dC9idWlsZC90aS1rMy1yNS1sb2FkZXItMjAyMi4xMC9zcGwvdS1ib290
LXNwbC5iaW4KPiAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2ltYWdlcy9y
NS11LWJvb3Qtc3BsLmJpbgo+IGszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcudGFyLmd6OiBPSyAo
c2hhMjU2Ogo+IGY4OWVhNGIxZjVjOTkyNDU1YjFhNjgyZmRlNDgzNTkyMjFiNTNmMzI5NDEzNWRm
NGJmMjBmZWVhNmFlYTkwZTQpCj4+Pj4gdGktazMtaW1hZ2UtZ2VuIDA4LjA2LjAwLjAwNyBFeHRy
YWN0aW5nCj4gZ3ppcCAtZCAtYyAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3QvZGwvdGkt
azMtaW1hZ2UtZ2VuL2szLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcudGFyLmd6Cj4gfCB0YXIgLS1z
dHJpcC1jb21wb25lbnRzPTEgLUMKPiAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0
cHV0L2J1aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcKPiAgIC14ZiAtCj4+Pj4gdGkt
azMtaW1hZ2UtZ2VuIDA4LjA2LjAwLjAwNyBQYXRjaGluZwo+Pj4+IHRpLWszLWltYWdlLWdlbiAw
OC4wNi4wMC4wMDcgQ29uZmlndXJpbmcKPiBjcCAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJv
b3Qvb3V0cHV0L2ltYWdlcy90aS1zeXNmdy90aS1mcy1maXJtd2FyZS1hbTYyeC1ocy1mcy5iaW4K
PiAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJvb3Qvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdl
LWdlbi0wOC4wNi4wMC4wMDcKPiBjcDogY2Fubm90IHN0YXQKPiAnL2hvbWUvZGFyaW8vcHJvamVj
dHMvYnVpbGRyb290L291dHB1dC9pbWFnZXMvdGktc3lzZncvdGktZnMtZmlybXdhcmUtYW02Mngt
aHMtZnMuYmluJzoKPiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5Cj4gbWFrZVsxXTogKioqIFtw
YWNrYWdlL3BrZy1nZW5lcmljLm1rOjI3MzoKPiAvaG9tZS9kYXJpby9wcm9qZWN0cy9idWlsZHJv
b3Qvb3V0cHV0L2J1aWxkL3RpLWszLWltYWdlLWdlbi0wOC4wNi4wMC4wMDcvLnN0YW1wX2NvbmZp
Z3VyZWRdCj4gRXJyb3IgMQo+IG1ha2U6ICoqKiBbTWFrZWZpbGU6ODI6IF9hbGxdIEVycm9yIDIK
PiAKPiBXaGF0IGRvIHlvdSB0aGluayBpZiwgZm9yIHRoaXMgc2VyaWVzLCBJIGZpeCB0aGUgY29t
cGlsYXRpb24gaXNzdWUgZm9yCj4gSFMgY29uZmlndXJhdGlvbnMgYnkgY29udGludWluZyB0byB1
c2UgdGhlIGB0aS1rMy1pbWFnZS1nZW5gIHBhY2thZ2UsCj4gYW5kIHRoZW4KPiBvbmNlIHRoZSBz
ZXJpZXMgaXMgbWVyZ2VkLCBJIHRyeSBhbmQgdGVzdCB0aGUgdGhlIGJ1bXAgb2YgdS1ib290IHRv
Cj4gdmVyc2lvbiAyMDI0LjAxIHRvIHNlZSBpZiBpdCBpcyBpbmRlZWQgcG9zc2libGUgdG8gZG8g
d2l0aG91dAo+IGB0aS1rMy1pbWFnZS1nZW5gPwo+IE1lYW53aGlsZSwgbGV0J3MgYXQgbGVhc3Qg
Zml4IHRoaXMgcHJvYmxlbSBpbW1lZGlhdGVseS4KCkknbSB3b3JraW5nIG9uIHRoZSBTSy1UREE0
Vk0gKGo3MjFlKSBhbmQgSSdtIGFibGUgdG8gYm9vdCB0aGlzIGJvYXJkIHdpdGggdWJvb3QKMjAy
NC4wMSB3aXRob3V0IHRpLWszLWltYWdlLWdlbi4KCkknbGwgcG9zdCBhIHY0IGluY2x1ZGluZyBi
aW5tYW4gc3VwcG9ydCB3aXRoIHNvbWUgaW1wcm92ZW1lbnQgcmVnYXJkaW5nCmhvc3QtcHl0aG9u
IG1vZHVsZXMgZGVwZW5kZW5jaWVzLgoKQWJvdXQgZXhpc3RpbmcgYW02MiBhbmQgYW02NCBkZWZj
b25maWdzLCBhcmUgeW91IHN1cmUgdGhhdCBvcHRlZS1vcyBwbGF0Zm9ybSBpcwpjb3JyZWN0ID8K
CkJSMl9UQVJHRVRfT1BURUVfT1NfUExBVEZPUk09ImszIgoKbWV0YS10aSBkZWZpbmUgT1BURUVN
QUNISU5FID0gImszLWFtNjJ4IiBpbnN0ZWFkIChub3QgImszKQoKSSBoYWQgYSBjcmFzaCBvbiB0
aGUgU0stVERBNFZNIGR1ZSB0byB0aGUgd3JvbmcgcGxhdGZvcm0gYW5kIGl0IHdvcmtlZCBhcyBz
b29uZQphcyBJIHVzZSBPUFRFRU1BQ0hJTkUgPSAiazMtajcyMWUiLgoKSXQgd291bGQgYmUgZ3Jl
YXQgaWYgeW91IGNhbiBkbyBhIHJ1bnRpbWUgdGVzdCBvbiBhbTYyIGFuZC9vciBhbTY0LgoKVGhh
bmtzIHRvIGJpbm1hbiwgSSBkb24ndCB0aGluayBjb3JlLXNlY2Rldi1rMyB0b29sIGlzIHJlcXVp
cmVkIGZvciBIUyBkZXZpY2VzLgoKQmVzdCByZWdhcmRzLApSb21haW4KCgo+IAo+IFRoYW5rcyBh
bmQgcmVnYXJkcywKPiBEYXJpbwo+IAo+Pgo+PiBJdCBzZWVtcyB0aGlzIHBhdGNoIHNob3VsZCBm
aXhlcyB0aGVtLgo+Pgo+PiBCZXN0IHJlZ2FyZHMsCj4+IFJvbWFpbgo+Pgo+Pj4+ICAgICAgIyBX
ZSBuZWVkIEZJVCBzdXBwb3J0IGluIHVib290LXRvb2xzLCB3aGljaCBpcyB3aHkgd2Ugc2VsZWN0
IGEKPj4+PiAgICAgICMgaG9zdCBwYWNrYWdlCj4+Pj4gICAgICBzZWxlY3QgQlIyX1BBQ0tBR0Vf
SE9TVF9VQk9PVF9UT09MUwo+Pj4+IGRpZmYgLS1naXQgYS9ib290L3RpLWszLWltYWdlLWdlbi90
aS1rMy1pbWFnZS1nZW4ubWsgYi9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4u
bWsKPj4+PiBpbmRleCA2NGJlOWExOGYyYzQuLjkxYWVkNjNiYWI4NCAxMDA2NDQKPj4+PiAtLS0g
YS9ib290L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsKPj4+PiArKysgYi9ib290
L3RpLWszLWltYWdlLWdlbi90aS1rMy1pbWFnZS1nZW4ubWsKPj4+PiBAQCAtMjksMTAgKzI5LDIx
IEBAIFRJX0szX0lNQUdFX0dFTl9GV19UWVBFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRf
VElfSzNfSU1BR0VfR0VOX0ZXX1RZUEUpKQo+Pj4+ICBUSV9LM19JTUFHRV9HRU5fU09DID0gJChj
YWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfSU1BR0VfR0VOX1NPQykpCj4+Pj4gIFRJX0sz
X0lNQUdFX0dFTl9TRUNUWVBFID0gJChjYWxsIHFzdHJpcCwkKEJSMl9UQVJHRVRfVElfSzNfSU1B
R0VfR0VOX1NFQ1RZUEUpKQo+Pj4+Cj4+Pj4gLVRJX0szX0lNQUdFX0dFTl9TWVNGVyA9ICQoVElf
SzNfSU1BR0VfR0VOX0ZXX1RZUEUpLWZpcm13YXJlLSQoVElfSzNfSU1BR0VfR0VOX1NPQyktJChU
SV9LM19JTUFHRV9HRU5fU0VDVFlQRSkuYmluCj4+Pj4gK2lmZXEgKCQoQlIyX1RBUkdFVF9USV9L
M19JTUFHRV9HRU5fU0VDVFlQRV9HUCkseSkKPj4+PiArVElfSzNfSU1BR0VfR0VOX1NZU0ZXID0g
XAo+Pj4+ICsgICAgJChUSV9LM19JTUFHRV9HRU5fRldfVFlQRSktZmlybXdhcmUtJChUSV9LM19J
TUFHRV9HRU5fU09DKS0kKFRJX0szX0lNQUdFX0dFTl9TRUNUWVBFKS5iaW4KPj4+PiArZWxzZQo+
Pj4+ICtUSV9LM19JTUFHRV9HRU5fREVQRU5ERU5DSUVTICs9IHRpLWszLWNvcmUtc2VjZGV2Cj4+
Pj4gKwo+Pj4+ICtUSV9LM19JTUFHRV9HRU5fU1lTRlcgPSBcCj4+Pj4gKyAgICAkKFRJX0szX0lN
QUdFX0dFTl9GV19UWVBFKS1maXJtd2FyZS0kKFRJX0szX0lNQUdFX0dFTl9TT0MpLSQoVElfSzNf
SU1BR0VfR0VOX1NFQ1RZUEUpLWVuYy5iaW4gXAo+Pj4+ICsgICAgJChUSV9LM19JTUFHRV9HRU5f
RldfVFlQRSktZmlybXdhcmUtJChUSV9LM19JTUFHRV9HRU5fU09DKS0kKFRJX0szX0lNQUdFX0dF
Tl9TRUNUWVBFKS1jZXJ0LmJpbgo+Pj4+ICtlbmRpZgo+Pj4+Cj4+Pj4gIGRlZmluZSBUSV9LM19J
TUFHRV9HRU5fQ09ORklHVVJFX0NNRFMKPj4+PiAtICAgIGNwICQoQklOQVJJRVNfRElSKS90aS1z
eXNmdy8kKFRJX0szX0lNQUdFX0dFTl9TWVNGVykgJChARCkKPj4+PiArICAgICQoZm9yZWFjaCB0
LCQoVElfSzNfSU1BR0VfR0VOX1NZU0ZXKSxcCj4+Pj4gKyAgICAgICAgICAgIGNwICQoQklOQVJJ
RVNfRElSKS90aS1zeXNmdy8kKHQpICQoQEQpLwo+Pj4+ICsgICAgKQo+Pj4+ICBlbmRlZgo+Pj4+
Cj4+Pj4gIGRlZmluZSBUSV9LM19JTUFHRV9HRU5fQlVJTERfQ01EUwo+Pj4+IEBAIC00MCw2ICs1
MSw3IEBAIGRlZmluZSBUSV9LM19JTUFHRV9HRU5fQlVJTERfQ01EUwo+Pj4+ICAgICAgJChCUjJf
TUFLRSkgLUMgJChARCkgXAo+Pj4+ICAgICAgICAgICAgICBTT0M9JChUSV9LM19JTUFHRV9HRU5f
U09DKSBcCj4+Pj4gICAgICAgICAgICAgIFNPQ19UWVBFPSQoVElfSzNfSU1BR0VfR0VOX1NFQ1RZ
UEUpIFwKPj4+PiArICAgICAgICAgICAgVElfU0VDVVJFX0RFVl9QS0c9JChCSU5BUklFU19ESVIp
IFwKPj4+PiAgICAgICAgICAgICAgQ09ORklHPWV2bSBcCj4+Pj4gICAgICAgICAgICAgIENST1NT
X0NPTVBJTEU9JChIT1NUX0RJUikvYmluL2FybS1ub25lLWVhYmktIFwKPj4+PiAgICAgICAgICAg
ICAgU0JMPSQoQklOQVJJRVNfRElSKS9yNS11LWJvb3Qtc3BsLmJpbiBcCj4+Pgo+Pgo+IAo+IAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
