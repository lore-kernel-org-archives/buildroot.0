Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D476C606A31B
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 11:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=P04HzFXP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB9D480D7A;
	Tue, 27 Oct 2026 11:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hQNs7he4OjR; Tue, 27 Oct 2026 11:41:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F77E80D5E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793101313;
	b=eSMh85k5OnM42C+Z08z3rcAQJ5ePkP6HuQJ5vstRjuB1Xu8uv2fVXWMquM2hSTkZ3xNa
	 8VxDj3RfufiYm/yK9SVJKqW9EoyevEIdGsyGPKiK47nMCQNMfcw7eHSI4+baq8+f8pGeH
	 D28sD7+7DFyPBdYIsjbbKmvFVGsCe/qK0hyAzocLFmoKwBs0pa+He7X1gje1tPnkBdp5F
	 HMmAZq60QmFuNhPLx4lQa/dwr9+UHjzDDJJK9waomWrpcSIgYzOzJSZKT70j1PlCD91AP
	 MsbhMZVOXCwRRVAX42LJevXTleNTGmf35edw4OwSpxkcgufrjIhRELvZ4i5iXHN8zHg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793101313;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:Date:X-Gm-Features:Message-ID:To:
	 Cc:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=VpiGfzDDHXZBuAhcI/FN6eFiE8fv8hDx2+Po5AgI1Qc=;
	b=LmcpUCN2P7dGhn4x3/QfPAyC+przPYF1uN/fuVaxpxH32URTXKxZmVzUAyHxHvdKfoXq
	 lY7MrJKF52njqrwZUq5mVRdfmBxalLyoJZOJSERg+aNvYVlJlmHfI5FSN7Edmc/Ai05PH
	 US+A84k0GnTEMB7zCyov+rparVzNNcBr7tuKmyi6RXpiBGnqhN1Wl4HoRoQZ2/muwJoeA
	 v0IdE+qfWoZkPHKF29kbQs1eoGRa5MVhvQS3md7NaZXnD7UbkI46YWzPXyU3igrj2cBC+
	 gc4gi4mXhdYj69Ug12EPSY0j+qxUqiZ5lYYHN+mRS2eqngol0z5i8NJYeyuyaxhQSoQ==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793101313;
	bh=VpiGfzDDHXZBuAhcI/FN6eFiE8fv8hDx2+Po5AgI1Qc=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P04HzFXPN8eDbRsB/m9hNnL0zmfnvho+u9AB23yOWUGDdwC06jaBkG81nO6Di02BC
	 WeKzE4XKfmGP3wK6Y1OYxgtPJGPqGfD/VsclVFjyGUipC4d/a8tlxB0PXfohqxaDNt
	 uisjz6lVMaZ933d1DGXqigayYctpJDf8IXUoLsAjTsz2ewZdy9NfZYZgFV/6Mnydy+
	 2fWzUXuTPvKBPKriQgA1D+iCqFroR+Sp0kmMDJLfOD+lcgSHB6UMl3zDweHwN5VATJ
	 Sl8QLkdzqd9C1Ad63FRo/A/DZKnkorOtoFQapX+xX8XnaG/2t67EQT1yHO5v76Mp1V
	 r1EzkxNeNdO8A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F77E80D5E;
	Tue, 27 Oct 2026 11:41:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1113C72
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 11:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 027F840185
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 11:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bTyyMyk2PR6S for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 11:41:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EFA944005F
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793101311;
 b=mKT/n2WVrVGbTWCLDTIo07hdLrIuaceYy87jtZ14/1N8oDjfb/gdP0SGL4x7sGJkv5jI
 PqBarYgIascIuUHEzrSBNnM37BfYtktYiEqvAoS5IY3alYwq+Ep0sXImfkMMDwd2byKOq
 n8C25EnBT7cUr+S+IZVLPLWoo2iOEqTIALkKL6MFoJYNBOSlOvpwnyFape2fvoUXE88pX
 JFFf9x76H+C3PzT9w95RJKgl+cPbqqgrhsQOPfszQXN63lX7/OnZQcjgBhpZ7lIYm55qc
 a3Q/onYiSFZq/QeEBAcBLeae8v+kdUqOevVlaiM89zWW05fqg0nrrlxCdyyMg5294kw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793101311;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=WwITWe/Ib4UL4u88y/4wN48mpiu/cP6xSKqie87Vo2M=;
 b=r/lvcEfy5O6TsBnFrZ2f3xM7Jss6TW3B79qhrH4ndhU/4A8TRnKip9Ih9ibbQP1zGPuW
 jJk9Pg70LyAlDlPk4zfOdwHHaQm3MMk8yRI7OJxaPrs5RnXaqkNQ/hUB8H+1xLUO/uBZB
 mznNnvyAZ0HdqVW6dTunPs1KZ+89XW/F24x43yPTrpHgwcrAw9JG3N1E79XEPJlgtroLc
 J5Z+17PKO9BfUuFpeevk4KHcm5SzmQGn3ik9m6sWDbuRsEMXw2k++qHheGCcs5asGVhGW
 vGjNJ1G8LKbiGF94Efq0d6JHIvtzAV99uP9P5V48bv72+DG4tT/CxcPT+RP1PPRhOIA==
ARC-Authentication-Results: i=2; smtp2.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=IknSqL07; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2001:4860:4864:20::2f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::2f; helo=mail-oa1-x2f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EFA944005F
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 11:41:50 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-48eee44b908so2405906fac.1
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 04:41:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793101309; cv=none;
 d=google.com; s=arc-20260327;
 b=V/NdlTvw6dGz9+PP5+k5bLmmjQAWtJJkR+xjJMFjwkfJ2RhBFicOMVdodfiPUP+xcY
 8xdVPUem05HMA0ww6D8uqsM1wreKrP8+1X58cAXIRK0kU0fn3TGMooZR+JukRk/emuf9
 NaTyAjO0XekNODpAN2df7FKuamDQj4QkyYLOG6+HQujDps9jaBt+I+QmVlnXxskethVB
 A3UzK4OpmXJyyxogh+zkAam23WcBJRSGH80NG+F0//Sp0Ya4Lyy5iSN8Rxai9Y1khbxT
 8LO5NmySv1HiiwZ2eErqBvTSBQiaGiZuJOBhO41+7tuyAs3Fq2ManE2lHWUJur2UZyqZ
 Rifg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=WwITWe/Ib4UL4u88y/4wN48mpiu/cP6xSKqie87Vo2M=;
 fh=t1HKz4FGwg2rlpSa7EUNbKGYl/IKyrvQ/1p5yhNuG2o=;
 b=RZRhtAxqdNRmkKki6Zumv4T85QN8oInK34ifJ0NXIlTe7XLklSTQ9o92lDcJ/Uxoex
 TfaznXiNaZzXL1j3R1Ihz8SXN6HfZ9hUThqaJ7WbXSuZT4p11Mqq0vLlqV/pB1erl4iO
 fYQnJ048bVjnjvsEQnyatdedjijy67TWWppk0ArXg3BQWOFXs9TJ0AYosqRuWTpuD93r
 v7vMd5YW5SrcJpYGHD0fHrR6UjfnMC8FdqEdhYmM0LGC3bW60FeIXWtLh0pW/n0QSySc
 XRrESD63IoxBGJOiJjsAPRpPFrQzJ5PJzVi3pcuKS1Lpo4d5ptO9JwRqk6ZUZ6Zz17IP
 uG8g==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793101309; x=1793706109;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=WwITWe/Ib4UL4u88y/4wN48mpiu/cP6xSKqie87Vo2M=;
 b=f+1e31htBpGhFDViz1Lle2q6/95tBEnKpxWrb8h0soXXkt14/VzSjVUIj7tEOfyEDF
 EBKat4dJtIqmzy77vcIhRZUDKtJkpmm01DqDSEBJa3VEWSxZlc7p26CZLY+gan5tMQ9n
 jjgqmMq4dfGMvEEogltVQzFM54kclGjr3loKHCA77LZvFa94RpfNFGjoPY2sQ7vHbA8W
 aENcHQNSjx7l6RHTQWteCMvC5Z0IB3cMum/tqjGDhd1+FEXN8tecUjc0QWf09rjsbG8V
 +X0ktT6sDxzegcCzCUwi7uk2JjGme2MbfvH/fJfGJzr2mUuhUspL6RL7QnvHjXhN+R0g
 dH4Q==
X-Gm-Message-State: AFq9FYKz8HbmYbbnKgB8JAbr95qnriRCs371an92bSqrtsdwdvjYB1Id
 +zPKrWbi0wZOSyN+vn1C6bdE15nELEmhFDk6CHMduaHN8RHGvs5UC6hs+C7SJ7thV5LdNz5EATR
 KGLhlEMgWLV1Ly2RyfKcBr6fHMVurg1N3c3SA
X-Gm-Gg: AYBFou0MaweixsRyP/uGA+soLOK1s57/asJpouw5h15hRxRI9KHDsyqsn1Ic6rdFN7F
 /u9JoVOiG+aGQLL4IlhH76Bli/80bzxVkEkyx+Dk2y21IaXVMfqdnOQE8EvUWDztwVyH9ILFalS
 OKyfWgK+shTE/jpIrdqx7rYuTScRkNUBIj0X2HuI8x5YUKNfUlGg+xSvMe04TZ93jYDbl5ba+PD
 aGz8IsvE7OBx7pvGhsK4vOHbmf6FsbtJ23N8Y6v//Aqoiiz4oW/JDKEEjVWRlzZld+BJNV9t89p
 lzSvNb81U1+sCGMXIoDwDUwsvevYym1Ww/HepV6FsCd3tltLmIERBDp4TfftJ/kgktRZ2xnkJF+
 gb5jaDZDE1J5h3JN/5+R0r+q4r2d0iWiAFPSf/A==
X-Received: by 2002:a05:6808:1804:b0:4a3:3108:866a with SMTP id
 5614622812f47-55c0026d2b0mr5579838b6e.17.1793101309248; Tue, 27 Oct 2026
 04:41:49 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261026135226.1614907-1-yegorslists@googlemail.com>
 <at_LGuRSbDPCUp60@windsurf>
In-Reply-To: <at_LGuRSbDPCUp60@windsurf>
Date: Tue, 27 Oct 2026 12:42:16 +0100
X-Gm-Features: AclHuK_X9SwguPaLf-nVHrje_IK0iLTLpGR3kxF-slbpSvgtm2rxEHA46AhgfDI
Message-ID: <CAGm1_ksPkLuq_MsPiYsT1dGLOQ5-goRRTNENcTu3ByYZbo4t6Q@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
Subject: Re: [Buildroot] [PATCH] package/ccrypt: fix build with GCC 15 on
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gTW9uLCBPY3QgMjYsIDIwMjYgYXQgMTA6NTHigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIE1vbiwg
T2N0IDI2LCAyMDI2IGF0IDAyOjUyOjI2UE0gKzAxMDAsIFllZ29yIFllZnJlbW92IHZpYSBidWls
ZHJvb3Qgd3JvdGU6Cj4gPiBXaGVuIGNyb3NzLWNvbXBpbGluZywgY2NyeXB0J3MgY29uZmlndXJl
IGNhbid0IHJ1biBpdHMgZ2V0b3B0X2xvbmcKPiA+IHRlc3QgYW5kIGFsd2F5cyBmYWxscyBiYWNr
IHRvIHRoZSBidW5kbGVkIGdldG9wdC4gSXRzIGdldG9wdC5oIG9ubHkKPiA+IHByb3RvdHlwZXMg
Z2V0b3B0KCkgd2hlbiBfX0dOVV9MSUJSQVJZX18gaXMgZGVmaW5lZCAoZ2xpYmMsIHVDbGliYyks
Cj4gPiBzbyBvbiBtdXNsIGl0IGRlY2xhcmVzICJleHRlcm4gaW50IGdldG9wdCAoKTsiLCBhbmQg
Z2V0b3B0LmMgZGVjbGFyZXMKPiA+ICJleHRlcm4gY2hhciAqZ2V0ZW52ICgpOyIuIEdDQyAxNSBk
ZWZhdWx0cyB0byBDMjMsIHdoZXJlIGFuIGVtcHR5Cj4gPiBwYXJhbWV0ZXIgbGlzdCBtZWFucyAo
dm9pZCksIHNvIHRoZSBidWlsZCBmYWlsczoKPiA+Cj4gPiAgIHVuaXN0ZC5oOjEyNzo1OiBlcnJv
cjogY29uZmxpY3RpbmcgdHlwZXMgZm9yICdnZXRvcHQnOyBoYXZlICdpbnQoaW50LCAgY2hhciAq
IGNvbnN0KiwgY29uc3QgY2hhciAqKScKPiA+ICAgLi9pbmNsdWRlL2dldG9wdC9nZXRvcHQuaDox
NTA6MTI6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mICdnZXRvcHQnIHdpdGggdHlwZSAn
aW50KHZvaWQpJwo+ID4gICBnZXRvcHQuYzo0MDQ6MjE6IGVycm9yOiB0b28gbWFueSBhcmd1bWVu
dHMgdG8gZnVuY3Rpb24gJ2dldGVudic7IGV4cGVjdGVkIDAsIGhhdmUgMQo+ID4KPiA+IEFkZCBh
IHBhdGNoIHRoYXQgYWx3YXlzIHVzZXMgdGhlIGZ1bGwgUE9TSVggcHJvdG90eXBlIGZvciBnZXRv
cHQoKQo+ID4gYW5kIGdpdmVzIGdldGVudigpIGl0cyBzdGFuZGFyZCBwcm90b3R5cGUuCj4gPgo+
ID4gVGhpcyBpc3N1ZSBoYXMgYmVlbiBwcmVzZW50IHNpbmNlIGNvbW1pdCA3NTg5MTM5N2FiZTYg
KCJwYWNrYWdlL2djYzoKPiA+IGFkZCBzdXBwb3J0IGZvciBHQ0MgMTUueCIpLCB3aGljaCBtYWRl
IGEgQzIzLWJ5LWRlZmF1bHQgY29tcGlsZXIKPiA+IGF2YWlsYWJsZS4gSXQgdGhlcmVmb3JlIGFm
ZmVjdHMgMjAyNS4wOCBhbmQgbGF0ZXIsIGluY2x1ZGluZyB0aGUKPiA+IDIwMjYuMDIueCBMVFMg
YnJhbmNoLgo+ID4KPiA+IEZpeGVzOgo+ID4gaHR0cHM6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9y
Zy9yZXN1bHRzL2RkMmIzNjI1NDI0ODhhMzA2YTUyM2ZhMDVkZWRjODU5ZGZiMGNmN2UKPiA+Cj4g
PiBGaXhlczogNzU4OTEzOTdhYmU2MGRiZTNkODJhMWVjMzk2NTRmZjgxZDFiMTQwNiAoInBhY2th
Z2UvZ2NjOiBhZGQgc3VwcG9ydCBmb3IgR0NDIDE1LngiKQo+ID4gQXNzaXN0ZWQtYnk6IENsYXVk
ZTpjbGF1ZGUtb3B1cy01LTUKPiA+IFNpZ25lZC1vZmYtYnk6IFllZ29yIFllZnJlbW92IDx5ZWdv
cnNsaXN0c0Bnb29nbGVtYWlsLmNvbT4KPgo+IEFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MhIFRv
IGJlIGhvbmVzdCwgSSdtIG5vdCBzdXJlIHdlIHNob3VsZCBrZWVwCj4gY2NyeXB0LiBObyByZWxl
YXNlIHNpbmNlIDIwMTguLi4gZm9yIGEgY3J5cHRvIHJlbGF0ZWQgcHJvZ3JhbS4gVGhhdAo+IGRv
ZXNuJ3Qgc21lbGwgbGlrZSBhIHZlcnkgYWN0aXZlL21haW50YWluZWQgcHJvamVjdC4KClRoZSBz
dHJhbmdlIHRoaW5nIGlzLCB0aGUgbWFpbnRhaW5lciBpcyBzdGlsbCBhY3RpdmU6Cmh0dHBzOi8v
c291cmNlZm9yZ2UubmV0L3AvY2NyeXB0L2J1Z3MvMzEvLiBUaG91Z2ggdGhpcyBkb2Vzbid0IGxl
YWQgdG8KYSBuZXcgcmVsZWFzZSA6LSgKClllZ29yCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
