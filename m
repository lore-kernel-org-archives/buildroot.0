Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE88606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 10:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rld0SKtx;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rYrPn23Y
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BE74060E;
	Mon, 26 Oct 2026 10:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ULeuNjgynAzG; Mon, 26 Oct 2026 10:16:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D25A7405EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793009764;
	b=dPfIhyzpxQjapUPu03euxmtNgccVSHaODam1K5vVITtReXe8JyYPmIaQ4KPuRfEGmlvl
	 8VJkS+gfVaXv8L3vLjl/CHDoF5RstR70j9tEsACf0qu7xrS+gL4hWFmjohnv1joqOjZVv
	 31A4Fo1PafcW2296/yUWdQ+3OnOAdXXjxozyRzdecLKqp1YGOAhi5Xj76Yjg86akm6Ys2
	 40TWfqTRu1U9QPyf7czwFS7anAJBnLAF4EGdf9vvBbxXuXmn+3H99fR6PFrklYLkJLiCp
	 dksMwK0vgmTdbe7EAuRj5lxafbJnd8aCHJslHTjACt+k/57ynbJ7/YjfiJqHGoxgGFg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793009764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CQpV/4u/vaQzjajbpkBIJPjF4f4TkKBzyFJ9JI1xOY8=;
	b=fTrdfMSluyatoCZWFujyXjWXNEPyLxEJ/2My6da9E4qgeUHqHjnRzWzvq4Jy8q6hAnjJ
	 Fjuo2X/PwVdLygCfmPhJaU3MxQ4tV93kKRwctY1sWjq8iKwM//+wCX/rq3mXrVnreXaVo
	 YCtron3zislyqmjreJYU1XIGq8g8fHMudtE3AOxkQkdBkcHGeBIu+J5pi1bx1lDqlyigX
	 a8Zbdz9dHgLFEozdPcR4sohMl88aU02ydz4pqjxZ4Nkpfud2MpmT9ILm4MnGnnKL3V7Yf
	 uTQVGA5UmV41vDbJ3Uk+gRMCQI1lTd4VxW/5mZm3uiuy1V9jkHeOiYiitAoUwSHAoPw==
ARC-Authentication-Results: i=3; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rYrPn23Y;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793009763;
	bh=CQpV/4u/vaQzjajbpkBIJPjF4f4TkKBzyFJ9JI1xOY8=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rld0SKtxIxWP55IiNMQ5tRjTLYR3G3JZIW8cJ0NTLlzV+Su28TT6ZlJdswloNeaAX
	 tI0FUP3jRW2VqEryUuwYQCvsaY9P6LurAXVPbsjRDDEXgB3Oypns7fl9vevtEccmQq
	 eJbrwNpmP6ontPs85CMmmTBuTnybpTVQWNm/ZeNdvlGhkLlv+ASKj0SG3Pu72muAHj
	 X9STZeLNGJgnswO2igmH1vs4c2bD3pXTZdsesYFcKqmNmD4nNyMxsenaeeZFd6rh3M
	 /zWnFOVZzWpHuhiZRXubthHxEFWQqeZi3D34rJp4tAt8wrkjs1oPKSb/RYLty8amQ+
	 k4bs3ftaN0fUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D25A7405EE;
	Mon, 26 Oct 2026 10:16:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A0A4343
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:16:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8690B405EE
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:16:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MKcLIzVJknY7 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 10:16:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5BF40405DC
Authentication-Results: smtp4.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2a00:1450:4864:20::22f"
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1793009761;
 b=AI+cD84Rl8KTOmtnXCwhUg4TvVQodK8FuqH+k4VDfaHECi5Ca0kkVOleZwG04Y3V72/f
 2xcIzylZcv80O5x1sFsgXSV2UVK8qKZSKGBpL3XnXcoITMjEmFbPB1PLLTLgLWbDba/yN
 OG4NV4t6JhtBB+EzN0c7AK8F0Wi/2gAgg5ue+H5+TGT09wSapWZ6OJUYg36CKONgTm6fB
 teHvLM0e96mU7k0v6MXZ1S3d6bu3/Jq5koH1bfTXjQ1YTOQ4Y6HuNuiTqbn5gIbkhl0nx
 Ki7qgbZndri4aD8cb1BVDyo2Xh72hUeHs++/C19/n3KNdCha80v8f5mE+LFLvGBVW3g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793009761;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
 Content-Type:Content-Transfer-Encoding;
 bh=PKzrFa/cjGvgR/7utWB83a3wZqJiVhsXwEocxJ6qDDA=;
 b=fBQot+rRVZDQ1Jpif5N+39gHTNWQVHWzhElj4Q4ivjJ51PlxChxL3JV1WREo8ZAUf0Qy
 JaYoBtKlOBS1JouiVhf5hcKOymzHsGiWV1bWv6ZBkNRQC4LB5/OV6w1QwYQeCnFYhTaHk
 lVX2ub3L2j6Gi6bkZR52pH2qqKBTJ3te7Hiun06QtVZVag4j90tkV70o/yhBhgLZganTA
 K/WM3UwULrzaeNDmSMiShZZpgyJGr8CBh1A0Ka1zfOXHa5QXdbTyX30pvksO456MSI3QW
 aV/WaoIcprzfAtNZsHcjC1cqhVsm9w76FBoW7F/KDHCMVqMFM3tvUV6pONFg0nhRN5Q==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=rYrPn23Y; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2a00:1450:4864:20::22f"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=leo.denieul.yoshino@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=rYrPn23Y
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5BF40405DC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 10:16:01 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3ab3dd9681fso22026801fa.1
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 03:16:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793009759; cv=none;
 d=google.com; s=arc-20260327;
 b=eC7PdkXmLAtx/Heha6ijXkkq3NKc8V9ZoUYWi9DtPMRw6+feDTR33dn8EHwNPz6Epo
 OLn2ofBAbcY6xUNctoOY4uEq7Q+eZjyI+1oELCbC2mnS20KCI8KQ69vb7gZIvWVklVG5
 TnDEezP3oOGF23ur7sftkrILaXhX6pXTxIs2QF28VX3Gpzeu93lK7HR9Jrc6/Hn+KKvD
 6n6mWbHF9NCyQwnikPXckQNGOpsjBnJdj82ToZXv4tSqVQKsvbiX5CbtA7bK5thdnhOi
 yiagftxvzOOusVqKA6u3fDYtCDofcgdd6jIOc6QLZdy5BK0Jo/FZDTzvJGCt3U8x7Mt5
 964w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=PKzrFa/cjGvgR/7utWB83a3wZqJiVhsXwEocxJ6qDDA=;
 fh=JP1SUM7tHJbtZXTdTEF+Rjyjr3ABX+gRu7tlFhhW1Lc=;
 b=UiBCE8oTUk9k4J1+atAIAW+vddYxZu2It2bzLgesQuV6+FP75SUIgblztEicAVXRLh
 FyW/ZGAZGqvvkJAb8fjW28KZQqvI6v5Uel96aZ26M1RtbBuO0sgwXLuymPB/PHdVGDvm
 oXSJJkgQLi6iK5JiZ5tXOAmi8BWSev3IyPTRYHhRdk3YzmjKjMb/Xmb1UdlJSD1dxAQF
 zzvEjLEE4zRexX0CtNIJhXP+C3DWA9dRnDsmy1CwXDZc+06XlHSkSHByPJBmZIUrdqgz
 +lWrz086ljGlEmusX5jb126n7BYCA6nMMGeyXdNzzsPZDe+2bzTgQmnCqQ9Irb2G1C3I
 OKdA==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793009759; x=1793614559; darn=buildroot.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=PKzrFa/cjGvgR/7utWB83a3wZqJiVhsXwEocxJ6qDDA=;
 b=rYrPn23YCzUNkaiBnUnJq6MM9J5oIU287GriUeUwomV4akU8JQ/dw9Pgw0bdUI08Fq
 pfPST72A+V+eBFP31dZZrGYhJYsmV63MtwIsdqom5vU3I2/+nZzDwKK58uo5B2Jw3K2K
 7vgDWrK3CdHhGOy4DT+DiResAdbATkeQ/h0JUI0FVq64fBty3RyyUtGPiSLl69VKS6tK
 2S/9rtuTdZZdDbBgCLV0jadPQ2v7ercpmQIGkbXKzbEsmE2tSgFz7YW7zNbkqsTfViPy
 BIe3RcB8oEqKMD7LaFpYpIF7/FcLc6V8eqYvVVdkRYL1+IBgMtSWoCJ6DvGEnWeFa5L/
 XCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793009759; x=1793614559;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=PKzrFa/cjGvgR/7utWB83a3wZqJiVhsXwEocxJ6qDDA=;
 b=1FSJohxFnazrCw6VVIYZyRFgKaN6yswSWJeohU9kN5CwVxXcl0INQcdI9P59TlcoBM
 t2RGyKx9+4/Cqu8XEKTxD2x1hoI6QynocmENH6RGmOejNp06EUoImCFOwO41sYMDXa3R
 6k2nfuJIUm9FKX9Oy8M2c+huBX4JvyR7aIcHZiIBB92uezE/MsFBIEvabpH98Zs60qCE
 uY78jpCQvuAny8zfLl8KxoY+IiwKF/PEPIxCG3QCEKv7ger9OAtR5toRHwVzzgUAojS5
 7vUPESyZ3GQW3rF6EMkztAr074sItCfJjpcolCrcan7Wv3btHzUBkcRB6gcrlWJcnGg/
 r74g==
X-Gm-Message-State: AFq9FYL64P4eYwaqeuo+RnLbPVLanViqF80evfBj14dtno8hqzSrms50
 okLSxBl+t52hhaDyEDO5Jm/XKeTwteCCCwIFFzD1ECb5Do0Pa1rYdf0VqOF33c7XE9Gtf64+6IO
 R9C1V6AZfvxCEbASMfxuNkp5Kuit+7WQ=
X-Gm-Gg: AYBFou2qFYJCvEDfsvmofLKKeJlaUpKUMb+ElyiBAz0gntZ2inwogna7NGlRFH1Oo6j
 ivacihW9GCjcHjdSgd0l/qhgBlD0su6BGaynMuIq5q5pKC9wE/12ps7cCGZB80ua4OGT9G//vQy
 w6MuFs1d5bggHRovNFobXKm5Rc6V3SF8b9hI/HaCu5i55K0qTtHwBi5rqSC58dgRxBTLl03lEh1
 /CybAIeKQhTbrcMi7ccQh2fGAr2T9axjg9OIvSx/WH0hkT7jkxc2mUdiEvkxS8nJ75fAjfyB02m
 skAWC6tzEgV2FdDX4/wtcvWU4OAY/tHphIPTi+tjF7zz4MPe6LUzu6OUtqEWflnWYN49pkIMSEp
 EwJMDzxvwPyicWlXTEjhS02gKZeQubFeUQ+P9lh0Epa6AfsV+NN0BsLyiBMC3xjsm7w==
X-Received: by 2002:a2e:bc89:0:b0:3ab:1d89:4981 with SMTP id
 38308e7fff4ca-3ac6fd70f92mr16649341fa.22.1793009758354; Mon, 26 Oct 2026
 03:15:58 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1792395346.git.ldenieul@iliad-free.fr>
 <be195354e0c84dc3ad31f1d53972d913033e01b9.1792395346.git.ldenieul@iliad-free.fr>
 <at5zpO5nrHoXUw_x@windsurf>
In-Reply-To: <at5zpO5nrHoXUw_x@windsurf>
From: =?UTF-8?B?TMOpbyBERU5JRVVM?= <leo.denieul.yoshino@gmail.com>
Date: Mon, 26 Oct 2026 11:15:47 +0100
X-Gm-Features: AclHuK-5zVotKsau7IaO6CBrDmrnXQPbPLEscBXXuUA4sYjstR5T3fmffT0PCS0
Message-ID: <CANMZqkch_Oe5f=HAEadncxXTHMdsyM_gBm=YvbGERg769v15HQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Maxime Leroy <maxime@leroys.fr>, 
 Vladimir Oltean <olteanv@gmail.com>, Vincent Jardin <vjardin@free.fr>
Subject: Re: [Buildroot] [PATCH v7 3/3] board/lx2160ardb: new platform
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
X-Spam-Status: No, score=-4.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGVsbG8gVGhvbWFzLAoKT24gU3VuLCBPY3QgMjUsIDIwMjYgYXQgMTA6MjU6eHggUE0sIFRob21h
cyBQZXRhenpvbmkgd3JvdGU6Cj4gU2luY2UgeW91IGRpZCBub3QgYWRkIGFueSBlbnRyeSBpbiB0
aGUgREVWRUxPUEVSUyBmaWxlLCB3aG8gdm9sdW50ZWVycwo+IHRvIG1haW50YWluIHRoaXMgcGxh
dGZvcm0/IE5vdGU6IHdlIGNhbiBhZGQgbXVsdGlwbGUgcGVvcGxlLCB0aGF0J3Mgbm90Cj4gYSBw
cm9ibGVtLgoKSSdtIGhhcHB5IHRvIG1haW50YWluIHRoaXMgcGxhdGZvcm0sIHBsZWFzZSBhZGQg
bWU6CgpOOiAgICAgIEzDqW8gREVOSUVVTCA8bGVvLmRlbmlldWwueW9zaGlub0BnbWFpbC5jb20+
CkY6ICAgICAgYm9hcmQvbnhwL2x4MjE2MGFyZGIvCkY6ICAgICAgY29uZmlncy9seDIxNjBhcmRi
X2RlZmNvbmZpZwoKVmxhZGltaXIsIGFzIHRoZSBvcmlnaW5hbCBhdXRob3Igb2YgdGhpcyBzdXBw
b3J0LCB5b3UgY2VydGFpbmx5IGRlc2VydmUKdG8gYmUgbGlzdGVkIHRvbywgYW5kIHlvdSBrbm93
IHRoZSBwbGF0Zm9ybSBtdWNoIGJldHRlciB0aGFuIEkgZG8uCldvdWxkIHlvdSBsaWtlIHRvIGJl
IGFkZGVkPwoKVGhhbmtzLApMw6lvCgoKTGUgZGltLiAyNSBvY3QuIDIwMjYgw6AgMjI6MjUsIFRo
b21hcyBQZXRhenpvbmkKPHRob21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+IGEgw6ljcml0IDoK
Pgo+IE9uIE1vbiwgT2N0IDE5LCAyMDI2IGF0IDA5OjQ4OjM3QU0gKzAyMDAsIEzDqW8gREVOSUVV
TCB3cm90ZToKPiA+IEZyb206IFZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4g
Pgo+ID4gQWRkIEJ1aWxkcm9vdCBzdXBwb3J0IGZvciB0aGUgTlhQIExYMjE2MEEtUkRCIChyZWZl
cmVuY2UgZGVzaWduIGJvYXJkKS4KPiA+IFRoaXMgaXMgY29uZmlndXJlZCBoZXJlIHRvIGJvb3Qg
ZnJvbSB0aGUgU0QgY2FyZC4gVG8gbXkgc3VycHJpc2UsIE5YUAo+ID4gUkNXcyBmb3IgTFgyMTYw
QSByZXYyIHNpbGljb24gZG9uJ3QgaGF2ZSBhIHByZS1leGlzdGluZyBleGFtcGxlIGZvciBTRAo+
ID4gYm9vdCwgc28gdW50aWwgb25lIGlzIGF2YWlsYWJsZSwgaW5jbHVkZSB0aGUgUkNXIHRocm91
Z2ggYm9hcmQgZmlsZXMuCj4gPgo+ID4gVGhlIGJvb3QgdXNlcyBVLUJvb3QncyBib290c3RkIGZy
YW1ld29yayB3aXRoIGV4dGxpbnV4LmNvbmYuIFRoZSBEUEFBMgo+ID4gTWFuYWdlbWVudCBDb21w
bGV4IGZpcm13YXJlIGlzIGxvYWRlZCBmcm9tIHRoZSBmaWxlc3lzdGVtIGR1cmluZyBVLUJvb3QK
PiA+IGJvYXJkIGluaXQuIEVGSSBib290IHN1cHBvcnQgaXMgZGlzYWJsZWQgc2luY2Ugd2UgdXNl
IGV4dGxpbnV4Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IFZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFu
dkBnbWFpbC5jb20+Cj4gPiBSZXZpZXdlZC1ieTogVmluY2VudCBKYXJkaW4gPHZqYXJkaW5AZnJl
ZS5mcj4KPiA+IFRlc3RlZC1ieTogTWF4aW1lIExlcm95IDxtYXhpbWVAbGVyb3lzLmZyPgo+ID4g
U2lnbmVkLW9mZi1ieTogTWF4aW1lIExlcm95IDxtYXhpbWVAbGVyb3lzLmZyPgo+ID4gUmV2aWV3
ZWQtYnk6IFZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4gPiBUZXN0ZWQtYnk6
IFZsYWRpbWlyIE9sdGVhbiA8b2x0ZWFudkBnbWFpbC5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBM
w6lvIERFTklFVUwgPGxlby5kZW5pZXVsLnlvc2hpbm9AZ21haWwuY29tPgo+Cj4gVGhhbmtzLCBz
ZWVtcyBhIGJpdCBjb21wbGljYXRlZCwgYnV0IGZhaXIgZW5vdWdoLiBTaW5jZSB5b3UgZGlkIG5v
dAo+IGFkZCBhbnkgZW50cnkgaW4gdGhlIERFVkVMT1BFUlMgZmlsZSwgd2hvIHZvbHVudGVlcnMg
dG8gbWFpbnRhaW4gdGhpcwo+IHBsYXRmb3JtPyBOb3RlOiB3ZSBjYW4gYWRkIG11bHRpcGxlIHBl
b3BsZSwgdGhhdCdzIG5vdCBhIHByb2JsZW0uIElmCj4geW91IHByb3ZpZGUgdGhpcyBpbmZvcm1h
dGlvbiwgSSdsbCBhZGp1c3QgdGhlIHBhdGNoIGFuZCBhcHBseS4KPgo+IFRoYW5rcyBmb3IgeW91
ciBmZWVkYmFjayEKPgo+IFRob21hcyBQZXRhenpvbmkKPiAtLQo+IFRob21hcyBQZXRhenpvbmks
IGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KPiBFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwo+IGh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
