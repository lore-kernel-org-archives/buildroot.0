Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62785606A328
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=OnyzsgIq;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zgz0ZRME
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 393A1408DE;
	Thu,  5 Nov 2026 21:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jY7092mifxcK; Thu,  5 Nov 2026 21:04:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3A4AD408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793912650;
	b=j1w6Ss4FAPQ9jwnNaDZ8/j9mrR1KKfgiTWAl58S5DtzNG2R9ra4C11X2iVG6gs+QxZ+m
	 33DO32SyPIrq9ZUR1lsU9j6LpOFN3f3BLeDJrigyjNRMb1moJ3Gfj4C0tmireFL/Tf2UX
	 8tvE79rwDVvIXB8h70EeIwXFY+jfz6nQb9uLFc5a68aOGRbiZUMFU3aEtVP/n7d5/HXSj
	 sVg2wj6B8Sn2HS8HwA+jQivCv8gHi6Sv/P2D0nrkv4HGP65OWlYXahG4YR9Bp1Drxfswq
	 AxfECO8ohM6BZ9SSQcZKLH3qkRmZhI4QZkTbmfkfIT+ziWRdRR9tz58GJER1F7ty6yA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793912650;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UkIas7WuruPqM/FmUzkLzPaDJgH3JS5BotNlSLYhfn4=;
	b=E6WJp+BkjoyOPGq+yF9O7kDM+aEmuFZuYYoHzMhkYDkD5Z/eSZHNU/0qrgX2EmFZW/Mb
	 y+NvvgSwWAVUH1szn/Cof74mm+jydWOQMLGSU/nQjE8Hcq7wos68Q/5kxdU/FdgMog1HT
	 AvJRpbTKWzjv06yrNVCKim7ZFQTxhdW0YgNtESQ4kcp0NYLhLSMwT9nFLPQ3AZjxfhd9U
	 TJBUAXskGdc3ZMIEsjf5R1UsBD+t7EkZoODFJWYt5sqf6XcwpHrmO3ZwA2pZFuBhe4ln8
	 mpT5ZsL8BTCLjT3mas41mwk6sOvXRyGwDeZOz36CODnbkeWqRHde8gfjh+eBqGjxyDw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=Zgz0ZRME;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793912650;
	bh=UkIas7WuruPqM/FmUzkLzPaDJgH3JS5BotNlSLYhfn4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OnyzsgIqr6eNldSjKs8oFBX186A1PsJf/jU9fFM4gqsVid3u7o5oqboNIM5wodoD9
	 2qFdD/Qn1ibDZ7kEUNFbNiGYs3ogmgGVMSEuGQzKlv5XbqQ0XizecOEWuRcetd7Ca9
	 DAMLQ1Yz4CmyMYdGUjGNzm0M275gZVJ/r6Hzfn4x6x2fAKkLypk2Ct3nBMGU2bhgEz
	 +imrW6IDrf0jGa9IsOOKpt8dHOgKXXRahopU9J1cr8dpPDbGkB0tDFswMHOZp55RV4
	 E0wjZgyHkHCdzAmpp31h5pDOZQfCxGzgWRytDaiPbTTV1dK0ZW3M/kNmtz8DkxuHOg
	 R94OQRqbIuKJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A4AD408E3;
	Thu,  5 Nov 2026 21:04:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4B0FCF24
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48540408E3
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D63l7THNUx5S for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:04:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BB5A0408DE
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=Zgz0ZRME
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB5A0408DE
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793912644;
 bh=iOBY7pfKJZHPpPMaL3Ux5cvleMR5xEUxGP0XyqISoIM=;
 h=From:To:Cc:Subject:Date:From;
 b=Zgz0ZRME72ZLFx0Sz8N9PZw7/h97QDXOZS5LlfsC4ZTe0WyprkzxKSZsCiKJo7idc
 drlu2x+Juf38p7/4AKh/H14UuxbxJA/bXUJNh3XnEi8nwnfsXgUKJG+7xfYQ2jPTF5
 9o6nHeEeC1rTrOzRtmExQNlK5IqWUDETuSSfZZXE3ipw14Z2LfLygRDKok7E8WJGn7
 aLb4aY1LvULeaqjFAD1u4HiLx/WAPpxlIb7cXnXSvXbZOONIgTJWkssym0jtfLi67B
 KdDmE8pqz+XdZs5OQ0Q5GXLq5GQkE/dLfzzsm3LzrrEOTD6jE+BmxbguQhOST2Y3dD
 zT0AZv8B1W2dw==
X-KAS-Sym: v3:f51bdf72230551df:i3EExBWPJQuNN7p3a+qxzvgCJ4kojBJK4GOGXf5iT7GmE
 ZPWNshjCtBc+gBpSsJlNANxbZLuWvq3ysMfDl1CYJaMnfkMGEC3sfr/PfBCacUt6GZ19p3pa+bf
 d+0dUQbh2/y1aeQ6n8zi0PIosP9YtnV5nI9i8LNJgsfNKnzds92phOIy6vqLc0LMql0aICRVF5u
 F1e5K8VtoS8mW3S7IW5CHG2+PWjOqslK/mONeTeeQ02DDtd3PlXYzivU4y/7TDouoHGi2Vl5LX8
 gpLqFrjDAgyojC3xglb5v80Uy7Nf1JpkIIyQzIRnFX4NTR+eXRThoZ4esZyN1bOZkKof4q6Q==:
 cydayAwx4TIGzrWfjQsA5S2wMp3QMLkiXVOl0jrihX+u7FfmWdgefzq4s00Y8YcVQogvOtuTLav
 3pcE3PnEyjTJfOA27X9WFYrzC86Padb80bfJzhgsgmmfqXmg6z3iYqSGHxxT8uceHWQBQm+PG7R
 rxQ5iov0cAIdrpZHyVgJYDzESjwa6GHZXL3GKnSocbrbIpWf9fZugm4+eSaLcjo71fvMOsbaPzM
 DGFv63wVJVGCwY1Xmi5eqMqAYHC2CBWl8aQefdrZ5zqpqZSYjmaCDmB1SaFuzsGHOjMahaaXlsk
 g3IzDsuRZsv7HMhDhllhHg3MQugy8n2H6Zq8NUJ/7JmYJ6iIwB2vbtrXTqxBuwM/OjaMDW97CdW
 ClZkaeQ+mLQfWosJBz72KKFXoXx9nvn0+s9Wr1YJkckmpIpmRVQVEH6SMVv93aYEs3I4QAagddG
 46iOh2rmVVzKstT80CRGfTgSqc20Z2nhE7HTMKW7N9/d69pfu+pCyDbLsJGVXmMnkmorAe0HRFq
 H4AOCQ861t/mjTWanjinYBqMXaEZP3a4axSqlVHgEYe9gKPwMm8FDnR4IyL8bJlmb8O4LWhRQh1
 6QJgQ8H+63N/WxH5
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 684B0A4C38FE;
 Thu,  5 Nov 2026 22:04:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33648)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP4cu-000000003X4-0jLJ;
 Thu, 05 Nov 2026 21:04:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Dick Olsson <hi@senzilla.io>,
	Fabio Urquiza <fabiorush@gmail.com>
Date: Thu,  5 Nov 2026 22:04:02 +0100
Message-ID: <20261105210403.2105760-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: ---
Subject: [Buildroot] [PATCH 1/1] package/bitcoin: bump version to 32.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

aHR0cHM6Ly9iaXRjb2luY29yZS5vcmcvZW4vcmVsZWFzZXMvMzIuMS8KaHR0cHM6Ly9iaXRjb2lu
Y29yZS5vcmcvZW4vcmVsZWFzZXMvMzEuMi8KaHR0cHM6Ly9iaXRjb2luY29yZS5vcmcvZW4vcmVs
ZWFzZXMvMzEuMS8KClJlbW92ZWQgcGF0Y2ggMDAwMSBkdWUgdG8gdGhlIHVwc3RyZWFtIHJlbW92
YWwgb2YgdGhlIGxpYmV2ZW50CmRlcGVuZGVuY3kgaW4gdmVyc2lvbiAzMi4xLgpBbHNvIHJlbW92
ZWQgdGhlIGRlcGVuZGVuY3kgb24gdGhlIGxpYmV2ZW50IHBhY2thZ2UuCgpSZW51bWJlcmVkIGFu
ZCByZWJhc2VkIHJlbWFpbmluZyBwYXRjaC4KClNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxi
ZXJuZEBrdWhscy5uZXQ+Ci0tLQpHaXRsYWIgcGlwZWxpbmVzIHBhc3NlZDoKaHR0cHM6Ly9naXRs
YWIuY29tL2JrdWhscy9idWlsZHJvb3QvLS9jb21taXRzL2RiNGIyOTRiMDE1YjdmMDNiZTA4N2Iz
ZTQ1YjFkZTlhZTNjYmYzMWQKCiAuLi50cy50eHQtRG9uLXQtZm9yY2UtZnN0YWNrLXByb3RlY3Rv
ci5wYXRjaH0gfCAgMyArLQogLi4uLzAwMDEtRml4LXN0YXRpYy1saW5rLW9mLWxpYmV2ZW50LnBh
dGNoICAgIHwgMzYgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9iaXRjb2luL0NvbmZpZy5p
biAgICAgICAgICAgICAgICAgICAgIHwgIDEgLQogcGFja2FnZS9iaXRjb2luL2JpdGNvaW4uaGFz
aCAgICAgICAgICAgICAgICAgIHwgIDYgKystLQogcGFja2FnZS9iaXRjb2luL2JpdGNvaW4ubWsg
ICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiA1IGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNDMgZGVsZXRpb25zKC0pCiByZW5hbWUgcGFja2FnZS9iaXRjb2luL3swMDAyLUNNYWtl
TGlzdHMudHh0LURvbi10LWZvcmNlLWZzdGFjay1wcm90ZWN0b3IucGF0Y2ggPT4gMDAwMS1DTWFr
ZUxpc3RzLnR4dC1Eb24tdC1mb3JjZS1mc3RhY2stcHJvdGVjdG9yLnBhdGNofSAoOTQlKQogZGVs
ZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvYml0Y29pbi8wMDAxLUZpeC1zdGF0aWMtbGluay1vZi1s
aWJldmVudC5wYXRjaAoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYml0Y29pbi8wMDAyLUNNYWtlTGlz
dHMudHh0LURvbi10LWZvcmNlLWZzdGFjay1wcm90ZWN0b3IucGF0Y2ggYi9wYWNrYWdlL2JpdGNv
aW4vMDAwMS1DTWFrZUxpc3RzLnR4dC1Eb24tdC1mb3JjZS1mc3RhY2stcHJvdGVjdG9yLnBhdGNo
CnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9tIHBhY2thZ2UvYml0Y29pbi8wMDAyLUNN
YWtlTGlzdHMudHh0LURvbi10LWZvcmNlLWZzdGFjay1wcm90ZWN0b3IucGF0Y2gKcmVuYW1lIHRv
IHBhY2thZ2UvYml0Y29pbi8wMDAxLUNNYWtlTGlzdHMudHh0LURvbi10LWZvcmNlLWZzdGFjay1w
cm90ZWN0b3IucGF0Y2gKaW5kZXggNDAzNzBkMWJmNy4uY2NhMGIyYzkyYiAxMDA2NDQKLS0tIGEv
cGFja2FnZS9iaXRjb2luLzAwMDItQ01ha2VMaXN0cy50eHQtRG9uLXQtZm9yY2UtZnN0YWNrLXBy
b3RlY3Rvci5wYXRjaAorKysgYi9wYWNrYWdlL2JpdGNvaW4vMDAwMS1DTWFrZUxpc3RzLnR4dC1E
b24tdC1mb3JjZS1mc3RhY2stcHJvdGVjdG9yLnBhdGNoCkBAIC04LDYgKzgsNyBAQCBub3QsIGZv
ciBleGFtcGxlIHRvIHN1cHBvcnQgdG9vbGNoYWlucyB0aGF0IGRvbid0IGhhdmUgU1NQIHN1cHBv
cnQuCiAKIFVwc3RyZWFtOiBOL0EgQnVpbGRyb290IHNwZWNpZmljCiAKK1tCZXJuZDogcmViYXNl
ZCBmb3IgMzIuMV0KIFNpZ25lZC1vZmYtYnk6IEJlcm5kIEt1aGxzIDxiZXJuZEBrdWhscy5uZXQ+
CiAtLS0KICBDTWFrZUxpc3RzLnR4dCB8IDEgLQpAQCAtMTcsNyArMTgsNyBAQCBkaWZmIC0tZ2l0
IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAogaW5kZXggODkyZjMwZDk0Yi4uOTNj
Y2JmNzFlYyAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4
dAotQEAgLTUzMiw3ICs1MzIsNiBAQCBlbHNlKCkKK0BAIC01NTEsNyArNTUxLDYgQEAgZWxzZSgp
CiAgICB1bnNldChjeHhfc3VwcG9ydHNfZm9ydGlmeV9zb3VyY2UpCiAgCiAgICB0cnlfYXBwZW5k
X2N4eF9mbGFncygiLVdzdGFjay1wcm90ZWN0b3IiIFRBUkdFVCBjb3JlX2ludGVyZmFjZSBTS0lQ
X0xJTkspCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JpdGNvaW4vMDAwMS1GaXgtc3RhdGljLWxpbmst
b2YtbGliZXZlbnQucGF0Y2ggYi9wYWNrYWdlL2JpdGNvaW4vMDAwMS1GaXgtc3RhdGljLWxpbmst
b2YtbGliZXZlbnQucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDhjOGU5NWJk
MGYuLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9iaXRjb2luLzAwMDEtRml4LXN0YXRpYy1saW5r
LW9mLWxpYmV2ZW50LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMzYgKzAsMCBAQAotRnJvbSAy
OGMzNTMzZTVmYjM1MGZlMWMyN2NmMDZkZWU2OTI4ODI1YmM3YmYyIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQotRnJvbTogQmVybmQgS3VobHMgPGJlcm5kQGt1aGxzLm5ldD4KLURhdGU6IFNhdCwg
MTggSnVsIDIwMjYgMDc6NDY6MDkgKzAyMDAKLVN1YmplY3Q6IFtQQVRDSF0gRml4IHN0YXRpYyBs
aW5rIG9mIGxpYmV2ZW50Ci0KLUNoYW5nZSBsaW5rIG9yZGVyIHRvIGZpeCBidWlsZCBlcnJvcgot
Ci0vaG9tZS90aG9tYXMvYXV0b2J1aWxkL2luc3RhbmNlLTIvb3V0cHV0LTEvaG9zdC9saWIvZ2Nj
L2k2ODYtYnVpbGRyb290LWxpbnV4LW11c2wvMTQuMy4wLy4uLy4uLy4uLy4uL2k2ODYtYnVpbGRy
b290LWxpbnV4LW11c2wvYmluL2xkOgotIC9ob21lL3Rob21hcy9hdXRvYnVpbGQvaW5zdGFuY2Ut
Mi9vdXRwdXQtMS9ob3N0L2k2ODYtYnVpbGRyb290LWxpbnV4LW11c2wvc3lzcm9vdC91c3IvbGli
L2xpYmV2ZW50X2V4dHJhLmEoaHR0cC5vKToKLSBpbiBmdW5jdGlvbiBgZXZodHRwX2Nvbm5lY3Rp
b25fcmV0cnknOgotaHR0cC5jOigudGV4dCsweDFmN2IpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRv
IGBidWZmZXJldmVudF9zb2NrZXRfZ2V0X2Nvbm5fYWRkcmVzc18nCi0KLVVwc3RyZWFtOiBOb3Qg
YXBwbGljYWJsZSAobGliZXZlbnQgc3VwcG9ydCB3YXMgcmVtb3ZlZCBpbiBtYXN0ZXIgYnJhbmNo
KQotCi1TaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMubmV0PgotLS0tCi0g
c3JjL0NNYWtlTGlzdHMudHh0IHwgMiArLQotIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQotCi1kaWZmIC0tZ2l0IGEvc3JjL0NNYWtlTGlzdHMudHh0IGIvc3Jj
L0NNYWtlTGlzdHMudHh0Ci1pbmRleCBhZDE4MTE1YmJjLi44ZTJhN2JmY2NlIDEwMDY0NAotLS0t
IGEvc3JjL0NNYWtlTGlzdHMudHh0Ci0rKysgYi9zcmMvQ01ha2VMaXN0cy50eHQKLUBAIC0zNTUs
OCArMzU1LDggQEAgaWYoQlVJTERfQ0xJKQotICAgICBiaXRjb2luX2NsaQotICAgICBiaXRjb2lu
X2NvbW1vbgotICAgICBiaXRjb2luX3V0aWwKLS0gICAgbGliZXZlbnQ6OmNvcmUKLSAgICAgbGli
ZXZlbnQ6OmV4dHJhCi0rICAgIGxpYmV2ZW50Ojpjb3JlCi0gICApCi0gICBpbnN0YWxsX2JpbmFy
eV9jb21wb25lbnQoYml0Y29pbi1jbGkgSEFTX01BTlBBR0UpCi0gZW5kaWYoKQotLS0gCi0yLjQ3
LjMKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iaXRjb2luL0NvbmZpZy5pbiBiL3BhY2thZ2UvYml0
Y29pbi9Db25maWcuaW4KaW5kZXggODM1OTYxNzE4Yy4uZjFkNmU1NjBjMyAxMDA2NDQKLS0tIGEv
cGFja2FnZS9iaXRjb2luL0NvbmZpZy5pbgorKysgYi9wYWNrYWdlL2JpdGNvaW4vQ29uZmlnLmlu
CkBAIC0yMSw3ICsyMSw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9CSVRDT0lOCiAJZGVwZW5kcyBv
biBCUjJfVVNFX1dDSEFSCiAJc2VsZWN0IEJSMl9IT1NUX0NNQUtFX0FUX0xFQVNUXzNfMjIKIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfQk9PU1QKLQlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCRVZFTlQKIAlo
ZWxwCiAJICBCaXRjb2luIENvcmUgaXMgYW4gb3BlbiBzb3VyY2UgcHJvamVjdCB3aGljaCBtYWlu
dGFpbnMgYW5kCiAJICByZWxlYXNlcyBCaXRjb2luIGNsaWVudCBzb2Z0d2FyZSBjYWxsZWQg4oCc
Qml0Y29pbiBDb3Jl4oCdLgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iaXRjb2luL2JpdGNvaW4uaGFz
aCBiL3BhY2thZ2UvYml0Y29pbi9iaXRjb2luLmhhc2gKaW5kZXggM2FkZmM3YTVkMC4uNzJiMjk1
Nzg3OSAxMDA2NDQKLS0tIGEvcGFja2FnZS9iaXRjb2luL2JpdGNvaW4uaGFzaAorKysgYi9wYWNr
YWdlL2JpdGNvaW4vYml0Y29pbi5oYXNoCkBAIC0xLDcgKzEsNyBAQAotIyBIYXNoIGZyb206IGh0
dHBzOi8vYml0Y29pbmNvcmUub3JnL2Jpbi9iaXRjb2luLWNvcmUtMzEuMS9TSEEyNTZTVU1TCisj
IEhhc2ggZnJvbTogaHR0cHM6Ly9iaXRjb2luY29yZS5vcmcvYmluL2JpdGNvaW4tY29yZS0zMi4x
L1NIQTI1NlNVTVMKICMgQWZ0ZXIgY2hlY2tpbmcgcGdwIHNpZ25hdHVyZSBmcm9tOgotIyBodHRw
czovL2JpdGNvaW5jb3JlLm9yZy9iaW4vYml0Y29pbi1jb3JlLTMxLjEvU0hBMjU2U1VNUy5hc2MK
LXNoYTI1NiAgNTA0MTFkNWI0M2M3ZTRjOTAwOTkzOTQ3NTllYjZjMmFkZDZlN2MyZGJlNzI4ODQw
ODkzZDYzOGI2ZmM2YWZjOSAgYml0Y29pbi0zMS4xLnRhci5negorIyBodHRwczovL2JpdGNvaW5j
b3JlLm9yZy9iaW4vYml0Y29pbi1jb3JlLTMyLjEvU0hBMjU2U1VNUy5hc2MKK3NoYTI1NiAgYTVm
MmY2MWUzMmNmN2Y3OTA2NDFjOWVjMzA2YTNjODhjYTdiNWE1NTY5NDY5NTZiMWYzNWZmZDdlMjc4
MTNmOSAgYml0Y29pbi0zMi4xLnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQogc2hh
MjU2ICBiMDI4NzY5ZjM4NTJhOTM2OGFiMTBiZDc1NGZmMDFlYmI3NDFmODRhMmZhNjU4YzlhZmY4
MmE2MzFiYzZlY2ZjICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JpdGNvaW4vYml0Y29p
bi5tayBiL3BhY2thZ2UvYml0Y29pbi9iaXRjb2luLm1rCmluZGV4IDg1Nzc2OGViYTguLjgxMGY4
ZDNjMjkgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYml0Y29pbi9iaXRjb2luLm1rCisrKyBiL3BhY2th
Z2UvYml0Y29pbi9iaXRjb2luLm1rCkBAIC00LDEzICs0LDEzIEBACiAjCiAjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIwogCi1CSVRDT0lOX1ZFUlNJT04gPSAzMS4xCitCSVRDT0lOX1ZFUlNJT04gPSAz
Mi4xCiBCSVRDT0lOX1NJVEUgPSBodHRwczovL2JpdGNvaW5jb3JlLm9yZy9iaW4vYml0Y29pbi1j
b3JlLSQoQklUQ09JTl9WRVJTSU9OKQogQklUQ09JTl9MSUNFTlNFID0gTUlUCiBCSVRDT0lOX0xJ
Q0VOU0VfRklMRVMgPSBDT1BZSU5HCiBCSVRDT0lOX0NQRV9JRF9WRU5ET1IgPSBiaXRjb2luCiBC
SVRDT0lOX0NQRV9JRF9QUk9EVUNUID0gYml0Y29pbl9jb3JlCi1CSVRDT0lOX0RFUEVOREVOQ0lF
UyA9IGhvc3QtcGtnY29uZiBib29zdCBsaWJldmVudAorQklUQ09JTl9ERVBFTkRFTkNJRVMgPSBo
b3N0LXBrZ2NvbmYgYm9vc3QKIEJJVENPSU5fU1VQUE9SVFNfSU5fU09VUkNFX0JVSUxEID0gTk8K
IEJJVENPSU5fTUFLRV9FTlYgPSBCSVRDT0lOX0dFTkJVSUxEX05PX0dJVD0xCiBCSVRDT0lOX0NP
TkZfT1BUUyA9IFwKLS0gCjIuNDcuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
