Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8590A606A330
	for <buildroot@archiver.kernel.org>; Sat, 14 Nov 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T0ZVTdWZ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 473CA60687;
	Sat, 14 Nov 2026 12:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jSw-SNGksZEA; Sat, 14 Nov 2026 12:32:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7C4236066E
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794659535;
	b=dS4ZgynA3LpqG06W6hsi+rC4NsORZbqdUfLLk5+C621T6Q1PFlMNnZKWxsFoVsYe0cfP
	 kQ68fzAbVZdAryedTrRYHGgAacG+dDfYXAi1tKCe6bk/B9bkc/kXp7y5DgZOFm9z0MTyX
	 wg7AtQVDfqkAzWo3w8yaINufulVcZ4PNtqwACzKuz+CQNXVmLdUrRd3l3CtXPVLcrvDE4
	 a6wmnQlQyjkNYzrhORTqvLG+zl2yctVSi/nrZiYXfv6GWkMY4Ph63C8PSBLwI+3Q+kVQf
	 2WXstKLWYeBy07hbqZCcg4opQIcUHep1X7CHHw8dfOVtowmFFLgo60XkdEr8g6XP+Bw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794659535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=OoJEJFUOncNxWkoH34/Nj/CLuIlfQYu5et7bd9gJf5o=;
	b=HsTItmsUfKRcyLcpEr59CzxeyAEFhUVC9BhCdirrNl2TUPGa78gL6kZER97Yco2qQ5sv
	 6UX4Vc0w6G88ddL5q5CaXMvg8705t2AiE51bLdIwWVUAZ9mVTj8GweXJMch7zxmlaa5hm
	 tUgietdSplXWTYIL6CfUhIystRC5QfFXWIXeQH7TkDGzVpH/LCJ4Nm9Rk2Alu+ghq9zlK
	 uibvfxOphT+SvKI93jlgeSXgdYn14AFScBKaVAL/AYqALU3/pVnoMqXJmD9c5FiS/B72/
	 usiQwT5FF1GJ1PNj6t4v9Pl+FSc1Tp9xZV4zbWcJv/AtXSfmOpHT3TtJK1ZohQimwQw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794659535;
	bh=OoJEJFUOncNxWkoH34/Nj/CLuIlfQYu5et7bd9gJf5o=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T0ZVTdWZ77mAFwXRgbRbQkL+5YbW4GGgFRKKVVgun7tP8sCG9GktlKf32XCz27XtX
	 ciWRbGMDGAxyi8yTeJkzx2GsG9DLe5QcU8NrREqo9deAo0jO/kzKxIIXqsGiraNLXd
	 qGE/8mM/tggW3YSE4sQsMe4MKTmFlGh27SIqC9uA6vLp4+ZR3J2ND/3Bsvpx/7QXeU
	 r0sssjF3f3ouwOqNj2hIE2yD+6U5kBNybqk1KgNyEO8GdpgTrNiLM3lFQ3UatzcFGL
	 0RsqoVRxeNgh3jiugptvKMy/663/qMPf7mZt6WzyUnSpUzmlO5/rINsBZimvXUIaVS
	 xmkNXPckK1DnA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C4236066E;
	Sat, 14 Nov 2026 12:32:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 5FE3AD7
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 497BA6066E
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:32:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nciYFXN8pM3h for <buildroot@buildroot.org>;
 Sat, 14 Nov 2026 12:32:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 340336065A
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 340336065A
 for <buildroot@buildroot.org>; Sat, 14 Nov 2026 12:32:12 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F30F119F5A5;
 Sat, 14 Nov 2026 13:32:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sat, 14 Nov 2026 13:32:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 14 Nov 2026 13:32:08 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Kory Maincent <kory.maincent@bootlin.com>
In-Reply-To: <20261113193612.1229303-1-peter@korsgaard.com>
References: <20261113193612.1229303-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <550314b144bac87dffa91bcae9968023@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/drm-info: bump version to 2.10.0
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

On 13/11/2026 20:36, Peter Korsgaard wrote:
> And drop now upstreamed patch:
> https://gitlab.freedesktop.org/emersion/drm_info/-/commit/154d17ec47baa9f66528d81d73788ddbde5000e1
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
