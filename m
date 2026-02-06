Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87351EE6B68
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 21:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5CD1611EA;
	Fri,  6 Feb 2026 21:57:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeXufAlJg8VO; Fri,  6 Feb 2026 21:57:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C43A611C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770415029;
	bh=sIJl6hurp3KuEuvvl+YayvHKvxJ2PNxZVvdbOF6GqJY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qc261k5951couLcWoCq0totKczp3O1KLrfXglZ7RHv1UOpYgmDaihXijuyjrkU5km
	 78xDVZjhGHcU+S/ip422l07RRjXuzNO7zPmSVN5gOqP9pnmbM+IlTgqTBwONu4CRus
	 IQrNTqxC1xyt9XFQIsZes92c75i50fw4fcW2mXwoceRPgP3YSdfK0aKIieJIAKoBzW
	 Z6SjplVOxQbtldbPrGTm0Pbl31TAul0/G/8RdjjmK/Pgmquh2VAEZmh65FGLQ9S7bU
	 vQr8J28GlyTjIy6Mu4ibkSU8lTxLk6Gzvp+O1L2ZhwhQsvKj9Aww9SYtX2xD8m2ow9
	 tDl50NQ8vuvNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C43A611C6;
	Fri,  6 Feb 2026 21:57:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2895C173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:57:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23D1C841F4
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:57:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5bX7iSMSKxyd for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 21:57:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 39986841F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39986841F2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39986841F2
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 21:57:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 6ADCB5FFAA;
 Fri,  6 Feb 2026 22:57:02 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:60391])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 06 Feb 2026 22:57:02 +0100
MIME-Version: 1.0
Date: Fri, 06 Feb 2026 22:57:02 +0100
To: =?UTF-8?Q?Mattias_Walstr=C3=B6m?= <lazzer@gmail.com>
Cc: buildroot@buildroot.org, Vadim Kochan <vadim4j@gmail.com>
In-Reply-To: <20260205102554.1028552-1-lazzer@gmail.com>
References: <20260205102554.1028552-1-lazzer@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <19afd247707f2338cae5588c903d2fcb@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770415024;
 bh=x1luD4tCbBjkbMpNHBo05FMkHodh/zwXYtkv0FJKovA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mIp4o/Y7YWe2nmSQOVvW+lFPGG1ATBfRkkJXCtuQvHLNnZHgEDCXniqmV7tWDRf6R
 SDngL3CCft9Xi+P0HUoBoyC5uJFgxAqd7z2ACx2pE24B5mWKGuhlmUi0WHqduSRUyy
 Z3fpnqU87NLUjWwxjPJwaHCuwSJUK5tjg2OdGEvWua78l0mDsZb96hnUqA6UrMJYvz
 eLp5ciXcRbJYSbSimEWO9r7r40iS5dQYP9YfbZVcZhJQ3JZUBzDTaChnWCa3eUJOZE
 xwGcUCoAIWblmLuBT9MeJvXLgDOY1aWtatIXD8QaD0FEI4QOr7QSv3LvE9YJAGf2a7
 qf5lcid6q1DEA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mIp4o/Y7
Subject: Re: [Buildroot] [PATCH 1/1] package/frr: Bump version to 10.5.1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gMDUvMDIvMjAyNiAxMToyNSwgTWF0dGlhcyBXYWxzdHLDtm0gd3JvdGU6Cj4gU2lnbmVkLW9m
Zi1ieTogTWF0dGlhcyBXYWxzdHLDtm0gPGxhenplckBnbWFpbC5jb20+CgpBcHBsaWVkIHRvIG1h
c3RlciwgdGhhbmtzLgpGb3IgaW5mbywgSSBhZGRlZCBhIGxpbmsgdG8gdGhlIGNoYW5nZSBsb2cg
aW4gdGhlIGNvbW1pdCBsb2cuIFNlZToKaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcv
YnVpbGRyb290Ly0vY29tbWl0L2Q4OTJjNWFmYWQ5MjFiYzdjNmEwMTJiMDdjM2U1YzBlYjllOTRj
ODQKCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
