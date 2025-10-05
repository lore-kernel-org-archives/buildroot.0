Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 896B0CAC5BB
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 18:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A2CD413FE;
	Sun,  5 Oct 2025 18:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G9S4UgScPQK9; Sun,  5 Oct 2025 18:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A7401412C1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A7401412C1;
	Sun,  5 Oct 2025 18:07:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3E66D226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FFFA40EB0
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iv7oGr__M21u for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 18:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 42DAF413E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42DAF413E8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 42DAF413E8
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 18:07:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 3178720039C;
 Sun,  5 Oct 2025 20:07:30 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Oct 2025 20:07:30 +0200
MIME-Version: 1.0
Date: Sun, 05 Oct 2025 20:07:30 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20251003201241.2430247-1-bernd@kuhls.net>
References: <20251003201241.2430247-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <c09e0786e6ab9fa76aa233ad7a1cfbc5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759687652;
 bh=C6sNkt4q8X9BuNz/cLzVuvREiKmOSrt8FeAQ8Oe9Mlk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eToJeRNNpgyY0NehdLZO7/A5cq8inKeX/o/jHDvFHZZOGgsmhEvhUD7EhzQniZiiM
 oddC3uNM6JuXjrxoZ6nxl76Oc06C4QbhsJqGBTNCjDiSqGgZ9uCYsoFhPZ/pf/07Hb
 0LgkYFZqYhi95VkOmzZNAjOi9KSyjOoYAAH2QP7GMDVTE9i8dY4mw60zBCD31GYvQt
 NfYN5fnb8fg9mc8pgax/n2TBadGhBAjdJs2TKgFXaHZDCFmxJZZbtIIUFPvZV9TsBK
 pT0tVCa9avCd6HsjZXxIS+NkQNlZc9EPZQqPmWqS5N2HlSKPUY399bf2rDnin+TpQy
 vUv4COur4y5VQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eToJeRNN
Subject: Re: [Buildroot] [PATCH 1/2] package/libudfread: bump version to
 1.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 03/10/2025 22:12, Bernd Kuhls wrote:
> Required by libbluray bump to 1.4.0
> 
> Changelog:
> https://code.videolan.org/videolan/libudfread/-/blob/1.2.0/ChangeLog?ref_type=tags
> 
> Use xz tarball and sha512 hash provided by upstream.
> 
> Follow upstream switch to meson.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
