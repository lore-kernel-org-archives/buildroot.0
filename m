Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C96606A322
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MqYLOI8/;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=tJlN0oEI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9784B409C7;
	Thu, 22 Oct 2026 20:57:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NouZOIkmHkBA; Thu, 22 Oct 2026 20:57:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7FB840574
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702647;
	b=ksBPF+WMUJjnIisZP+52pUrcJqaGUUcOf63pUz/QEv9R67D77pJm4C2h19Vu0cdIkItm
	 V27yiqZ4r2QaWs87PnJxjHtJNNTYbsxuZWq2RjotP1vTjiFsYFOM2ybnzKsUvgErgZmeg
	 /MOs+f0OVshjSO1QCkwQ8Zc/TA/lmnY1uWYDzd4fYeEQ96bs2YPdFYQgleUDbrzN6Cy8a
	 arF0CvH2HLY3AdkSneCll42/od0Y4usH6fdHtBZE1HMQIgaNoBN/0sGRO5NvrXcFYXdSj
	 f3eAHaKsMHR+9/w0Dbkro8COpeeSCzgNbxlnvbkylowkwlX8GOcXY5/RLllr3F7kl4w==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702647;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=yvf0425z/RPvME4Z+Fv9mp1Yccrrt19rciODQSMnbl8=;
	b=Ktv8rrXpnQCsuvYpTnW5c5FEJukXUKqK24woUDM+OYbO08mChs9HJ2E6tK7ZV3TRlD3P
	 SJo2U3XXrDYgeqwnFdAJY8qKXdX0ccH5ZCl3JJNyajWttQhHEEYNuG1d0ZadxHJoMbCtT
	 Ks99BmOUw06bFjuQbyKri+ACpBWkT5waurTNSX8/Z40mqI4JbMCryR5Kwx27+mTPICLyC
	 XBKHCnB6a1pKLQf92o5G5xuW0X2DFiv3DXWfwn+BfGOSPqrMQbx1IsqLbgFqYmgLedsuj
	 u4iExL0TmoyMWrkpsI0YCnRJmSmiIxZcyzOh/1FwwEGgZ5PLOePVo30JHBHZiDybwtw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702647;
	bh=yvf0425z/RPvME4Z+Fv9mp1Yccrrt19rciODQSMnbl8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MqYLOI8/A8Lqz3y3KPmyBG9EOnPwM1HJH5MrLaIx2IZwd/yAP5uqxpTW+k3BRsPuu
	 cDDK668zVSQTpwlHXoMJ9RcHRDHeFpQC0O3tE9Y2I9hdBz3nQ8GZcMrVP3EcF9tpw4
	 RpZajPWwvuakpacLsHEK5KXrgAJcEnImQ//j2+BWorHSktz3h5f+F61sBXe5i1XVSu
	 oH+XFQiv88rDWKitsT1L2u5P8t9woHh4Hok9BdRqiKPyjLZov0KBU/0Or7z7qhIGV9
	 TywntZaCPy39AeYLb+a+MICMg/2TXTnNOgZGYAtFsBvGZT7ZdfefSRrKKLd/8L8zSL
	 hZLn+hJWUUY+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7FB840574;
	Thu, 22 Oct 2026 20:57:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A0FD13A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91C936080C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bK_Z5uJhgDAI for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:57:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org ADEB3607E7
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::122f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792702644;
 b=TN2N8FEbWldFLIB4N/GG/C+mI/RqJkNXZCDjYai1ugt/grigfCooHou39AlHQQCdvsDu
 YGu5CO9bI7UsisExB787zVMLgLoXL5gOcYamLjb+aRaCbZjC5KUnufqbR/VAH9TFdcuV2
 7qWANcyStPeIv1Z7jsAaFHnBWzGhGgEszNKq3r5X/jSR0wkaZ28yhjadfakZ9gBrNPI4R
 3keWstSIRH/2Tz+MW+OhR09C8n9lRL+lIOigkiHfXMHRrrHpX2WDFZ7aluEWl6OlaNeh3
 6mrKw8I6wGWq/hMYSt7pIz7BM8WYOy/s9coQEF/rKxo6iFCJ1sTkCiomW5j0aCRKYgA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702644;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=VfY1NqKgTSO24lEd7aztqVbmAceOypw/z2s4PhyBP7g=;
 b=icJbpb/fCpGhANVSvfd9cRLGwYhpVrqTSzuu5Kd5lQey8x0yLbReh6LiwIAZt/vv0mFL
 LF2H/yh076qPOpg28c50IugpI2G2aLwKjuOBJT85P1oMJzHvO+9iG97N2i5o7vky2tDEd
 +TjX4rMoqa0yuIr5srtNQTwuZ8W+cHRot0ep7KxlynbnMG/LPT+QgwfWAEKl4KLlKnBKg
 PIo7u5D45n8vifmKakkz084WO8ifa6NpObvI/QQi3Bd5fYRcut3WHhnt7Eb/s8ByVVyTE
 V170E8j7vS6YhseY5ewZ9HrpsDmH8LktjU1k/XyhHI1rTpZNFogCUJHA+ubsiYbxU5w==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=tJlN0oEI; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::122f"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122f; helo=mail-dl1-x122f.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=tJlN0oEI
Received: from mail-dl1-x122f.google.com (mail-dl1-x122f.google.com
 [IPv6:2607:f8b0:4864:20::122f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ADEB3607E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:57:21 +0000 (UTC)
Received: by mail-dl1-x122f.google.com with SMTP id
 a92af1059eb24-181516de561so126673c88.1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 13:57:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792702641; cv=none;
 d=google.com; s=arc-20260327;
 b=eJTwbtBvQzQQpyXMeyeaxsIHL0Y4EsX4C1NzxMcpuovNMKsJVcC3PmLMHvFkNUdBKr
 ZW1NhF+np4FGl9PWNZ6ZvntNEc5WxUeev9TM+x2MjA5D5F/l0e5tY9HEwxtfhI9zxZeJ
 eSCB6/Rq+qzsXOZyHmZWIDpjagQOick5MM6e2xci3gNB9+T9azHEcphnaQofCnzCEfr/
 3n9+2lOjy2q7StzHHX52Cr7ImTiVLt89lnkY5pwFlRveP/PWB5CkV1tmANyNeLp0iVO/
 JK7oo2igIbwFsvG6JUrTdw/IR8KRWnxpdH1/M5yGgQNJORfOucgpFSJJ4sXb3FoGQYdv
 qe7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=VfY1NqKgTSO24lEd7aztqVbmAceOypw/z2s4PhyBP7g=;
 fh=eHwedtJLRfbxXOrIKhD4epcGSncfeprVhioTCrwoSnk=;
 b=QYwxoh28TLbNj4EYhTkeEhQ1h1ZkKjWoUoNmzvfIKRNqS5kTAvZ8GB/07Fsuce9s0U
 mec666glR6QPp/aM1kvnKtacf/t1glGRQMSW/v9HswmoidWAc4pbnqnk6Ly4OFjljFhK
 jkLr9T3+VX/Tz1OYMNnRK8xXFqajQlp8a1PAzS7BdSjHTJc07x4orXd2z1b8UT/zTHXz
 FBIGJNjxN3CIPSDODRGeQ7xmvMAH+HH3is79URaiUxEwJDnjCtMGPR9rvaWmVrBIV0/o
 hDNSgkR9zcRkNnrQwF7t86JotkLIMJjblVcHKFpfN/N/3W0SBnz37wbG2UN9ESKYGGel
 VH5Q==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792702641; x=1793307441;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=VfY1NqKgTSO24lEd7aztqVbmAceOypw/z2s4PhyBP7g=;
 b=tJlN0oEINch7Bty5X/UscegD3/qF03HKGN2fLlV50zHHkVaxNVSOVFd16IMBu0dmtS
 FkOb14vt7AyQkH/V0jKtLXyX+1yNYbC79tuWZSMEPc0jAj4GaJaNMhZdJeucTVZRAu8g
 V0+w94nRQwdKv3YVeLo27J1XQXug1LdINcm9ffROAHXyoUPJl4Jc7X2b9cLwMOgevt6j
 yLjcT8oT6eaOYidi0vtqw6s0DtQ/0hI+cUqC+FYGWfkGyemQKO1OuwgGprhCBhjqVdVM
 k3Ib4RjA18P7NxgFmyr2B/IGLaaegOKVOAC45vymTl2xqzuKER7H7FdbbzFWsy+GvmLe
 NPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792702641; x=1793307441;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=VfY1NqKgTSO24lEd7aztqVbmAceOypw/z2s4PhyBP7g=;
 b=oehgkKVOW8H/Qm5J44GSp3mXQO+gWwiQNgvXuvwQV7Lqgm1YobQAHk1ICVHYgnEvDG
 d8TmMGCLyUaQQjq9Rmrw4p8Oh3tmfGdLnJ8ve/zXaQ3S+18aUcro/WUoTvCIIe4ftgZq
 kZ0v9vbfOmXxyZLUtRyvb/gCUBEc2kSwlLo/ZKhQ49zeDze79xzj8xKWBTLebmr+puXm
 jxkCEjozx0EUo3FqsJYts3PQZhnlavxrl1bjuznGxPjvQHMHoxqh7LnI7H1L8soD9Uy6
 2XjcdCUWKDeeLzNcDOyzdGvUwLEoiKYGzjyGX/E9ayXFEwIv7xUK/KvK/H1SShgwmb+c
 8+UA==
X-Gm-Message-State: AFq9FYKz2UcIB2hiung622WymlM3+u4pFFHsENhWZ/wMhXFNWPZElPG8
 bzUdDqitxMlr1qQON9Mmb0VN4J6iqErgNnsFeyMyUzqXRdScVSJzsHUVK00pEXZ3K70Jhwnq2qp
 hgi8Andz60SxZYE7urSNWRgJSgfTO54N+q5s0g4YWJk0pCJJDJKQCKkU=
X-Gm-Gg: AYBFou3kEcbELAPAcPoyX5ZbUoGz7JuJeuRonqYWONG1PoQtPRu6XAkGVhepp4SjhpF
 K7Rn8gZ6I/Hth+ZAaPNu+B3SlOc4E0baU8+WH77mYvDRTOjhde+LSi5KwmSKll87GIHVNk5XzU7
 +0nd29rid3vQMfVwRPL1//gbF9/6/vef3r6HHqDVbApEvyEFjrTzstpbUVf7zWHVf3rYQCCgheF
 RpMO034LWvjfQ2dTgPOntDOgTdbekb+pCGPcjnEulNX+0lj2enPQiwbPQN4Uf8OwWnJoVJkIfZl
 5KWJS9RCPTDv7hm6q8GGPM845sKoKAnq4lbc6aMcn2+IYKKwVLSlchKblFq56EUMYEH1EntUFnH
 eoI5ptVoDAL3z93oIFSEnTnEViFCfqzQhA4ifpxaDY3ANAt/gTDKgDHIv/+xXPmAeobo6FP3HV5
 N74mdw67op6sTXaVblbEUFJQ==
X-Received: by 2002:a05:701b:42d1:20b0:185:e68c:904c with SMTP id
 a92af1059eb24-192f2f0ae92mr4206620c88.7.1792702640723; Thu, 22 Oct 2026
 13:57:20 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260614155328.304282-1-j@j-ernberg.se>
 <20260614155328.304282-6-j@j-ernberg.se>
 <atkwl965cKxez-Es@windsurf>
In-Reply-To: <atkwl965cKxez-Es@windsurf>
From: John Ernberg <j@j-ernberg.se>
Date: Thu, 22 Oct 2026 22:57:09 +0200
X-Gm-Features: AclHuK9Y0btzk83GDbRxiOHkq1xESU4SOajXRSwn7KxoY8dhAPgFFpk4BT7PuoA
Message-ID: <CAAHg4ZjS8XRRBTiUH+5cNfzqe6zHY2QNKhbmZ_1FJN_n0WsJ7g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, John Ernberg <john.ernberg@actia.se>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: Re: [Buildroot] [PATCH v2 5/8] package/libcamera-apps: Only enable
 EGL if both epoxy and xlib_libX11 are selected
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgMTE6NDjigK9QTSBUaG9tYXMgUGV0
YXp6b25pCjx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3cm90ZToKPgo+IE9uIFN1biwg
SnVuIDE0LCAyMDI2IGF0IDA1OjUzOjI1UE0gKzAyMDAsIEpvaG4gRXJuYmVyZyB3cm90ZToKPiA+
IFNpbmNlIHJlbGVhc2UgMC4yIG9mIHRoZSBycGljYW0tYXBwcyB0aGVzZSBkZXBlbmRlbmNpZXMg
aGF2ZSBiZWVuIHJlcXVpcmVkCj4gPiBpZiBlbmFibGVfZWdsPVRydWUgaXMgZ2l2ZW4gdG8gbWVz
b24uIFsxXQo+ID4KPiA+IFRoZSBkZXBlbmRlbmN5IGNoZWNrIHdhcyBicm9rZW4gc2luY2UgY29t
bWl0IDNmYWMxNjNiOTMxNQo+ID4gKCJwYWNrYWdlL2xpYmNhbWVyYS1hcHBzOiBidW1wIHRvIHZl
cnNpb24gMS4xLjAiKSBpbiBlYXJseSAyMDIzLgo+ID4KPiA+IExpbms6IGh0dHBzOi8vZ2l0aHVi
LmNvbS9yYXNwYmVycnlwaS9ycGljYW0tYXBwcy9jb21taXQvYzgzNTFhMDkxNzRmMTQzNDI0ODg0
MDgxYTY5YjZkZDgwMThmNGJhMyNkaWZmLWEyNDY4YTM5MDQwZjlmODgzZTViMDNlMTUyM2RkNGU3
M2ZkNDNhZDllYTg3ZjYwMDc3MjQ3N2I4OTBjZGQ2NTVMMTgtUjIyCj4KPiBUaGlzIGNvbW1pdCBp
cyBvbmx5IHJlb3JnYW5pemluZyBtZXNvbiBvcHRpb25zLCBJIHRoaW5rIHRoZSBjb21taXQKPiBh
Y3R1YWxseSBpbnRyb2R1Y2luZyB0aGUgcmVxdWlyZW1lbnQgZm9yIGVwb3h5K3hsaWIgaXMgb2xk
ZXIgdGhhbiB0aGlzCj4gb25lLgo+Cj4gPiBDYzogTWFyY3VzIEZvbGtlc3NvbiA8bWFyY3VzLmZv
bGtlc3NvbkBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEVybmJlcmcgPGpAai1l
cm5iZXJnLnNlPgo+Cj4gSSBiZWxpZXZlIHRoaXMgd291bGQgZml4Ogo+Cj4gICBodHRwczovL2F1
dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMjFkLzIxZGNkMjBkNzBjMTI3NTgwODM3MzNi
MGU1YmM4ZjFlZmM2NzEzNzAvYnVpbGQtZW5kLmxvZwo+Cj4gPiAtaWZlcSAoJChCUjJfUEFDS0FH
RV9YT1JHNykseSkKPiA+IC1MSUJDQU1FUkFfQVBQU19ERVBFTkRFTkNJRVMgKz0gXAo+ID4gLSAg
ICAgJChpZiAkKEJSMl9QQUNLQUdFX0xJQkVQT1hZKSxsaWJlcG94eSkgXAo+ID4gLSAgICAgJChp
ZiAkKEJSMl9QQUNLQUdFX1hMSUJfTElCWDExKSx4bGliX2xpYlgxMSkKPiA+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX0xJQkVQT1hZKSQoQlIyX1BBQ0tBR0VfWExJQl9MSUJYMTEpLHl5KQo+ID4gK0xJ
QkNBTUVSQV9BUFBTX0RFUEVOREVOQ0lFUyArPSBsaWJlcG94eSB4bGliX2xpYlgxMQo+ID4gIExJ
QkNBTUVSQV9BUFBTX0NPTkZfT1BUUyArPSAtRGVuYWJsZV9lZ2w9ZW5hYmxlZAo+ID4gIGVsc2UK
PiA+ICBMSUJDQU1FUkFfQVBQU19DT05GX09QVFMgKz0gLURlbmFibGVfZWdsPWRpc2FibGVkCj4K
PiBIb3dldmVyLCBJJ20gbm90IDEwMCUgY29udmluY2VkIHRoaXMgaXMgdGhlIHJpZ2h0IGZpeCBi
ZWNhdXNlIHRoZQo+IENvbmZpZy5pbiBhbHNvIGhhczoKPgo+ICAgICAgICAgc2VsZWN0IEJSMl9Q
QUNLQUdFX1hMSUJfTElCWDExIGlmIEJSMl9QQUNLQUdFX1hPUkc3ICYmIChCUjJfUEFDS0FHRV9I
QVNfTElCRUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTCkKPiAgICAgICAgIHNlbGVjdCBCUjJf
UEFDS0FHRV9MSUJEUk0gaWYgQlIyX1BBQ0tBR0VfWE9SRzcgJiYgKEJSMl9QQUNLQUdFX0hBU19M
SUJFR0wgfHwgQlIyX1BBQ0tBR0VfSEFTX0xJQkdMKQo+ICAgICAgICAgc2VsZWN0IEJSMl9QQUNL
QUdFX0xJQkVQT1hZIGlmIEJSMl9QQUNLQUdFX1hPUkc3ICYmIChCUjJfUEFDS0FHRV9IQVNfTElC
RUdMIHx8IEJSMl9QQUNLQUdFX0hBU19MSUJHTCkKPgo+IEkgY2FuJ3QgcmVhbGx5IHdyYXAgbXkg
aGVhZCBhcm91bmQgd2hhdCdzIHRoZSByaWdodCB3YXkgdG8gZGVhbCB3aXRoCj4gYWxsIHRob3Nl
IGRlcGVuZGVuY2llcy4KPgo+IFdpdGggeW91ciBjaGFuZ2U6Cj4KPiAgK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfTElCRVBPWFkpJChCUjJfUEFDS0FHRV9YTElCX0xJQlgxMSkseXkpCj4gICtMSUJDQU1F
UkFfQVBQU19ERVBFTkRFTkNJRVMgKz0gbGliZXBveHkgeGxpYl9saWJYMTEKPiAgIExJQkNBTUVS
QV9BUFBTX0NPTkZfT1BUUyArPSAtRGVuYWJsZV9lZ2w9ZW5hYmxlZAo+Cj4gV2UgbWF5IGJlIHBh
c3NpbmcgLURlbmFibGVfZWdsPWVuYWJsZWQgZXZlbiBpZiB0aGVyZSdzIG5vIE9wZW5HTAo+IHN1
cHBvcnQgYXQgYWxsOiBsaWJlcG94eSBjYW4gbm93IGJlIGVuYWJsZWQgd2l0aG91dCBhbnkgT3Bl
bkdMCj4gcHJvdmlkZXIgZW5hYmxlZCwgYW5kIHhsaWJfbGlieDExIGFsc28gZG9lc24ndCBndWFy
YW50ZWUgdGhhdCB3ZSBoYXZlCj4gT3BlbkdMIHN1cHBvcnQuCgpJIGNvbXBsZXRlbHkgb3Zlcmxv
b2tlZCB0aGF0LiBJJ2xsIG5lZWQgdG8gZGlnIGludG8gdGhhdC4KCj4KPiBJIGhvbmVzdGx5IGRv
bid0IHF1aXRlIHVuZGVyc3RhbmQgdGhvc2Ugc2VsZWN0cyBpbiB0aGUgQ29uZmlnLmluCj4gZmls
ZS4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGxpYmNhbWVyYS1hcHBzIGhhcyBhIHByZXZpZXcv
IGZvbGRlcgo+IHdpdGggc2V2ZXJhbCB2YXJpYW50czogZHJtLXByZXZpZXcsIGVnbC1wcmV2aWV3
LCB3YXlsYW5kLWVnbC1wcmV2aWV3LAo+IHF0LXByZXZpZXcgYW5kIG51bGwtcHJldmlldy4gTWF5
YmUgd2Ugc2hvdWxkIGluc3RlYWQgaGFuZGxlIHRoZXNlIG1vcmUKPiBjbGVhcmx5L2V4cGxpY2l0
bHk/CgpTb3VuZHMgbGlrZSBhIGdvb2QgaWRlYS4gSSdsbCBzZWUgd2hhdCBJIGNhbiBhY2hpZXZl
LgoKVGhhbmtzISAvLyBKb2huIEVybmJlcmcKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
