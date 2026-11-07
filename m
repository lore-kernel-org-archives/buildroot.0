Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40AF9606A326
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 10:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rEC8rI6w
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 138F84078D;
	Sat,  7 Nov 2026 10:53:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pXlfvODJaPay; Sat,  7 Nov 2026 10:53:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3303740761
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794048796;
	b=b6zsbfoJvYQ4HzoPfC1V4w4tWMJTWhmaJ/viUxehSzBkhErMy6XIzhd3ELTGsf780z3y
	 kXZ/zcVKA6McJAPxbTVDenX1hZXw1Z7GA/Qoejgya5Lg8fVC8oTYqY+ZjBW9CMcvzOExf
	 /pxv1dUpM+wjfRQnVMuRmZwjWnzef1coo9w3rGdVreVEjEjdilRQr3+qMQZPFgmB8g7hA
	 m7d7m30QdR5P73ej+92T8P1r00VgrPrA+lYETH+PnPFoxRRODeKMywjwbk3xvyia/IF4H
	 l0FNIrl2Gc19thY1uJvEFeKX+Wz9BypHEghdElLfNz27M7YCKKKYtxUmiBnMY03QueQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794048796;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=qWShmvnVBBy58QifGC3DYLYkGS8g0zBDDEuTHT8zDbg=;
	b=Xcj5JZzXze2vDF7JudfGkXDV+MSG0wclYMn+XFIgMYWfUfw8D9NqMAR12OjlEGTMcagK
	 TtLKlN1zjXMdJCApKybv2+4rJtNM9nIuN+6t9MV1BJCwTVhv7waLx46R2+7Aj+hlV/X1j
	 j816szGBSmXzdcCnu7Fmgv6FObi9HMwIuYWyG9Yts1fQwtE7FofquKpFdOEW/QhT5j0LT
	 jMkxxyxvtiRGl1QX8EeFpF8MYVnv8q+b+wHaWQ/l+JQOia1DGIXtJ6FllUY3uaDppyfp3
	 yeEXFoDBJffZ9nOBVxKOuZ8hyJh5gQCZsdZmyAo6uwvT993nkoIIJMuGpWH8JYdFNwA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794048796;
	bh=qWShmvnVBBy58QifGC3DYLYkGS8g0zBDDEuTHT8zDbg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rEC8rI6w2KvAbodnlwYdQ41wClsy/8UfAMDf3O/TuCE+rWl8o/azpcWXo3iRBSLcs
	 uHsOys7/Pl79eQJQ1jgwEPkeE+8Cygj2OsJGkhix6KZ8oP8H3K6EZ51BygUrZu4MJ/
	 Bl6C83F/SNobVoT9tqGTq5FzhY2oAmPMpSWq25GxU7WExKfKDnOtK/pxDtMNimlhy5
	 wbbhPEDWaKGr0tuym8H6Izh5t23Tb6Rj03ldZJEauCs7OXg7fj8PDnTgUkdJ9KT/Pv
	 TkUbXVqbztaiEeGXmcER5ices/W40xe1LMqZH2tnvsfO9Und9UC1bj7RGhG/+s/lQb
	 qJXCHqieusVag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3303740761;
	Sat,  7 Nov 2026 10:53:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69AF41C6
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F0C4606AA
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utW0gghwg7i4 for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 10:53:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7EE75605C7
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7EE75605C7
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 10:53:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id D600A19F738;
 Sat,  7 Nov 2026 11:53:08 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 11:53:08 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 11:53:08 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Norbert Lange <nolange79@gmail.com>, Sen
 Hastings <sen@hastings.org>
In-Reply-To: <20261106215504.352784-1-fiona.klute@gmx.de>
References: <20261106215504.352784-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <6a1667aea8015639dc0ec96514e970a0@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/systemd: bump version to 262.2
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

On 06/11/2026 22:55, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
> 
> This is a stable patch release, no changes to options/services.
> 
> All changes:
> https://github.com/systemd/systemd/compare/v262.1...v262.2
> 
> Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
