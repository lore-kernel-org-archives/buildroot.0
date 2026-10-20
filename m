Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78C1606A31B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EfUyiTpc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim header.b=PzwcnL/s
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96ABB60891;
	Tue, 20 Oct 2026 13:49:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eP8uF-7H91O4; Tue, 20 Oct 2026 13:49:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A87546084B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504195;
	b=Pon1CiTR3KegmZmT+FbHutXfLKciOXDE6tDQ87tj9TNnZJwqWd13eFpFeb3SY60dTvWQ
	 JlpiroVS6F8PZcPQkM0GEZXHGM3uEjpNjD0Yn0cQd8KG2AzDd9qY3EKAaHgCsBReZv4VR
	 V6PvqSOdhwyu0UN5FuClaiRWuUW2anewKsG1v3ejj6CuSf/XqkR8VSdBzUB8i28q1eZZh
	 jJ6VO6eSFaqa2pLUl4/i9Yr7gPLcf4u+B/v+UjxsVO4GYswVLffvtYYmgzoKMw8WNbF/X
	 4BRQbaY/UX1kLL7itQPYB2g95NIfLoYd+uhP33je4K3zkXASYQR0JzjbiWgZlu0DLLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504195;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=qz/ftRYZBmgxkYENSvdt4nHyqoSipF9lYszhAi8eB7w=;
	b=AiAa/O8u2nwP+qwD7xQh8XZx8XXJyazS1fDuBgQk98AqxocElPBE1xtKeB5vM6O7oiI/
	 bxQHpSm9pwdwEzY+V8FpFdqbyjs/8SJn53ufZ8qsa5SToRvPBjLnbar81hjnQ4+QrGN6t
	 RcJgEg80aInB5jeZe91zJXfbyRp6lZdLxl16s5QSmQ5+/3xsDhPM0H4FwgUTKwxT9sNry
	 KnPqRyqR7p2i5vBtm1n/WDbguJIi8ke37cvDFd4xaNcXCFjo+hN4xCYTNEF7MrVfYBd4v
	 ADg1Rtg8P6z7pXT/uZleTp7yqlkVPYwNekCSulXcQzO7PhJvSGsrlh72O2Vt3YF1tgw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504195;
	bh=qz/ftRYZBmgxkYENSvdt4nHyqoSipF9lYszhAi8eB7w=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EfUyiTpcE6bmdlQ5h64fvPH4OULfazlmslImj0Koxsq2ozDIatd3h0XIR4sGQILHx
	 y2m/QTZTzYGGInCHV86tINFCb6qJXQheIs+LySQeLPx/9xAIDnrbiD+i9mP/F+GWdY
	 CKUa9puglP33xcuvpwpaZ1qH764JdnkrWw0+lOJrz9vrgWMsv8UZSzrxfw4ugyZoFc
	 jFFrzvcSTBWy0Bnnnq9hLNATO7pC8uNmHzsELK4LGejLoskVnlmCjan7D/Z44PtlAA
	 qbdg5nKrr7WajYWjQcedHvOdeJcEKs7BY2/f9x+Q7Q+616IlN9Zbvg4JXwh6AlMZGX
	 7pG60dAe/lKZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A87546084B;
	Tue, 20 Oct 2026 13:49:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E9FF8255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:49:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CFB034083E
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:49:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLN-qk4APdY4 for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:49:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BFFEA40860
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=136.243.2.102
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504194;
 b=UqfUBmhNHWkfz7/fegzzSal1+jmxtG4RLq+knsH6x79QEu2C+XGRo3L6CEr2QprbwblA
 SovL9SkGymPfUdnFsaW7N1eb+Rs7hWZWKm1N3k+W/K2C2vr0FX+eLtGRsVOdURt7b0uZB
 DmkFjGHFFkzVKwMnqLuIiaj0pksDYHu/LH7Ua2dCKYtBHODOOZJbSZSBiPEJOLOT1rTmc
 2pWTOA7iPCFw283HcKGfaPbeIe8drRbj1E9GC6/PfAUIvlByTGEUy5m9OvpCa7Ld8p2/S
 zQRj+g7ecy8Rqbrsd2ieqoXOdAeFlu+oWNK3op1DTE88iJ61Xx+dojS83sXxdgfklSw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504194;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=CpgVtW6YBb3XCXbFYt2DYneIF4C1Oc+3d/TLuGdABHk=;
 b=NZVxSP7G1PssPukYypCFcxBUo5GP7QuH2ITkEioX8RbXDYs+LXFesogMoPHkAdVXsym5
 Vc2/J314HesPkVJqLtd2a8+n6iUuwYjWf6OrZD1KsyNfnVahWekpO5O8hf9wpPx5eQA6Z
 zXrsYafNzoTNNIH0JzaSDM5LqCB9Wew15qNylqdNxASE35rBQQzUTdWN6PIpIAPiSFS8f
 MLnNg1eMN3n9V/PTWjQhHajPgaDEptOcJ53ZRBR/kRXcSAcsPEGImM4IL4XolsQIUL9AH
 X2+VwG3D8L/wJY49/ZxxU0EUxleiwlme+q+4/VRbWG/dEVTyHb95EEynl7W0pcPpNbg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=n621.de;
 dkim=pass header.d=n621.de header.i=@n621.de header.a=rsa-sha256 header.s=dkim
 header.b="PzwcnL/s"; 
 arc=none smtp.remote-ip=136.243.2.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=136.243.2.102;
 helo=nyx.n621.de; envelope-from=fl@n621.de; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=n621.de
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=n621.de header.i=@n621.de header.a=rsa-sha256
 header.s=dkim header.b=PzwcnL/s
Received: from nyx.n621.de (v4gw.hekate.n621.de [136.243.2.102])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BFFEA40860
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:49:52 +0000 (UTC)
Received: by nyx.n621.de (Postfix, from userid 1000)
 id 8AA60E00A53; Tue, 20 Oct 2026 15:49:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=n621.de; s=dkim;
 t=1792504190;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CpgVtW6YBb3XCXbFYt2DYneIF4C1Oc+3d/TLuGdABHk=;
 b=PzwcnL/sophIjE8zFaZqvHugE7YGSrAXE+Gg65mI4ViN+WyY6n+rrPzSh1Fquoy1GFqIvR
 wyQjsPSMou16NYuTy0LgpdIdPBN2vlfTESDFEzEREgGeJk8Tde4KtSK8TE497++h7EvFcK
 eS3WFoKoJ7D6ZrvM02qDgfijp2cQ+No=
Date: Tue, 20 Oct 2026 15:49:50 +0200
From: Florian Larysch <fl@n621.de>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>
Message-ID: <20261020134950.t4p6e3u3pqbstub5@n621.de>
References: <20261020134219.20635-1-fl@n621.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261020134219.20635-1-fl@n621.de>
Subject: Re: [Buildroot] [PATCH 2025.02.x 1/1] package/go: security bump to
 version 1.26.10
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Sorry, my tree was out of sync. Ignore please.

Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
