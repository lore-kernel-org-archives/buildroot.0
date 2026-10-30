Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1D0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=F1Si0syp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C33340DFC;
	Fri, 30 Oct 2026 15:29:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8VtreK4k1NIS; Fri, 30 Oct 2026 15:29:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31B3940E18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793374175;
	b=BMnKduw1eePhvlqD7OiMuuXvXO09g2faIA7pMNcuMjzhMCEA7/w8bQvgvwTtAdnlCv7u
	 tARRfOrcztnUBbWwd5aXHKJr2reDdE8zdecL1HhgJ2jOvUSkjfwfZinu6vD8LgjBI+n13
	 AFijNnVaFyW4bv632q+iFqf3Q2zKazTTIomi1T7zY6rmROKqbGj+wLzJ3qd0knAOpGYXV
	 YifULTvImb19nKaPWcVmQkO3wlNPh180Le8x6g2/gFesATP/qkFUrQa6h8AwUPqttNiRK
	 rltBuOMk263Vov6kc2i4eW+jurRawDUqwkqTDpBTuGI7e77hheqTfQYodmy/U949iHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793374175;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=pDAGd1+jPxdR+CqOV5DZmBti5M/FoywzZPGUmwcsR4c=;
	b=OO5lIicpEZ6Ib7cz5/couRlHtVKMP0oWDiThKxmXp7ijvOvH/sVUCtmVeIDu8PE6JFLi
	 xXqkAstaAAl8hwSRpFqXp2deEw/vi8EVXkS2AYTVF4R4EU3+kLTnXfbYB6iOeOUvRXzeZ
	 HTqM6d1DK7hLL2Yz8H1/lZo+vUD9erzxC7TnLqe/w9opo/Hlzf6/z0IGFhY/n+UI0fEmO
	 ZNH3K/78C5+hn8nsnRzC7eGqBII0qChViafWpM80an9zRTyN/3fvs1ZAx7jwSjVmURGCL
	 w+Cp49BCnQ7CNRZyq+OTEuItIKwxL9toXTXJVpwhTFj8N2CQn+EwIorIexcyo92lQUw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793374175;
	bh=pDAGd1+jPxdR+CqOV5DZmBti5M/FoywzZPGUmwcsR4c=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=F1Si0syprNbOxK00igU53dlaz69npecuZqHz22JRs2+6MNWf2/chCwvlDhYjPs2kl
	 y1Mt+PTBzcZV5ZFqy4Guzl8gjGgEoOwMeutho6Lcon1oMGf4wlljG1M3DWqWAFeBsb
	 CGUaG7t3yoEDCWFCOqZo3qjCM7tqh9EUAWwP/ns973Aw5jgX8BxxWxhhwX1O9TPr4v
	 IHS7mbws7hD6wWm1xT6fXEG35//xMzw22BZtQMTK7X4J9gc9l9EO0ugZebs1vQBI2P
	 l3V8SJqx1NT+cq7yoLHLWzltRlQUqU+PJ3LPOHoLmvnurQrEN7vAhD6dBhV0cSRXu4
	 CSetTCGgqPmHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31B3940E18;
	Fri, 30 Oct 2026 15:29:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 133E4D38
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10AB640C39
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q-StBEmfy5DV for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 15:28:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DBFEC40C2C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793374135;
 b=cmlEViw07IdWREK1/KI8HmyFLEWeSTGht9c+kgN1QchGCvnXkFsidW0XyFlYs73Xch/i
 BmrjRztMI4XL2qcQKo+abeZA3CHMiLYeTCQZivgCpUbzOyQkzFZGyz6uyYBKos/K0d6GI
 kyv6UI0A6Pvm7CKtex8drfCecKXIK8ZloQD49fipGBM/LchOSGrjY0wBAQk1s7v+ck9yO
 Vcqd4qBckQk7mGT9iVg4456TuN29uuLxfV7EAHWawj4IkphBERHTi/1SVat5bjR4cxoeq
 wTQBNEvZJj1wwOHHjuiRuytQnIydq8Oqh5CKLHAupaEcdyjLSDgsw0i+gc9fbKIR1MA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793374135;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding;
 bh=x1QkscE3q/mTIiF0xarXKenV4+217jVuqqq0221WJVY=;
 b=rZ0xHivGA2wZuf6cqP4uBEh9vrLivZoWedLSqEaXWPpMAWhdq2RNlaI5qb97sBoRQEsi
 OM2Q6PfOokDWqujc5WKBtudwOdzdd2A+/2wzElWMRbieyZ//ItyCHS34CLmPFFuR+cGSt
 dVZN9XtzUunju3YWd1EPJj9HuOXRkt3o5luaZO3/wpnyZwcZlQH2ggVKfP9eAsgJxXpS8
 08Lo0Bjd2w6RSyxPR69L2j2mv+p3rxRDc+S7sxd6jLKNL4QynNRhXjbmg65+M8IlHRuFP
 q5udHCodorIA0Qgxd85eSv9zlGZoxGSbHW9SPNDFa2xu+RX0dkEbSdKlq9MBJooSdRg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="ZUFk/MX5"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DBFEC40C2C
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 15:28:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4a35ac4475dso5921965e9.2
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 08:28:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793374132; x=1793978932;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=x1QkscE3q/mTIiF0xarXKenV4+217jVuqqq0221WJVY=;
 b=mo1gSIOjldOsSGSIFvLfxTkh0dOQujL2aDnLJ3SAOH5yzS9CknJ+2eJwE3pSd54axV
 sa2NS3M/LZbOc7KQNmV0uHnJSHfjqzBfuqZAF2bhUZGWMhiqGuQREQnjXtNiPpW688ue
 DWb9pRIA5cGXKiDnhwURRj0MT8HLRxWYifsYSVRMetoNnk0mpXWni+al5MwqDjEttBfq
 X63UgbbDxHQQLxdI/07N8gvuWKlc1q45pk/8cgI+tckAjsyLeLI3DSn1PsGWgpGcsmvT
 VwH0b0UdJv3RY5ZCvLcmFBd3K054pVvpl5kknqSNDpFegZCmCrUpI+bWfEzXP7V6RzhD
 Svsw==
X-Gm-Message-State: AFq9FYIdVNQJP3kG74S8+ai2BnzSZerkSHGnz0PdXyLgONd49dEl+NUv
 hN8fUNIoJVWL7Mw9fjW/W/YktZ3ssyQ67mpYEmmvpj9h3KRXMSOomJedPcAl70hMpkk0Yip+cL2
 79p08e+I=
X-Gm-Gg: AYBFou2hzT7JNZ86M616TNx4Fv/Aad81ZBUOm490q2YDXiKyUPRcUBXsFhudH9M5NQ+
 JcqQBNcOy6necXmml50GwQG2TrPKaJrEaSwL5mXAJoRTU+xPC3vspFVy7UKDTsb+VD32q/Q6y6t
 UUZTedGowsaCIbfCqfxxtC1r+o8Y+t1AgAbSDSe2NhzER390G9sIDp+B13HOi840CO6LpIWAK9g
 T6+fkdEIxf7RZ2E90dHaTNFbSRKvTWc6iyk3u95fJwsrg/SDVufphUVlWuMAvobBOpXvGbgU0c8
 mdVHUpZNlM1dgdnf5tNF8QKGsMaPCe7bTvCZLJ7hUS9VhFAY1cb41NmAVZmPKxlM1sqAJzAaVA3
 ptOfdOGZQPPdqlOEId6rwEjOdYCwixC8ZZGdmaxNixCka+HiMDWY3ro0D+hONDRo02ef9t3QAaP
 Jb3lmZmaEpaSbarTdT3hElFnZ4YlxNWHG/Io2g/mHyspT1//nYkqG86loXYtbqVEOxPgVGk3Ir2
 H/7w886stqDhar/ruLGXcpgXC3DYRAJNbzN8j5kkc6T6ZMPNVBrGPpTeu+1diTi+QNPuOC3/g+H
 HaCYOE07hSM4BLcSuQSpYotPn9ROGVqFkO572GaFjj0TYZq0JAAjwnYrK8txR7rSKi5O0oeG
X-Received: by 2002:a05:600c:8b6a:b0:4a1:e6c8:ff74 with SMTP id
 5b1f17b1804b1-4ac17e10acemr55380335e9.29.1793374132412; 
 Fri, 30 Oct 2026 08:28:52 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4abf67aab10sm65690635e9.9.2026.10.30.08.28.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2026 08:28:52 -0700 (PDT)
To: buildroot@buildroot.org,
 =?utf-8?b?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Date: Fri, 30 Oct 2026 16:28:49 +0100
Message-ID: <20261030152851.1907569-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261023145524.1751306-1-raphael.melotte@mind.be>
References: 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libnss: security bump to
 version 3.132
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SW4gcmVwbHkgb2Y6Cj4gVmVyc2lvbiAzLjEzMiBjb250YWlucyBhIGZpeCBmb3IgdGhlIGVNdWRo
cmEgaW50ZXJtZWRpYXRlIENBcyAoWzFdKS4KPiAKPiBGb3IgcmVsZWFzZSBub3RlcyBzaW5jZSAz
LjEzMSwgc2VlOgo+IGh0dHBzOi8vaGctZWRnZS5tb3ppbGxhLm9yZy9wcm9qZWN0cy9uc3MvZmls
ZS9OU1NfM18xMzFfMV9SVE0vZG9jL3NyYy9yZWxlYXNlcy9uc3NfM18xMzFfMS5tZAo+IGh0dHBz
Oi8vaGctZWRnZS5tb3ppbGxhLm9yZy9wcm9qZWN0cy9uc3MvZmlsZS9OU1NfM18xMzJfUlRNL2Rv
Yy9zcmMvcmVsZWFzZXMvbnNzXzNfMTMyLm1kCj4gCj4gWzFdOiBodHRwczovL2VtdWRocmEud2Ut
aGF2ZS1hLXByb2JsZW0uY29tLwo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRl
IDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiBSZXZpZXdlZC1ieTogR2l1bGlvIEJlbmV0dGkg
PGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+CgpBcHBsaWVkIHRvIDIwMjUu
MDIueCwgMjAyNi4wOC54LiBUaGFua3MKCj4gLS0tCj4gIHBhY2thZ2UvbGlibnNzL2xpYm5zcy5o
YXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGlibnNzL2xpYm5zcy5tayAgIHwgMiArLQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9saWJuc3MvbGlibnNzLmhhc2ggYi9wYWNrYWdlL2xpYm5zcy9saWJuc3Mu
aGFzaAo+IGluZGV4IDAyYmJjYWYwMGQuLjM3OTIyZjA5NGMgMTAwNjQ0Cj4gLS0tIGEvcGFja2Fn
ZS9saWJuc3MvbGlibnNzLmhhc2gKPiArKysgYi9wYWNrYWdlL2xpYm5zcy9saWJuc3MuaGFzaAo+
IEBAIC0xLDQgKzEsNCBAQAo+IC0jIEZyb20gaHR0cHM6Ly9mdHAubW96aWxsYS5vcmcvcHViL3Nl
Y3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM18xMzFfUlRNL3NyYy9TSEEyNTZTVU1TCj4gLXNoYTI1
NiAgY2EwMDA1YmM3N2U5MjU1ZDk5NDIxMDNlNmY5NzU2Y2ZlMzExYTNkZjcyYWZhOTk4NjA3MDll
Mzg2ZWIzYzE2NyAgbnNzLTMuMTMxLnRhci5nego+ICsjIEZyb20gaHR0cHM6Ly9mdHAubW96aWxs
YS5vcmcvcHViL3NlY3VyaXR5L25zcy9yZWxlYXNlcy9OU1NfM18xMzJfUlRNL3NyYy9TSEEyNTZT
VU1TCj4gK3NoYTI1NiAgZWU5Y2Y0ODM3YmE4MDExNDFhODA0MzIxYzQ0NjJhZDhmNDUyZmY0MzE0
Mjc1YzZkNTEwOGE2YjA1YWYyMjdmZiAgbnNzLTMuMTMyLnRhci5nego+ICAjIExvY2FsbHkgY2Fs
Y3VsYXRlZAo+ICBzaGEyNTYgIGEyMGMxYTMyZDFmODEwMjQzMjM2MGI0MmU5MzI4NjlmN2MxMWM3
Y2RiYWNmOWNhYzU1NGM0MjIxMzJhZjQ3ZjQgIG5zcy9DT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvbGlibnNzL2xpYm5zcy5tayBiL3BhY2thZ2UvbGlibnNzL2xpYm5zcy5tawo+IGluZGV4
IDZiNGU2OGE2MjQuLjIwOTczMGY2YjUgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJuc3MvbGli
bnNzLm1rCj4gKysrIGIvcGFja2FnZS9saWJuc3MvbGlibnNzLm1rCj4gQEAgLTQsNyArNCw3IEBA
Cj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUxJQk5TU19WRVJTSU9OID0g
My4xMzEKPiArTElCTlNTX1ZFUlNJT04gPSAzLjEzMgo+ICBMSUJOU1NfU09VUkNFID0gbnNzLSQo
TElCTlNTX1ZFUlNJT04pLnRhci5nego+ICBMSUJOU1NfU0lURSA9IGh0dHBzOi8vZnRwLm1vemls
bGEub3JnL3B1Yi9tb3ppbGxhLm9yZy9zZWN1cml0eS9uc3MvcmVsZWFzZXMvTlNTXyQoc3Vic3Qg
LixfLCQoTElCTlNTX1ZFUlNJT04pKV9SVE0vc3JjCj4gIExJQk5TU19ESVNURElSID0gZGlzdApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
