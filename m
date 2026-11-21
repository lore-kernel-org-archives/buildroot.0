Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56913606A320
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 16:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Je9UaLl2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2652F80F8C;
	Sat, 21 Nov 2026 16:27:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3_U2JZpO7xVq; Sat, 21 Nov 2026 16:27:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3DED080F43
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795278459;
	b=MOOcRV2aWTJSm6iY1ZGNovC/ZaVNkK1czsXQEDrqlcbN0u9+dwEgh2eyq85ickVw1ypG
	 XWaAmY7FEjz1kCaen41ldoU8x3SxAgFUMPWVe9WF0Jc2aJ0BgqrmW43PMofKjvkW92u5y
	 1yUNlZJ7XJG/GAD+ljucmWp2pQ+w2onU+yHYM7S1ilS+thvFfhs3FBljbRwtV1HK5o2Q7
	 30Qqawf/BYsoZN2NnVzt/B5EgUf0memjVqEU96YZ3bZXO4Si7L01qIWVIXcl+e+MYDE9n
	 5ZeIQIm0Ltuy+461LMqzY9Q9dFVW04QqbwQVypPuj5aUKyvwjN1Mn5R1hZb966+pVNg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795278459;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=wJGOmjNYvVFP2cEAZZhmUWXj2dYgqDgokbzwiPkLxic=;
	b=Uy/flRgVQyZ7FbVUzGs9Y6nU2p9e3/TtlO+BWGmsBFEfIXp18YdYcAqKRP3zjHa6YPA4
	 rZYQN7vrvLxveAOTHkNFnukKMND4A28SXSLh9vF3uSl7ZNVPKUc9bBKpjLmMMXyeO5NOU
	 stn9EItRwPY2r31TaUjIPHU/2mwRsS+cvZhYx0lSRvjKM6ULQqJwSATrXE7OV7JotxrpK
	 1c6SFuR8zeO87QnIl+OD+y/lyVnv/xR8O2Sc8Y4hV9Q6wBh/02agjuc76D7FuvYeHXsG4
	 ZtUPlO8C2LEzHjKc1YVy2fQZrSEMILJxbsyGIi4Td/O0CocnEA6xEF2Uavt1eIS7DRw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795278459;
	bh=wJGOmjNYvVFP2cEAZZhmUWXj2dYgqDgokbzwiPkLxic=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Je9UaLl2iJd+v/8NuNxxpvaiu8Tj/5sFa6dQrxL90k7r+V8WR1m4Oz8chaJceGdEd
	 EV0EkcoIRPd3H/9LZVkuAfvWXDcdFjzmTtCVN5P/A3N1RmxvYV76Y4K2VOIQmTAHOz
	 frzDa7h3K3j5jxYRr6uVuAoPIsQLPsiHvwn5k6PeBoogZrsuB6dpSroOjNkVl8HRaL
	 wKPpzlMtciubEtUVct8Clz77efxfn3m6c7VY74dsxMxFkNXTzsJM9bTDGi+qgyDoiZ
	 yW7Au2633oxXC56GCoXll5oONIH173464aNqAh6eYgwICHhDYBfJD+BUx3Y+FXexHt
	 Zv5vyhjZO479g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DED080F43;
	Sat, 21 Nov 2026 16:27:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5031B15D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 420334009D
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:27:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nCeXEsGv-6C0 for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 16:27:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E0A4C40012
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E0A4C40012
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 16:27:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 35240780316;
 Sat, 21 Nov 2026 17:27:32 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 21 Nov 2026 17:27:32 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 21 Nov 2026 17:27:32 +0100
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <awGGNwaZnjwHV98Q@waldemar-brodkorb.de>
References: <awGGNwaZnjwHV98Q@waldemar-brodkorb.de>
User-Agent: Webmail Free/1.6.21
Message-ID: <fa707cba4a9f7c3185ed71fb04276fdd@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH next] package/chawan: update to 0.5.2
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

On 21/11/2026 12:53, Waldemar Brodkorb wrote:
> See here for a ChangeLog:
> https://chawan.net/news/chawan-0-5-2.html
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
