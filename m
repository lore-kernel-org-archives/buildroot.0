Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B3C0C433FE
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:50:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF3D40522;
	Sat,  5 Nov 2022 22:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBF3D40522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dvXzaGl9yTcS; Sat,  5 Nov 2022 22:50:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ECB5E40153;
	Sat,  5 Nov 2022 22:50:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ECB5E40153
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DEE901BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C26408C8
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:49:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B8C26408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0rSt38P4Ocd for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:49:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 974DC40499
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 974DC40499
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:49:54 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2F866E0006;
 Sat,  5 Nov 2022 22:49:52 +0000 (UTC)
Date: Sat, 5 Nov 2022 23:49:50 +0100
To: Baruch Siach via buildroot <buildroot@buildroot.org>
Message-ID: <20221105234950.6c9e06b4@windsurf>
In-Reply-To: <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
References: <996e9db6fa29e5b1c59d7ecf3e84da781bace4ee.1667288516.git.baruch@tkos.co.il>
 <fe30717bf4f0096985334e3e23fd1f1573eb53f9.1667288516.git.baruch@tkos.co.il>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667688593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O5oiEp8dBASe6hy/b1N9UP45u1LkVAZ1MvgY43mmrmE=;
 b=WFyfVXZeh2E7gC7K0jdlcGx2UhfYml/RNPfB5xl5ZccZqM/QvwAVQ6rJqq4KMq8TtapucH
 5raDYpem3B4IiP//ivOfWws+JllyGCyRb1vJDBta0diKWIeZGyrOPybpdYda/n8V8cjJAT
 mXAWxan+nq1C6ZJ5pL3Nqv2K/6P6mZp+KNQ20ycs8gfdYqn7qAX99epka0Ql2zro522ceg
 T97txGB9PBTY32qcluNFkS4HXvlCsu+xX3HT+EVTXbsWC1kb2uNXH+SYLkNPndaRRWqOo9
 gFryNR7SRKcj9rsMTJ8Azdi7mUm/paoyCW7kohp7cvoEe9CFat8awgTWXAxRfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=WFyfVXZe
Subject: Re: [Buildroot] [PATCH 2/3] package/socat: disable openssl for
 static build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue,  1 Nov 2022 09:41:55 +0200
Baruch Siach via buildroot <buildroot@buildroot.org> wrote:

> socal configure script does not take the zlib dependency into account
> when linking with libssl. This break static link. There is not easy way
> to add zlib dependency, so just disable openssl for static builds.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/socat/socat.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master with an improved commit log. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
