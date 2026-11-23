Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4540606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 20:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HZEsB39Z;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VATOwMNU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75E516068B;
	Mon, 23 Nov 2026 20:25:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IHa_5nG-OrrO; Mon, 23 Nov 2026 20:25:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A5BEE605CE
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795465509;
	b=R3O1Gz9pr5NM7RdwtNFUgBjLyHEu3I9SYMx8iuyGujbJCLdLs3EvJf9D+8jnFvErxItJ
	 hroO6Jpzr7blEzxM+dNo527XwdsPF9PRl70LCM76D6H/sJ321G7SS8rl2n73aU5vdg9G+
	 X6k7E0t+8FhV4Ype2XlUS2/EUPYhTg7u0Vc24+KiWSndAajdvz7q5dC0usduuOPT9o2hX
	 Q7SUvASf9CHdp+q6FeFrYSPdnEy/SKB+h67wxS4j9NTVCUhu8y60Qdbx6Eh34ZjYBayay
	 szaKTc/CaQbS6Ef6119ST8nM6VUZ7Z5CbK5GTPRyiQFI5pdWYvEJRY7qQB1DQBygBNw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=A0ZctHpEuzJ0y/Brt7/7J9bbxzhaDeAuMNWLLTuLGAk=;
	b=RI4x6ITu3U9MmUazkLomWE+DkbYGxkHS94DvHgudHHWRs81YVfQJRHCECVR3p93rJVP1
	 YSig7b186TStW/EiqNQ/e63VaFhzwM/DRomTqqZ4YQGHWaakOS3zGQmdk58CoPbveWzD2
	 olMzyBxqzKU93w9lNe8BHmXEKijP+5/YMaQP3ZFn6/5KjXfI0crO8AOVclHnj8srBYebv
	 XoQ7lV1xd+XFGreG7HazlJGb9dsA1HPBwYhJSxBsBK266upMHX9hAjRaqeIMKxGKjh4xf
	 ciDu2m9tkDGHbArmwBbcpCnnVNET7F491xdWiWlif6xfZ2WgoGl6VNLsKV+SSW+EWXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795465509;
	bh=A0ZctHpEuzJ0y/Brt7/7J9bbxzhaDeAuMNWLLTuLGAk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HZEsB39ZGOoB5K24DqnW4JlgSzO3ZHXspj6zq3AT5i26VuMMWOUYsQve+M657VWYY
	 SUzWq+dMewbrrIrc8cy99DxHnCNDwzG5Zf1ySRVvOrW2Cy6bTgyZ90oM08+MMnL4m2
	 fp8eKW7jSaeNQJOz+wrTKOCCbfk59FS1hlXqaSNCZcovMNjMhr8tZBEfZd2hahh+dK
	 F0sl/XzcRSEmh7wwRuqdBRRRLtey/tNNsX9Y03X8DQIx9I0Wnj0S9gWF+Kxh7GUnrW
	 AmD9ho7ofu5V1z/25uCwFxzxFwanubTMBg5dZLpTA4qmZXfyBVA4TxOJVJz4D/f5LB
	 Ep04gziImQbng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5BEE605CE;
	Mon, 23 Nov 2026 20:25:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B9AD222B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9F3914055C
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sjce-ybQg9uP for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 20:25:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9084440523
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=VATOwMNU
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9084440523
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 20:25:05 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-491846221ffso3175287f8f.3
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 12:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795465504; x=1796070304; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=638ecNyjR7Q2Foi++0pl0IgWRG35qc/Zh2P428xEkac=;
 b=VATOwMNUsTWV1yg7bHWfl0wXUKdYMM3Jrl6PvVpv4JJJJvpTBG9OrBoUi3JGGDJaAc
 6xnaK5VmYOjSJqtGyi96fll5IjWF/jwKRENDquzmCUmYQpsKOfzlXZhw4+MHAQgqyQe8
 G3fZRx9nyT6ySNCbXJ8vOl0Cx/sCYx4lnEejJ5l9GU0wougxmS9Wv5fRK3JBYyDItJKR
 kW0pv4+J69K6Z1otk1xy5JBtS/yxiAy9A0Ubm2AsNb1xKWLLrL8NCiGKaJ0fYcf5K+um
 c96P3whrw0UunR4aDLZdAujhcaLR+Bv0rjUgcKLOi/JBHH4ZjttOB4CUmXJhXdOWNtom
 FnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795465504; x=1796070304;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=638ecNyjR7Q2Foi++0pl0IgWRG35qc/Zh2P428xEkac=;
 b=hhrEm1CgHcDe0ctTNz0crWLqzkXar5XhE1hX4DCb5R9teDE5hYTej0y49szMZM2a6h
 ZCTGvmg6ZfS99CnWLNLz1hS1OdELvIbsAqEU+6zts2/moFgmp6dbO+Mml3QzX+duBs+D
 OLyK19hX3g/9krCdq5J6mz1uEnzlUx+qijQfVNO9c2Dj8yF/8WrZjglOG7Untw17Li5O
 xSqaCc7seBb6jWIOSJLdz6m9fTgJPrytfV/ExyVn3rP/WUo5HTGajqBet+zKmnh1L4Jr
 fPrqJAxiwdi8+KbB+mQn+KpAmGJIQjwhAq5bs4E/WY19N17VUasm47HgWj/q1gdbxi1d
 eqsQ==
X-Gm-Message-State: APuU4Z8TF4cRn/+dqe55yhZvsFBmgwaQGZWolpJq2pylC0FjfIB/FQME
 ZN6QOhTECvyUMdUpaCV9GKVdus1CZuUv2P9xzLWMWqFLPObTsjC7MURC4OYU2e2p
X-Gm-Gg: AZFdTZf6oQ/XzwuAs6u/PkOk3R3sa2qYKkad9PBmG+uEH0165gBMgdACgkBjgwpYGwZ
 qmG2RP9rDuNlGyNbv1uM1ZtFjgdO62x3jBMspe4FjGxA/9OM1g01nxPNH3xluO+BD3HnF/K8aSh
 eiwKAfbNyx/ebdDIowAj+PWYdNSQ3HbP9eTSXG921cdJm4nANq+YFONTga/aRZF3WPmob6QNkKm
 NtExWvfOj5JYBy15FwDmUdNXxcYmZb81BPUo0mZl+fWrsfGLuaC/Wn/uBQ1IJZMD03JbVH8ZGPK
 y0qrJMQECj2Kr1A8vhKUhdbI2GKfRMqYWeYlwotWX/YFXioQAyeKKXwRsCkoa7URdC4JmflPlFU
 Yw7kJJA1oRBU51lqR+7SrMLZseSkQ5Tgy7eVXCu3Xm1iqjbvdT81TsfrOwbVzI6lRDkIDfRWsYT
 BUHbfhliCakDtKAhihsxpuTg32W7dDHXFdvzRyoBZeGkmttztWPxGXpU6WoxaIFE+thTzuyxQAT
 SGgONkO94gjOaDEoOgtHrMayQ1j20hww1n/6AfX7c7q9h/MUBBuuayikybkhH6/ReG+eaIdRt9T
 YGcPL8ycNv/FqIOs6pcA3VEyNx98qjkCeWMs2vjb4WJE6G1tJjU=
X-Received: by 2002:a05:6000:2313:b0:490:50c1:f359 with SMTP id
 ffacd0b85a97d-4abb4d70071mr26825853f8f.39.1795465504030; 
 Mon, 23 Nov 2026 12:25:04 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6c340df4sm27783747f8f.55.2026.11.23.12.25.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2026 12:25:03 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Nov 2026 21:25:02 +0100
Message-ID: <20261123202502.3419375-1-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
References: <20240509204218.77779-1-fontaine.fabrice@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libp11: fix enginesdir
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Fabrice,

On 09/05/24 22:42, Fabrice Fontaine wrote:
> pkg-config doesn't return a libcrypto enginesdir prefixed with the
> sysroot so drop unneeded call to xargs, readlink and sed

I think this patch can be dropped. As Thomas expected, OpenSSL defines
enginesdir relative to ${libdir} again. Master has OpenSSL 3.6.5, and
its exporters/pkg-config/libcrypto.pc.in has:

  enginesdir=${libdir}/...
  modulesdir=${libdir}/...

So pkg-config returns both prefixed with the sysroot, and the readlink
and sed are needed again. fe7ad9e3a2 ("package/libp11: bump version to
0.4.18") applies the same stripping to modulesdir.

Not Applicable: https://patchwork.buildroot.org/project/buildroot/patch/20240509204218.77779-1-fontaine.fabrice@gmail.com/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
