Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D1606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 08:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VRAHEWXL
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 817A48148D;
	Sun, 25 Oct 2026 08:57:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Vk4IPT_m026; Sun, 25 Oct 2026 08:57:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BA9C5814DD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792918628;
	b=rbyybAJ4TWDfROS8R0ffGicpfbt5yJ2gY3qEdxwW5N8HbMlSefgCiM+lfYjzWYB0hSbI
	 yQhcrAKRZj1lq5KXmpTZOOUNONwy8B5J5AU84tCSzxjhoQXQwS9+aZk0wQfb5EDmMsWZs
	 wtbRnXO9aDd9cIEdxPOFBxadxYVPEL0+XT32ytGUNqO3qwqwd7Fi2ypkl/ln56Bf3rKyq
	 oX/a9ay5Ztce31YplxDLGyi4WIhLSrguSnAQ8gQB+6hh7PO6TDoS8iXn20Q5lzLSDZKbs
	 YNB7IJPIRfAHzs/gZfeVe5c7l0omfA6+CVdrEMbSVSV3pJt+qtEGupwkr8zJRSTPmDA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792918628;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=9QeHDhgqCp5hilEFzxU0JMusf7KdZlp7jnmOR+9Fjb8=;
	b=Yf+LRuDZsZaU1R0cm3sGA3/gaaa416sWOO4wc0znR2CrL7M7hrXMvSD7YZ1K6+Efwia0
	 XaMR5KiOxmQ2M2xJXiDryN9KBCu6Ulv6P/VFnVKnVOVjQDC/BEj3hK3OVbhqnSOi0qhJd
	 H2LH9x9BQOjchO932gKMjfCGgNy9KbOlqszf6RyJ35a70tDbFCSoVtfQ/7GurLYgG0LJH
	 2I2ZgQZJwtT1bW23fH++6c0AB34mlir+mDG6b0Rrt6bL8FlhI7tdIil2Vj7Xa/Qwf2Jcb
	 kZQihmPY7lExeyolpf8v9RPoEl0psrRHnsgvGfXj44HrliszDXSkRWkAEycDABnLvCw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792918628;
	bh=9QeHDhgqCp5hilEFzxU0JMusf7KdZlp7jnmOR+9Fjb8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VRAHEWXLWqUmAPFyZrrRxCZVHyzNNQjOnaqzM01XxUeWlAt7nz3QetC7iyDMjhPWh
	 iB40ci1YdVbxw4iTYjNl2ExU/RXqY6x+3C67r4eG0F76k2TEEj4Ge1OXhS9oO5QL6s
	 DZn7uvKFe91IdVnXftAk3Dd1J48Gqfb+oKEPpXM7qXzNSUH4LwrcjlAh+FAOrZy19N
	 6JVYGsjr+6Ahb9UYhssvNdjCgfILKX8KDWz7Jz04QX9FbJLWg/0LPl90GRwUxQ3m/5
	 DgsLO+ntJ2L2OHnUzBaayKcxwtyZjGDTwE8VDPZjjugjxrTmc8nHZlMksd64V0bwR2
	 sJoChn0JDQdkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9C5814DD;
	Sun, 25 Oct 2026 08:57:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0873143
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E21DC8148D
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:57:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J1r2A1FEXJG0 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 08:57:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8075381082
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792918625;
 b=iJRtcdCewLkkhs7NZFlDzLapISGrOQo6xjRWEuJSiBa8s1U8pbZpf394rGR0258V6xok
 rlizCQ86Y69sdxAGMjA2rRmKsA8GGu5LUteBVPwyyZolRi1zUMBkREnVPf4tICAuR1c5d
 Uw2xQjg1xAKmiUT1eCgY8/EGx1POTcJtLf14advn86s5b6KUteVQUqDBz1s3MhaIxVWyx
 hUNUbUEnLsskRCeMZDGbUOJWF+FdFcMb3rRRM+XDgg7VOW1gzNN6GH5j1Nzt3piCKR68B
 tNJYmJZg15WNytzUnIXnPYYFm/81/U3th5R6+OKlk1PfKrU6S0yEsuJqMHVjnEl+o3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792918625;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=/GAwygDvJ9jmj83PTzUsj8wnf5BhARau1MoJTTnx8dY=;
 b=Ys5ErpNzl+w5mhg49Gcb5fK5I/Bq0ZX6SdTVv+4RYK9pzVd7k8CXUk/jZWe1vi5CoHrI
 9Tq1V1teH/YW8KG9p8pBJJwGbDPxuv0THGgTtSWrCwU5ngg4tXZZKpM8JZCEscvE63J6o
 nHZXcWVTkbkcezvcic+uCSok3nF5jSxqJ8NrANNFBv0yfpJlqCp6p3XBPEjt+snyB0Q4z
 7DUuw1ghsc5RegMx/mJLQoc7R5RWu+MmtRAbtnxlcr8T7bXu8oRsyhsYhhgce6Uz2SQcv
 CPQxJQdLaDtv+oxSeUMYfgDxuKKJw7lksOJD8qn1lokIAc1G6cL6CZP5lz/GrHbvELA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Wyqlhar6; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8075381082
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 08:57:04 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BEA6619F5BE;
 Sun, 25 Oct 2026 09:57:01 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 09:57:01 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 09:57:01 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023155612.373228-1-james.hilliard1@gmail.com>
References: <20261023155612.373228-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <43681e7f531359694bc4f967751f540c@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/tailscale: bump to version
 1.104.2
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

On 23/10/2026 17:56, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
