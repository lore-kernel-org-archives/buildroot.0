Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BC3606A325
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=jFUCv9SH
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0B3680E1B;
	Sun,  1 Nov 2026 17:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpma7DPmjHRE; Sun,  1 Nov 2026 17:08:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F14F980DF3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793552895;
	b=rzhpcmnUvd4/kuNOh+Q8kp/MKEuKduCEKKTKyQHwayfqMSonb4XHVZDVEeCLRvDu+0jU
	 XK6lEzhwgNYCe8TapzTlM7xP4LmNh2wBFXHLWQLEo4A9AoEcZ91loagB118iXIrLXQ3jq
	 ntvENyxYAnur83+h1D18pLYSEpRGUt87nHU+/pcmRoWrcittM46y18kXa6k2mEMmTRH1s
	 Ym7bJN9+1x4nn+OdA0e3jB+UWscBb8G6S+Tcfr2jv2lv/kjgdJ12hd6pAzZesIdXVYzVd
	 6TjSuiqvUIQciLvXjPrJf9IstctDoQ3l+6kwvq0fqr7N1h9LpMXlEA56RVeJ7Ot314g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793552895;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	b=sGZpmUKeFlyrCL6Wuhhfudo3sd5l7xpSkHmGNAnwO5cgAOWszsjKuob8f8Lw5xzPfvuI
	 L+IE8LxO3wif3J2LEmq9VTnQN2G9i+5sdKLc6NQ+mU86UY+kiYbXyB1n6rdKDF+R9wY3z
	 9HJ23ONy2xfA5YTh1Y4ffrQjrOjzKByx42df9eJ+8ovB2xO4ayW2Q7SS/lbii7T01I4QG
	 EcRVVMeUSz8OTBj76/ez384CHllBeM4C4IQN6pD5h+/fs1Jlcvotjk1oAj9mbl3Cc1AnE
	 IFD0Qp+1bwMIoi5PQgTNWwyXhNml7Y+t8C8G1AGEk7FzyLd08gA+Uq5QfMT/Y113zrg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793552895;
	bh=SXCdqy/E5QhB+uVoEOYFdPbmR6gUIiUsekuOVbTTQNw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jFUCv9SHwWvBJlGs3QQuGuo+cq5bREQX9t55GDQxhlJ/dw3bei707r7E0SZ/kWH0w
	 74DF4oM45PJ4OPHlzWxUuqvPzyOmGWRr63OS12dufYCogLjfCeEK785LAAVMmm7Aaa
	 N2VYDPRVagxZ3EOefxbocHEqKVBQnHyK7GgA8RsdwHx478WOy+V4sIOLs12ApOVQX+
	 Mi5mPgNit6vu8cUZ0y6uQS5By2gACuiLWjjg9pixpcBrWH936vahrfTnw4V3Elha1t
	 20za8bYn3Ufe16RRADD4Xnqj0VbjyN76KnxR6F4b+SxxdAbhePsJoQP5T/4l782fRc
	 ySnXrrH3JT3oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F14F980DF3;
	Sun,  1 Nov 2026 17:08:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 240342AC
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A19E605F9
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x82-rIZVEe4d for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 17:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 6A792605D2
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793552892;
 b=Oa8iOpWL//RQf5yrE1IroeXOOnusDshohccVJiqG/eV/AHn00Uui8wnYaBR9UhL3YKjc
 BLJPUzX7vpmfxz6T/+lUeRR5J5G2m6iQ1sYPDdsgR6A+FkxYg2rIiDOeJ9HyS3eJcidL9
 hwfv9Da7plnBvIeeSQ0iiP6PwotSs6tnpfeYp9/4UZmyX8L6iBOqlOCi9ILzXvIV1Kzbg
 44xu1vqssahWYEuQo71Ju2fgLwC5GcNBG7nuFVeoGX2ZrB5bvJwozRyZ/ky/GLJPIUjdp
 190SeDPgJWynz1a4lkGY0mbyArBChducFbJ2+S/D2HtQox+m3U4B4E6J47aFove5V6A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793552892;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=wFB8ldEjsX0K9rqWZQr37tBRKhJIB1pZGGCrU11F5P0=;
 b=XZKtW16YPHyd2uUkEs7hBLA1PIgBR1Kgovw2VtqRPEyTNEjaLPmu5PIczBH/9sg1p2yG
 k+OB5e9kHXGq3A3mpQl8+H4kT3cJyCIrlwgRsWByzms1OSh36em6rNIJ0sACKKrlKN9GG
 ACGSRBCIOhsTUctctcD6pCmpRa2a4CNRONnPpwWyZ0JPbgjIwHfCugWqi+vIfexZSIneJ
 7z+ZiJGSVkvofnhSbM1gNd4GdqExlYrPQyFc0YdhgUXXw5aOFLTsZi0aF4u2JXuISXDwP
 u0CxUiBbX206rOhMmhQlKrIV7Q+T0grMAHAA96XfEqdlxYwuVH/KG17huG5wYYC+8pg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="B/UJi+VF"; 
 arc=none smtp.remote-ip=212.27.42.5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A792605D2
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 17:08:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 1308C5FF88;
 Sun,  1 Nov 2026 18:08:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 01 Nov 2026 18:08:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 01 Nov 2026 18:08:08 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261031172019.2683287-4-james.hilliard1@gmail.com>
References: <20261031172019.2683287-4-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <f677627058c24bd91a5b3dfbf193d497@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/python-engineio: bump to version
 4.15.1
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 31/10/2026 18:19, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
