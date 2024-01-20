Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486BEC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 08:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC7160E6D;
	Sat, 20 Jan 2024 08:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEC7160E6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xGFGHLdtjiJu; Sat, 20 Jan 2024 08:10:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3160F60B0D;
	Sat, 20 Jan 2024 08:10:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3160F60B0D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AB3901BF32E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FB2C60B0D
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 08:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FB2C60B0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zH9XiqxcT4nY for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 08:10:41 +0000 (UTC)
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2C06A607B4
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 08:10:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2C06A607B4
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40e80046246so8950915e9.1
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 00:10:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705738239; x=1706343039;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jHukUvAwYYoueAf/SL5lOVAuK3/aoRERxXQ7qzZn1ZI=;
 b=NlN+MW4j+icqD/1lujrsKUo9ybQ89kx/F22TfCUiB0GXj8OC4l+5vyqXt7KDT2FBAZ
 1j/BNpFqCgDz1OG1LYeGwVqjvdsUq9aS0pq3xT1Vp+q4NWvCRGbCU5CYArH3/Q+ZPfOT
 fteQ8y/Yp8i3TicPEMYocrx0RSw/YKn6qaOdH+ut0Osq2lva8+WotkUSEcVdMYNJJcL+
 Xn/An9du1wlnPL+Laf+n9XuRwXAmlTElwSI6sFDekqV1ZniCJRLGRdA3TmUE+LvGmBdZ
 7a+yO1+HSBcUF1sZ+bPQtO8YqItKWQ7opeuE/Jq8CifIgVadcRAk5tH5CmXpu9Gg7g/O
 Bwlw==
X-Gm-Message-State: AOJu0YyL4a2ZKfpx9umxvVoMF5ICpFTF0JvIo4b7WGjb/AytKniuxMC2
 OL+8xCJcS3Eg8h/2RisTPGPDhiOyzurujvDcyCHIWJWHbqUGUpUdqiONbpZ7utZ168VTwzYC+cv
 /
X-Google-Smtp-Source: AGHT+IHG1MZ/gQ1bmxK2fyhAgIeV06gzsXTallmM+/HbPKPkohgA3uxN+esx5gUPpvbNz6Z9BPRgyw==
X-Received: by 2002:a7b:cd91:0:b0:40d:88bf:da7c with SMTP id
 y17-20020a7bcd91000000b0040d88bfda7cmr494757wmj.159.1705738238937; 
 Sat, 20 Jan 2024 00:10:38 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a05600c1c1500b0040e9f7308f4sm3985655wms.10.2024.01.20.00.10.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 20 Jan 2024 00:10:38 -0800 (PST)
Mime-Version: 1.0
Date: Sat, 20 Jan 2024 09:10:38 +0100
Message-Id: <CYJDQOY1OLS2.2VW25BFSDZOVP@rtone.fr>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailer: aerc 0.15.2
References: <20231211155951.4079886-1-gael.portay@rtone.fr>
 <ZarX-o1aELjzYnys@landeda>
In-Reply-To: <ZarX-o1aELjzYnys@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1705738239; x=1706343039; darn=buildroot.org;
 h=in-reply-to:references:to:from:subject:cc:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jHukUvAwYYoueAf/SL5lOVAuK3/aoRERxXQ7qzZn1ZI=;
 b=ABlHAdmQtzZuU/ii6acKaNi2C8avgohKKOhnAoWMhpbCMDHb+6tKLg+hEZj++nMlaa
 8zZBRIqxhkLaE32BZAmLsA8pz6VkrxCJDr8xZZBNg9VWlBxD2EoWgCX8m7wvdwGRURs5
 qAZGVgLKdva23sZKGtOpU/jwEclgFWvGHzMJY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=ABlHAdmQ
Subject: Re: [Buildroot] [PATCH v2 0/2] Add support for Pi5
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
Cc: Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwKCk9uIEZyaSBKYW4gMTksIDIwMjQgYXQgOToxMyBQTSBDRVQsIFlhbm4gRS4gTU9SSU4g
d3JvdGU6Cj4gR2HDq2wsIEFsbCwKPgo+IE9uIDIwMjMtMTItMTEgMTY6NTkgKzAxMDAsIEdhw6ts
IFBPUlRBWSBzcGFrZSB0aHVzbHk6Cj4gPiBEZWFyIG1haW50YWluZXJzLAo+ID4gCj4gPiBUaGlz
IHR3byBwYXRjaGVzIGFkZHMgdGhlIHN1cHBvcnQgZm9yIHRoZSBSYXNwYmVycnkgUGkgNVswXS4K
PiA+IAo+ID4gVGhlIGZpcnN0IHBhdGNoIGVuYWJsZXMgTU1VIDE2SyBwYWdlLXNpemUgb24gQVJN
NjQgYXMgdGhlIFJhc3BiZXJyeSBQaSA1Cj4gPiBzdXBwb3J0cyAxNksgcGFnZS1zaXplWzFdLgo+
Cj4gSSBoYXZlIHR3byBjb21tZW50cyBhYm91dCB0aGF0Ogo+ICAxLiB0aGUgcmVmZXJlbmNlZCBs
aW5rZWQgZG9lcyBub3QgbWVudGlvbiB0aGUgcGFnZSBzaXplCj4gIDIuIGFyZSAxNksgcGFnZXMg
cmVxdWlyZWQgYXQgYWxsPwo+Cj4gVGhlIGlzc3VlIHdpdGggdXNpbmcgMTZLIHBhZ2VzLCBpcyB0
aGF0IGl0IHdvdWxkIHByZWM7dWRlIHVzaW5nIGV4aXN0aW5nCj4gZXh0ZXJuYWwgcHJlYnVpbHQg
dG9vbGNoYWlucywgd2hpY2ggbW9zdCBwcm9iYWJseSBoYXZlIGJlZW4gYnVpbHQgd2l0aAo+IDRL
IHBhZ2VzLCBhbmQgYXMgZmFyIGFzIEkgdW5kZXJzdGFuZCwgbWl4aW5nIG9iamVjdHMgYnVpbHQg
Zm9yIDRLIHBhZ2VzCj4gYW5kIG9iamVjdHMgYnVpbHQgZm9yIDE2SyBwYWdlcywgaXMgbm90IHN1
cHBvcnRlZC4KPgoKKGluZGVlZCwgdGhhdCBteSBjb25jbHVzaW9uIGJ5IHRlc3RpbmcgZGlmZmVy
ZW50IGNvbmZpZ3VyYXRpb25zOyBJIGFtIG5vCmV4cGVydCBhdCBhbGwpLgoKPiBTbywgdW5sZXNz
IDE2SyBpcyBhIHJlcXVpcmVtZW50LCBJIHRoaW5rIHVzaW5nIDRLIHBhZ2VzIHdvdWxkIGJlIGJl
dHRlci4KPgo+IEFuZCBvZiBjb3Vyc2UsIHdlIGN1cnJlbnRseSBoYXZlIG5vIGluZGljYXRpb24g
d2hldGhlciBhbiBleHRlcm5hbAo+IGxpYnJhcnkgd2FzIGJ1aWx0IGZvciAkaywgMTVLLCBvciBl
dmVuIDY0SyBwYWdlcywgc28gdGhpcyBpcyBzb21ldGhpbmd3ZQo+IG5lZWQgdG8gaW1wbGVtZW50
IHNvbWVob3cuLi4KPgo+IFJlZ2FyZHMsCj4gWWFubiBFLiBNT1JJTi4KClNvIHlvdSBhcmUgc3Vn
Z2VzdGluZyB0byBoYXZlIGEgcmFzcGJlcnJ5cGk1X2RlZmNvbmZpZyB1c2VzIGEgNGsgcGFnZQpz
aXplIGluIGEgZmlyc3QgcGxhY2UgKGFzIGJjbTI3MTIgd29ya3Mgd2l0aCA0ayB0b28pLgoKQW5k
IHRvIGhhdmUgcHJvYmFibHkgYSByYXNwYmVycnlwaTUtMTZrX2RlZmNvbmZpZyB0aGF0IHdpbGwg
dXNlIGEgMTZrCnBhZ2Ugc2l6ZSBsYXRlciBvbmNlIEJSIGhhdmUgZW5vdWdoIGJpdHMgdG8gZmls
dGVyLW91dCBleHRlcm5hbAp0b29sY2hhaW5zIHRoYXQgZG8gbm90IHN1cHBvcnQgZm9yIDE2ayBw
YWdlIHNpemU/CgpSZWdhcmRzLApHYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
