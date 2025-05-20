Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10516C3ABDD
	for <buildroot@archiver.kernel.org>; Tue, 20 May 2025 17:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D270C40B22;
	Tue, 20 May 2025 17:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pVAnt-esS6fa; Tue, 20 May 2025 17:29:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B39640AD8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B39640AD8;
	Tue, 20 May 2025 17:29:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFF9DE
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E57C640AC6
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IoE9Ph-xXv_f for <buildroot@buildroot.org>;
 Tue, 20 May 2025 17:29:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0B69E40AC1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B69E40AC1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B69E40AC1
 for <buildroot@buildroot.org>; Tue, 20 May 2025 17:29:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DFD5A780503;
 Tue, 20 May 2025 19:29:26 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 20 May 2025 19:29:26 +0200
MIME-Version: 1.0
Date: Tue, 20 May 2025 19:29:26 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250518174413.2148870-1-bernd@kuhls.net>
References: <20250518174413.2148870-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <2a9cb4aab982fe7b1c0a0677f380d21b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747762168;
 bh=1btwnLo/tjRQjbYv+hXVCpyDRKHOGk97nnPvW1UIIh0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TvszT4FI5MI+iOYsYtz/Iq3a6UaQnDoJH1EeLPVmXahTOPVR2hzdjAeA8JL2Fm/ML
 JijLOfLy8W4JTackDWBjlI6zUfJBtUemC74p4EQdM9UT0AZjP9oNF4NPdnW71YT4h/
 VE+2Cwsq48ATibel7BuMwl55LgrGDkb5JnEGluxSiGThJZh+8O1eJEsJJtTlKlmefo
 E1zDfXL44/qzK92DVsT0FNgIStnaRs0Wajg5rPcMBrvJD5zmSA4PE66bmafd6oV8Cv
 hHTWzqPlj4UB4K5r48cCyXPKd/hp3ljmNFzXF0rm+0On0QLf74hgf4BIv7KT3rOpkG
 6bjsL9nIO+Y+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TvszT4FI
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to 1.2.14
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

On 18/05/2025 19:44, Bernd Kuhls wrote:
> Changelog:
> https://www.alsa-project.org/wiki/Changes_v1.2.13_v1.2.14#alsa-lib
> 
> Removed patch 0002 which is included in upstream release.
> 
> Remove Kconfig options for alisp which was removed upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
