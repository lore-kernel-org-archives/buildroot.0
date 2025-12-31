Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CB2EE6425
	for <buildroot@archiver.kernel.org>; Wed, 31 Dec 2025 11:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50D8A81E0D;
	Wed, 31 Dec 2025 11:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4FIgiU5mS-qF; Wed, 31 Dec 2025 11:20:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14E8D81E03
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767180027;
	bh=gkCS4rPmNu/Lqf8XvQwEIhIb6z2ZL2eeHeDPi8a/fjI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QL+psNzx6TP9hgBbsFfg0jLY3T0qBkBiGVN3lC4MoHvcTSnbDu8qvhOiaTR9bxB7u
	 FxGVGpvGMycfzobl9lD8VdmzipjwRpDn9N0qabMDd9QcgVcgT8w1s3TydcL6MOhEaa
	 piEdC+hmihPpxEcS+ZmbnyrK8NwUGeqhrr4FuuXFfPPiwg6OL0BLHVUR4V8uexwU+H
	 aVpyjXrY8ECTP75QLgJy9+4MLg8oH3RE5KbsYU3a/aOmWFucYbtracLJd+DvX13N5a
	 GHHKKUkZPoiuSQYnaCArpqhMM8xI2BsowjXLP6C6esOmL2BxMLj5ER5BaVYVfTUQzO
	 PoS2Es6Lsx1lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14E8D81E03;
	Wed, 31 Dec 2025 11:20:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F644177
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 565DC81E03
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HuqWi2cgcMqP for <buildroot@buildroot.org>;
 Wed, 31 Dec 2025 11:20:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E4DC081DF9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4DC081DF9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E4DC081DF9
 for <buildroot@buildroot.org>; Wed, 31 Dec 2025 11:20:23 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 68CA313F8A2;
 Wed, 31 Dec 2025 12:20:19 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 31 Dec 2025 12:20:19 +0100
MIME-Version: 1.0
Date: Wed, 31 Dec 2025 12:20:19 +0100
To: Joseph Kogut <joseph.kogut@gmail.com>
Cc: buildroot@buildroot.org, aford173@gmail.com
In-Reply-To: <20251230-libxshmfence-shared-memory-dir-v1-1-03a64fed2269@gmail.com>
References: <20251230-libxshmfence-shared-memory-dir-v1-1-03a64fed2269@gmail.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <42aa6cea67ccddabf4d8a9b528ec3a69@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767180021;
 bh=+Tt4AUYuSWpmJkxvdu/P07gKAFAHfbnGiM/OUfN8SPw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=m41do9aVHB9tV1pkRwJ1dBLbFadudndYAfQVh6nXcw+tImckzsmCfKqpivwgKATkc
 VWCMcaRc5L4rUopArl/h6SkyzeKw5ffaVc5wsF9TLWKFjjyO6q+3AhkR36VY6ea4n7
 QGxinsA96rRj+TH9JED+MhWawjNQts9PYAHIAjM6iR9RgeILgBsPwBPN/uQab5q6m3
 jLz7eA0HBwYrepkjTbzLCEa1YYa5XQ7KS1J7o+y9p2m5DOmmAo5P+dxKOpa6XhzLlV
 TnioBOToDZh5UgxL0wjGrnSFG0Jyq+fgRqcp1K0LANp3tIYkpKrwxCwrA8uzQnY2Ay
 x9uEW1miwvriA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=m41do9aV
Subject: Re: [Buildroot] [PATCH] package/x11r7/xlib_libxshmfence: set
 shared-memory-dir
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

On 30/12/2025 19:54, Joseph Kogut wrote:
> libxshmfence has multiple paths available for the shared memory
> directory, as some distros [0] opt to mount their tmpfs in a
> non-standard location such as /run/shm rather than /dev/shm.
> 
> The default value of 'auto' will set this path to whatever the host is
> using, leaking host configuration into the target.
> 
> With X configurations that depend on shared memory files for futexes,
> (muvm [1] is a notable example), this results in applications silently
> breaking during presentation with a blank window, as the configured
> path doesn't have the required tmpfs mount.
> 
> Set this path explicitly to avoid situations where the host context
> leaks into the package build, causing feature breakage.
> 
> [0] 
> https://wiki.ubuntu.com/OneiricOcelot/ReleaseNotes?action=show&redirect=OneiricOcelot%2FTechnicalOverview#Upgrades
> [1] https://github.com/AsahiLinux/muvm
> 
> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>

Applied to master, with a small change. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/cb79eee7fe6f5e8e5e31474dba47dc054fabfa02

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
