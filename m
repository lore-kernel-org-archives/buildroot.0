Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E49A606A32A
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ff9IhkmF
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9809D406AE;
	Sun, 22 Nov 2026 12:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sC76sn5Hq9lg; Sun, 22 Nov 2026 12:26:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EBBAB40694
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795350380;
	b=B6KLHrpfbKe0qjR2gFBc5FkH24z0ry5Y79ug3WOuKYnbtNCRC25wLqqK6Pnv57ptg8VW
	 czxSYAcO7hC1TsCpE89WR/8BZ3oqpGoNmM6yp9ZPjKC1jOJMEiXPzeIbdGfm0nieWsyYm
	 mh9OT/nkaDMxJUGcZnbaihPfAjCECki57sMdsKT+kBzuWrd04/57g49op5GBTHu6XZJvn
	 Qj/8lP3udObsZcqQ3VygfwGT/5SoWNX/B4al9Y3AEXTzgwiDsmNXLh3Z7DTCiCGj/TzDo
	 P0L84uA8DT4n/fNub8/3vA1XMAKs60aeux/dM9HtTX48ZfmL9L/aIclcmdv4NTBkUaA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795350380;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=kvI1cjUiE7RTcZSA3Ja48sTAxaB/tb3S5zUd4JTL1bo=;
	b=OWp6roB09If0Mii2wEUecFTakOse90eFjU6qaM0QeL1EVszky16PMgIMcZBh4VLrOVKj
	 SAm2aVjwc7PFT/50StojCU7OEgOxx231tdO0DdhI8EI2zTMD7rc1CrEnm1zUVALhKr8HD
	 GGLngCBZMYvuem+o52znP5KYeD6vb+s5H7EpCM+zhT7mQztiY4kKJ5icWwCtWFkBysSzH
	 HkNzknmmGKXToUstEFdrjywc5QiBCDvVV9a9OznoLMzSmp5mwV/U32QiN5y/dxK+j7KMW
	 0cNI4IDToZxtJtQUV8Rnkt/R/QEhwaZ0aEtt0/PpZ9gKgUySpcdvqefsS/zsDBjFgGw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795350380;
	bh=kvI1cjUiE7RTcZSA3Ja48sTAxaB/tb3S5zUd4JTL1bo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ff9IhkmFeyToO222HvXPgaKEXWYFZBY7QTX8HfgJUmOkPZi6g0LVrOxjHxLy2ZJrO
	 F8juqgqTstYiB9+OgEyHLq2HrGujtyro1RLbqWjgC4D4kxQ9RQbXsVIJL7w19Oybs1
	 Ob80ktElGw3s53TZ24MiFwaaxJ6dMUIcK3AYxoXqeiAEeJVKgs6ZoxL3ruGOVC6zrF
	 apYD/0Vipne3Qt2ViQn7KBtnSCNgJYDu6ZQFw7fqA5YacngyGcMJZodDoxSpeyYtNL
	 +YnHlgSq/vxs3toJytc31H50nf8agrZOjy0M5eE2BLuzBfStKQM2iBdqKx53XTkBTx
	 vEL/5jD4uniFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBBAB40694;
	Sun, 22 Nov 2026 12:26:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 57B9C260
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5551C60614
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:26:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UZ2IbK1GFUh for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 12:26:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 05CE560612
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 05CE560612
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:26:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id DE7F9B0056A;
 Sun, 22 Nov 2026 13:26:12 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 13:26:12 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 13:26:12 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261119183232.3819338-1-bernd@kuhls.net>
References: <20261119183232.3819338-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <58489a7d15414a4601a3535138830c88@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/freeswitch: security bump
 version to 1.11.4
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

On 19/11/2026 19:32, Bernd Kuhls wrote:
> https://github.com/signalwire/freeswitch/releases/tag/v1.11.4
> "This is an important release containing critical security fixes [...]"
> 
> Removed patch which are included in this release.
> 
> Added dependencies to libminiupnpc & libnatpmp due to upstream commits:
> https://github.com/signalwire/freeswitch/commit/7481baed1886ed6505227e23a184ec85ed55d201
> https://github.com/signalwire/freeswitch/commit/f7ec023dc1a1694f34cd72ee6e670197abf136e6
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
