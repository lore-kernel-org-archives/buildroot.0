Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFA1C5320E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 05:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5EB97402EC;
	Sun, 25 Aug 2024 05:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAi44b9Ti0dw; Sun, 25 Aug 2024 05:49:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24CDF402ED
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24CDF402ED;
	Sun, 25 Aug 2024 05:49:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3A111BF5DC
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 05:49:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A22E860617
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 05:49:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hz3Wt5VREksj for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 05:49:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.48;
 helo=mail-wm1-f48.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A01A60614
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A01A60614
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A01A60614
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 05:49:44 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4280c55e488so17063855e9.0
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 22:49:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724564983; x=1725169783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H8LuCZDGwsfH911crhbh5kkGfHdnAzmnH80rWAcJUbA=;
 b=pvdF31kT26G9SyzdwFSTL/coZHmDFDYcj5e9bbmypC2D2k2mB5Sq5AzW+c8FuwDns8
 Z2H1eEMoAOPmWZ6Vz1PL5SWxUIMVO+PBgVilBCxpAKXz1YiBzM9KYkTHb6S4l7vJC5w6
 1zY9cU7PFTdJqrNZiQ6iVowLKbyPdIfD189clD4Em680edIq8+jt2nUvy8Ulk9CfWqzl
 ZHe3231H20hgOoqDXEOfId6v7mVDhoeajhdEcpI0Ps3LyzJua3SymtcuC0aVyj7L41DK
 CNhIyvF90ndEn0bSC1A84Yu6xlNxFY0mRjhwrpZP1Mh782ZfllA34EQWoLqeT45e51HT
 Siuw==
X-Gm-Message-State: AOJu0YyXneEsq4MpVCtgYxbdAMO9as1C6fsgywAWIshAOXdrGGseCbD0
 LRMVSLy9yR/lxNF85JiW5AmYbEspM9k5rB9lx05OVAPk216GiiIa
X-Google-Smtp-Source: AGHT+IG5iCabayUTLCnPFWp6MsU5NS2+KOQn9imv/hShnser1Gf3TeFy2XqEo9RScH1WBVp3Fyt5QQ==
X-Received: by 2002:a05:600c:1c13:b0:428:f0fc:4e54 with SMTP id
 5b1f17b1804b1-42ac38cef1amr63997945e9.11.1724564982545; 
 Sat, 24 Aug 2024 22:49:42 -0700 (PDT)
Received: from fedora (ip-109-43-177-41.web.vodafone.de. [109.43.177.41])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ac5159450sm112832595e9.17.2024.08.24.22.49.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 22:49:42 -0700 (PDT)
Date: Sun, 25 Aug 2024 07:49:40 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>
Message-ID: <20240825074940.6de3b82b@fedora>
In-Reply-To: <20240824-frotz-v1-1-05b86b9e6038@gmx.net>
References: <20240824-frotz-v1-1-05b86b9e6038@gmx.net>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH] package/frotz: update package hash for
 verion 2.54
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

QW0gU2F0LCAyNCBBdWcgMjAyNCAyMzoxMToyOSArMDIwMApzY2hyaWViIEouIE5ldXNjaMOkZmVy
IDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+OgoKPiBSZWNlbnRseSwgaGFzaCBjaGVja3MgaGF2ZSBi
ZWVuIGZhaWxpbmcgZm9yIGZyb3R6LTIuNTQudGFyLmJ6Mi4KPiBGb3J0dW5hdGVseSwgdGhlIG9s
ZCB2ZXJzaW9uIGNhbiBzdGlsbCBiZSBkb3dubG9hZGVkIGZyb20KPiBzb3VyY2VzLmJ1aWxkcm9v
dC5vcmc6Cj4gCj4gJCB3Z2V0IC1xIGh0dHBzOi8vc291cmNlcy5idWlsZHJvb3QubmV0L2Zyb3R6
L2Zyb3R6LTIuNTQudGFyLmJ6Mgo+ICQgc2hhMjU2c3VtIGZyb3R6LTIuNTQudGFyLmJ6Mgo+IGJk
ZjkxMzFlNmRlNDkxMDhjOWYwMzIyMDBjZWEzY2I0MDExZTVjYTBjOWZiZGJmNWIwYzA1ZjdjNTZj
ODEzOTUgIGZyb3R6LTIuNTQudGFyLmJ6Mgo+IAo+IERpZmZpbmcgdGhlIG9sZCBhbmQgY3VycmVu
dCB1bnBhY2tlZCB0YXJiYWxscyBzaG93cyB0aGF0IHRoZSBjaGFuZ2UgaXMgYmVuaWduCj4gYW5k
IGFwcGVhcnMgdG8gYmUgZHVlIHRvIGEgY2hhbmdlIGluIEdpdExhYidzIHRhcmJhbGwgZ2VuZXJh
dGlvbjoKPiAKPiAJZGlmZiAtcnUgZnJvdHotMi41NC9NYWtlZmlsZSBmcm90ei0yLjU0LW5ldy9N
YWtlZmlsZQo+IAktLS0gZnJvdHotMi41NC9NYWtlZmlsZSAyMDIyLTA0LTE0IDA4OjQ3OjQxLjAw
MDAwMDAwMCArMDIwMAo+IAkrKysgZnJvdHotMi41NC1uZXcvTWFrZWZpbGUgICAgIDIwMjItMDQt
MTQgMDg6NDc6NDEuMDAwMDAwMDAwICswMjAwCj4gCUBAIC0yNjEsNyArMjYxLDcgQEAKPiAJIEdJ
VF9EQVRFID0gJChzaGVsbCBnaXQgc2hvdyAtcyAtLWZvcm1hdD0lY2kpCj4gCSBlbHNlCj4gCSBH
SVRfSEFTSCA9IDVhODZkZTJmMDc5OWJkZTEyNjk5YTAxODllYTEyYmU4Yzk2MTk0YTUKPiAJLUdJ
VF9IQVNIX1NIT1JUID0gNWE4NmRlMgo+IAkrR0lUX0hBU0hfU0hPUlQgPSA1YTg2ZGUyZgo+IAkg
R0lUX0RBVEUgPSAyMDIyLTA0LTEzIDIzOjQ3OjQxIC0wNzAwCj4gCSBlbmRpZgo+IAkgZXhwb3J0
IENGTEFHUwoKIEhpIQoKVGhhbmtzIGZvciB5b3VyIGludmVzdGlnYXRpb24hIEJ1dCBzaW5jZSBs
aWtlbHkgbm9ib2R5IGJlc2lkZSBtZSB3YXMgdXNpbmcKdGhpcyBwYWNrYWdlLCBhbmQgSSBhbHNv
IGRvbid0IG5lZWQgaXQgYW55bW9yZSwgSSBhbHJlYWR5IHN1Z2dlc3RlZCBhbm90aGVyCndheSBv
ZiAiZml4aW5nIiB0aGlzIHByb2JsZW06CgogaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5v
cmcvYnVpbGRyb290Ly0vY29tbWl0L2VkMmQ0NDBhMDhhYmExMjlhNzM3NzA1YjJhYzQyMzFkCgog
VGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
