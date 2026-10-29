Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEA6606A31C
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 20:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JMH2OyKO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59B5C81062;
	Thu, 29 Oct 2026 20:23:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H9KEk6XRBxCP; Thu, 29 Oct 2026 20:23:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5C63181083
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793305437;
	b=QhzkUVGJ0tsuOXqtG5jHU8pBstKEmYNJchctgURiIouBPNenKKVF76YWm2X+ypreZME+
	 uwsjp5egnJAYW4w3CIQ2PexwrSXtFNbW5omOI1nANCbqbAKYqbbkfpSnRt8NZ3CXna/02
	 GJjtkOBYDaLsyi486jsiaujapK+cNQB6ex5KB0KmTJiPpaUn9Fdn9qHvqy1ci5CrOKtfx
	 QOjpNlz4qsSWarxDoD/ym55adKIhvS6SCeHy+2x+UrXa0Asonv8bwUffZM+hTz6Z7yeKb
	 L3T+b2Fg8aOEroBDdwdj8AiYcieQnAb+yj4MtWQQ5g+PsP/wJLz7TYeYlPoC43h5x4w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793305437;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=7R6Pj+iJBPnTztqm24r0pL2Y+I45V1RTL2zZC5JdKJ8=;
	b=ROpQqOBHCr0o4h3lz7FEjV3MqrYUTuha2jWpN8F8OZvapr6swHT7J0qwn5jgIlH8fwmu
	 q6wCiH+mkFDXaMmT68TMcoNLxMTpiX9Hs9wYKa7CCgMyHeXb7IycE6ijqHNMdi8Lvt9Ra
	 Lacw15p6YSXpJ5lU63fvL5eRTV2rAbAktsM/79B66Gsf0KQ+U3J00H863JY74O2jGLGnc
	 DjkLOcskiyQUC+XodgWo7fje5INPPMYS1kCLEP/WJgHuMCNJRXxJ1sMGsA4sU0T74V8va
	 Y8CBc05YuUu5slxTPNJalUXrVaZimo/6vr0Nw6InUdRgCBiDSgvXkWp47lPz9Z07eSA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793305437;
	bh=7R6Pj+iJBPnTztqm24r0pL2Y+I45V1RTL2zZC5JdKJ8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JMH2OyKOziLmxmbid7U1ptfWQ4ccZMrXF+0sAUpK9pOwPDmB2akgNzNGDwRKRJQMv
	 +KoWEmMq+GTA1ODtuuQ35AqYYXmD42o7RWsSpCuPFCRFl1VCx9KMpldxBoAqivQRII
	 8sJ37+K9M68so2xcBpl/Ie2D1Dsfcc4tUiA29pHebCNRwFSw7Pg+bK7vHBQD5i9ZP9
	 Q/Bi3VZ96DPOV9p+ZFegLzjjF2m5L6g49V8yfboEILy8GySYlLyN/nR+wKq5DO+6zt
	 ThHQbLs6XerjCSB+CidMXPh62HdqiaZlTA26iYOBXvieRup6+31FSdtFRa2b+YXRWl
	 YyxyOHNUPevuA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C63181083;
	Thu, 29 Oct 2026 20:23:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FE953A7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2449C60A77
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dxgVrmIGDQfp for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 20:23:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 50B6960A85
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793305434;
 b=oHZL83D5F0sdToFilYz1zotPdcK7IDSMCihBugwIv8ywoq8A+gkCqgBL9b0PxxM5mQt3
 VYsTqwaPw1wm7TR+NW4OCBuG8t8oy9cJoiPyB4crAU8jBsG77i7QytV1zlYitoa50jVN0
 7BXv0mcXpPK4U3v04HQzDixtGBBA6v6CVj6u3LGiA+uX8TNiHkXzv2+LpjLcGHljWNOQ6
 AAJ7aWknJqfI5cG6eZcOlDUYv8cESItZuI2VhjXMDswHRxGbKDJnPdweS8kzBlsgbMfJN
 5FwqlSohty8e2UyOIyU+nh4yj6RaJGLDFOw64L9SUQifjOyzebiqxb2iDAUuYj1NJWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793305434;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=spi0kp0akz1u6SFMkuHLCwSiv2cMjH6BzCSZepDvq/U=;
 b=Vr1RZ/cKnO5SbBq9vGiSzmmom+/JO0ozBhb9yVX69yWcdX5SfhSMKQmaMDiYBwzpYfww
 njlHv0zcuWWe2+Twc5kfS1hrNX1eF1h4b0RS7GTkx7X59OFCZBkZOSWzwYe48t13PtA52
 wFVnYlZz3MeTSsZghc+kjitqkm+YQoKyXV//jBnPtUJKL/vlVe1kZQN10UNbeifO6BTbD
 8aUjwS/zaXe9Gbzg4reANBnibk6+aEueSwDhzyRjl7myIwO8isVI3OsJKT3mqsc/nvCVP
 ld+uZk9Ft7obXy5nAjXmS6NvX1NjbgnS4rKDb9exJIgn+HkjtAV0ByfhN9r8K/l56LA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="C/wcKmgJ"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 50B6960A85
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 20:23:53 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1718519F5C3;
 Thu, 29 Oct 2026 21:23:49 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Thu, 29 Oct 2026 21:23:49 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Thu, 29 Oct 2026 21:23:49 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20261028222936.514451-2-bernd@kuhls.net>
References: <20261028222936.514451-1-bernd@kuhls.net>
 <20261028222936.514451-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <2565e37d1d6e6a9bcd719552d7353e62@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 01/18] package/bento4: bump version to
 1.6.0-641-6-Piers
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

On 28/10/2026 23:29, Bernd Kuhls wrote:
> https://github.com/xbmc/Bento4/releases
> 
> Removed -std=c++11 from cflags due to upstream commit which added
> compatibility with c++20:
> https://github.com/xbmc/Bento4/commit/9380a868a74252fa53c80174a3e942168e6c0d85
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
