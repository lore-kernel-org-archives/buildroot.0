Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E3CC197A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Nov 2023 08:54:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D58D60B05;
	Mon, 20 Nov 2023 08:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D58D60B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m24v1d_-0HsH; Mon, 20 Nov 2023 08:54:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE2A860AE4;
	Mon, 20 Nov 2023 08:54:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE2A860AE4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE88E1BF5DD
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 08:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7A2F60AE4
 for <buildroot@lists.busybox.net>; Mon, 20 Nov 2023 08:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7A2F60AE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1L7_Sh6rR-94 for <buildroot@lists.busybox.net>;
 Mon, 20 Nov 2023 08:54:08 +0000 (UTC)
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18006606DC
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 08:54:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18006606DC
Received: by mail-pj1-x1031.google.com with SMTP id
 98e67ed59e1d1-280165bba25so2749714a91.2
 for <buildroot@buildroot.org>; Mon, 20 Nov 2023 00:54:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700470447; x=1701075247;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+LcaZ5kn1f/l9q8dCcwfm+jH3QFzHeVrPFHiqvPFAKw=;
 b=iD0eoqe576gRRAlBaAjPq7/bzcOhl+QkbJZyWoRWwz1OQrju7n3qpE0HZfngTeHcIv
 o29SmX2pLzPBioNAmels3H1QZ6nkfcoFc/PKUGlHXEAekVUIcL7pit2HMeCPBgcXxjH6
 a6yM7qMn/MEi04mlI7Aa2/74c9+CRFduqcH8PPAfqDTNddDlSL8MJ/tMRwbPRuBtFVi4
 Pw0+Ncydd5SgBCJqqoUZF99+5+rUJlazntLxYxp3lXEpNef0SKjdm1UJtjZQYWpTQL7v
 AXMQGJClXviFvhQ8R50NK2W/0X4U5EpX/L1gBBBJ9u2IzcLwxd8XQgCu2MefUwXmkvX/
 co8Q==
X-Gm-Message-State: AOJu0YwLIleruiWLUMS7IvFILtn3605TL05NduzoONphBXBenwD6nLOM
 EFy0pPOrFrqtd2HPrTh1YNVSo2rnLJb5fYQ+CbQ=
X-Google-Smtp-Source: AGHT+IFNT8l+MWwYaeeRF8sKu9iDHfiJIzdt+Ty0XLVZdh6Qlk5qgmxoksGA/W471SMWrhBi7Px+F441sgmcIaFvdAA=
X-Received: by 2002:a17:90a:142:b0:280:699:c5c with SMTP id
 z2-20020a17090a014200b0028006990c5cmr4848325pje.21.1700470447372; Mon, 20 Nov
 2023 00:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20231115100222.29685-1-bstruempfel@ultratronik.de>
 <8950d51a-3b99-4aea-bd2f-473fd32d8f78@grenoble.cnrs.fr>
 <CAEktqcuLCaKbRZpPQDTRCK-3QYxA-s=mHcRyFW6Az7civD41Vw@mail.gmail.com>
 <7affda22-14f6-4bdd-be82-719476b9b993@grenoble.cnrs.fr>
In-Reply-To: <7affda22-14f6-4bdd-be82-719476b9b993@grenoble.cnrs.fr>
From: =?UTF-8?B?QsO2cmdlIFN0csO8bXBmZWw=?= <boerge.struempfel@gmail.com>
Date: Mon, 20 Nov 2023 09:53:56 +0100
Message-ID: <CAEktqcvgw4+NKD8GN2vK29iC0N15Z++ao3qA+u3PJnFh3VvA+w@mail.gmail.com>
To: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700470447; x=1701075247; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+LcaZ5kn1f/l9q8dCcwfm+jH3QFzHeVrPFHiqvPFAKw=;
 b=iOGYZqsoW8HBI3zTeF+DQ6v9xIOQnVchRUt+On/lYNSFG0SEBrtdr5ZuJ+ix7ofbkG
 wXpEqg3vcsT70RizCnh5GDtRJ9T5EOeH8RAau+JYSx58yRrVZ3i4Hqkvs2lVLp7C9vhh
 alZOknNPKAVC/O1oYjASzAgAfvFaxJZwuOs8GQXeKd0k0nFNFmgamrw+XKIO6zLLOjwY
 YoGumCgJxrwUsDg0m5m6qCAOtC+UgDZiycm42Q3cJrNYxbN8b84KCMEyQKe/7S/4J78y
 GQqx3XZea85L4fw3Ss4RdEKsLPTQxrva9OUCToOD2/B638bbZPi7QmkcpyVz++7WOVNr
 z1pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iOGYZqso
Subject: Re: [Buildroot] [PATCH 0/2] Adding support for gpiod v2.0 and higher
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
Cc: bstruempfel@ultratronik.de, vfazio@xes-inc.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgRWRnYXIsCgpPbiBXZWQsIE5vdiAxNSwgMjAyMyBhdCAxOjEz4oCvUE0gRWRnYXIgQm9uZXQg
PGJvbmV0QGdyZW5vYmxlLmNucnMuZnI+IHdyb3RlOgo+Cj4gQWJvdXQgdGhlIG5hbWUgImxpYmdw
aW9kMiIsIELDtnJnZSBTdHLDvG1wZmVsIHdyb3RlOgo+ID4gRG8geW91IGhhdmUgYW4gaWRlYSBm
b3IgYSBiZXR0ZXIgbmFtZT8gTWF5YmUgbGliZ3Bpb2R2MiBpbiBvcmRlciB0bwo+ID4gbWFrZSBh
IGRpc3RpbmN0aW9uIHRvIHRoZSBkZWJpYW4gcGFja2FnZT8KPgo+IE9yICJsaWJncGlvZC12MiI/
IFRvIGJlIGhvbmVzdCwgSSBkb24ndCBsaWtlIGVpdGhlci4gImxpYmdwaW9kMiIgc2VlbXMKPiB0
aGUgbW9zdCBjb25zaXN0ZW50IHdpdGggY3VycmVudCBwcmFjdGljZS4gSSBmZWVsIGEgYml0IHNv
cnJ5IGFzIEkganVzdAo+IHdhbnRlZCB0byBwb2ludCBvdXQgYSBwb3RlbnRpYWwgaXNzdWUsIGFu
ZCBJIGhhdmUgbm8gc29sdXRpb24gdG8KPiBwcm9wb3NlLiA6LSgKClRoYW5rcyBmb3IgcG9pbnRp
bmcgdGhhdCBvdXQuIEkgYWxzbyB0aGluayB0aGF0IGxpYmdwaW9kMiBzZWVtcyB0byBiZSB0aGUK
bW9zdCBjb25zaXN0ZW50IHNvbHV0aW9uLiBUaGVyZWZvcmUsIEkgd291bGQgYmUgaW4gZmF2b3Ig
b2Yga2VlcGluZyB0aGUKbmFtZSBsaWJwZ2lvZDIuCgo+Cj4gUmVnYXJkcywKPgo+IEVkZ2FyLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
