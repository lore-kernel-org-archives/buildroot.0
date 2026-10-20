Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0101D606A332
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 18:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Bo747jdh
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C163C607EB;
	Tue, 20 Oct 2026 18:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yRHlZHiwFYV; Tue, 20 Oct 2026 18:19:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A30BF6071D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792520392;
	b=orHdUdFV+srbO/aoOlW2vK2OBskfA1lt+4W7N6qyqFCEiR1BCfJz9oUYr9qfddOqnA2r
	 tEk2yVfGC1F4UyKPGWhOMM7EHndONtGdbCcs/SCWKf0YUgK1bjt2Y9O0VqxSHcoQYcxvT
	 NTzuN9lCJgpunQJKE2WDAiuflSmRHrU/c+8/O8JFl0erVDI7cYsvSYWWhEzHDybN+l+nE
	 iJp0qAEVV3cKtRNsWD/sMCFVMqr0vB9O/soTSchYkx2SS6QIdwn1V+YLg24ZETlaa0Pgm
	 wquQ5oC/2rpnKIAoiIOUsLC+1IsoZ8Ch3o9UdDEYQ6DZScAJpz0JLd0cgo136WgLfXw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792520392;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=U86VL/Dr9AH/hwb37VYymIGCKTo9tDcBnMtMaJ0snKU=;
	b=Vo7jBhOjzKXnK/0kTkC5//RsVxgUpeH8RXVluplGbVJqoDCIJU9kucNTtDAcZz5Nos5I
	 a/z4t/1ufR7Q0pIYvS332zsIXc5gKMzwFzdw8sssLTnfrSNoDZ1gEebSy4ro2P5K2N6Am
	 fbUGUnGRBuo+qRrAwhgMpOu4yoD1cVSKo3wHztFfLoZqL8qoUA/RuvVepRRJclHmltvT8
	 A5ccP+bSh2yGHOfhLMfKrvmvPcl7QvY/gZwfliq9H+e74mlf8gc13FVhxFGg30oyV5KTk
	 fdmK6ZMPBhY/45+n1DY/dEUGd+7XqOyRJyEQz4rh0UhOWtgqp1WnP3b/KPPdp2ottCw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792520392;
	bh=U86VL/Dr9AH/hwb37VYymIGCKTo9tDcBnMtMaJ0snKU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bo747jdhf4v19ullnW80AFgGWMa2l6/5bwCYcUiETRNzUnLLZQN8iY+McLuT7Gsex
	 42XRihJC0XSggkir2N/9DQhTRvzkam2SSZCN56YC4ssoWhMi9bUzIGcQ1F2DxdGPEq
	 6YG6OuCgfHzTMjuK5euxlB0HG30kcUHrWy17kCUX0PHGHT17P4OjyzTPwIfZ2C7VIT
	 Cjrmu6ExNJdYKYIsA8bkn+MGi2UcEKcgHLK3nnkHP0jMfray0rrCIAKkce7qnHLmPr
	 guKZCCq9mCUFqD3bZqnuxb9C6+zGl8U7TKLDsKOZa525uZB38cpEAGLrz7LLZyyDqj
	 RObUwqWzUgaOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A30BF6071D;
	Tue, 20 Oct 2026 18:19:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 210603A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:19:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 131E7405C3
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OUZPJEc2PgzJ for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 18:19:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 34B2E405B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792520389;
 b=EzA6sb7QleZab3pb+b3ziqowbH8oOvGIg3qZk8b2jRUqiiBoSk1pWgL03bT2pY/t1n08
 SfGIcIMFUESvk8EhqzoKhbVQmbwf2lDKhtXSwTfYziVklpnbwdZ/1R7foKRcHTEkRy1xB
 ivotOZ57cN2Of+5z4vk+Y4zvpnLMsdHIVTCpsjGzAhK4SQAlpZfInvIwZwLHycPz/iAth
 wMw7VgXweocHuwSg5SrKZ2GvrkpghoSZa7b72B0TWh2NNb3DFqagIPZXHXC1DTf8G47I2
 SLgrt6Yl/Ly9OwNmGGBHMtlgnR5hh4ihus/44s52O47TOmQAsZQRf5tOIefWgsSaC8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792520389;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=zcmQBhqWKLVDxIeFLiVaTt/VkMXaK46a15160nkKMjA=;
 b=rlyMqrv2mqsVjEuN84qmppIh+HgflNUe22Waf6Z+JGobJLzvpj6v7lb86gBsomuk7x/T
 uX/zC5ur1r4dNXjqNf10jsk5mzZP2BCZviElF+LzMqUIYgc7h90r1POOJzuTAFrmyoZpq
 9V2h2HEwFhzO2asXjPmdeq/SsA8vqS4m67vCuYOFmuoS/XStQxK5MAUbXEk1nBBOClwDE
 4ei/n80Wwo/xI1UIlGH0QQ4LZU455RHQBoFtmxwL7ces6hJKaHoT8i44tUIQ2FIvxikmP
 P01I5yHouRGFpFJ2fh9cXdxNMr+9poAXn067q7Jlckb6PhxvmwUnYQe9bxZYMIdEF5w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JJeA8kuB; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 34B2E405B6
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:19:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 865511A1290
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 18:19:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 478C960393;
 Tue, 20 Oct 2026 18:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BE0DF10328C52; 
 Tue, 20 Oct 2026 20:19:39 +0200 (CEST)
Date: Tue, 20 Oct 2026 20:19:38 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Petazzoni via buildroot <buildroot@buildroot.org>, 
 Francois Perrad <francois.perrad.86@gmail.com>
Message-ID: <atefMriQw5K-VNaX@windsurf>
References: <20261020120646.1306735-1-thomas.petazzoni@bootlin.com>
 <20261020120646.1306735-2-thomas.petazzoni@bootlin.com>
 <87tsmg8gqi.fsf@dell.be.48ers.dk>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tsmg8gqi.fsf@dell.be.48ers.dk>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-hare: move cache directory
 outside of $(HOME)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 06:43:49PM +0200, Peter Korsgaard wrote:

> Do we have reasons to think that this environment variable will only
> ever be used by hare packages? If not, then we should perhaps rather do
> it globally / in pkg-generic.mk, similar to E.G. how we set GIT_DIR=. ?

That is certainly an option. Initially I only saw the problem on
host-hare, but then I saw that the hare packages themselves can be
affected as well. The question is of course whether there will be an
impact on other packages, but if we decide that $HOME should be
read-only, then it makes sense to divert XDG_CACHE_HOME to
BUILD_DIR/.cache, and see whether it causes issues for some packages.

Should I respin a patch in that direction?

Independently from that I believe
https://patchwork.buildroot.org/project/buildroot/patch/20261020120646.1306735-1-thomas.petazzoni@bootlin.com/
can still be a good small refactoring to merge.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
