Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC47B606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IYF63vOT
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BCC5281004;
	Thu, 29 Oct 2026 21:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OtRXFTFWozWB; Thu, 29 Oct 2026 21:36:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA9A580F72
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793309780;
	b=a5Ls1DoHaiMGNr0IqKsJpJ1ky5tkU+9LPtbZ7oNv9gqGwpMrduhUM4dK+r4qhKqckX4Z
	 EXRJvuONkTS81y9yd284sMYkG2vvOSuzbKcjMljQwXLttOgC/mti7wiYuXpe07jlAlLgO
	 YXfjkN/R4ux1t19w31GdWVZGJx6nvtu0CfP08jm5/QSpPJmJBCaV7cdcrVJ9QDeO8NpLH
	 OWqXyT2f77f9ho3J1QmcGogOSpL7mZXf5qlYwTDJE5X8Fhsqnh81zYtmssaBInHLHjFMH
	 TOofzjyOHsUJUmFhmHN1pBKxy3+Jrzz/ZUsjkTLgy0iggUD+CCS1mRIGtFed1KbfVIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793309780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=DUV6gC/a+6qMYqrdrSnhChy+O8aJ5LW+tyeSC3g/zQk=;
	b=c5YBxyU9Kb0Do+V9Ml3Gce2PV/jFAMTID4j3Xb92aIp1ZVIKx0Pat5hCdnH8cJSz/MlU
	 Ks77JaqUg2NcD5mf0P/pl6PjvSxtPjHm14+B2GKcp8Fd3Y8PBidI1ko6rXGgIQgWFxiSy
	 A9ohuAgB8CCJ7imxA3ACCHKTkgqJO5bxewL2dqgASEHYZEnJ/nhs1sHvC9LBDIAR/VS78
	 LUsoOz1dwyzwdW/C0yHJ9BXgKW3b3m3e5RqsVR7UKQsHa6koFYbmqbig/x96J1LIXnQ0j
	 mH1aHtden0QkWlx1ccNVb0ooP9D5zpld17e3Jky8P/pNdwpRxV41wk+ipYNojLtDrRA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793309780;
	bh=DUV6gC/a+6qMYqrdrSnhChy+O8aJ5LW+tyeSC3g/zQk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IYF63vOTijFIt/TdSJSFGdAM1Q6Uh74pBAKqDpxPHcROshSRJjH5imxB9COX7WhEB
	 m8qXua2dNh3CrluuUPXhi8Hdne38reOKmSIxvPlriUKfIAB0RPVvK4GFaXAuIMQDmt
	 /f1h/76PhKmzJTiMfveIBVvA0q5/oumQPjCkoOn+5XQnhpaXoZCgct0RTVLXz2aebc
	 0DPhwdk3kQruv0FfY0BLik9f5ViSxD7w67I/kKhGK4oee2T4RVvjAobZFuhyV4mtDG
	 RhoTz7SKGkz9rLcHQCN7Pc7jG9Y0S+xgADXX7DUbjk1o7QdDGfi/00XXB6ndPxhjaE
	 2BuhVIp0asA1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA9A580F72;
	Thu, 29 Oct 2026 21:36:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 324CE1DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17F7240506
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ohBCKnq4iyKm for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 21:36:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 251FE40176
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793309776;
 b=DifG9g7tFPthPaK/TZgHBozY+E25COuJl4H2ePjg8hZ6JcSpZadMEoVKx7RIMjc3pBN0
 LTnKePrLJpFSg/m5YoGSlNVR0vy0ce6hE5BJVpU4rBnWKcVqJRmL0A43AuSf3QYoEu3Vs
 NVXsj9de3R1bnfhWcEvTwcF50/S6NxsKk+2lN5ZA2rohMeRVniSgwtPOPH1GOp63vsLZt
 L93wc6E7XF0jqqZBjLOEYaMhJyLWRat7kz2t27xXvhKTdPCnjkHm3ZfB3F84CqjwLQHil
 V5Tu3GfH11EoHbKIwH8MJCKFjKlC0WcNYfl1s96pJkchBzhxgC7UeQSuiW0TX8tnoLA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793309776;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=gzpoJ77bYxg79kJZfbsCjJZMjG50LvqMExyYQm19Kcc=;
 b=s+niqoq4G1wheu+okBwRcV0OOLYNbcIiWFuFwYaRJ4DDifUV5TFVSrxyuNyE8mdMTbVV
 qq3bCgbb4WRIbbzIUS+764Jd//zpgc3GKVwuhaj30VFrkmvsUs/g/kAaS1i3wqDwh6ZnF
 YnblVtvs6ru04PUTOVuaxGQt2dbx16WonoVUvqc+nh433F5N5Lw9FRlIXQLYV25/AzNgq
 mO6/T9ev/d2yAiH5NYj9G4dVCvMOdU9jdYdxkgpjeHfJcWtCUYQ9ynVwnWKqeFEqTqqXf
 n788HBjbH8cjBm4BrMuRuK0Ul4KXyX6rJ3apdsXCQRiHMNBoxtbHQBoRFj7BOTNQgfQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=a0gVTs2A; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 251FE40176
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 21:36:14 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a35db1f202so192545e9.3
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 14:36:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793309772; x=1793914572;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gzpoJ77bYxg79kJZfbsCjJZMjG50LvqMExyYQm19Kcc=;
 b=WEJgJvhut00g9x/uacUhq71/MPBzneoo+nbOXbOlyQXSiZmpVV3u77WXvfS2EQX6Pk
 4r/mTieAOLhr8UR53y48NHhxtsg9Vtk4kxXmf8594hFK/bihc/bU6iuUiHhRTmN0wG/J
 4tST+e1Qc4WV81DgBddeDqQLGRSx9u2R2n0nSzjqDJ2UNsKK/YPdlsa5w5RpFgt5EF7M
 SwNosTqCSG5/p6K4VwWPJinyeQojmpmWpk3LrCxIE0cdQm79Zh5Be86JBy08JyBPJ5DX
 vDi7XtjI8/KMFK4QulltbaRZGYUWLc5L0lS3TGTZ4RnHjcs9BfPCAVh3sZL05OBTBmJM
 BQdg==
X-Gm-Message-State: AFq9FYJJI6S6Tyt3KdOlLZtand3xBI06O4W695pLL4QrCddD6iW99CM1
 n+gN3j9tkrydo0rfNM/NausuOFwUrTXT8NeatpQOhUjp7vciSRkAIhKP70JRZoaut6diAsDSDgP
 CJvCUnwJ0BQ==
X-Gm-Gg: AYBFou2puDRaw39PjPdmBEYOA+7s75rvsWLItw4HOGnB60oxMnKrMyLy2gnToZgKPmA
 rXhoio7Horx50RmNJ0gTzgLWNowMqYwbBiVVLT6i0Q1W4AIDV8fO+VrKjyATRL1ieeBir+0Zz2Q
 QxnYYpTEnLP767nQ/rW0L9L69DKPx7rw3tqeYiGXRjZUCoM8TcopMtH/dh3ulu+r205Xmd1/NIw
 Lp7hk5ci3sC+WrTLQEv3ANWIH9BcitPDQ3gOYaMXBegJwaSvtDPUe/dKeqjgaGErMT3lyh93QAd
 45hIP4jQk00pqUrKus76zLA2Hg4oMntOkUhkvFT4NXOccMzUNa8TBLTtGPs+nin3aB064RpEF8+
 LF7k7Uyk8XITKss06aOPysB6RBPoHdDbpsGxtoqm9kFPj3Ixd7UytGEqwNKw1rugzj0DeNxJnMV
 JURekfq1/rr2eZIjpo+6vAY2FGJ2rww/EPq7h5t1YJlRdKRRZSrXqXrSB0RKm1iK8DpDjpF/J2y
 m/uZq1nnNXQXRymVjSAOPMBQeojJTr6cwio85eBl67K5zR7v+KKikX9PgUFkL47XNNg0bJZLjK9
 WWAFIu6U6pXd9XTcfnR1IydBc9MhElb1JNb5oG5daEmP
X-Received: by 2002:a05:600c:a4e:b0:4a7:76fa:87e9 with SMTP id
 5b1f17b1804b1-4ac187a766bmr5704415e9.21.1793309772652; 
 Thu, 29 Oct 2026 14:36:12 -0700 (PDT)
Received: from debian-hp-1.fritz.box ([212.233.51.18])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e6eb25dbbsm858997f8f.2.2026.10.29.14.36.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2026 14:36:12 -0700 (PDT)
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Thu, 29 Oct 2026 22:35:42 +0100
Message-ID: <20261029213546.1783883-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261029213546.1783883-1-raphael.melotte@mind.be>
References: <20261029213546.1783883-1-raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for, 2025.02.x,
 2026.08.x 3/3] package/mupdf: add upstream security fix for
 CVE-2026-40505
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
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUgPHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJl
PgotLS0KIC4uLm9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJtaW5hbC5wYXRjaCB8IDI4
ICsrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvbXVwZGYvbXVwZGYubWsgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAzICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKykKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL211cGRmLzAwMDQtYnVnLTcwOTEwOC1kb24tdC1wcmlu
dC1yYXctZm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9t
dXBkZi8wMDA0LWJ1Zy03MDkxMDgtZG9uLXQtcHJpbnQtcmF3LWZvbnQtbmFtZS10by10ZXJtaW5h
bC5wYXRjaCBiL3BhY2thZ2UvbXVwZGYvMDAwNC1idWctNzA5MTA4LWRvbi10LXByaW50LXJhdy1m
b250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAw
MDAwMDAwMC4uZDkxZmRmNDlmMAotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvbXVwZGYvMDAw
NC1idWctNzA5MTA4LWRvbi10LXByaW50LXJhdy1mb250LW5hbWUtdG8tdGVybWluYWwucGF0Y2gK
QEAgLTAsMCArMSwyOCBAQAorRnJvbSBjMTljODJlNDZhZmZlOGQ0MDcwZjU1MTRhM2EzMDcyNThm
OWRmYmQ5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbTogVG9yIEFuZGVyc3NvbiA8dG9y
LmFuZGVyc3NvbkBhcnRpZmV4LmNvbT4KK0RhdGU6IE1vbiwgOSBGZWIgMjAyNiAxNzo0NDowNSAr
MDEwMAorU3ViamVjdDogW1BBVENIXSBCdWcgNzA5MTA4OiBEb24ndCBwcmludCByYXcgZm9udCBu
YW1lIHRvIHRlcm1pbmFsLgorCitVc2UgJXEgdG8gZm9ybWF0IHRoZSBmb250IG5hbWUgYXMgYSBx
dW90ZWQgc3RyaW5nLgorCisoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCAwZjE3ZDc4OWZlOGMy
OWI0MWU0NzY2M2JlODI1MTRhYWNhM2E0ZGZiKQorVXBzdHJlYW06IGh0dHBzOi8vZ2l0aHViLmNv
bS9BcnRpZmV4U29mdHdhcmUvbXVwZGYvY29tbWl0LzBmMTdkNzg5ZmU4YzI5YjQxZTQ3NjYzYmU4
MjUxNGFhY2EzYTRkZmIKK0NWRTogQ1ZFLTIwMjYtNDA1MDUKK1NpZ25lZC1vZmYtYnk6IFJhcGhh
w6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KKy0tLQorIHNvdXJjZS90b29s
cy9wZGZpbmZvLmMgfCAyICstCisgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCisKK2RpZmYgLS1naXQgYS9zb3VyY2UvdG9vbHMvcGRmaW5mby5jIGIvc291cmNl
L3Rvb2xzL3BkZmluZm8uYworaW5kZXggYmM0YzA3ZWRjLi5hYjRlNjYzMDEgMTAwNjQ0CistLS0g
YS9zb3VyY2UvdG9vbHMvcGRmaW5mby5jCisrKysgYi9zb3VyY2UvdG9vbHMvcGRmaW5mby5jCitA
QCAtNzE3LDcgKzcxNyw3IEBAIHByaW50aW5mbyhmel9jb250ZXh0ICpjdHgsIGdsb2JhbHMgKmds
bywgY2hhciAqZmlsZW5hbWUsIGludCBzaG93LCBpbnQgcGFnZSkKKyAJCWZ6X3dyaXRlX3ByaW50
ZihjdHgsIG91dCwgIkZvbnRzICglZCk6XG4iLCBnbG8tPmZvbnRzKTsKKyAJCWZvciAoaSA9IDA7
IGkgPCBnbG8tPmZvbnRzOyBpKyspCisgCQl7CistCQkJZnpfd3JpdGVfcHJpbnRmKGN0eCwgb3V0
LCBQQUdFX0ZNVF96dSAiJXMgJyVzJyAlcyVzKCVkIDAgUilcbiIsCisrCQkJZnpfd3JpdGVfcHJp
bnRmKGN0eCwgb3V0LCBQQUdFX0ZNVF96dSAiJXMgJXEgJXMlcyglZCAwIFIpXG4iLAorIAkJCQln
bG8tPmZvbnRbaV0ucGFnZSwKKyAJCQkJcGRmX3RvX251bShjdHgsIGdsby0+Zm9udFtpXS5wYWdl
cmVmKSwKKyAJCQkJcGRmX3RvX25hbWUoY3R4LCBnbG8tPmZvbnRbaV0udS5mb250LnN1YnR5cGUp
LApkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9tdXBkZi5tayBiL3BhY2thZ2UvbXVwZGYvbXVw
ZGYubWsKaW5kZXggNzZlNWRiOWY2ZC4uYWM5MDk1YTJmYiAxMDA2NDQKLS0tIGEvcGFja2FnZS9t
dXBkZi9tdXBkZi5taworKysgYi9wYWNrYWdlL211cGRmL211cGRmLm1rCkBAIC0zNiw2ICszNiw5
IEBAIE1VUERGX0lHTk9SRV9DVkVTICs9IENWRS0yMDI1LTQ2MjA2CiAjIDAwMDMtYnVnLTcwODg0
MC11c2UtaXRlcmF0aW9uLWZvci12YWx1ZS1mcm9tLWluaGVyaXRhYmxlLXByb3BlcnR5LnBhdGNo
CiBNVVBERl9JR05PUkVfQ1ZFUyArPSBDVkUtMjAyNS03MTM4MgogCisjIDAwMDQtYnVnLTcwOTEw
OC1kb24tdC1wcmludC1yYXctZm9udC1uYW1lLXRvLXRlcm1pbmFsLnBhdGNoCitNVVBERl9JR05P
UkVfQ1ZFUyArPSBDVkUtMjAyNi00MDUwNQorCiAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFHUyBh
bmQgTElCUyBidXQgWENGTEFHUyBhbmQgWExJQlMgaW5zdGVhZC4KICMgd2l0aCBVU0VfU1lTVEVN
X0xJQlMgaXQgd2lsbCB0cnkgdG8gdXNlIHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0aGUg
YnVuZGxlZCBvbmVzLgogTVVQREZfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJH
RVRfQ09ORklHVVJFX09QVFMpIFwKLS0gCjIuNTQuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
