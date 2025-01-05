Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C928AE77198
	for <buildroot@archiver.kernel.org>; Sun,  5 Jan 2025 13:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 862FF408E1;
	Sun,  5 Jan 2025 13:22:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cyJk5ocwiEYV; Sun,  5 Jan 2025 13:22:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61CD3408E0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CD3408E0;
	Sun,  5 Jan 2025 13:22:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 259BFDB4
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13A7B40B9F
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:21:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r4sC-HGhFzq4 for <buildroot@buildroot.org>;
 Sun,  5 Jan 2025 13:21:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 42B474097C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42B474097C
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 42B474097C
 for <buildroot@buildroot.org>; Sun,  5 Jan 2025 13:21:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id F052613F8CE;
 Sun,  5 Jan 2025 14:21:53 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:48590])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 05 Jan 2025 14:21:53 +0100
MIME-Version: 1.0
Date: Sun, 05 Jan 2025 14:21:53 +0100
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <05938c936119392a3e652cbb27b55b7da436e36c.1734938835.git.yann.morin@orange.com>
References: <cover.1734938835.git.yann.morin@orange.com>
 <05938c936119392a3e652cbb27b55b7da436e36c.1734938835.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <d2baa32aed31f6779eccb1e9cf7724df@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736083315;
 bh=+WmMV73M3yNDLeeSuBayQaz3EsTBZsw0uIvqPW8It9E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OFQdHVmRDD5J5QiNmCoXlWyrhwYQ76+N+nW0Cr7cA4hb/atIBWUnqcDWl+NcLGa7W
 oAvZkaeGgy3QOzTft+owhHh3mll1UOiABrgW/nHkU7eeaKpR5+mbSUQyhremoVqf1y
 /McfRhpTdzlv6sVSL9z4lk9019t6LJ64vMmVynyw+wWMKO9T5Yt2a1sMC+18c4bSjC
 HgcT5EhI4REj586OzjQ5qIDTvaCq7EwiaM2VXYMuEZ+fSKlUyKIFwmyIkrXv94jiYJ
 lm++N9t4siKh+ToBlkeKUNNLjEvJdTRuIEtJOJsY6KAuygteZENIDdvbYAz165u0xn
 3ER+5zc6Ftk0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OFQdHVmR
Subject: Re: [Buildroot] [PATCH 1/5] utils/get-developers: don't offload
 parse_args()
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

On 23/12/2024 08:27, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Offloading parser.parse_args() to a helper function does not bring 
> much,
> if at all; it even is restrictive: indeed, we can't use parser.error()
> to report errors and thus have to resort to a canned print+return
> sequence...
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
