Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A78DDCCD195
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 19:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FCBC81401;
	Sun, 19 Oct 2025 19:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmgYu9hO66Oi; Sun, 19 Oct 2025 19:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D8A1D812D0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8A1D812D0;
	Sun, 19 Oct 2025 19:08:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A66521CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9891741107
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LSoouIdpznv2 for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 19:08:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC362410EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC362410EB
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC362410EB
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 19:08:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id DC65C78034E;
 Sun, 19 Oct 2025 21:08:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Oct 2025 21:08:43 +0200
MIME-Version: 1.0
Date: Sun, 19 Oct 2025 21:08:43 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20251013201723.3833289-1-dario.binacchi@amarulasolutions.com>
References: <20251013201723.3833289-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <2c375c14e1a2f8bce818ed370115739c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1760900928;
 bh=bF+bpUD7ZM2Fed3M/TK5fPO54QIE//uj/xJruGTsjbc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JACqlnb/V67HWG/byYnMFbKwEfW+1Rzke79si9OmHt5X+bqg7vPBvkFCE+p9RR6H2
 WVYGXo14SfZPZgseRgMyuoXBAiGl5SwJGQuGJY6PKXe7wJPkgeHw94uFpMmncIIamf
 p7ao+zha00I12DY5Is9ZdRXQehSmB8RdyUor1+IuWfo2Pq2uMi9HcQz9vYPt6Sa8Gb
 sz2Tl/CKVcwsJ8G5NyWR1kM6b8bMrmWmrUX6vuiK9hk+NjV2ygymXex4W4EWmMkozZ
 w5QnBZYgEvyUmLWeykgV3fqIo1wlXejqKC9VZkA3Gbya4fOC3/vTT15e9kASogt5JG
 iJoyOn8SMppDg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JACqlnb/
Subject: Re: [Buildroot] [PATCH 1/1] package/gupnp: bump to version 1.6.9
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

On 13/10/2025 22:17, Dario Binacchi wrote:
> The removed patch has been merged in version 1.6.7.
> 
> Release notes:
> https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.7/NEWS
> https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.8/NEWS
> https://gitlab.gnome.org/GNOME/gupnp/-/blob/gupnp-1.6.9/NEWS
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
