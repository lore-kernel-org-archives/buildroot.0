Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3451D606A325
	for <buildroot@archiver.kernel.org>; Fri, 20 Nov 2026 13:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lft3n8AG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y7tSH6f+
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E299360D7E;
	Fri, 20 Nov 2026 13:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KqrDcJRev1Gv; Fri, 20 Nov 2026 13:00:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 140D060750
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795179633;
	b=EPN9Jkzk83Qe4V1D5fxSOxRyu20QW689Fc3rXqWnEI2RnLZqQhb2XwdAu6knPvTA3dHq
	 OHAYPaYwrKW4O8gxCpdAyPsCpFLddIYn1SEfNVkaeUu6bP7LmgUr+swPVQ37guIjIuam6
	 1MNsxhmSkgEulF+wtDOBBJxi+8twP5SlWjgd2scIDHufJ1uF0U20Dm1t0yGXKPC19cU9L
	 tivZaU3UKsyU0nSWyM2fGBKnvMOsw2sM09G0x4oVqeYFGlIn/0A4gt9uquP2M4yiXu6yT
	 V4+dSWFtM3auigfE/BHGcvaVWkxSEUu+mi7VxSK5AQ5sPVeYV4yjDCgt5Woj4owDnfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795179633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Organization:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DKNHk/0LPD0QH8N3cGcs3wLHJD+2KJOERirUaB+v5sU=;
	b=kssM5V2mtKO7H+l8wT/ob76bqRrO4HsmzWENSdn1m3KUYro9MjWIeCf0/+PxCt0J7olR
	 mHiI7fDOpHbkqZOapoftWdjKp3/l9YFWrCQTf7cOHy6Wkf0dyrFbU3v9FIGggBpF+AKfD
	 mtBhPmU+S2yIR90pC2zi7LFGK+vcln8wCvaWZo5XCccmM12fd3vV0unBwX5c74YK+uzmM
	 aq3F5hIccszi7kRCcVc5SEe4DVBy8BJ/ryqC9kYO59eYz0mif3mZkDoP1fKjv20Mog074
	 gEJGbVHKpTxt8sWe74LYImssWVCYekWltG4wMULCfDqi6szcl5BwhWyZITVzNgYWkmg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795179633;
	bh=DKNHk/0LPD0QH8N3cGcs3wLHJD+2KJOERirUaB+v5sU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lft3n8AGOD9gfkis88TEAt95C+o/eSQHQIFgGp8T7fSbQSAptPJD6UbTYiMXZDKpZ
	 vRudwJ7lQC/8jTYrpkmvR1/sgRYN/ooWH+/T7OiRBAvi9/mrXL71S83B2f1UtnYXpB
	 b5GQoIRG+1sA12Rw0EYjQz1n8SFT0kpSFeivYfJKT+2cFB7WQMprd0baJB9KdGTCWx
	 fyfMDlKvlmJ8R3YuxR8JPKJ4RLv5BRxUjePyLhyXAbipVNbNViddBcuzUW66CGeKw7
	 Z0ZRHi+UT7tebfiLyVJieEC1xyDopLHtzJA11G16AehEbfAEpz7agJV2bVHLtb6rzz
	 CqybA1jmiEPbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 140D060750;
	Fri, 20 Nov 2026 13:00:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DDD3169
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8CF940A8D
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JGw03oEM5rf9 for <buildroot@buildroot.org>;
 Fri, 20 Nov 2026 13:00:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 0AC7F40208
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::635"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=y7tSH6f+
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AC7F40208
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 13:00:29 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c4cdc606b47so159869966b.0
 for <buildroot@buildroot.org>; Fri, 20 Nov 2026 05:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795179628; x=1795784428; darn=buildroot.org;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=DxvMv4DZg00dRJkWPW5M8QIjWGWzlKkM5cJdgnuz2AE=;
 b=y7tSH6f+LNclsyhl/HIMrmdtQXg1HklSbn65R3sY6gXV+Eig06WKVPoOl19b2z6JFx
 qOtg47KWJYV/ebHCAtIV5Qh3+UqFf5xRTMlBGWyDfDvZnwfRtyeHepRT/eehKBv9iHYS
 ocja5wGGWobmOeDXubWY8a4e1vi46DqsI5vUIws6sOw29yVA/Q3Ir5oHRZre+heiCatx
 wRo3k0hex9ZWVcLyR+Qz6SBCXrrITBTqpzQBuDLx6CPlQf+F+U0xbGsK1u5OmJe8OK8e
 z+JA2dcplDqfW6eUI6zgDj29c6XM+lC1JpcG8Lifmyke/EYDFurzuYa9gNKvLH3QkQcR
 fFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795179628; x=1795784428;
 h=content-transfer-encoding:organization:content-type:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=DxvMv4DZg00dRJkWPW5M8QIjWGWzlKkM5cJdgnuz2AE=;
 b=2KGnF8Kl8HKqa6TQZuBWGMAgi/AktflOKy922X6v2P+04xve733AK2ZWkeGsGoYGLX
 x2tI4hKLDhFwZTrfjGOLyZFmw+uLthYdNskB+UlXmHDP4D+FrBA3cWwPk+gt0uCu01HH
 PMugqDdpxflf837nTavP3hEA3cwYblmyRQi4oHz46HGpAs/9/kKp1yfhqaVDZtcpnAdw
 1BQLmxfIiF0+tHzhcGQFusFz2LVBcbF2Nc7fXygBeWploFjlRGh/PFsDHWLDpOMTMiny
 KlcpOYMQ4It6deremsok1iRqJjjYFLp2ZD6nI+/LuLq7upOJWvlmwUUheman17+SWUHZ
 sdsg==
X-Gm-Message-State: APuU4Z8pQDMJiimW0x1HicTY1UeP3RdvdAnJ1zbk1hY8gKOaXpBNqPeA
 fPoV5cXz8TzpPfbJDDdneUjoIIxE0XPADfOG4tHa91RAU5BmpxZmp1YYB9/vOQ==
X-Gm-Gg: AYBFou0H1zwyz4NnPB2oT9Ni35eA414jA5LJ2pV5hCQtDhFNyGoUk08RZ3xCqQsY7Pc
 mlz+PV1GviA1C7RGNNv0UWydZOuBXWXFyE7iaDAs97TJuaGGUCOfOIUvANvD5vPGWiWlQzTq/XY
 x46QiqMZ0W1zH5LoQQ9yRf7sHnJYt9vhfbC3wzGU3eQsV4NowVwVSkbOzkyyws0omjHShDrFQz9
 +K5XnhnZHpDkCvFYJhQ3brSzQ34/3zgAR3A4LSlwUoc87e1aSiYwObJ6dePkJQRp3k0Fk/NkIAz
 t9KoDGPHvu9dSzwUqVpDmWwhA6Qxln53dt6KvykbdtijPv3ICPppPSSjgzLKQh1unI3bkTtv5cQ
 J/VbfrgFG1z7sKoiARoNJjCDJZ3EU4GZKOg3jw6K9W0n1BhMShZcwTVfNYUYcZBhV5CbuNRXt/4
 T9epjnjSejpezMO//0yLa7TXa4SzFg8XYtxfudqXDYCs6p66RO/2GwPUL8R+JD/uUrQdifSMrBy
 OM/ZtLzASahsspRacIVzubRD9Wmrlf/5zNv5gaNPuVEuC5WYBA3kTy7aWbm77Q+9us5MnwbW3tk
 KEMkBA2U7SFcNkXnqWIrilSvwEHwC2pCcOOH63zd7DI5Dq1O+7sbJo+sO/h5BXQUqXhTGDU=
X-Received: by 2002:a17:906:d10c:b0:c2e:2252:6ddb with SMTP id
 a640c23a62f3a-c513a5ea8a7mr247103666b.10.1795179626971; 
 Fri, 20 Nov 2026 05:00:26 -0800 (PST)
Received: from tollan.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c513aea17desm92823566b.44.2026.11.20.05.00.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2026 05:00:26 -0800 (PST)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 20 Nov 2026 14:00:14 +0100
Message-ID: <20261120130015.344000-2-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120130015.344000-1-lazzer@gmail.com>
References: <20261120130015.344000-1-lazzer@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH v2 1/2] package/hostapd: add IEEE 802.11v (WNM)
 support option
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

QWRkIEJSMl9QQUNLQUdFX0hPU1RBUERfV05NIHRvIGVuYWJsZSBXaXJlbGVzcyBOZXR3b3JrIE1h
bmFnZW1lbnQKKElFRUUgODAyLjExdikgb24gdGhlIEFQIHNpZGUsIGluY2x1ZGluZyBCU1MgVHJh
bnNpdGlvbiBNYW5hZ2VtZW50CmZvciBhc3Npc3RlZCByb2FtaW5nLgoKU2lnbmVkLW9mZi1ieTog
TWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+Ci0tLQpDaGFuZ2VzIHYxIC0+IHYy
OgogIC0gbmV3IHBhdGNoLCBzcGxpdCBvdXQgb2YgdGhlIE1CTyBwYXRjaAotLS0KIHBhY2thZ2Uv
aG9zdGFwZC9Db25maWcuaW4gIHwgOSArKysrKysrKysKIHBhY2thZ2UvaG9zdGFwZC9ob3N0YXBk
Lm1rIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9wYWNrYWdlL2hvc3RhcGQvQ29uZmlnLmluIGIvcGFja2FnZS9ob3N0YXBkL0NvbmZpZy5p
bgppbmRleCA0MDc0N2E0ZTYyLi41ZDA4ZjE1ZmY4IDEwMDY0NAotLS0gYS9wYWNrYWdlL2hvc3Rh
cGQvQ29uZmlnLmluCisrKyBiL3BhY2thZ2UvaG9zdGFwZC9Db25maWcuaW4KQEAgLTc1LDYgKzc1
LDE1IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUQVBEX1dQQTMKIAloZWxwCiAJICBFbmFibGUg
V1BBMyBzdXBwb3J0IGluY2x1ZGluZyBPV0UsIFNBRSwgRFBQCiAKK2NvbmZpZyBCUjJfUEFDS0FH
RV9IT1NUQVBEX1dOTQorCWJvb2wgIkVuYWJsZSBXTk0gKFdpcmVsZXNzIE5ldHdvcmsgTWFuYWdl
bWVudCkiCisJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IT1NUQVBEX0hBU19XSUZJX0RSSVZFUlMK
KwloZWxwCisJICBFbmFibGUgc3VwcG9ydCBmb3IgV2lyZWxlc3MgTmV0d29yayBNYW5hZ2VtZW50
IChJRUVFIDgwMi4xMXYpCisJICBvbiB0aGUgQVAgc2lkZS4gVGhpcyBlbmFibGVzIGZlYXR1cmVz
IHN1Y2ggYXMgQlNTIFRyYW5zaXRpb24KKwkgIE1hbmFnZW1lbnQgd2hpY2ggYWxsb3dzIHRoZSBB
UCB0byBzdWdnZXN0IG9yIHJlcXVlc3QgYSBzdGF0aW9uCisJICB0byBtb3ZlIHRvIGFub3RoZXIg
QlNTLgorCiBjb25maWcgQlIyX1BBQ0tBR0VfSE9TVEFQRF9WTEFOCiAJYm9vbCAiRW5hYmxlIFZM
QU4gc3VwcG9ydCIKIAlkZWZhdWx0IHkKZGlmZiAtLWdpdCBhL3BhY2thZ2UvaG9zdGFwZC9ob3N0
YXBkLm1rIGIvcGFja2FnZS9ob3N0YXBkL2hvc3RhcGQubWsKaW5kZXggZDY3M2M4NDU4Ny4uZDlh
MTY2MDg0MiAxMDA2NDQKLS0tIGEvcGFja2FnZS9ob3N0YXBkL2hvc3RhcGQubWsKKysrIGIvcGFj
a2FnZS9ob3N0YXBkL2hvc3RhcGQubWsKQEAgLTkzLDYgKzkzLDEwIEBAIEhPU1RBUERfQ09ORklH
X0RJU0FCTEUgKz0gXAogCUNPTkZJR19PV0UKIGVuZGlmCiAKK2lmZXEgKCQoQlIyX1BBQ0tBR0Vf
SE9TVEFQRF9XTk0pLHkpCitIT1NUQVBEX0NPTkZJR19FTkFCTEUgKz0gQ09ORklHX1dOTQorZW5k
aWYKKwogaWZlcSAoJChCUjJfUEFDS0FHRV9IT1NUQVBEX1ZMQU4pLCkKIEhPU1RBUERfQ09ORklH
X0VOQUJMRSArPSBDT05GSUdfTk9fVkxBTgogZW5kaWYKLS0gCjIuNDMuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
