Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B4606A32C
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iNLIGsYG;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NudPn0v9
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46DA780E23;
	Mon, 23 Nov 2026 17:30:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UVm3QSSibSOJ; Mon, 23 Nov 2026 17:30:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F19C80DE7
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455013;
	b=WQCZhWdRwk1umz6r1SU5XgdqU5jBG6sze5N84hsEd3yayGBQ7UfseW8gpWgC7zzosMCi
	 kkoQLvlFtwpkiIEG3QUGewgTSjhaxeKU+2UwIWyUh75tmbSeHvWOnnvsAAzctdggseOCW
	 ja7azkZ+joOF1MJaIKdAvfy/MZZsp/KFh+nxoxvNfFNqiLlGEC0hnG5EhRcnBSYqFebkT
	 298F0gBFhPD3/asUVzMin31IDHgPyVu7WJpA2q8uiw/X+rCa59LmQrhDjvFkabW6yVlx2
	 VwCPvoFdXns0e5rSrz8ryT9j2Kux6US5wSEHAklvu3WRv6M8x72gLNoCsZrIzfBfsyw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455013;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=0/QS6VU0rMSkrlX65vmsM3vqueFNArhUYzPNNwKStRg=;
	b=sy42qgHSy9efykKfF4vBuVXMd6I6hgVSVulIxn7gAr5adP87sNLtIgOYdKXaYL8dfdri
	 eFbYdm/SEe1YWkX7Rkvj/tIVUv6A1z4LTp3S9iYlFlKD+tHYpI19AAnV3nyI1yvG4dDRx
	 PFrG7kqvIBEJ7wc0uxZclr9k0E0UUUBW23ImVZB/qLgExG3OERiaQCPuu2GNBCmQPnnyX
	 U6R33+w9GafApLDN8x88IYNGl5Z/Pydbp4BK1CBdSMD8igM4mObS4HTp3DOl3QQqImY4s
	 yK3+Y7p8N6teZe3ixvkxYeBAGnqLxn/IEqxV0PVHIjonJYk6yxumF552yyNd1q2OrCw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455013;
	bh=0/QS6VU0rMSkrlX65vmsM3vqueFNArhUYzPNNwKStRg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iNLIGsYGIjlkFYf7aqjYOnTlW4IlJbZRhn4/tv1qi9Q0aQC2/VaORAW1OaGOyRjVw
	 vVqhNuTcZxjaL9uJUpIuRHy/Gbjk10wK2KgC5sHXPSEHyAngO9mSwXMwf4Bk1uo0r7
	 cC5GatmJme5dPb16cxud/77bkL8P2imHZxKOKSbG49N15z9F8MmhQ3EUphKUiJZ+Xm
	 qgiYZZme9gFqG3Z52UsB/tUTEYj2t/s7MpRqwNowPnIAX/Ju60OdulLROJ71qxJ5jg
	 Zi/vxuXRHmE3pfAywzR8mLlCPfwb0bQQngELdnVmHXsV1TZG1gUIaDgwWIEukG9zlV
	 OZMiwOK7CQ1Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F19C80DE7;
	Mon, 23 Nov 2026 17:30:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E48322B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB15940500
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:30:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a0o2hvz7eQf2 for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:30:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B8DC6404FF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::333"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=NudPn0v9
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B8DC6404FF
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:30:10 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb6886d30aso34853895e9.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795455009; x=1796059809; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=yV7kXYJlc1NVdqzolxAYqi8qnIbJOMtdldX4OtPD2ys=;
 b=NudPn0v9818xoOHQjDsWVTf/j3JlxIXOUOXTYtSIupNCDeywM3R+UAH3lfqd58vfwi
 9Nck5oiwFfy7WKsB5HRhXhcLhvDFerZQEJPQ4BPGxoW8FBmWkmEuYpZRam5Zx3eaql2O
 tWMIuCzfMKoie9RYaCl5JNrO6I6Z+FLAT8puqBIe48mGLNraEP6rVhu935i8NxZTCPtS
 obxys6DwJqgTd3mhZSxO1F6YwfWcs+aNlrOtl0yMoffBoSe8canztdsTjdP1XBiM/Coh
 HPtHDrh7jZ+pUIXNbS03fzHqWzulqV++GeXG0luOLN7EKjzumdOg7BPptsl5VJwzFaPK
 hHuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795455009; x=1796059809;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=yV7kXYJlc1NVdqzolxAYqi8qnIbJOMtdldX4OtPD2ys=;
 b=bXi/p+yv/t7JB9269NJlrawEQA9SIHdvYO8WzGtsilFXkqprpbrMLUMi/L/fk7CoC5
 Jcde+ub0Uv5ZJ5ukKECuSxi5hvgXUlzEdmzs7Yi5f7Vf1eLoaQKnY6lb0gJ1uloeGc6a
 C/NO1MqtFbMU7JNwa911zMqLXyspybjpso+VLhTv+7TNapvffY1bGy7g3VCvXnz33mZP
 BFBjSDPaiaEpSVaAhA27C2bPOwOmHO4mT8lzV5o488qX+UNqyzr6J3kgLamAKoN+sNoN
 I12o5sZlvGsGaYQJakWiy2lv4xtWCXOFuGCZpH1kbJEb4UdwWQif6nkuUq7r7PAkkmig
 hn6A==
X-Gm-Message-State: APuU4Z9mKKhlb/Z2DG71JqahbgSFqbuxY0vUHwOb8GKflJekKVwJc+Rc
 W0Dcy1MEfYSccmFe9neTbVofDiKUpFUwEECRb/PH7M6SyFAIRPdwTtcO8356A2Q+
X-Gm-Gg: AZFdTZd8D6NV3xroOI08GsI8pR0EpHvyc78vjwvx79P+SPABvzXFqZe9PhLhMPaAz+D
 UI8GClpijW12MIDplCRGLM4EY+OZSzmHwlWEOQ70PXSGIn5EfYdQ5OwPBdxQdt8pIlWgxK9RQcp
 s2J4x7PmHBsGQG/XdKZxcI1euUdXa3yKkOPO+ckE/96HUCP5fzkJtn8UQyibVMWVKSXH+z9mXs6
 r51U8JdwPiqaANGWkUfnyVAt8/AhrtWm3Se6Kyn9poI9yXSrjFsWwGwXbwrX3WHnKDt3Ug3i+Pa
 Ak4k/B2sdpKh46fiXlGYdmzJHjf4TtCeyweF1jlhOW3qQndXYISm0PhbCH3fmRNAzAvjPHl915d
 DrkZlvRR65hrd3xCBrVXcjpBo7atgIaJVSz75H5vWFduc7mN8kIGPd3DrZcAxtsglCGciPolsei
 y8PcdMDtGY/SQ6tz0cWkjdUY8A4HGoZkh/XT4rPmup7wHq5Aqm23yjRESBWrB+To7s4GCtcyWIq
 qnN8GmPNJ/jXlb0fO6wI8G8TMjBlYYjLXYKST1TIsrRfhpO9M7mPxaKaloMEJbaEU3cIS8x/kJP
 MzKVzpWiKxZZkwK0LLTKYdVaaCHXBnNR0mrWXuURy/kLpbFBv20=
X-Received: by 2002:a05:600c:310f:b0:4b5:d95c:2378 with SMTP id
 5b1f17b1804b1-4bb8881f9b7mr270339225e9.34.1795455008500; 
 Mon, 23 Nov 2026 09:30:08 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906817ccsm180899105e9.5.2026.11.23.09.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 09:30:07 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>
Date: Mon, 23 Nov 2026 18:30:06 +0100
Message-ID: <20261123173006.2250595-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240228165300.4158751-1-vfazio@gmail.com>
References: <20240228165300.4158751-1-vfazio@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc: add symver attribute
 support to MicroBlaze
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Vincent,

On 28/02/24 17:53, Vincent Fazio wrote:
> By adding symver support, there should no longer be any need to patch
> packages to account for this architecture quirk.

I think this patch can be dropped:

1. GCC 11.4.0, 12.3.0 and 13.2.0 are gone: master has 14.4.0, 15.3.0
   and 16.2.0.
2. The affected packages now handle MicroBlaze themselves: attr 2.6.0
   and libkcapi 1.5.0 check the symver attribute in configure, xz
   5.8.4 disables it on MicroBlaze. Buildroot dropped its attr patch
   in c804ebff55 ("package/attr: security bump version to 2.6.0").
3. The GCC change is not upstream, and upstream GCC still lacks
   symver support for MicroBlaze.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240228165300.4158751-1-vfazio@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
