Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F9A606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ET6n4JPg
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D2FB605F1;
	Sun,  1 Nov 2026 17:15:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlzrbRguE9oG; Sun,  1 Nov 2026 17:15:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D0DBA6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793553319;
	b=XLwQIPKN6zAY6UXk31UeVcTGPoIm0qbX72tCdBD77u4A7r0Q7csJ1QJtynqi00jgS3Ub
	 qWf6jBlyq6DuEtknvBA74R6kCPeT0kXf2FBpA0b6LI+iU6ZavQ54bKjBzXgA6yT/xc84f
	 lq5U6XZ6LiLJxmQth6TrpIEOq5ID/FVkWWw5F2JsrV2HvIwcqk6dwYCiOCeqxIEQN2DOZ
	 tIoaGMrqtcRHc7dzfxs6zP0dajsaskDxgqFp7vt23rUG+R2fMca4e1dSKx8zbSzUuHY5g
	 7BCgcEL0i08AiuBCki/tBtcJ86S5ocpBHryJ7pJU99wwiWtr943HQcJdpzWwXqvWgpg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793553319;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=aU8jKXs7/41lFAQztLSTy3GgGVN+pWtTkXsRYbv+kw0=;
	b=NM/2IFekti7IxWEKwJ+g0lmjm9Wmwkmqpzq210N2GgBouTRBVRQQoapro9rIcbiD7pPc
	 +w8Bcly1JwSNmBbf0H5F+MbV03wWRmKRuMswuJ5MRXHoiyNCI4pNVL9sMhHsH8ugf0qiL
	 9lx+8fdl8eQoB2MNKrf7/DXkfLa+RpwpUPMORywoNeaXLTWbOi0+x020FM7IHbrOPHo4j
	 9a9Sg1vqQi/wwELS7u1MAvlhl3n43jFcQL+VYFllUF5Yx2rmImcSFXMsCCt/Vhw1TNZcW
	 AE0rJMyCtKIZjQ3o77aQfNNu4KBiRVBK94Juaw5gmzdpomLKbak8m0U33VD4YR0nn8g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793553318;
	bh=aU8jKXs7/41lFAQztLSTy3GgGVN+pWtTkXsRYbv+kw0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ET6n4JPgKw+xbvb8OSICNvcWLTGIwFmOZkmWkz1BoS86Bm5nRVBXCTPnnZNcXbyGT
	 p92i5lA3ojygSGo2ChxRfEyyyVC+fODFJuEr102FzaOvGu9Zbwaucnaf7VITJb0ntf
	 L+5bb3ZJMEBnag9iQ6MaCYfc8KOPkg9LpAHDQLyVHcTkEWJ3qKvEey5ofrGmXeMhFw
	 3wNrV9NMw9iB9N625zljj0Ekzk/tyarJwK45Nw37jmrGUBjIvJAU7svfScsvuOcQt5
	 7I7nFPjCdBMQDCEc8d3GEV8L0PVyDVWN669+8KCFHurT/C6OBeG+WjkOYcwhWiq4Fe
	 Sg9p4nSMi8D1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DBA6061B;
	Sun,  1 Nov 2026 17:15:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5579EEF4
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52ABD405B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32UcP8SUlgxD for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:15:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B561740305
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793553316;
 b=ivErKGAVTn8YaaUzKjMx8BpKd1V4X80sfD6fRi5v/auvA++amwRX7Qv7ZQgXNv61sZOW
 mTueg3ys8Q6SkLDH74VZbjjSVnxTPnIuFMuWWKaPdvFCWYyNXIZowUDukTT3yCw7Jzcye
 RU9hKNDWRkew6vRtQ7ywUxtkCHqGvcxVztlV5bnrwgO8kSlCvLhn37Eb1AUN/nkNt3fbW
 1vRCyvNPfqEd2SLYVHpPRFVCptSq/7maE7KE/p2hvAA037xVKnystPIRNgeIQQ6uHkWcU
 3bt0G9iZzdVlBFfARifvCKSx+yrdxJB0d633mtobRTEs2TFBSmSXTXEDnj4JEfEwrfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793553316;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=y7zjh0zNqJh9T1b0hp6s0GYEuyQ5A0p89+xqImN2PM0=;
 b=olOEi0M0rL0GQLOUlD4TZgpMYsYHPaKskJCeiArdBDdWAdQsOFJe4ayGcKSmPTrMWqfo
 KZI1zxOVxIkg4/moiFJEzOLbKQ1RL2JpFAcfTqC+pAC0rPVvch6rexcThPK1aKB9cATFP
 PPGmf4E0b5zKfAYBdicfa0xquY+awP2t0ccO98pXOIlCGkRQG+LUlgo4uyQOqHN2lwfdP
 5zXasIQHqSDw3rE2E5ku428pay6iEU4kBfqC0RLBGXkZSl+jn3fuJI42ygZnDI0wJfGHC
 Kporlb1fYbISQ6yXUn8GI63Gtdpx1jpEqHiR3pA0FrtLBpkSf7PjpeE+0f4hguRsfDg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Z+9CpkdM; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::10"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B561740305
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:15:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 822BEB00565;
 Sun,  1 Nov 2026 18:15:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:15:13 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:15:13 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031180711.2738509-1-james.hilliard1@gmail.com>
References: <20261031180711.2738509-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <c0fcf3b9a8acd6f0ddaeb54733db03e0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/python-grpcio: bump to version
 1.85.1
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

On 31/10/2026 19:07, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
