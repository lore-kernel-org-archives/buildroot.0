Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC616606A324
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 09:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sgl9/pWH
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C3A606A2;
	Tue,  3 Nov 2026 09:12:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bKbPcfSwb0pO; Tue,  3 Nov 2026 09:12:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A90B660670
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793697135;
	b=TIpZEpY8L7zc2TKB5Dp1FRcm/8DhHtkWQc5/vW/BaI61XFsJ1qGWRjUPwxB7vav5Gq2M
	 mPy6NnHZOodGlZSTqrjk483K8EAPY2ozgupbOKcjvbBUPRBfjN47YVu82uyOdsErbGsHt
	 YeklHoJS5pyrZLg4xnvlykUZkPv/lD7K4fxonfJ9eFucNUaDvr/LOj/j+A8otxo9vmgUf
	 lDDW6TpfAOJR5i3c9Drb875k66Hp/l2Ref8+D/Rm1ZKL4OgUrS7xD+oblW1lJiChJN2i2
	 F5916hSA48ENeggYHhqU9Gq+uewJtBKPk4pQOiXvQx7ye+i6PVvPxMA7uJ8UtFfDn4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793697135;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=OVvc4URCpk57YqP+QBh1X79CkVHeCPEX2H4gxB3dg78=;
	b=aHn6jnq2g1DLmHfQX/PJjMIdtgsdUAzBymsF6LIrzgW9+25kl1IDOLU2h+3w95VpZY+G
	 D3rf9lYOa2f4at6CkFQvtjzFpxBUcC6wB1xGcvwWQe9FwTuPxNNQoFdFkj8EZ27BtebVo
	 SFyzWmQdqWY8fuZgYp+ILprveygDnephLitlajZz0KCBvkeQZj6hB2IML0S/WwacdUNDS
	 llDbKvfvNqxg9F8ImzE/HhnCtvOXcqjg1MJo5dWOaJfeMSEgZCmR4LixzSw8S//B8rggY
	 OYgW9QIeUBvVJ70QSLoyazTwHhcaV/tL3DGw/SUR1rWkB5OcHTp3XXM2gjQPKOQlEJQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793697135;
	bh=OVvc4URCpk57YqP+QBh1X79CkVHeCPEX2H4gxB3dg78=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=sgl9/pWH8Bl5yylOB5BLs750mRwgFlKkW6o5/gPTY7fiLhy0OvrKegs4e8FSopu62
	 +y31sRsH37VFRKCprA1ZkzIi6UWn/sFfvmr1TmEjPnM5JdyaaA65+Wv82JvZweTd/M
	 QHAXbiybZuCS1Q64lQfVoZtJNjly5mVLz0SReJYO7aKx3v5inlkHicNUJUnI1FzwQL
	 +nteslU5RpHnMAYLoL9R6vXaiEA7fiFwaMJpo9fefcS2lGXNqlVJoFX1U+WgAcF46V
	 gGdQVFS3QK1Ecc40rZIpb7JRcDxn23CvBP6mIpc1cXMwp/8EwdmHW1r7ScKjP6p8Qe
	 t26LcrdDMTEqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A90B660670;
	Tue,  3 Nov 2026 09:12:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A1C0435
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 09:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B8C7401DB
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 09:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4pgaXdfI-QU1 for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 09:12:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org F07A540080
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793697133;
 b=bil8sTx/zc7areajukGU7u1yySIPpk2l2Hw3RY4OLJldoxv+bgpVoOOUlzTc21HcUoJ/
 ctUA542piocK9Plq9Ym6ouu1QLPPIa2IPmOb0pRzsyjgbNPd/2uW5xX7mJCyd8DMFqR8w
 dbIaYsCwfya+aQZaU0b3i8OagZev15BGC/xvLJwJqOrLcAwGrD1wjAcIVe5sAK2SR8c1s
 udxb8NDoX5t0F+RnzRu9scdFR+i+/MWRRiUZOK3z92LGYH00Fmnq2yifnWU0BD3fEXhqQ
 NR/sb1vEtRpfpCKwZkn4wHm81oeJrBU0T9MtPERsHQiELX1pbbdJGluKmcpH2/Ow0rQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793697133;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=MJUr4tdfpy0myHqSLGampxf4a4c7WxEz5TnVzddsUXY=;
 b=oGZaZgBe71B7Hyu62k1+xxoQ5Iy5G97cgyR3UyoEZS6oNzoTG2g8Sqz1UKxfDt7y5+S4
 CTgQWIFiMkqR7vlyLQ+G4NBxMbnbdbDRSN/TDD08SNUoauvOQ9zNNSOvalPbG2r9wwgOB
 XtxgxSwLq5Tq9PZI/1SzqpXee8a+AjAVry//pB0bih7Frk3bf4qVFgloLHAZBjsAr5lQj
 aLYq4QbAEg6+8LCHa8THRKHK+fzKRFjU28KqqjB2ZU28ayluN6Lvyx6yANQrHRAHd42x9
 yPluRhbsE2k7//1MpYhLW5DHw3h0TvH/qABTXzqbqMQKPo9JoJ9UIAtOiWNexDhCX+A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=V0sV64xX; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F07A540080
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 09:12:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48e09aa5264so1898672f8f.2
 for <buildroot@buildroot.org>; Tue, 03 Nov 2026 01:12:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793697130; x=1794301930;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=MJUr4tdfpy0myHqSLGampxf4a4c7WxEz5TnVzddsUXY=;
 b=Rh2BVXh8k2/ZdLCh8RRGmrIDAt7Sy4ymLgusCYtBB9xlwhgOmoY93oAwhwAc8lSkLb
 WDw5ZAWkA5Jes+gvzeSibWYZYzy3PkJvmklKDfEMKCqqccAz0R7XveM7wyTCmpQqoP4Z
 8krxUza0xP5OhFtkavDK3wKcfuuARy86uEzA/Yg3QHOk3BOeB+YBPchTzE+c5U6aibjm
 XRrVAfh8cyP9KnvYvrWBzAKsGVxIOtWeLVnuglL9ji6OOQo05WualYOz91mQZ5fT2gsH
 WPJcht3o8zouklml1D3A7xiwTH9FmXyD9NQfRrcw4S2Kv+CQXPUAcCNw0AFWPHMpXNeV
 kIew==
X-Gm-Message-State: APuU4Z+NsMoJQgbHFBvXTQrFSdL/y92IFA6O5iFXE7YoZ6YRXx4zOvm6
 CaL90hoG/0waY+z82eb9RTJ/8mZToeOP4pde8gSu6hii+0L64wYFf8UglKbGvy7JrFRJqmqkTlg
 xOnEyFCw=
X-Gm-Gg: AYBFou2ePTBQiyvdeMdi23IUPJMJyy9bkGsYy1LsTi42WFWZhMv+m8bM/NmMMAI9ZG7
 pyq/VjP5zRThYdMHRzZYedgVhQlHdPdb013VFzoej3fT/zSVD3zDCqRhjUwuomR50AEcLM1jLXO
 CEFQyWFYZ3/DEMMGG6WZo1Nx/pF/IOyMvVogA3rqlR7w7TQS7XFxipn53sPkfmbwgV7oWCorQg/
 A2C8oQJ99X9E7IlhdLQLGrR42xIkMH6Q59t1f5DELKqZY9z3bnGc3BcYJz4cMx4TzmDOj3Yyty+
 XMzVGHiHTw+LWr9NeCTlmE6ltE+qaxaOnsqePvJW16iLwf7FXTWq3bLJ8s1d8KCuvY5kCJq/UGZ
 1twcRNQ+bcgNRLyzv72gIwgiy9+K36AZikpT9xcCwRto5NAFcZr6ObunhpKtdw33h4+UREdliUt
 GPR1e4Fg/fJ4/9C8Jm33r5I3RGzqm+otd3T0tJKS8+a4OLwqxWKbf/e8uTvIB1RA1VMcVisTV77
 kWBhtYsli+eZ8hFzmXiZYK9hJ8wmB7jJRD/fBvTN7bDizenxYXHjOQzE1GfnFWQ7wspZ1RcXG2g
 uDx/bFmxcEfSR1JcHNLXFp9xgk9MXjs=
X-Received: by 2002:a05:600c:a49:b0:4a1:dadf:9876 with SMTP id
 5b1f17b1804b1-4ac180f1b83mr301684925e9.23.1793697129956; 
 Tue, 03 Nov 2026 01:12:09 -0800 (PST)
Received: from debian-hp-1 ([212.233.51.18]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4ac09ad35fdsm223818635e9.2.2026.11.03.01.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2026 01:12:09 -0800 (PST)
To: buildroot@buildroot.org
Cc: thomas.perale@mind.be, titouan.christophe@mind.be,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Francois Perrad <francois.perrad.86@gmail.com>
Date: Tue,  3 Nov 2026 10:11:37 +0100
Message-ID: <20261103091139.168897-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/perl-mozilla-ca: security bump to
 version 20261020
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VmVyc2lvbiAyMDI2MTAyMCBkZW55bGlzdHMgdGhlIGVtU2lnbiBFQ0MgUm9vdCBDQSAtIEczIHJv
b3QsIHRvIHdoaWNoCnRoZSBjb21wcm9taXNlZCBlTXVkaHJhIGludGVybWVkaWF0ZSBDQXMgY2hh
aW4gKFsxXSwgWzJdKS4KCkNoYW5nZXM6Cmh0dHBzOi8vbWV0YWNwYW4ub3JnL3JlbGVhc2UvTFdQ
L01vemlsbGEtQ0EtMjAyNjEwMjAvY2hhbmdlcwoKWzFdOiBodHRwczovL2VtdWRocmEud2UtaGF2
ZS1hLXByb2JsZW0uY29tLwpbMl06IGh0dHBzOi8vZ3JvdXBzLmdvb2dsZS5jb20vYS9tb3ppbGxh
Lm9yZy9nL2Rldi1zZWN1cml0eS1wb2xpY3kvYy8wUjNYTEpMNkZ1RQoKU2lnbmVkLW9mZi1ieTog
UmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0KIHBhY2thZ2Uv
cGVybC1tb3ppbGxhLWNhL3BlcmwtbW96aWxsYS1jYS5oYXNoIHwgNCArKy0tCiBwYWNrYWdlL3Bl
cmwtbW96aWxsYS1jYS9wZXJsLW1vemlsbGEtY2EubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdl
ZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
cGVybC1tb3ppbGxhLWNhL3BlcmwtbW96aWxsYS1jYS5oYXNoIGIvcGFja2FnZS9wZXJsLW1vemls
bGEtY2EvcGVybC1tb3ppbGxhLWNhLmhhc2gKaW5kZXggOWUwYjZmZjE0Mi4uYjVhNWI1NzBiYyAx
MDA2NDQKLS0tIGEvcGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLmhhc2gK
KysrIGIvcGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxhLWNhLmhhc2gKQEAgLTEs
NiArMSw2IEBACiAjIHJldHJpZXZlZCBieSBzY2FuY3BhbiBmcm9tIGh0dHBzOi8vY3Bhbi5tZXRh
Y3Bhbi5vcmcvCi1tZDUgIGMxYWZiYTVmNGZlZjcxZGZlN2I2MzI4ZGRkM2MyNmQzICBNb3ppbGxh
LUNBLTIwMjYwODEzLnRhci5negotc2hhMjU2ICA4MWYwYmQ5NjY1ZWFjYmI2ZmVlZjEzYjBmYTE2
ZmJiMzAxNjJjMDkyOTI1NDJiMTIwNjQzNGU1NjkxOTZkZDliICBNb3ppbGxhLUNBLTIwMjYwODEz
LnRhci5negorbWQ1ICBjNjI3MGRlODZmZTg5ZWE3ZDFiMjZiNDNiYWQ4YzVmNiAgTW96aWxsYS1D
QS0yMDI2MTAyMC50YXIuZ3oKK3NoYTI1NiAgMWFlZWQ5N2E0NjMzODllNTgyZTA4NWU4MmRlMDNh
ZTBiZmZhZTc0ZDQ2Y2Y4ZWU0YzUxMTM0MWU1NTA4YzIxZCAgTW96aWxsYS1DQS0yMDI2MTAyMC50
YXIuZ3oKIAogIyBjb21wdXRlZCBieSBzY2FuY3Bhbgogc2hhMjU2ICA5NWNkNjNkYWU1YzJiZjZl
N2NmMzM0MzU5ODE2MTRhMzZjODVlZjAxZmM3YTAyNDY0ZTA1ZTU4YTUzNTUzOThlICBSRUFETUUK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvcGVybC1tb3ppbGxhLWNhL3BlcmwtbW96aWxsYS1jYS5tayBi
L3BhY2thZ2UvcGVybC1tb3ppbGxhLWNhL3BlcmwtbW96aWxsYS1jYS5tawppbmRleCBhOGNmZGQ2
NmM2Li40MDIzMzlkMThmIDEwMDY0NAotLS0gYS9wYWNrYWdlL3BlcmwtbW96aWxsYS1jYS9wZXJs
LW1vemlsbGEtY2EubWsKKysrIGIvcGFja2FnZS9wZXJsLW1vemlsbGEtY2EvcGVybC1tb3ppbGxh
LWNhLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKIAotUEVS
TF9NT1pJTExBX0NBX1ZFUlNJT04gPSAyMDI2MDgxMworUEVSTF9NT1pJTExBX0NBX1ZFUlNJT04g
PSAyMDI2MTAyMAogUEVSTF9NT1pJTExBX0NBX1NPVVJDRSA9IE1vemlsbGEtQ0EtJChQRVJMX01P
WklMTEFfQ0FfVkVSU0lPTikudGFyLmd6CiBQRVJMX01PWklMTEFfQ0FfU0lURSA9ICQoQlIyX0NQ
QU5fTUlSUk9SKS9hdXRob3JzL2lkL0wvTFcvTFdQCiBQRVJMX01PWklMTEFfQ0FfTElDRU5TRSA9
IE1QTC0yLjAKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
