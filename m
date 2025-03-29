Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37996C36011
	for <buildroot@archiver.kernel.org>; Sat, 29 Mar 2025 12:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08A5F40E22;
	Sat, 29 Mar 2025 12:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AszUbvWdd0S; Sat, 29 Mar 2025 12:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DF8C410B8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DF8C410B8;
	Sat, 29 Mar 2025 12:40:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 048C019C
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0158781166
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:40:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CxnXSh5FI7x for <buildroot@buildroot.org>;
 Sat, 29 Mar 2025 12:40:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37FF98111D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37FF98111D
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37FF98111D
 for <buildroot@buildroot.org>; Sat, 29 Mar 2025 12:40:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E294878034E;
 Sat, 29 Mar 2025 13:39:58 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:59900])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Mar 2025 13:39:58 +0100
MIME-Version: 1.0
Date: Sat, 29 Mar 2025 13:39:58 +0100
From: Julien Olivain <ju.o@free.fr>
To: Francois Dugast <francois.dugast.foss@gmail.com>
Cc: buildroot@buildroot.org, Alistair Francis <alistair@alistair23.me>
In-Reply-To: <20250328195741.3921731-2-francois.dugast.foss@gmail.com>
References: <20250328195741.3921731-1-francois.dugast.foss@gmail.com>
 <20250328195741.3921731-2-francois.dugast.foss@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <e29cf5d4e7d7fc32f8844b7b565a064c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743252001;
 bh=e42epWSxB0SHqpzdtcDkZ+Wxtt96N+33wsnlE0RoZeg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rjp3DskX9uk5VqokVr125njnSbfNqGz3cly4bS0CyHriZJMGQ+2JNpedvkcG5Q7IM
 wd/0qKZzfFDImcs+mnDt3An1jRyjRU6tmi38ttT6s5Sv/FCoGaSI95/0FjzfMinXBu
 gWqrKBvSBk22NBNEDguTqCVGhRM4QzHReumImLX6k7bIO3BIBM79TO7LOXuEuFfmgS
 5PdMAK5Ki2JroKBuoyTqWr1nUQXqQ7nu5PckExfq8T3v+tpW3N+zZEJwcX86MRKpJT
 qDEcqk0OrLT46drKVQjnDcYPWPKp+dZijGl6uZCmgq/NfbYdpmRzjuXM38JKvQy37b
 qu8oIw1C+Zy6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Rjp3DskX
Subject: Re: [Buildroot] [PATCH 1/4] board/sifive/hifive-unleashed: fix
 shellcheck warning in post-build.sh
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 28/03/2025 20:57, Francois Dugast wrote:
> This removes a warning reported by shellcheck: "Double quote to prevent
> globbing and word splitting". As a result, the file can be removed from
> .checkpackageignore.
> 
> Signed-off-by: Francois Dugast <francois.dugast.foss@gmail.com>

Series applied to master, thanks.

For info, I made few corrections and improvements. See my notes
in each commit log:
https://gitlab.com/buildroot.org/buildroot/-/commits/1ba1055d3da2d98874aae1eedf1983a2ed933605

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
