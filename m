Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1247B606A320
	for <buildroot@archiver.kernel.org>; Sun, 22 Nov 2026 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FUfrc5UD
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 288E7406B9;
	Sun, 22 Nov 2026 12:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUJK9FAfI43l; Sun, 22 Nov 2026 12:09:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D86D34069F
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795349349;
	b=oCxo3eHYbE6+gGDAHANTvE/aK/eMGMfAWEKHN4y7CN+qU3SMewIMt2abJ95fZrWLsZ1I
	 8tq44OjCA5u5+Gw4Yvg9KsGaPStLc0GGJfB6bxnQGTVSnQQJpQ9RoiqMYXzizmrMGekNs
	 9/372WJv6I11TRLNG4uhS7krEX5G1L/swhguRqPYRWqKkQUx9A4/dS94l6NgBaw0FlbYK
	 Zo4KZ6h03++XdLu21b8Jdz7tZvFktfgMOqiu4qmzxXot0GLkk0AegNdpyi+K9/0tonEOP
	 G9uUYaEuYaGtpm9a7YDyvMsSusW5fmYFvj1A6x3YuBOstnYWy/8F5B1vgFygcOXUewg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795349349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=a1Pp3x7dLMDv49d5b+lf5wEnKCD7BEUB3JULee6/fBk=;
	b=UFdQ24Uf3dPE/nMbQgJ2wsoz3vi8REjtBOb9AsZgqrdiWSR9X4wKgRSJFMfAhbD6Nttt
	 co/akuSVoymatewITA73/GzV+IS39KMJ1PefBcD77brieH1y+TixRVnXV6hNG1E1JQrTU
	 2NzkYFR92NWoUUPH0IVcq6LAfe9J7zg+9zG57dbPk49GhpCCerAzmyD0uWoKZnc27gQRJ
	 kFiY3OfTYbouITSESq+tgEKCJ3tFD60Xt5rNkuicWSRhn0rGG5slxj2HcwiPGZfuhn7TR
	 VqkXUfoQgYQy+0Joq6cJdLOA37rhIdx49W1U5A2T9Vi3DJ33hYJ8WGwcJmlZf11xH5g==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795349348;
	bh=a1Pp3x7dLMDv49d5b+lf5wEnKCD7BEUB3JULee6/fBk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=FUfrc5UDZbzSGx7izLrPskh1Uqh0ARjAdoRuOUyll0lZVu886eC2UTZZl3L+TSYwl
	 33DnqoG7/PHscLlETRiOmaYEV57IYYoN2NIlJzHr9FG8W0pPna/dfvz9hc5VTMzVPY
	 1ZKs6Qv50GwPzVWFyJAoacfFnt2+lheXndhWl/mQ0HHBJbn0FH/Sx5y66iq5AX2XIf
	 1P0ynGQJvLchQqP3bF0upLT0m9Qf27KzRFcMVQZCpes51VRCQ0Se8pnuOgAcmsdHos
	 +ayRoeD193+kAxfX7xYscPDzjaTVwS+ZO0oRZhL1w+OvViVlJYhQoJOmRbZVt1rLQ/
	 KoOuGJLDks2Sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D86D34069F;
	Sun, 22 Nov 2026 12:09:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC35A371
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A24605F3
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKUg5T1FbvNi for <buildroot@buildroot.org>;
 Sun, 22 Nov 2026 12:09:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 11C6D605E9
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11C6D605E9
 for <buildroot@buildroot.org>; Sun, 22 Nov 2026 12:09:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3A5A85FFA3;
 Sun, 22 Nov 2026 13:08:57 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by localhost with HTTP
 (HTTP/1.0 POST); Sun, 22 Nov 2026 13:08:57 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 22 Nov 2026 13:08:57 +0100
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, buildroot@tudorholton.com, thomas.perale@mind.be
In-Reply-To: <20261121200654.28019-1-thomas@devoogdt.com>
References: <20261119140223.1968045-3-thomas@devoogdt.com>
 <20261121200654.28019-1-thomas@devoogdt.com>
User-Agent: Webmail Free/1.6.21
Message-ID: <b9e30f68b27c2bd8c330b9e8e748784e@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v3 1/3] package/openjdk{-bin}: security bump
 17.x to version 17.0.21.1+2
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

On 21/11/2026 21:06, Thomas Devoogdt wrote:
> Fix CVE-2026-114938, a heap-based buffer overflow in the HotSpot
> compiler which may result in takeover of affected Java runtimes.
> 
> This also includes security fixes from the OpenJDK advisories published
> on 2026-04-21, 2026-07-21, 2026-08-18, 2026-10-20, 2026-10-21,
> 2026-10-24, and 2026-11-17.
> 
> Other relevant changes include certificate and cryptographic hardening,
> updates to libpng 1.6.59, FreeType 2.15.0 and tzdata2026f, and fixes
> for TLS, HTTP, Kerberos, JMX, JFR, and HotSpot.
> 
> For details, see:
> https://openjdk.org/groups/vulnerability/advisories/2026-11-17
> 
> Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
