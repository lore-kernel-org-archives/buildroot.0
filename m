Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFE8606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j2J02rfp
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07DE040620;
	Sun, 25 Oct 2026 17:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bx2W0C4z2_7X; Sun, 25 Oct 2026 17:15:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 1F6BA405D0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792948524;
	b=J6Vz+Wh3v6/D9rTcIqM2SS+wOtWue5rF/mA2o6W5q0jY1Xl0Qo6/n/5VtkHrzos1OJvv
	 8iYntlOS6A6MeXWl8lxmxW3hCIAyP6gCRt2Fr8BbBToxnkNMO7tiJLuVClHRIpaYkyKQN
	 R5ZTJd6XmVVIpdosqBv/qATPu+0zNV6Zc0XNZ057lO3bqPn5JLOaTjwb21vX3TwpvG+1u
	 2RHUip+nIUD+tfi2dEUytrgLjwoJrje92FhXVla7RHxfB2nHSgt8sHGGl8sinKpDHgAo7
	 ZTJMY3mEa+SNJU5WgRtcIPue10HhNJ6+OXbIrMv1B85hJKWW6W3tjoqks/wGehmyV/A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792948524;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Nnu6P0nzMyr3kR2Lc2oEccU87tXO06wF7qqPPbKOguE=;
	b=nn2uWADsT/OitSWi8j6p8Km1O9p5ePNVjzqsvmJ0/EemR3HpafdFry7tpQ0lNuctFfWK
	 /5yvwxrqLFt649OEPslJzXYPOwAOQSEbaydu2YH+KbKhOG/+qFmBxsY/TDXLDa0m3UQAR
	 KzlXlt7G3UmqeGItaQtr+5ul6niu8LbooluE9YZjDU0cHrAR6wWGHtYOWm6AFgNCN/7F2
	 tZwVGrDgW/IVXWe+IInhZG6n560JBWEoup3c8p5ON5DRBexfEV50U3jId3On2l6dcjq+K
	 8EWBLXM/px/EI8v7aeVlMJHbLVqpBvrIns/K7swSonVlnDheldO2exoTbDcC9qBsYFg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792948524;
	bh=Nnu6P0nzMyr3kR2Lc2oEccU87tXO06wF7qqPPbKOguE=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j2J02rfpbYZnBBx+ImaL0dPcdgBQCF/gXI15SjFVUvUVlJb5rjBKsCPhTSIsTWY5g
	 Vt6j1ES+/xRGp7kcoqR6f39eh3z/Ab0pm+KaruYtx67DLrfrbrSYWQ1nzoiSrwl/hm
	 FB74HoPWnISRVQiNZvl/4WVncEGWDohY/szN9Zn9lK8z3nz0rSs35ZjVzCrFB0uPot
	 tzqOD3pBW63/uqAPx4x3xI+IjHC/UtdS054J8MQlfRtXYmgGGqkGd0x4eXngXhPe9Z
	 hGL2DIz1VrrxXLv0PdMQx53Rjdw8qDC1saMRi6E88xTgTOF348PzXRBuTyCxnBgT5J
	 ++JsAEtrjUx9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F6BA405D0;
	Sun, 25 Oct 2026 17:15:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E919F3D9
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF5680AE3
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:15:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ccJ_I7pWKJL3 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 17:15:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E1A7380AD0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792948522;
 b=B0Es2HCBWBomKr+d/nQCxSk7zUSXzgWl5RUpMnSJtPgddpuZCS7+kOdhEz5VtTTMJL3e
 5rHNQouNzczKUITt9t6SOz9OOTwxzB9RxRqNtsq4K6XTjzgqA3Op6YqFGLgsk2gB+whvK
 zHOuuh6jmvGGz+WhVVg624HLFGQCyR/5zxErJ5XMpHRaL6WmhnAuYG1spIr7JsmZ3U7nt
 68P+hRGWfk1VQ8TU3gBJulbnbEmPFyfbnboEU2GeA2h2h11FHAPlUqsfrOdi3uWZN4pK2
 slAbgmF3/U1y/5mzIxqrEC6seNm/nZFxLIkbIQMOCrWpcqoMDneo7clgfo+VW4OPOag==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792948522;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=OGyNSHcRnJl9b1cj9EDiatkRyi5ymA0N+p12QMZmTv4=;
 b=rlyYaZ96qR8KomwnXwIwSZRbvdJHNm7lD//5fgFHF6FAACEiT+wzZ2As3OOSeuaOP4OX
 XeD31lVdeez8jUzePK+OwHz/fi0UNnMTZFo3AuIAjQvlFfpimLU2sqp1LvnCdNGXzUPzt
 mFxj9aBqTMwL+UmB/BLjuYnXSp+5v/Xn6XmO8vnnys9N9v+/IaIo9KF3jpRHDAIMW8Ih+
 sNUoHZJkLcsGYdnX0AoPJFHKYOEXNUErmZYdFYilrcL6A0Yr5/3rj3/nFwaNrU9dKUKPt
 BPpPKjdYYRhbxHRjHcPBnmE7bgl1iSjtGIjFj+aQyQvev0WCwVF5mi3Abb7z7tjJdNg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="D/u/ELug"; 
 arc=none smtp.remote-ip=212.27.42.6
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E1A7380AD0
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 17:15:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 2BB017803A2;
 Sun, 25 Oct 2026 18:15:17 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 18:15:17 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 18:15:17 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Fabio Estevam <festevam@gmail.com>
In-Reply-To: <20261025103835.1748520-1-peter@korsgaard.com>
References: <20261025103835.1748520-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <238ccca4ea7c0c8c6fedf39dd2c4b3e7@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] configs/freescale_imx91frdm: bump
 U-Boot, TF-A and Linux to LF6.18.37-2.1.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/10/2026 11:38, Peter Korsgaard wrote:
> Which is based on U-boot 2026.04, TF-A 14.1, Linux 6.18.37.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master (after runtime testing on a board). Thanks.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
