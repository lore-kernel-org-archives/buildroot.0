Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9994B606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JTSLPQBP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CD5C40620;
	Sun,  1 Nov 2026 15:05:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fggeskXc8SJQ; Sun,  1 Nov 2026 15:05:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9610240581
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793545506;
	b=gyORYA9RWPdxhD4AIz9JKbz11sNCj4mWQ5bYwxiQaLsCwoX/Ia0cRFW+trX4Tm3KYcAJ
	 CeZtCpY6FU/UxsbQYvJYjEyYP/5yGi7nENrCUbO1eFonrKElIA2r2x7z0YSD6iiZ8yG6L
	 Qly/m8AjKsDU+cNnzxXEKg/U9Gco2rlogNqt8dghyCWSJUr7TLaan1XsiKl5d55gfR5Lr
	 V+99UOY359PrdJdllqRY4jhugLDBjAuWoWo+k/2GXdNOKMc9neSj2hQITAuFq9WC3e/1x
	 i3kV0hlLks/qSfuqFpRzczduCUYcWdFFDxGdShu7M7rl73NaKhKw6dkNWvtlwPtKh4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793545506;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=UQGJSg4riKaddWSWDqc8ExWHKMg5d09Cqrub43MX3YA=;
	b=lErXATcdVnsexMZBajyHon6+fWoOmCJSXqfBgykee0wVOYXAUbdazxqKWz5ErDuBF1Zn
	 dPQLYa1Iiwo+ghqHWrIBnwlfFKzf7mcF24IB+XjWUgOvpbzNQyxIjVGjMwVmlG+eLvV79
	 KiPHpjNRp9xQbVr2iGrM8FzSWadAhqhFUpY4JHdU+P79BhQDH921HXlE7irdTkJx11Fpr
	 tczGfgadY4YNK3g9izwGP731/XMmPfb/zxdkWmPA6efEV2gLcSCE1CahTDRLqJJBJWmHi
	 H8bkrT6u8KtSi4bLAiobxrJR++wa1IJjb/EDKjjd8jlQypOBqfACYa2LewCHnqrmdrg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793545506;
	bh=UQGJSg4riKaddWSWDqc8ExWHKMg5d09Cqrub43MX3YA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JTSLPQBP2DsOIUwYjCvxpeDIF/5M/98NdQp4lmpHdv+vYcvEvcBdQFWA0lB42YiGU
	 Zyyrt8IqiTFVcHDRWwrQp7SCuDzNYg6LW+2vAFmrmhl5JwH5YCDCRTdraB+v2wuCr3
	 ntuk4arJyFa8i00eiN0OTPNTYdxqdo/1xxARoEFUVb4QqhpinOHLwyBZorGu3shQ4O
	 lB0d1G/stU9hML7gXFyH1EyvrlQOqfHfvzjOwBG0fNQk9KsRLfOhRtFI/gDY73fT3y
	 Q9W8JzBvoACak+cK1MFYrgWdprEEU1TpJjsibywybFzb/jUMw9LNdKN+BxcGoScLDk
	 l/6PYIk5sEMEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9610240581;
	Sun,  1 Nov 2026 15:05:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3DD4A380
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FEF480E01
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-Zcog8kiLsY for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 15:05:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E6DB380DFA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793545504;
 b=GDMkMJREQwckJjqvhxiel/i3Y2kVMTm8SXtHKG0Qboz1KVT7WTFwyQ5Pq5ln9uT+9fNk
 vA1YNV/reivZuV5AZU0R2L1ljenQ71ici7gLe+gB2p1R6L7rPxRha86cVHcgW/XUsbxDe
 tsdRVQk2D9OqtLIh2kIJqNhKQuNyyVbGjDEJyzUwzB97CASjq6tBL82YxmEqVt/EwqA/H
 C06HSR0obQ3s6FX6/+ww113msqrZ3bHfZ3T1oXWAqbMH8mXsgQMm+aTDt+VMLXVkC5sOm
 3Fu+vaU+Q+9FqwIEeowB24wh8gIjXw+ZlOvJi+V2FO4Vf+I7lI1OR+esyCkBE09i5sA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793545504;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=zm8XDjaUNoX3DrplCUl/oYs67jz/XpGSHOizuBiCtGY=;
 b=sOb+tGrY5MSZtlqTzQxuyc9PjzYxt3AuKtvaiAEamX7p5cDbI8uInT0F/EarWCjAidXa
 rEb3Bh5DX2nNH6XYL1wMnM0dk7Nz/cJck8jUfpkKG1tZf8FUHafjHzx2aq9VzngoKTTIR
 0BJ4JSgqaz96p+qQMPBzqlQDtbkxOQWSr8/451Ohy6oeHCGvYUIzdKhXgAtebTFX+r3wM
 cOYT7tkRYIFxk7tTXzM533msEgo2EFQS3N6ELQfgNmP1gHAURplkuhWgPmO5UdRpLpYWm
 cft/OlM26RmY02j4CqSfGcWkReh+uTiZJnOkuzHhGp2r2+0kmkYKOdcUsoUR/9oP1CA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=WxSgBi7x; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E6DB380DFA
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 15:05:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5525F2003CA;
 Sun,  1 Nov 2026 16:05:00 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 16:05:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 16:05:00 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-22-james.hilliard1@gmail.com>
References: <20261031172019.2683287-22-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <77c6b5bb459b4ffded1ccc2c3d2d08df@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-twisted: security bump to
 version 26.10.0
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Fixes CVE-2026-83813, CVE-2023-44487, CVE-2026-115778,
> CVE-2026-115775, CVE-2026-115877, CVE-2026-115774 and
> CVE-2026-115776.
> 
> https://github.com/twisted/twisted/releases/tag/twisted-26.10.0
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
