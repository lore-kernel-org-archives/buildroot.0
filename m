Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098D9606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lKYvAFRB
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFE4340818;
	Thu,  5 Nov 2026 23:42:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Heyf4-4E1sQ4; Thu,  5 Nov 2026 23:42:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C696D40824
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793922167;
	b=LbwdPgQ4yacPgnLWyPv/mB7Vgjvx5svbdnj5thHI6cJCqVxCGj3AH2XsbGF2lUgt3/S4
	 mfquQh7n5xN6pLyl7n4F0syE3Czl2RD+4DPDc1rE5nOvOPrAsNnyJGyEbhmIyb4AX9yzo
	 IchiiZ2ZBUH8swEAtCQO+7HURzduzuZ6iBH7zn+ihwhQlFJDf5rzljnHofA41hsLzK9BM
	 Sy2ufGiAvgI4IrVGeoB1rKUIAkK6AgT7SPOJkDQjQ/9BuHn4HC2TaFY/5ABmrpgno/Fzb
	 6lCjHvJ9pLWDlBsF4GRUIoX4OV8yENnJ2ecXSXmeVy5Qw2AxeJOWCB27MuZSCAt8Efw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793922167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=SJMmlOsYz/+rF+QZJRccXI8ztxXjJkINJwIPS1eLN/M=;
	b=hW4wwrZjHILuZYucv86fhPTxlmkpuMnD43lDp7PqS3Ul0Jz6XmI656/M4CTy3cXRi1Zk
	 Pq8VWo91vpIupzSl1vIHf+ZrlZeRqONkYA/86CtO2oVAiYkHny5+wuP5Y+NM/+f3hEzaG
	 kMzBM1rMv0Q2MpN3psKn/yyZKMOTRBcTo2OZznp8hbatnB3xXUTWGpefdyrwijij+/sZ1
	 MVDwh1JsN2nLtFqP4kcS8hKykZEENzhRfUi6sf6mX246+fBPzqaD5fKdjKxpHiDSmlVNf
	 6Wz2kyHxMytoF7akyY/2I4ra3apfgeKRJsvnLVtcUW9olqC07rAMUYG7WtCocjQdPag==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793922167;
	bh=SJMmlOsYz/+rF+QZJRccXI8ztxXjJkINJwIPS1eLN/M=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lKYvAFRBucG8TqSFBXWc/Fv2xIvzfqIJF4z5G/kdJwvaBrrZgQ3tjUehISdv1x95c
	 qtKynAIHWbvI7fUgBxY8vOQmkAj22wTg+53xnk3SthPu2C1iM+zEi/xbcvTScuJNyY
	 5qLqgvE9JYllSKxqH5Wuggk2H/Rahp2HVKyzN4+1az1RrnMizgJCyfI7Y1cOf/d66v
	 yy5ITyJlbFYf8yFuf0dfHUgRKU1tzabaqCPkkVyQWhHEuCYgertjuK/s6mqEmoWZdC
	 Lwl+NE11KdD1kBTxLz1740X/xnVda8Y4US8yfIjNDlVRRAc4TGHR4FN8FGdxGFIH6L
	 QiLTlcQJodgnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C696D40824;
	Thu,  5 Nov 2026 23:42:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B907195F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AAC9880F6B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K_U3ZC0oVLFg for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:42:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D770E80F68
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D770E80F68
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 83B5CB00593;
 Fri,  6 Nov 2026 00:42:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Fri, 06 Nov 2026 00:42:37 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Fri, 06 Nov 2026 00:42:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261105215523.1641743-1-bernd@kuhls.net>
References: <20261105215523.1641743-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <bab80745c95237ac5ccad6d91dcb5391@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: bump version to 2.44-70-g21442dba0
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

On 05/11/2026 22:55, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
