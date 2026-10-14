Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F9FCC6B2C
	for <buildroot@archiver.kernel.org>; Wed, 14 Oct 2026 20:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34E7E4076D;
	Wed, 14 Oct 2026 20:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2OtKfUiedOW5; Wed, 14 Oct 2026 20:38:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4FA1440775
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792010317;
	b=FLAyM7z2Rol6v7rPtYhMwJgGqPJ1cFKfmakzkLvrIiJELTtBg2t2EOgt2L59+SEjSWSW
	 yqUE/cma1HB7g4DFTj9AIH/TB0hro/vQSj2Rbkem8w/4w842mwAH9zmxVyo8CRMe/4ykP
	 UAS5hxNbwS27RlmySOwJHr0mLHRhg/rZlJ1J7ROfXoyhs2fUKIi+Nv8reFJBDiioGTiE7
	 JzshzvpIvL4Si7SuaP4JJFPn63FWxHozVt4O6DJzJdrHrvKhqIf/OHolm4grqzNKZRuA+
	 sU/sIqHyee4/1C+/swwwSzrbZOshIqC3yHjiEqkI0NN8siD6frXr2pNB6ERQLMwLRrg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792010317;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=EMtJOr/yl1nfjsVtrBjoyshzzTiVUpJzYPki9EAazG0=;
	b=lloVjixkYFBsifnUlRP2QrIXjW7G05EM8azXPQeIn8rUoMdKPTg5zyP4IpzlXt38dweC
	 imR6kX900k3tvd7eV/V9ro4QYYswTl0W8TS499MFOqsm2a2Y5tlJBvngCRy5eFb/dWHvC
	 ow8bABjx3unxdufLa/nFG3eP/1pt2OaNqcBk1R6vPv2LLOsDa1h0zN4UV1t5VQy3S/ZP8
	 EVzyUYHsiR5CTmumoUqKlK35g2qHgOV5fDPN5bChefXov4Iu62ibRKu1wJdpeCfbAYXdw
	 zM9QToPTLPu4/wWiB0jzRCuZZN0TYu1mxbbwPheHQeJzwQJ9MlBcf+biRQl2XM3N/qQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792010317;
	bh=EMtJOr/yl1nfjsVtrBjoyshzzTiVUpJzYPki9EAazG0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lw3NYUr+YjIg9sP1dPmtbGxtIMdiE4oYgun3kBSnHAdleEsbT5sN8UPvof/SWhWWj
	 NtAcLfqhVNxz6qYyXTPbNBeHbs4UmrPV+5vySLZvBhcxoVDMzQ9eJP+tJCC1EJISqo
	 jIttGaJy03p+OVCcztu/HeyOxIRsIHct0Soty03PGP176QDvAIwjq4rHjxZ0Ah4zEd
	 o1DjxEB2xtW+2gmSV+pRUfYlUxSzvV+soi3W03XtI2bIBFFCfadBXGiox6nuE8YnA2
	 0AhfzUCDFlBuVjlz6jgPE3ewAL0M/FIONI3Zn3LlJacEr3bLXWKNp8x1ksfUfGSCwD
	 elPrpNoTKimMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA1440775;
	Wed, 14 Oct 2026 20:38:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with UTF8SMTP id B0639A58
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with UTF8SMTP id AE6984019A
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id YbLRQxWMKU8h for <buildroot@buildroot.org>;
 Wed, 14 Oct 2026 20:38:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DF2F1401A3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792010315;
 b=kxkXq5bJoZ/lorTSum09g2/to25J5m6h/d3s4PXzVXRIIn3GDFPO8l4foA2RwV5DXmgf
 H9zOYfgO58UTj5j2w/YRRl+SOGbIsjes5FoPk03md0qYGVwzwwEyV2HtJK4qC1TkxybBM
 xMbk6d/4PcKOIEfi/+RcHGXw/JZQiAznw5a0PiVJ9rlPNj0VJR76ThPLfe0KEDqUbzRY1
 8RPLv1OYsOKoC5aSabxGef1TN201M1SB0TsTVffH5BjGPESIOREfsRMyS6rcZlmUEPmiK
 5xgxDtvPD6a9gnm0jTaBSeY8b3fgFtyajS8O580xrupUsuWODksKK/q1haNIIIXzbJQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792010315;
 h=Received-SPF:Received:Received:DKIM-Signature:Date:From:To:Cc:
 Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To;
 bh=/WSsu6r4CP/7Qe649UpGwYtniyfeD+5bt7fSL0Prn6Q=;
 b=Fy64eeqDhFqcEdW/TSE+H7uZUCG33NW9l8m9dRc8wIL5yxeK7wcL61gqTfOBF4h4gwbb
 VfBoSl6vgDZIaZe1fnFHHDaBeOLVWKUPz43uHVZOR0AKQwkNxCeUCfRZWNzkUTufTO74a
 j4PWJ/eTjbJ1zb7zdyYDTlvZ38m3i51et1Ghcpq7MBtPXadl/0ZAOmicEiQkF7JG/YkBA
 bdAWS0FJS8PE5Gt5207j85QmUlf72WG0y1yKYyWl1T9eEQIFmw6QsfUKS0yR01FUqRdEv
 bpfyhvlEhur3O+ay5KhBMS7TBOkcrnqVw7df9sHy6QEqs0C7XCqBRV5OpACBoZjMo9w==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=kernel.org;
 dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20260515 header.b=EY1EqOLp; 
 arc=none smtp.remote-ip=172.234.252.31
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=172.234.252.31;
 helo=sea.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by smtp2.osuosl.org (Postfix) with UTF8SMTPS id DF2F1401A3
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:38:33 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with UTF8SMTP id 55F0843D82;
 Wed, 14 Oct 2026 20:38:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AAB971F000C4;
 Wed, 14 Oct 2026 20:38:32 +0000 (UTC)
Date: Wed, 14 Oct 2026 23:38:29 +0300
To: Fiona Klute <fiona.klute@gmx.de>, stefanb@linux.ibm.com
Cc: buildroot@buildroot.org
Message-ID: <as_oRSUUVH8SQG-m@kernel.org>
References: <20261014164625.1474866-1-fiona.klute@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261014164625.1474866-1-fiona.klute@gmx.de>
Subject: Re: [Buildroot] [PATCH 1/3] package/libtpms: fix typo in
 HOST_LIBTPMS_CONF_OPTS
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Jarkko Sakkinen via buildroot <buildroot@buildroot.org>
Reply-To: Jarkko Sakkinen <jarkko@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Oct 14, 2026 at 06:46:23PM +0200, Fiona Klute wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> --with-... arguments need two dashes.
> 
> Fixes: b2eec8c6265a38cdba1afadf7f60e0fd00f3b448
> 

By defacto there's no new line here, and it's 12 most significant
bytes of the hash and short summary in parentheses. This is at
least how it has always been in Linux but not 100% sure about
Buildroot. It just looks weird to me.

E.g., I would instead:

Fixes: b2eec8c6265a ("package/libtpms: add host package")

And wold not add the newline. Since this is not kernel, take
with a grain of salt.

> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
> ---
>  package/libtpms/libtpms.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
> index 7bc69a50d6..0ece84ae04 100644
> --- a/package/libtpms/libtpms.mk
> +++ b/package/libtpms/libtpms.mk
> @@ -13,6 +13,6 @@ LIBTPMS_INSTALL_STAGING = YES
>  # Required because a plain Git clone is used:
>  HOST_LIBTPMS_AUTORECONF = YES
>  HOST_LIBTPMS_DEPENDENCIES = host-pkgconf host-openssl
> -HOST_LIBTPMS_CONF_OPTS = --with-openssl  -with-tpm2
> +HOST_LIBTPMS_CONF_OPTS = --with-openssl --with-tpm2
>  
>  $(eval $(host-autotools-package))
> -- 
> 2.55.0
> 

I'm not saying this is not right but I'm neither sure whether this
is bug fix or not.

This is a weird because I've used this almost on a daily basis for
Linux kernel QA since I contributed this... Stefan can you help out
resolving the mystery?

Br, Jarkko
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
