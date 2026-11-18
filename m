Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429C606A320
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 19:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=slN/x5X3
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C69EE60708;
	Wed, 18 Nov 2026 19:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fgNMIdbBXp2v; Wed, 18 Nov 2026 19:48:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org EC468606CF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795031281;
	b=qZV1q0c1fsjm3urq6oh6SN35Vd6mmMgJiHhuovsRc7vFunjZYRLNzOuPVPSHFfoGOJAi
	 TXLoWwoDaX3jRrMndbV7VzDodTCJ2NiGNJhLeDW74nuiCKyCNQupa/c1UP/L6c7tnC8PX
	 KXj3G05taVWzjeFK2Yl35zJgrtizkIg3LK+arKbybVN5H+rruLPoLy7JN/20Rk12uWuhZ
	 SoWnP6gfUeAj4RWgqv1WA43yXVkaWgcFCCk48FIvwIS2yc8dVVEXEUmrC8F2eDEViHEFD
	 hmb/BZOOlEHzbW4dueGJHAFWTD5TeRpjxwLP87H4Tz8Kl6MBBJHTWDPQI7BwVexQi+A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795031281;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=xwj8JhL2ckIpzBf20kW9GfmZk3PVpAYfRNsKMsgCQ0I=;
	b=Zk19yjt71rs6Z6+AFXPgfH6Pc6L17cJaEwLRJgBUkgHzan3xRyvwBCJwOrMjo+tn01Zt
	 5iu6exfGrPfJtRsYCzBc7N6joUBOvJyysI+qe44ecVHXae9d2f7Fwj+yfOuYBp5JYAw6S
	 ezfDjLY60pgPzYKYmKOEoi24nrWvGuBH1cPbYWp1dC+G4k0ZY48JtdCFIYgh3exwjAIbd
	 4kvACLbBaim9VK0J7JxgIAbWjHVJhE5HqqDpuUtCNYi5K1I83vERq6dm3wMVW8DT1Xvr7
	 M8gsMOq2TPO0lrGUwb8fqFeM8kXTzRYX69EqFm7cY0etC8nKQbkN6MSaBUJYqoUg35Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795031281;
	bh=xwj8JhL2ckIpzBf20kW9GfmZk3PVpAYfRNsKMsgCQ0I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=slN/x5X3FmcRx/NmjvDr9lkJ6MImK/op+5Iz9qfimC32c7Cl3JcF5sHc8YQy6u8RS
	 UmIJN7qrlBAEz0Nh4ZBiNC+BG9WijcXEhoZGiwqcaRL7KkT/1wjFaRxqsZPN7u+pHC
	 TkArduzCTrB18mg+Cj5HR5Wbvkf0i8EAhJkRUNfsRThOpNu8RtEwRH4XgMWCXsYmpz
	 OQYjx9UW6s2EqYaw84wjT7Sk0tH2gFs1mbtPZYqvGLhu7XGJlZmHx5M6Zg0zBCymsv
	 fmP2GnZsuOFCUiA7nGw2dzcAs305G62vg7Ei6tHGvh/FMfkx37wqR/oKPZc0exlaML
	 AaQ7y/IN3T/nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC468606CF;
	Wed, 18 Nov 2026 19:48:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5A1D49B
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2D0C40606
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u_YhdfeHecQU for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 19:47:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 03C57405B1
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 03C57405B1
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 19:47:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 3313E13F8A9;
 Wed, 18 Nov 2026 20:47:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Wed, 18 Nov 2026 20:47:51 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 18 Nov 2026 20:47:51 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20261118181417.156927-1-bernd@kuhls.net>
References: <20261118181417.156927-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.21
Message-ID: <13251b27f5cec9102e0e7749e6d33608@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/lcms2: bump version to 2.20
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 18/11/2026 19:14, Bernd Kuhls wrote:
> https://github.com/mm2/Little-CMS/releases/tag/lcms2.20
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
