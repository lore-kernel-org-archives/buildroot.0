Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F2B410775F9
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 18:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90A72610E0;
	Wed, 18 Mar 2026 18:06:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dy6Z-fgVRBkn; Wed, 18 Mar 2026 18:06:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDABA60C2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773857191;
	bh=QJjt+3QUds0kzb8xgA5H48YrP0gEpJkK+QuXoW0gBxQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fbbVAi2//RGHR5EJiI2TMi//uOCDaQs7GfKM1S8cSHPzEwLe01E8npOBSfHdUx1J2
	 rgsOBoja+IMTnCTfWdOeVorhvVKXwsFzo6yY9y6yCqHLgp8Ugwdy/gvoVo1xNlUHBw
	 alhjmRbdsolVmntrJzHynQ1nuYTP6lclhJlTVHr7r40TKEnzykE+hxqswYHurHErtZ
	 J404uRdeOVQs46nsGCdtMjSgls6CNZR4/U67FFsWMwiaO0BSM41V4MkstZcQRn5eKk
	 4k+I1xTpnKidyZywf/3z3vPLHuA3z6A1PM/S9CBLTXhtRvZU2hma7QwF7qD8i9OVTm
	 Xp8KUvx8L5VDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDABA60C2E;
	Wed, 18 Mar 2026 18:06:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E65381B6
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7B9960BF8
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hJ9iXBvYqwMV for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 18:06:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org AA8D1610E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA8D1610E0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA8D1610E0
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 18:06:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3A2CD60137;
 Wed, 18 Mar 2026 19:06:26 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 18 Mar 2026 19:06:26 +0100
MIME-Version: 1.0
Date: Wed, 18 Mar 2026 19:06:26 +0100
To: Manuel Diener <manuel.diener@oss.othermo.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20260318105338.1000762-1-manuel.diener@oss.othermo.de>
References: <20260318105338.1000762-1-manuel.diener@oss.othermo.de>
User-Agent: Webmail Free/1.6.13
Message-ID: <631f2a89dde979bbcf53239dda431a3e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1773857187;
 bh=tHqTKf/yiUCBCUK4oFI23K38lZ/gXGojx8BhGTKMaKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nzyMeKy3VJd4KmJOk50i1EyBzFekDkESW17DH8/di9A9a0op0rOp+FfpGhmtjGgCc
 jLFHNmCrxUUxHsPSdSE5RZbRkuYgc8uHJVL7i6xtlh10KCqxzdgZnRifwZf/VdnalJ
 kUGi7V2l3GBLUYVl2sWUH2L4zTdG7I78eIhf419qMpODCOXOu+d1O1o+5RJm01FAmM
 sNmR6TfbfHF0Ws4+X7zrHLu+lzbwqXooGFAfr35PtqpMB6xUHHi2FtmLgijbjxaE1B
 H7xa54mduzy9/fara5BIkUNzIVr9NB6bjM5jSdlMnpULeiDGv9L5hYngo8nm+kSCIo
 MSFkUahHQHYBA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=nzyMeKy3
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: add Manuel Diener to several
 packages
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

On 18/03/2026 11:53, Manuel Diener wrote:
> Add myself to packages recently orphaned which I am going to continue.
> 
> Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
