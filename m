Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360B8C3DA5D
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 09:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7C066060C;
	Thu, 25 Jul 2024 09:53:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dVFQkoDxp3La; Thu, 25 Jul 2024 09:53:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F8A960A50
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F8A960A50;
	Thu, 25 Jul 2024 09:53:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D95F1BF2C2
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:53:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99B7260A50
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 09:53:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWZz0WLU3wS0 for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 09:53:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B63A86060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B63A86060C
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B63A86060C
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 09:53:48 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4267345e746so5443775e9.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 02:53:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721901227; x=1722506027;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=k2r4voHZP2vXOCY6a0LlT8VaunOPH5iqppCq7QbeIuM=;
 b=dnZ3oJIbX5XZKlMa67TdBYMYQbmbBxkK0UHtmE31hQ07+dtWZ9qGd4lyOhEMw225wI
 bcMo4WHxX+8MkP9DuL9VBBLIW8NUikEH5VTGxLustalLtUewouEobQtzeDDCQCTQDM2a
 Xlqu6GbX1UPfsSbflNNBtje/KazAOPboNsqtuQKM95kUJ9Z1O2B8Sbn6Z8wAL2dNTz6Z
 hoj2zWLhSKunnRFtnMIgUvNt1LerxXQFbJhuAuI5bB7TA9sitrKJ58QVr7Oq90qrTQHE
 /vZFBPXvEX3FjWX3MLaWo9w0gDmH8Z0M97S7UEAx3vwH2gBc4D8MPRVOjJfq32EPJAlk
 a1HQ==
X-Gm-Message-State: AOJu0YwxFj0VUuYqJMm9uIUbJvv1+M13VvbgHNqmWN5hZ0LFcq4tsMSO
 U4xt6pAsswuPGO67aWIcJGG9IcXl9YWWWosA1zRQzXg4AOpcIfrk
X-Google-Smtp-Source: AGHT+IGnOflxFZMLAC07sdv0z5H4x75jQQssehDBWoPrH/S+mcwhww2BHH5UXRFfQsm0D0Aeao+Edw==
X-Received: by 2002:a05:600c:3794:b0:426:6157:7ad3 with SMTP id
 5b1f17b1804b1-42806b940f9mr10267345e9.19.1721901226491; 
 Thu, 25 Jul 2024 02:53:46 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-428057b7218sm26327855e9.47.2024.07.25.02.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 02:53:46 -0700 (PDT)
Mime-Version: 1.0
Date: Thu, 25 Jul 2024 11:53:45 +0200
Message-Id: <D2YJ1IQ4XJ62.17GIHGKSB1ZYE@gmail.com>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>
X-Mailer: aerc 0.18.1-0-gaa8319bc591f
References: <20240723212011.23048-1-gael.portay@rtone.fr>
 <20240723212011.23048-3-gael.portay@rtone.fr>
 <20240724182158.07c7436b@windsurf>
In-Reply-To: <20240724182158.07c7436b@windsurf>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721901227; x=1722506027; darn=buildroot.org;
 h=in-reply-to:references:subject:cc:to:from:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k2r4voHZP2vXOCY6a0LlT8VaunOPH5iqppCq7QbeIuM=;
 b=jLymHt00DCRwfzMCMtNAkmoZEJqpDgb+bxkBZlNLhkHTU8Ii8avu7bSXA+bamlL1SF
 xFRNBj+V4SRTp/RygWkLi5b+cst24EwD1XfF+OsGKpefKPW5UHKy5SJZr7X5SGPWkADe
 PAPjvyjRuQyyGJICK0esIE1sa3ysITYjTusGbGPOM7cGZF5HOUoeKiE1khqvUxtKKNLC
 +yWG7GfC5eWpudpAykXqf2mN0Ujxw6XFi5te8W09ob0UHr//vQZZjCfnWSorHse/9Opf
 jTOVaY+RKYC3NxR8d7D4BwMxXRbihActUmWa+Z4e7AbMI5DYLEcJ/4W4jNTPNtZoiXQq
 K4Cw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jLymHt00
Subject: Re: [Buildroot] [PATCH 2/2] package/rpi-userland: package is
 deprecated
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
Cc: Samuel Martin <s.martin49@gmail.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@rtone.fr>, Mahyar
 Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLAoKT24gV2VkIEp1bCAyNCwgMjAyNCBhdCA2OjIxIFBNIENFU1QsIFRob21hcyBQZXRh
enpvbmkgd3JvdGU6Cj4gT24gVHVlLCAyMyBKdWwgMjAyNCAyMzoyMDoxMSArMDIwMAo+ICJHYcOr
bCBQT1JUQVkiIDxnYWVsLnBvcnRheUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiArCSAgSW1wb3J0
YW50OiBUaGUgcGFja2FnZSBpcyBhbmNpZW50IGFuZCBkZXByZWNhdGVkLgo+ID4gKwo+ID4gKwkg
IEl0IGxhcmdlbHkgY29udGFpbnMgY29kZSB1c2luZyBwcm9wcmlldGFyeSBBUElzIHRvIGludGVy
ZmFjZQo+ID4gKwkgIHRvIHRoZSBWaWRlb0NvcmUgZmlybXdhcmUuIEl0IGhhcyBzaW5jZSBtb3Zl
ZCB0byBzdGFuZGFyZAo+ID4gKwkgIGxpbnV4IEFQSXMuCj4gPiArCj4gPiArCSAgVjRMMiwgRFJN
L0tNUyBhbmQgTWVzYSBhcmUgdGhlIEFQSXMgeW91IHNob3VsZCBiZSB1c2luZy4KPgo+IERvZXMg
TWVzYSBub3cgaGFzIGEgZHJpdmVyIHRoYXQgc3VwcG9ydHMgYWxsIGdlbmVyYXRpb25zIG9mIHRo
ZSBHUFVzCj4gZm91bmQgaW4gUmFzcGJlcnJ5UGksIGFsbCB0aGUgd2F5IHVwIHRvIHRoZSBmaXJz
dCBnZW5lcmF0aW9uCj4gUmFzcGJlcnJ5UGkgPwo+CgpXZWxsLCBJIGhhdmUgbm8gaWRlYSB0byBi
ZSBob25lc3QuCgpBbGwgSSBrbm93IGZvciBub3cgaXMgdGhhdCBJIHdhcyBhYmxlIHRvIG1ha2Ug
aXQgd29ya3Mgb24gcGk1IHdpdGgKcXQ1d2ViZW5naW5lICh2M2QgaXMgc3VwcG9zZWQgdG8gc3Vw
cG9ydCBwaTQvNSwgdmM0IGlzIHN1cHBvc2VkIHRvCnN1cHBvcnQgdGhlIGZvcm1lciBwaSk7IGJ1
dCBtZXNhIGNhbm5vdCBiZSBidWlsdCBvbiBwaSAxL3plcm8gZm9yIG5vdyBhcwppdCByZXF1aXJl
cyBzdXBwb3J0IGZvciBOZW9uIGFuZCBCQ00yODM1IGhhcyBubyBzdXBwb3J0IGZvciBpdC4KCkkg
aGF2ZSBwbGFubmVkIHRvIGdpdmUgYSB0cnkgYW55d2F5LgoKQnV0IGZpcnN0LCBJIGFtIGZpeGlu
ZyB0aGUgbGFzdCBpc3N1ZXMgd2l0aCBxdDV3ZWJlbmdpbmUgb24gQVJNIDMyLWJpdAp1c2luZyBy
YXNwYmVycnlwaTNfcXQ1d2VfZGVmY29uZmlnIGFuZCBJIGFtIG1ha2luZyB0aGUgcGFja2FnZSBt
b3JlCnJvYnVzdC4gSSB3aWxsIHNlbnQgdGhlIHBhdGNoIG9uY2UgSSBoYXZlIHRoZSB0aW1lIHRv
IHdyaXRlIHRoZSBjb21taXQKbWVzc2FnZXMuIEFuZCB0aGFuayB5b3UgdmVyeSBtdWNoIGZvciB5
b3VyIGZpeGVzIQoKR2HDq2wKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpo
dHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
