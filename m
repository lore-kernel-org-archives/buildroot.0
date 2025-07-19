Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79F8C83F34
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 15:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D6140C3D;
	Sat, 19 Jul 2025 15:18:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3uBjt9mzsfRl; Sat, 19 Jul 2025 15:18:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A881440BFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A881440BFD;
	Sat, 19 Jul 2025 15:18:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E676B222
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8994400BE
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6-Ko4YMsmeVb for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 15:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E16EA4009A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16EA4009A
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E16EA4009A
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 15:18:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7420B60134;
 Sat, 19 Jul 2025 17:18:18 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 19 Jul 2025 17:18:18 +0200
MIME-Version: 1.0
Date: Sat, 19 Jul 2025 17:18:18 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20250716143240.1354630-1-fiona.klute@gmx.de>
References: <20250716143240.1354630-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <4e0443565c67773a43d47f794c8a4573@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1752938299;
 bh=voVZgc15bAoAmCtk32R/gWdk6VU89vzKAgHYVkGsWqE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=rGNFbKO8WLTagk5JLPCJ0wklfLilMMvqS4qw9cmJtfZejiFvgbhW7TUblGXQDQYB5
 VpIWjO5k7iH1uwAkEro9E4ZCNa8GS01BDUZcVTc2gcazSXd7K1pzfDcbzwMAiNK8W1
 raKbxKKu38fKelL+m0lj/ANVJI1dgED7IUu23R2qA4ZmFFjgWE/q9HLoxK7c/NWBhy
 dcp7iN0SLYBNDP4C0ZZ9axTWAJqfxIOaAD8uYeZLqNgCA6M2O37y378OTjKy0l2WI3
 GN8cdNsfnWY5YpPYTkz4XtpPFlYZr8fBTqS/Gu7C2RGxUOPpkv1hsw4c4A2AmvCQc2
 PUlOhkkiC+u6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=rGNFbKO8
Subject: Re: [Buildroot] [PATCH 1/2] package/network-manager: bump version
 to 1.52.1
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

On 16/07/2025 16:32, Fiona Klute via buildroot wrote:
> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> Upstream changelog:
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/blob/1.52.1/NEWS?ref_type=tags
> 
> Not mentioned in the changelog is a new build option to set the path
> of ip6tables [1], add it next to the existing iptables path setting.
> 
> [1] 
> https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/57321f78c9aaad23099e80f7945ef996acbaa7cc
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
