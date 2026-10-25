Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0192606A31B
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 14:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qqMuh1Cy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=lHU7GfdU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C649D40C85;
	Sun, 25 Oct 2026 14:14:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L7aoQsv8X8DW; Sun, 25 Oct 2026 14:14:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2588A40713
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792937652;
	b=G9PIp4dULxx0RkYCcLY447R9+MhCqMxr9rnujmztJkvJSd3GQGeec2Qmo9B45G4blUZX
	 79CxmIl2/QEIWDw5ChokFGx+QSuRbzDFTExOZoWtJHtwaduh4Fd4Ibf0IGAC/t42JwkRK
	 3yaKt5qCdaVulEZDk0N8HgxAz446CbwCc/YIuJc4ZeoZKWnei+Wnu9HKdKydnNXI8qn08
	 PdcTS2kAg4rNJQW0kTxnDTTs4eyRau/pbl6yAVlarRuBJcrF9i09oLQdjJAJyP0FFr1cY
	 ofGsN9yDa8yBWjh0Cdx26PzTJz5C4zC94TihkAjk+3rE0ycW+qsmHc2xvMao9KTuDvw==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792937652;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:To:Cc:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SheM15VAdqeHyP2sYf/fynlY8AcN3An5jkfGhlb24Fc=;
	b=kVSp82QvA1gn3dbfcQymVIPmkgEXme25rIcbzufPN95DvM0K8H7qIyCsQUFdecg3OLcW
	 zgkoDhG1znOoYiAGlVrmEb5jjC3BIoyL04ZguaTcGTGd962xKV/pYBHMP+z7ooXHhD6uK
	 XV2JrFl5HX23ku62FgniSM2TOju60gp3x871dWJxRRjKNHmXK4+XTxxFHdIAoPzGBe+z2
	 tNcWL64hbLAS1s2YUyjrbQOzcBm/3lY+pAl5Gd7lkiZHG7p6+hEhRQMHqe5RZ52moykpI
	 uYG5ZqGEgeaLIvLgBkKBouzl6wvG+Xp9zd91nCm3nkEe0Y+p+oPA7a8sKSFsQJUmsaA==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792937652;
	bh=SheM15VAdqeHyP2sYf/fynlY8AcN3An5jkfGhlb24Fc=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qqMuh1CywULip73mGMWpIgkLiVIfPeKspjn3L5RxmV7ScuxjuxpRzBS7MlP0wNgWk
	 tiiKxnoN26G3U+FBIr3folEEhAdxCczIZxCym3pjDejDsn3CvaPh17//3cSU/Qs8VE
	 6jXrpoNOf2d+rqcUPilHh5QOmEvoX/8YrE9JfA9KQemtTL7iHppp6H0UwAhO7fON96
	 aaVBgGfmveC2GFxPhNoQKzlWlv0iSrNNbx+H3noCAllqoPUSytUB1DEBZC4G+4y9T+
	 pHZ6AbsP60bMBxGIN24TWtibDISAyzz1KyNjUKSQZWmeJnUVjGZB7fzIos+HPUM2cl
	 gEnDRKBy9hWJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2588A40713;
	Sun, 25 Oct 2026 14:14:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5066C3AF
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:14:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 361D260890
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Eoy02miymB6u for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 14:14:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CE1966088B
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::122d"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1792937649;
 b=HNqomI5+pyGRakY5gZCvHSV7lcflUdKHAvn7yMWNcAI+Sus0BpBDmcn7o77/3tqdPHI1
 3drtpnN1GrH9DiOTUYJZOaQORUDKNBuBBwkTnHTSBWDAvNNd02G/peGjTQlRnixDSvYoi
 9naBFmo2Z8wxYM+YFRPU2kVJCjhQxM5ff5/ceveMz4rmJtEO/pyftzCsaGVNH7MOiuIRk
 LGuR5T/zt95utuLNIuZsmr8AZbxGSnlCHBD1jrFAR56oYjr1MOqcxQ+gtTpI4jxDZ5dHs
 WEfzXhB0cpKaawB/JWDNrSzBF6qlaceCofxrWqyeJlNepIW39wv3rRZSHbHwacqCSSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792937649;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
 bh=UvWyBQ9n8XNFbt+yOfuBjJB5+kC2CDBVsmJVELD99O4=;
 b=SB3oIj19BpCujXHmyoXJNabBU9sBvRfZ5QxQ0mT7h2ZgZDHVfCHy+T2clOe9wfyrvZK2
 GfS2HVofVHCdz12B4HKwCdSMQb/HOFVVHhQ6WwqPyXdncJWFyebB0Nb0tvCqVhX/rirfQ
 4jriyywv4peFBHUAZ6PvL+5GysDngEJWxy9srOWZaikWWxzifdaQyL19bDtfazCbkNDQk
 DBIS3KC68BKL+vs3uYbA+b3mb84PUpNu33yHfP2rXGcFGDDwHp6M1w80TZcZDrwh1wC9L
 WiYLZCgOkzpz5Z1kNlUeFFdhdg+WwfC4C1NwvEtwb5wvQ8Qh5G+g9xqgPsefYuuYufg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
 dmarc=none header.from=j-ernberg.se;
 dkim=pass header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=lHU7GfdU; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:20::122d"
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::122d; helo=mail-dl1-x122d.google.com;
 envelope-from=j@j-ernberg.se; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=j-ernberg.se
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=j-ernberg-se.20251104.gappssmtp.com
 header.i=@j-ernberg-se.20251104.gappssmtp.com header.a=rsa-sha256
 header.s=20251104 header.b=lHU7GfdU
Received: from mail-dl1-x122d.google.com (mail-dl1-x122d.google.com
 [IPv6:2607:f8b0:4864:20::122d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE1966088B
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 14:14:07 +0000 (UTC)
Received: by mail-dl1-x122d.google.com with SMTP id
 a92af1059eb24-18cdcfc05ffso2619994c88.1
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:14:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792937646; cv=none;
 d=google.com; s=arc-20260327;
 b=KEN7jUgimYnIRogzVcIBYKYdkZ5naWS5+IukzdLtTYxsKGoFMlnwJh6GLmMqZY8Xkq
 ToRIo+Kr12q2iSK0AmCGlA27D+spT8ozj816SWbtM0NnErOjLbojjduzeRues3/2cdXH
 S3zoO7B3x68sf6iQCzxwM9e8JtTzBW+OfMSdU0OLYqZDJLIGdj3h7vruWGHazr+Lhm8q
 tfdId0VK5wg77fzSb9WhqFiTXoD9ZxUZzDaw+edsJgqfq7ajXhF4mf1C6FkxxSAXKrVc
 cIC1hjcRYlDjxZSJXdVpKhngh+SQCe1oEBD36SO7QzlVDoV63ON6InF3WXg1baZtbo74
 lu9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=UvWyBQ9n8XNFbt+yOfuBjJB5+kC2CDBVsmJVELD99O4=;
 fh=6zz8HBWv6q65+Cb3BRKhdU++Qs1sgGx4eFazIYF55Jk=;
 b=aQ3zaFCS5IfKPd7kOiJHtbab8JfEqXjTNU+tYk+N6p4pRXf8G2DrSc1ZAUcUViuSkN
 29t2ADJBJYqMiklTucR/BxWMSC4Zx4RhVVFYqOwaQeU4To4O28hRcosDVUGXxAUfNqqj
 zPv1pBJYr9iDJZt3T37Uwhak93BpCL0eHeODoyXwFjf/dRdcPzKnW5MFxkuTnd0M7TXo
 ighrwughLvNuvr56DXhDok4iJpe4OaU+LFivu10oYEmdDL4m4fhArFnciBs21OWBFiNx
 c7pexE1iaBpfryA00VbVcpmsS13dzzTS3Wf6ComUe6a7IUPyPpR4t/GPqkQDeDXxkufg
 Xvog==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=j-ernberg-se.20251104.gappssmtp.com; s=20251104; t=1792937646; x=1793542446;
 darn=buildroot.org; 
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=UvWyBQ9n8XNFbt+yOfuBjJB5+kC2CDBVsmJVELD99O4=;
 b=lHU7GfdUkFKB8gQ2apOgwEtOQZnjLEndENHwkysuLKq+af78qZpaMDJ97BJPdrMbp/
 0FzU9r+0oNWvSjoMDW8A7OKIgv4WiH9UiTpXW3MI/L0rINHiUgiEYqLSx/Gw6CWg8hPx
 F9UStiyr7Z/EyUN5hE1nIGJCu6DPVxkQtdmqk2DH1df9/8zPGGleZwhgzTSJ0xXsX34s
 5iaZXMHZpr1QIR6MLbbRsi8yZPYRoShcIhfWVQ7rnFzjiMShY3V3VfnLy/BcEqC6MIAP
 IfB7VXsmeUedV7bUQmayHqW2rguosp7VQuDDGyBD2yOK3KKzCRXOGXfu8oRqf7xzAq1Z
 idiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792937646; x=1793542446;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=UvWyBQ9n8XNFbt+yOfuBjJB5+kC2CDBVsmJVELD99O4=;
 b=gWWZuSQAfbDlsWbTx1c38Nn5T/EU8xl2fCpoo7DQVLwMGc+t1HXGZKmpypekPp4i1X
 HOCWmu6glon8WL+8GjSzHUit/CPbSO6Qy3L1ffWbys0d/H55EfKRN1qkxQn6MpGT4p/I
 MRnlLGHUiPOj/x8WRXT+UIL/pHeQu11DnjV7NFFE+M775k981gkHou8tfoWA4sPVK3vT
 5dusClExdjn85mRuaWBWjGN18SATooaKgyIg/smzFhd0zZdziSjrev1PlC04mt3a27dk
 njIIkKSJxh2BC1grA/knlX1fiUJzpQfQ9gRuNCESrcVqeuFrCQ1vHK0PWeFoNIsviV9J
 O7bA==
X-Forwarded-Encrypted: i=1;
 AKwUvByqN99NpuMjRbS30gUPnVoBMedwMNdoFy6f9hN0TYYhVskWgwSudfutwrhI/xUqaTehMYAuMu2aPY8=@buildroot.org
X-Gm-Message-State: AFq9FYJKpPoJ1Yk9KlRQJSOpnbthg5DrGEepylDnJSktkZ7jq21AX5N7
 zBvoIe6yh6uH9pGTn0unJD0zgetXhAvjaZTqMEUEEfSykPg0z6RH89z6yA4qApbB6DabduHUIWT
 Fgjuv2nRHx36HcaCiduScAyCjq375LesVA3ioeBMjtg==
X-Gm-Gg: AYBFou14TI9UNW2kdrtrxAbL+dCNo9vHYX/LQmL3C1WJGhDweiYPERz9/uYK1eyt7OA
 7aSQ90is36wRLw+5CiObdXCNhnkchq5k4mW1UPIsLnAtkp+OMYJ40U7JrIyIL1KAhi4QKbTxXNg
 jLhSHHd+XFMkH7A9wQ6/RW4hqj9HiCpiGVDtFvrsbhIFLkFxdYmLb/PveTNxVt1bZSYQyGmuNP+
 eLJoxYDk32t9u4NY4Y2WCpJ0nUAPhqXhnUu27PqgZ71racYx8xvL6Uwhw6Nw9OGADrbW1Kl4MqC
 XJZA9L11tAJL7K8hf8fPNODgKISKAM3+7ipA6ZVnfDpnra2XXsYHbrAw47F1TjXYFg4bym9eSNc
 48dWSto3BTpuQMtR8XVN6lYx9+vACyWP8J87UX2TIpznKa6wrFWB3h56R4sPkg7mmG6oHEWmXj+
 RrUMyO25V29xe9SUsCHIgR0A==
X-Received: by 2002:a05:7022:fa02:b0:166:37d2:3b72 with SMTP id
 a92af1059eb24-1993686f496mr7890041c88.27.1792937645891; Sun, 25 Oct 2026
 07:14:05 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261018160651.349981-1-j@j-ernberg.se>
 <atUtmzafWnVtVm-t@windsurf>
 <atWwZGNSjbN0GrwD@landeda> <atXItOiRRP2j79zR@windsurf>
 <atXov2HEcIiVzCAU@landeda> <atYLM_NKiCwSpJSU@windsurf>
 <CAAHg4Zh+asqbkBTqtoaaZgRTgWn0YxUp0CnLfxD84vYwPNvetg@mail.gmail.com>
In-Reply-To: <CAAHg4Zh+asqbkBTqtoaaZgRTgWn0YxUp0CnLfxD84vYwPNvetg@mail.gmail.com>
From: John Ernberg <j@j-ernberg.se>
Date: Sun, 25 Oct 2026 15:13:54 +0100
X-Gm-Features: AclHuK8GoWaIYsyYkYPz6IQCGAVK4P9XiApUX5cOaSwwuXqb20Jloem0mommZqM
Message-ID: <CAAHg4Zh0QZJ5Nep0S+BJnUO_zmB7p3nwYwYXDg594gb4vnz1dQ@mail.gmail.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org, 
 Adam Ford <aford173@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [RFC PATCH] package: {libgl, libglvnd,
 mesa3d}: Propagate libglvnd GL provider to libgl dependencies
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzIEQsCgpGdWxsIGNvbnRleHQgaGVyZToKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnVpbGRyb290LzIwMjYxMDE4MTYwNjUxLjM0OTk4MS0xLWpAai1lcm5iZXJnLnNlLwoKVGhvbWFz
IFAgaGFzIHN1Z2dlc3RlZCB0byBkcm9wIGxpYmdsdm5kIGFzIGEgcmVzb2x1dGlvbiB0byB0aGUg
aXNzdWUKdGhlIHBhdGNoIGxpbmtlZCBhYm92ZSB0cmllcyB0byByZXNvbHZlLgoKVHVybnMgb3V0
IHRoYXQgYSByZW1vdmFsIG9mIGxpYmdsdm5kIHdpbGwgcmVncmVzcyB0aGUgcmVjZW50CmVuYWJs
ZW1lbnQgb2YgdGhlIFZBLUFQSSBzdXBwb3J0IHlvdSByZWNlbnRseSBjb250cmlidXRlZC4gQXJl
IHlvdQpzdGlsbCBhIHVzZXIgb2YgbGliZ2x2bmQ/CgpCZXN0IHJlZ2FyZHMgLy8gSm9obiBFcm5i
ZXJnCgpPbiBUaHUsIE9jdCAyMiwgMjAyNiBhdCAxMToyNOKAr1BNIEpvaG4gRXJuYmVyZyA8akBq
LWVybmJlcmcuc2U+IHdyb3RlOgo+Cj4gSGkgVGhvbWFzLAo+Cj4gT24gTW9uLCBPY3QgMTksIDIw
MjYgYXQgMjoyM+KAr1BNIFRob21hcyBQZXRhenpvbmkKPiA8dGhvbWFzLnBldGF6em9uaUBib290
bGluLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gTW9uLCBPY3QgMTksIDIwMjYgYXQgMTE6NTQ6MDdB
TSArMDIwMCwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiA+ID4gVGhvbWFzLCBBbGwsCj4gPiA+Cj4g
PiA+IE9uIDIwMjYtMTAtMTkgMDk6NDAgKzAyMDAsIFRob21hcyBQZXRhenpvbmkgc3Bha2UgdGh1
c2x5Ogo+ID4gPiA+IE9uIE1vbiwgT2N0IDE5LCAyMDI2IGF0IDA3OjUzOjQwQU0gKzAyMDAsIFlh
bm4gRS4gTU9SSU4gd3JvdGU6Cj4gPiA+ID4gWWVzLCBiZWNhdXNlIHJpZ2h0IG5vdyB3ZSBoYXZl
Ogo+ID4gPiA+ICAgICAgICAgW0dMLXVzaW5nIHBhY2thZ2VdIC0+IGxpYmdsIC0+IGxpYmdsdm5k
Cj4gPiA+ID4gQW5kIHNlcGFyYXRlbHkKPiA+ID4gPiAgICAgICAgIG1lc2EzZCAtPiBsaWJnbHZu
ZAo+ID4gPiA+IHdoaWNoIG1lYW5zIHRoYXQgW0dMLXVzaW5nIHBhY2thZ2VdIGNhbiBiZSBidWls
dCBiZWZvcmUgbWVzYTNkLCBleGNlcHQKPiA+ID4gPiB0aGF0IGxpYmdsdm5kIGRvZXNuJ3QgcHJv
dmlkZSAqYWxsKiB3aGF0IGlzIG5lZWRlZCB0byBhY3QgYXMgYSBHTAo+ID4gPiA+IHByb3ZpZGVy
LCBmb3IgZXhhbXBsZSBpdCBkb2Vzbid0IHByb3ZpZGUgZHJpLnBjLgo+ID4gPiBbLS1TTklQLS1d
Cj4gPiA+ID4gPiBJIHdvbmRlciBpZiBzaG91bGQgZnVydGhlciBoYXZlIHRoaXM6Cj4gPiA+ID4g
PiAgICAgW0dMLXVzaW5nIHBhY2thZ2VdIC0+IGxpYmdsICAgICAtPiAgICAgbGliZ2x2bmQKPiA+
ID4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwtPiBtZXNhM2QgLS8KPiA+ID4g
PiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB5b3VyIGRpYWdyYW1zIDotLwo+ID4gPgo+
ID4gPiAqIGxpYmdsIGRlcGVuZHMgb24gbGliZ2x2bmQKPiA+ID4gKiBsaWJnbCBkZXBlbmRzIG9u
IGFsbCBhY3R1YWwgR0wgcHJvdmlkZXJzIChsaWtlIG1lc2EzZCkKPiA+ID4gKiBhY3R1YWwgR0wg
cHJvdmlkZXJzIChsaWtlIG1lc2EzZCkgZGVwZW5kIG9uIGxpYmdsdm5kCj4gPgo+ID4gQnV0IHdo
YXQgYXJlIHlvdSBkZXNjcmliaW5nIGhlcmU/IEhvdyBpdCBfc2hvdWxkXyB3b3JrLCBvciBob3cg
aXQKPiA+IHdvcmtzIF90b2RheV8/Cj4gPgo+ID4gQmVjYXVzZSB0b2RheSB0aGUgcGFydDoKPiA+
Cj4gPiAqIGxpYmdsIGRlcGVuZHMgb24gYWxsIGFjdHVhbCBHTCBwcm92aWRlcnMgKGxpa2UgbWVz
YTNkKQo+ID4KPiA+IGlzIG5vdCB0aGVyZSwgYW5kIHRoYXQncyBwcmVjaXNlbHkgdGhlIHByb2Js
ZW0uCj4gPgo+ID4gVGhhdCBiZWluZyBzYWlkOiBpdCBpcyBvZGQgZm9yIG1lc2EzZCB0byBwcm92
aWRlIGRyaS5wYy4gVGhpcyBtZWFucwo+ID4gdGhhdCBpZiB5b3UgaGF2ZSBtdWx0aXBsZSBPcGVu
R0wgcHJvdmlkZXJzLi4uIHRoZXkgd291bGQgYWxsIHByb3ZpZGUKPiA+IHRoZWlyIG93biBkcmku
cGMsIG92ZXJyaWRkaW5nIGVhY2ggb3RoZXI/Cj4gPgo+ID4gPiA+ID4gLi4uIGV2ZW4gdGhvdWdo
IHRoZSBsaWJnbCAtPiBtZXNhM2Qgd291bGQgYmUgaGVyZSBqdXN0IHRvIGVuc3VyZSBidWlsZAo+
ID4gPiA+ID4gb3JkZXJpbmcsIGFuZCB0aGVyZSB3b3VsZCBiZSBub3RoaW5nIGZyb20gbWVzYTNk
IHRoYXQgdGhlIFtHTC11c2luZwo+ID4gPiA+ID4gcGFja2FnZV0gd291bGQgdXNlIGF0IGJ1aWxk
IHRpbWUgaW4gcHJhY3RpY2UuIEkgdGhpbmsuLi4KPiA+ID4gPiBBbmQgdGhhdCdzIHdoZXJlIHlv
dSdyZSBub3QgY29ycmVjdCwgYW5kIHRoYXQncyB0aGUgd2hvbGUgcG9pbnQgb2YKPiA+ID4gPiBK
b2huJ3MgcGF0Y2ggaW4gdGhlIGZpcnN0IHBsYWNlLiBDaGVjayBvdXQgaGlzIGNvbW1pdCBsb2cg
Zm9yIGRldGFpbHMuCj4gPiA+Cj4gPiA+IFNvcnJ5LCBJIGRvbid0IGhhdmUgdGhlIHRocmVhZCBo
aXN0b3J5IGhlcmU7IG9ubHkgZGlnZXN0LXN1YnNjcmliZWQuCj4gPgo+ID4gV2VsY29tZSB0byB0
aGUgd29ybGQgb2YgbG9yZS9sZWkgOi0pCj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
YnVpbGRyb290LzIwMjYxMDE4MTYwNjUxLjM0OTk4MS0xLWpAai1lcm5iZXJnLnNlLwo+ID4KPiA+
ID4gSUlSQywgb25lIG9mIHRoZSByZWFzb24gdG8gYnVtcCB0aGUgbnZpZGlhLWRyaXZlciBiYWNr
IGF0IHRoZSB0aW1lLAo+ID4gPiBiZXNpZGVzIHRoZSBidW1wIGl0c2VsZiwgd2FzIHRoYXQgdGhl
IG5ld2VyIGRyaXZlciB3YXMgZ2x2bmQtYXdhcmUuCj4gPiA+IEJ1dCB0aGlzIGhhcyBzdGFsbGVk
Lgo+ID4gPgo+ID4gPiBBbHNvLCBldmVudHVhbGx5LCB0aGVyZSBhcmUgdHJpY2tzIHRvIGFjdHVh
bGx5IGhhdmUgbXVsdGlwbGUgR0wKPiA+ID4gcHJvdmlkZXJzLCB3aGVuIG9uZSB1c2VzIGJyMi1l
eHRlcm5hbCB0cmVlcywgc28gZXZlbiBpZiBHTCBwcm92aWRlcnMKPiA+ID4gYnVuZGxlZCBpbiBC
dWlsZHJvb3QgZG8gbm90IHBsYXkgbmljZSB3aXRoIGdsdm5kLCBpdCBkb2VzIG5vdCBtZWFuCj4g
PiA+IG91dC1vZi10cmVlIHByb3ZpZGVycyBjYW4ndCB1c2UgaXQuLi4KPiA+ID4KPiA+ID4gPiBF
c3NlbnRpYWxseSwgSSdtIHRyeWluZyB0byBmaWd1cmUgb3V0IHdoZXRoZXIgd2Ugc2hvdWxkOgo+
ID4gPiA+ICgxKSBGaXggdGhpcyBsaWJnbHZuZCBpc3N1ZSBieSBhZGRpbmcgbW9yZSBjb21wbGV4
aXR5Cj4gPiA+ID4gb3IKPiA+ID4gPiAoMikgUmUtc2ltcGxpZnkgZXZlcnl0aGluZyBieSBkcm9w
cGluZyBsaWJnbHZuZCBlbnRpcmVseQo+ID4gPgo+ID4gPiBXZWxsLCBubyBsb25nZXIgbXkgY2Fs
bCB0byBtYWtlIGFueW1vcmUuIEkgd2FzIGp1c3QgcHJvdmlkaW5nIGEKPiA+ID4gcmVjb2xsZWN0
aW9uIG9mIHdoYXQgSSByZW1lbWJlcmVkIGZyb20gYmFjayB0aGVuLgo+ID4KPiA+IEluZGVlZCwg
YnV0IEkgd2FudGVkIHRvIHNlZSBpZiB0aGVyZSB3YXMgYW55dGhpbmcgSSB3YXMgbWlzc2luZy4K
PiA+Cj4gPiBPbiBteSBzaWRlLCBJIGJlbGlldmUgSSB3b3VsZCBiZSBpbiBmYXZvciBvZiAoMiks
IGkuZSBkcm9wcGluZwo+ID4gbGliZ2x2bmQuCj4gPgo+Cj4gSSB3YXMgZHJhZ2dpbmcgbXkgZmVl
ZCBhIGxpdHRsZSBiaXQgdG8gc2VlIGlmIFlhbm4gaGFkIG1vcmUgdG8gYWRkIHRvCj4gdGhlIGRp
c2N1c3Npb24uCj4KPiBJJ2xsIHdoaXAgdXAgYSByZW1vdmFsIGluIHRoZSBuZXh0IGNvdXBsZSBv
ZiBkYXlzLgo+Cj4gQmVzdCByZWdhcmRzIC8vIEpvaG4gRXJuYmVyZwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
