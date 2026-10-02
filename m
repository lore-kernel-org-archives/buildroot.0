Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A668CA5FE4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 18:52:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE82881335;
	Fri,  2 Oct 2026 18:52:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQ8e1XNeL4Wi; Fri,  2 Oct 2026 18:52:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 20A7E81296
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790967129;
	b=EvxDb3KLrFBVbTVfSffJjMH4cO64ROsrGHWvURYuPRqxrGZ75C9IkQ95qGABOV/C3a60
	 V/vASZdipFNy7HkvlGs1Tm+E2gOgLsIqEwpMvPtCZG3BBZSYHPdg5DuxcESEK1xSFFQbu
	 1ShPXAWnk5WJpL2Kx11r+TIsVxOj0IX24Do9fynYYDWj8mLY8Y8jdtAEHYNqOAafypNvu
	 f++IWjQ56jHYNd+Fy9dWocnMeAaLSTacbZ53oquM41Bc1VHhD7DJ3sdMJa6Xi7Uc5XOee
	 tzeUoUZCwZimQWdjKT0WARp77pZMg+OERZ38g2tEIzLn2rfMCvgFq6VltWMYV9uUW4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790967129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=AkbOvox+7ldW6WWF3hpEgZPUM9zYBDsG8Dj9zENTQnc=;
	b=KGPhjTMQuE+7qfR2TZr+MkeTJoQQUvAueIS8DCXDJxn/AHr7J+bqpN6cf0of6IiEIzIB
	 ZvoVejxONu8EapuxZjpyTWcmUv9MtG9RdL3l8HKvt6LamY5iaYvdIWMOl59c+eq7vcHT3
	 GkOkPnNAcd33Wx4Y9Uz0XMDx9X6oPYyZyziJ3xHIFqh3FcwEpfmwTuNXjbwsN55SxLbOS
	 BXhhQFOC4pzPP5aDWHFZ3q4noreExa3FnP1ARPrr9tpVESHYYHBNS+0Txi+CxAJyVXn9f
	 glsD13/fwH4B5eYjj9BXAQ3Xsu/kMOTac0uay+zR4BWZV8MOUhbtmSRv8/wLTwug+dA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790967129;
	bh=AkbOvox+7ldW6WWF3hpEgZPUM9zYBDsG8Dj9zENTQnc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=A5Lai128ujxmazoWk1dhe2GkNsD+lvrzQIBIIqGGc+WT7DxgkfOmCAapUf2dZsSBl
	 8eGrSFdlrLfVkjRU9/6b3keuLCPdi16pKDOIVGF81CgtqFUJmkXETGnP5rXOxnLuLf
	 IjlA22yhQMgi288feEjuoTGWTCIbkzxj0Gyrl+P2ZoHFvai2265UcAzxE4+MOSWssL
	 m0iCluzQtvjW66ztZLONanTJJBlBzfPn8wRAvgZTBOJvhr1V9lpbzenok/IVGMUs+w
	 75AA1E6qJV9Qxzz5vhYIwExzVhuwF2BIwu/OUqM586d6GdOCQCifbVDqI6Cqr000oa
	 9nRMa1dGnIJPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20A7E81296;
	Fri,  2 Oct 2026 18:52:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 177611D2
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F1618400C7
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:52:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yRxCpdqe5-G for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 18:52:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3C3B9400BC
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.156.103
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790967125;
 b=ekcs8Sa9ueE3nT0lIB7dFMWCcvNYitIz5pXPYlde+bv/TM2P6I7ebjxfy6GIc8o86JIT
 UE23zPLVdhPUPGTzYWnYJET5pMwc0pVo1wRLd7UsHnHhO3cC5V7Mna5WCA6Pwm+tBhMfr
 6rfgNYl+LRjdoPhJMTUEq3Dau5Zb7c/lhzCIOuMCKL0rEQxASmAJjWP3qpF+ZCcy/gK1n
 0ddpT8tIrgujIafivXOVCeedZVFPTqBa9oZMAIpSdxmHm7du70LAE5JkAWSksPLqTtYqp
 LhIBAcgzwxbrkMgM8NsCx7mwM96rVcAcQqoU/kfhxgQ4BITU0f7OSDvxm6i30R53o5A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790967125;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-CMAE-Envelope;
 bh=ZembZhiqATiMTySOKt6OTJ1ZTKRvdg4nCWTCAEqt394=;
 b=KG8I4czp36EM5s8Sd+w8GuqyDd1hAeYFSjnSJqioh4F5aXLOJeB1W3ps3CNveUusW0Cx
 Zw+hJwKx7TN0W/ur9gdg6LywKF3wN/hkawa0ffMDORoL6hb+tVInW+clTJ1MB+PJC2zhc
 XsAqMvK+rN9P5/OYiv5BJt59253cDBFSkBE5anaQaxCswRBo2e8ofoS17f9n0ZbyKCywn
 k9gAdJaQ82qiZTMQQ00Kuf0T3DiwKNbBoiTTGm2B6uj3EYfVvvqYJ05RyvRdb13PUPbfF
 81Nz+LVRhNFGiiZfwNB2dzqlSEI8cGYh2QQ7Iu3DYi1azx0WKQMLd+mnS9LUqP0roaA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=benettiengineering.com; 
 dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1
 header.b="YiR4/kAE"; 
 arc=none smtp.remote-ip=62.149.156.103
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.103;
 helo=smtpcmd10103.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=YiR4/kAE
Received: from smtpcmd10103.aruba.it (smtpcmd10103.aruba.it [62.149.156.103])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C3B9400BC
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 18:52:00 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id CiMPxK7CnGpniCiMPx0WsX; Fri, 02 Oct 2026 20:51:57 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1790967118; bh=0+J+KqAqsnU/HcVUZL303nkUmOCPAesVaPqxxJCz0ss=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=YiR4/kAERYm4LJFPDumenlGgxmr2aAdLPHeYTdDGB3tDHSVYdJRL9l0yY51WXxAXL
 fWxx2ZFX6MYj6TERVqKO2wOf/8veTFRmqGyL9+kSYsiJIho1D843p3mn1gSExnPq9Y
 /ClSHKlE1Lic/cp8GqwsjnUiWi2p1PP/8wfHqoRToaaROykxWHiiw49pIwGHm+VwKb
 W0Z/nS8sddoPvzRWDxYxmr0oPi4SGk3aHQjo9BecYhGEvE8iP/fEg2b1U9G/SAawgc
 i1MmbDUmPrLwNq1IVEA1+IngfcbtT45Yars2INCncyE2UnNAM1mh4QdbwOoLpMBHTs
 WgWkJLwqG+Wgg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri,  2 Oct 2026 20:48:03 +0200
Message-ID: <20261002185156.3350834-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCc+hGYQTZSXoxkEZdpuzvDppGOu+K/j8BnsMnOBHgH/4Vwv0tFv8fys8AStvLfb3Xkq4Xx/UjLY6f1H71gAOGKCYCqRFeAbrWDA3gu4NfrXGOF2Kmvj
 n69tyDHPrPXaWLHc7ksKit0NRdK4E0cm1+StldElWOG8Lk/HOTiCFPPmerGkG8bm3XaMgd38YkXFp2eVqL097W6g5YBRfMx78HhhbJHmdKnqUZZbOYBBKGpr
 ccDCE54P4ytoVGaXvo4ZrKBxGGYn+ATCv6A5esBZGKQ=
Subject: [Buildroot] [PATCH] package/harfbuzz: bump version to 14.5.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBsb2NhbCBwYXRjaCB0aGF0IGhhcyBiZWVuIHVwc3RyZWFtZWQuCgpodHRwczovL2dpdGh1
Yi5jb20vaGFyZmJ1enovaGFyZmJ1enovYmxvYi8xNC41LjEvTkVXUwoKU2lnbmVkLW9mZi1ieTog
R2l1bGlvIEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Ci0t
LQogLi4uMDAyLWZpeC1nY2MtNC05LTQtY29tcGlsYXRpb24tZXJyb3JzLnBhdGNoIHwgNjMgLS0t
LS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoICAgICAgICAg
ICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsgICAgICAgICAgICAg
ICAgICB8ICAyICstCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNjYgZGVsZXRp
b25zKC0pCiBkZWxldGUgbW9kZSAxMDA2NDQgcGFja2FnZS9oYXJmYnV6ei8wMDAyLWZpeC1nY2Mt
NC05LTQtY29tcGlsYXRpb24tZXJyb3JzLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJm
YnV6ei8wMDAyLWZpeC1nY2MtNC05LTQtY29tcGlsYXRpb24tZXJyb3JzLnBhdGNoIGIvcGFja2Fn
ZS9oYXJmYnV6ei8wMDAyLWZpeC1nY2MtNC05LTQtY29tcGlsYXRpb24tZXJyb3JzLnBhdGNoCmRl
bGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBlM2RlODgxZTljLi4wMDAwMDAwMDAwCi0tLSBh
L3BhY2thZ2UvaGFyZmJ1enovMDAwMi1maXgtZ2NjLTQtOS00LWNvbXBpbGF0aW9uLWVycm9ycy5w
YXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDYzICswLDAgQEAKLUZyb20gMGQwYjYyNTc1ZjJhNTI3
MTBkMWZjM2Q1OWVkMzc1Y2IzYTUwNzAxYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206
IEtldmluIEhlbGxlbXVuIDwxNzkyODk2NitPR0tldmluQHVzZXJzLm5vcmVwbHkuZ2l0aHViLmNv
bT4KLURhdGU6IE1vbiwgMjEgU2VwIDIwMjYgMTI6NTg6MDMgKzAyMDAKLVN1YmplY3Q6IFtQQVRD
SF0gZml4KGdjYyA0LjkuNCk6IGNvbXBpbGF0aW9uIGVycm9ycwotCi1UaGUgY3VycmVudCBidWls
ZCBmb3IgdjE0LjUuMCBmYWlscyB0byBjb21waWxlIG9uIGdjYyA0LjkuNCB3aGljaCBpcwotdXNl
ZCBvbiBlbWJlZGRlZCBLb2JvIHN5c3RlbXMuCi0KLVJlZjogaHR0cHM6Ly9naXRodWIuY29tL09H
S2V2aW4vY2FkbXVzL3B1bGwvMTAwNQotCi1DaGFuZ2UtSWQ6IDdhNGJlYzViNTQxOGJkMDkyMWIy
NzNkOGQ0YTFlNzliCi1DaGFuZ2UtSWQtU2hvcnQ6IHNwdm9sbnVvdXZ5cgotVXBzdHJlYW06IGh0
dHBzOi8vZ2l0aHViLmNvbS9oYXJmYnV6ei9oYXJmYnV6ei9jb21taXQvMGQwYjYyNTc1ZjJhNTI3
MTBkMWZjM2Q1OWVkMzc1Y2IzYTUwNzAxYQotU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90
dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgotLS0tCi0gc3JjL2dyYXBoL2dyYXBoLmhoIHwg
MiArLQotIHNyYy90ZXN0LXJlc3VsdC5jYyB8IDYgKysrLS0tCi0gMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCi0KLWRpZmYgLS1naXQgYS9zcmMvZ3JhcGgv
Z3JhcGguaGggYi9zcmMvZ3JhcGgvZ3JhcGguaGgKLWluZGV4IDAzOTlmN2YzZTFmLi5lMGU3MzNl
N2U2MSAxMDA2NDQKLS0tLSBhL3NyYy9ncmFwaC9ncmFwaC5oaAotKysrIGIvc3JjL2dyYXBoL2dy
YXBoLmhoCi1AQCAtNjM1LDcgKzYzNSw3IEBAIHN0cnVjdCBncmFwaF90Ci0gICAgIH0KLSAgICAg
VFJZKHIpOwotIAotLSAgICByZXR1cm4gZzsKLSsgICAgcmV0dXJuIE9rIChzdGQ6Om1vdmUgKGcp
KTsKLSAgIH0KLSAKLSAgIGdyYXBoX3QgKGNvbnN0IGdyYXBoX3QmKSA9IGRlbGV0ZTsKLWRpZmYg
LS1naXQgYS9zcmMvdGVzdC1yZXN1bHQuY2MgYi9zcmMvdGVzdC1yZXN1bHQuY2MKLWluZGV4IDlk
NDg3ZDQwODNlLi5iN2I5M2E0Y2JlNyAxMDA2NDQKLS0tLSBhL3NyYy90ZXN0LXJlc3VsdC5jYwot
KysrIGIvc3JjL3Rlc3QtcmVzdWx0LmNjCi1AQCAtNDMzLDcgKzQzMyw3IEBAIGludCBjb3B5X21v
dmVfY291bnRlcl90Ojptb3ZlX2NvdW50ID0gMDsKLSBzdGF0aWMgcmVzdWx0PGNvcHlfbW92ZV9j
b3VudGVyX3Q+IHJldHVybl90cmFja2VkX2Zyb21fbG9jYWwgKCkKLSB7Ci0gICBjb3B5X21vdmVf
Y291bnRlcl90IG91dCAoNDIpOwotLSAgcmV0dXJuIG91dDsKLSsgIHJldHVybiBPayAoc3RkOjpt
b3ZlIChvdXQpKTsKLSB9Ci0gCi0gc3RhdGljIHJlc3VsdDxjb3B5X21vdmVfY291bnRlcl90PiBy
ZXR1cm5fdHJhY2tlZF9mcm9tX2xvY2FsX3dpdGhfdGFnICgpCi1AQCAtNDQ1LDcgKzQ0NSw3IEBA
IHN0YXRpYyByZXN1bHQ8Y29weV9tb3ZlX2NvdW50ZXJfdD4gcmV0dXJuX3RyYWNrZWRfZnJvbV9s
b2NhbF93aXRoX3RhZyAoKQotIHN0YXRpYyBoYl9yZXN1bHRfdDxpbnQsIGNvcHlfbW92ZV9jb3Vu
dGVyX3Q+IHJldHVybl90cmFja2VkX2Vycm9yX2Zyb21fbG9jYWwgKCkKLSB7Ci0gICBjb3B5X21v
dmVfY291bnRlcl90IG91dCAoNDIpOwotLSAgcmV0dXJuIG91dDsKLSsgIHJldHVybiBFcnIgKHN0
ZDo6bW92ZSAob3V0KSk7Ci0gfQotIAotIHN0YXRpYyBoYl9yZXN1bHRfdDxpbnQsIGNvcHlfbW92
ZV9jb3VudGVyX3Q+IHJldHVybl90cmFja2VkX2Vycm9yX2Zyb21fbG9jYWxfd2l0aF90YWcgKCkK
LUBAIC00NTcsNyArNDU3LDcgQEAgc3RhdGljIGhiX3Jlc3VsdF90PGludCwgY29weV9tb3ZlX2Nv
dW50ZXJfdD4gcmV0dXJuX3RyYWNrZWRfZXJyb3JfZnJvbV9sb2NhbF93aXQKLSBzdGF0aWMgcmVz
dWx0PG1vdmVfb25seV92YWxfdD4gcmV0dXJuX21vdmVfb25seV9mcm9tX2xvY2FsICgpCi0gewot
ICAgbW92ZV9vbmx5X3ZhbF90IG91dCAoNDIpOwotLSAgcmV0dXJuIG91dDsKLSsgIHJldHVybiBP
ayAoc3RkOjptb3ZlIChvdXQpKTsKLSB9Ci0gCi0gc3RhdGljIHZvaWQgdGVzdF9yZXR1cm5fbW92
ZXNfZnJvbV9sb2NhbCAoKQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5o
YXNoIGIvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5oYXNoCmluZGV4IGJkMDI1ZmI1MTUuLjBk
NDY1ZTdjNmIgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enouaGFzaAorKysg
Yi9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lmhhc2gKQEAgLTEsNCArMSw0IEBACi0jIEZyb20g
aHR0cHM6Ly9naXRodWIuY29tL2hhcmZidXp6L2hhcmZidXp6L3JlbGVhc2VzL3RhZy8xNC41LjAK
LXNoYTI1NiAgYjcxMzJlMTQ4MzU4YTQ1MTg1YzlmZWFmZDA0OWRiYWYyNDM2NDlkM2M0NDQxNGIz
NTM0ZDljOTVkMTg1OTJiOSAgaGFyZmJ1enotMTQuNS4wLnRhci54egorIyBGcm9tIGh0dHBzOi8v
Z2l0aHViLmNvbS9oYXJmYnV6ei9oYXJmYnV6ei9yZWxlYXNlcy90YWcvMTQuNS4xCitzaGEyNTYg
IDdlMmZhNGU4YzdjOThlOGQ4MTQwNjcxZjU3NzI1NDJhZmFhYTZhY2NjZmJkNzQ2NTA2ODg2YjZk
ODVmN2Y4ZDYgIGhhcmZidXp6LTE0LjUuMS50YXIueHoKICMgTG9jYWxseSBjb21wdXRlZAogc2hh
MjU2ICBiYThmODEwZjI0NTVjMmYwOGUyZDU2YmI0OWI3MmYzN2ZjZjY4ZjFmNGZhZGUzODk3N2Nm
ZDczNzIwNTBhZDY0ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZi
dXp6Lm1rIGIvcGFja2FnZS9oYXJmYnV6ei9oYXJmYnV6ei5tawppbmRleCA3MWVlZThmOTNmLi5m
OGY1MTJkNWE2IDEwMDY0NAotLS0gYS9wYWNrYWdlL2hhcmZidXp6L2hhcmZidXp6Lm1rCisrKyBi
L3BhY2thZ2UvaGFyZmJ1enovaGFyZmJ1enoubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1IQVJGQlVaWl9WRVJTSU9OID0gMTQuNS4wCitIQVJGQlVaWl9W
RVJTSU9OID0gMTQuNS4xCiBIQVJGQlVaWl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2hhcmZi
dXp6L2hhcmZidXp6L3JlbGVhc2VzL2Rvd25sb2FkLyQoSEFSRkJVWlpfVkVSU0lPTikKIEhBUkZC
VVpaX1NPVVJDRSA9IGhhcmZidXp6LSQoSEFSRkJVWlpfVkVSU0lPTikudGFyLnh6CiBIQVJGQlVa
Wl9MSUNFTlNFID0gTUlULCBJU0MgKHVjZG4gbGlicmFyeSkKLS0gCjIuNDcuMwoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
