Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEE4606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 22:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=BFJ1mt4u;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=o8e4cL+5
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AE3D60644;
	Sun, 25 Oct 2026 22:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yKahW_g4erpA; Sun, 25 Oct 2026 22:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40D2C60617
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792966092;
	b=XK7zKdQOH3rnRMtCo565h+95mswpXOW5m2sLHel6FVGENu7VQoz7GiYEij8wkVnsBpd1
	 3bELXPQENdO00I3IeLsm6iZeOwGDjAXlS0GEHg6fZ9hq1oaoRPK1gODKpYNdurmsLNkq5
	 /kO9clRHjiESJdHh+B46rYPNwnF4+sYdSb2A51bwxqE5iB7s6neUEmkMcDFJSXMezAkQi
	 fQZRHAETdDIXwlJDzJ/6IkbGDv+NcrbCZYb1CSFHv2sZ8vr2zSQ/yoD9PWWdeploJ1ZP2
	 ykQCl+tLh7hnnXpSktWld6tWUgmNyOwhnBjBXDuNNpkKjazQNCCRoFNjBnY7mjG71/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792966092;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qCMAkyvl58xShQ0cN74gBZ3ZuDRwU3GW0mpcRlma5mU=;
	b=Q/eHX4Mo0janlBk4K54JLC/YESlVealKq4xj4cs4AfFLNzONYWXDfjAfVLgMe9p7Fmeu
	 x54pR5mlxhixU7HSiQnnjXzKx8IW2qnZY4VVFKQ1Qm7TAOUo7TchOUNe/MhC3Z3H7TZIl
	 SWUdw8rJeQl+7n2JHsnXKmENkbZZeEHAaIJ+iEhrMP2G/H7Q5oXF8pShYJsONPAchKMHH
	 8/oTz8S9nsEczZoev4AqRF9QGhOqtFGutfAd4gAYsrzcJV5zM63JKE2umBhpya+V5slml
	 V81T9HhzSnh4eofbQOBaJvmtOJCQwdCwg0z8+b38R63o6Tcz8qTzZdAYdfNM51EtC2Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792966092;
	bh=qCMAkyvl58xShQ0cN74gBZ3ZuDRwU3GW0mpcRlma5mU=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BFJ1mt4utLrV1hSBk3WrCQ/t8t5EAExyGaGyVMmNmRAR8ltcGGu2a54bN1R7oQmt8
	 lHcMVKXJQbwSTfPFL88YowRZmIPVMbrN64Qru1SsQ2Hmbv5ONwdWHHsLDneH0xu8XJ
	 mYkPHINP3RMu21Q7OTAdX3RxN4LV/eOeJ/ICYxMVqjg35jHTrIF3OoHJaytyfHp0W3
	 4AdJ8DkgDvIrYyxzvqkiUfofLv34njp5tzK3exNbollKT9Jy4s60h6oWZf8kC2fpTo
	 +uA7AABrKMZ7uTvvVB4hLZbZMveAB1GeW9A91k1UFn0ncpM6Pjh2ZuUy6t3MnoZvZo
	 g4vVnSrY+cMMg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40D2C60617;
	Sun, 25 Oct 2026 22:08:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DA135334
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C091B40574
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8k-ex3ydlLU for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 22:08:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2B77440497
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792966089;
 b=hxw0ZHEv93O6mSgLIdU8JYtubTPlx+jrU56je0A+Hz4Hg+qfWTvTxl9ASvvQNzKF5ZkQ
 gXsp0Izji1XhzqtxHwfwuEQ36zjBfzs66/ko+kUbbFgimG2MkSL12T89awhPHgce+UODz
 rYrFXIACmcEGfFKNBHJHgjveuzYA0eQOMNxcWmdSne5lTb36bA4EOiGfYnA5q++5nZY7Q
 Wc2O2I0pMnUY+knZ7nIUP5fKUOIE/1FNwCoBK3LOdEOjswjhPtc/O3r0zOAFMV67Lkh/+
 dVJHFhh1x5bO8MSQZmOlKBxWEoaW1dS7YDVvJ9xPaM0NvdVWuzNpSrfDIipXaqYlPIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792966089;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=TMKX5IxuWZAKyjoEh6V39lnmn1yFC5R8mHiRk3NPd0A=;
 b=g36Xs4IWGpjk0CcCAFpfB89qJ4owVR4T7nCZiCYtn4ksOanE4yd4frWw8xA0jbnkBUG6
 8ML4jeZD9m8DkN7K6TxgPoSjvX03YoNAIiC6c4EHtF3a7ukwTkQUKrWT1NNhP5LrmtkK+
 ky7bfBn7cyJp5tlvc4xXUwaGiXDj/hNa7y93AOAj2PfgsCzNev3tlVOn0c8eOgX+IV3FE
 Lkf4/dN1O7836rjV1GvAYqWylpByOcMHs5Q6Th1JYeHOZcZH08zpvDzt6N4SAAghYJrLn
 1EFyN8O4EB42qaH6nIDMybtL6c+AY8B0119bRhKxwA3ngzR/Fg+XdEdM+leyH9lYwQg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=kuhls.net;
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o8e4cL+5; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=o8e4cL+5
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B77440497
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1792966082;
 bh=TMKX5IxuWZAKyjoEh6V39lnmn1yFC5R8mHiRk3NPd0A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o8e4cL+5qUqvxtIfj6X8pj8souFWSgtfgWK7p6GOxnrzZOr/tRzXmi3CsK6TxO8BE
 3c1YB29QSk3Njc1rvDw1nGaqILzY7iLRJCtBbwZBTvm3xrCCi21LO7JZPJf3Il4ihY
 VvwQzTQAaUiR5r7Pv+V+etMUltZZQ2brcesJ9a5PAIKHHAT/9z7Qzk7bSqvvrX2W2x
 bmZjr5m1LxGccVEAAip4OfLK2XGLviAlgGW/3oujipCJLRXWCMcE4qxXxgQ2VyxydW
 vhKWSfGsCfn0CNTUOr7s1+pQjxHPV+Yn0dgj1zfwIjEQljRzOpkE+os0XC0Buf8sIu
 mD05p+wNrCb4w==
X-KAS-Sym: v3:f51bdf72230551df:mw1smLpguST1BOZ6D8Ar3ug6q3O8AHrnOC/y68gqsxl9b
 HrFVr/Uj+wx+TBXOpzKizM0PdNqdM57C3tEfZJM7phmfwdGzcQfp7+XBjWTUwGFnFa2R7qPF7VI
 ZFiLgHeA6vEiVM+9E2PPcNRv/9/llHNl2AJegq9NnjwF0JDCGySoJpQiJPr+P/cGHpsF8JVof/z
 OuIWnNMnmfmaTJyW23liyr/CngiWR1u0Lea6bX7/PxWlfltmOzau0YqQdUOpn7fOLWM9inu76Tu
 BI96e9uoMFRM/NgiGNkpM/x/eDeKvFmlh4ZcBP/jsg/hew6xwW9eb98g5jbdufY/hU7dP0QA==:
 55BODC0+gfQ9+LRjYd8ioJV6dIJbiyLIaxVt+D+Hz+2uE7OJG510E/OpuTihAAHELSKGnobNa48
 6evI99aG9/wXLVxbOQJyWLJRTgBtNQCHLConFAnyI2hpQZnYSKHEW+T58/gkZ0BD/YuL8NnlLQ2
 Ixazo1wzTgnmeQfRiKiETeMK96S5oF/D4Wwh5VH9aMx4Ct+O0aDM1Z0sX1Gu4JQdauawqtPB8Ri
 8VLvTNyPjU9gysOBbXPKIP1hmt3SslkR/r0FBQVh+1/y9txTpRhkl+Z6VYRqDnB5s/GeXByJtXi
 raPJ6YQ8y2+nNR3l/FrzLZONFl7mtwtEueKMYPep5NhFWz5A5GMY3q9Pn77LvfXTWvTCbyeLJNY
 L4nQQy/J3S3eeUF2llx9GW2sVF29yFVytGW+5nuJoWfRyffRpUef9ohg+dHYcBW2qCVJjStRUM3
 o1kt48BirVY+sBVENGTXyLgt9w8Z31+ssb6wBim/NNiRjqt3zY+yxco2zQ0xUAo2vFduo0WKVcc
 WkBwLpDvwMYFp/SV0oCAsJ5d7Jr/kc3h45GzvHLxCqD5Gm4USAMPMOojXNhhTtfsMKIok89LQ==
Received: from fli4l.lan.fli4l (p54a1ba05.dip0.t-ipconnect.de [84.161.186.5])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 269ADA4C693B;
 Sun, 25 Oct 2026 23:08:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42422)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xL6ND-000000001fP-0fAV;
 Sun, 25 Oct 2026 22:07:27 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>,
 =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Date: Sun, 25 Oct 2026 23:06:54 +0100
Message-ID: <20261025220723.1332924-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261025220723.1332924-1-bernd@kuhls.net>
References: <20261025220723.1332924-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 05/34] package/containerd: bump version to v2.1.5
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
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

RnJvbTogSmFuIMSMZXJtw6FrIDxzYWlyb25Ac2Fpcm9uLmN6PgoKU2VjdXJpdHkgYnVtcCB0byBs
YXRlc3QgcGF0Y2ggcmVsZWFzZS4KCmh0dHBzOi8vZ2l0aHViLmNvbS9jb250YWluZXJkL2NvbnRh
aW5lcmQvcmVsZWFzZXMvdGFnL3YyLjEuNQoKU2lnbmVkLW9mZi1ieTogSmFuIMSMZXJtw6FrIDxz
YWlyb25Ac2Fpcm9uLmN6PgpTaWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmRAa3VobHMu
bmV0PgotLS0KIHBhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhhc2ggfCAyICstCiBwYWNr
YWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9jb250
YWluZXJkL2NvbnRhaW5lcmQuaGFzaCBiL3BhY2thZ2UvY29udGFpbmVyZC9jb250YWluZXJkLmhh
c2gKaW5kZXggNzAxOGEwNmExYS4uOGIzNDUwODIzYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9jb250
YWluZXJkL2NvbnRhaW5lcmQuaGFzaAorKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVy
ZC5oYXNoCkBAIC0xLDMgKzEsMyBAQAogIyBDb21wdXRlZCBsb2NhbGx5Ci1zaGEyNTYgIDhjNDA5
ZjhhMGJhNjAxNWNiMzY1YTk1ZTAzOWEwZmM5ZjM2NjNjODkxYTI2ZWI1MmMwZmI4Y2QyOTFiYTc1
ZDQgIGNvbnRhaW5lcmQtMi4xLjQtZ28yLnRhci5negorc2hhMjU2ICBmOGRlZjY5ZTAyZWNmZjg0
YzA3ZTI0MzUwYmUwYjgzNGEzYThlMWY2YWNjZjA0MmNhZTRkNTA0ZTUyZWIwM2QxICBjb250YWlu
ZXJkLTIuMS41LWdvMi50YXIuZ3oKIHNoYTI1NiAgNGJiZTNiODg1ZThjZDE5MDdhYjRjZjlhNDFl
ODYyZTc0ZTI0YjU0MjIyOTdhNGYyZmU1MjRlNmEzMGFkYTJiNCAgTElDRU5TRQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9jb250YWluZXJkL2NvbnRhaW5lcmQubWsgYi9wYWNrYWdlL2NvbnRhaW5lcmQv
Y29udGFpbmVyZC5tawppbmRleCAwNGI3Mzk3OGE2Li4xMTdkZDFjZGEzIDEwMDY0NAotLS0gYS9w
YWNrYWdlL2NvbnRhaW5lcmQvY29udGFpbmVyZC5taworKysgYi9wYWNrYWdlL2NvbnRhaW5lcmQv
Y29udGFpbmVyZC5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLUNPTlRBSU5FUkRfVkVSU0lPTiA9IDIuMS40CitDT05UQUlORVJEX1ZFUlNJT04gPSAyLjEu
NQogQ09OVEFJTkVSRF9TSVRFID0gJChjYWxsIGdpdGh1Yixjb250YWluZXJkLGNvbnRhaW5lcmQs
diQoQ09OVEFJTkVSRF9WRVJTSU9OKSkKIENPTlRBSU5FUkRfTElDRU5TRSA9IEFwYWNoZS0yLjAK
IENPTlRBSU5FUkRfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKLS0gCjIuNDcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
