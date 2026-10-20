Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA520606A31D
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=IylYnQ7b
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B452180DF0;
	Tue, 20 Oct 2026 21:19:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JNIhEHo-T4L4; Tue, 20 Oct 2026 21:19:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3E75280DF4
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531167;
	b=M5UZitUHBmVW2qHICkHgt0rnvNbD12MV0IzO4fMUJ0plcPvVmhlWIo3xeoblSK6ogMux
	 acuott+RQ5vZ/hOOC6uU6EuBdj/Kiwq56LnUNbTY60PdoWpnwm58Cmepl4n/CYO7EnA7/
	 mtic7Td7WduPVJ2GiMpEbsAkBWP3KB31ciDEIcvtA+BzJjuU/6ok/9QPcD/DhIyickit9
	 ANEgNiCzidFLUJMyvwWbqi9RfRHWNPiS9tCoQjAaZK855xxQis22REaLpyUvM/qLJyROW
	 oPtU96L5CzUhInOOSmkJCJC4hflWPoVykt8tPyIOp7nUGBMjjQdObTLh/WdndtJjHGg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=R+ok8htgSTv6cjMUNxeyZWkBjnxhijtEqsphsNEnd+w=;
	b=f5ouxabAcR5SMOrWlOSTs1Jr7A6rpEkCTvqUYAn3rAzLf/ay1L2nQQWWkHZKLBG1e1ck
	 0doaq0DVoYXM6dBJsLYa0SHK8k/oTlNPSOmebTS52JneXE6p/NskL41B8Boabshu2LVWC
	 mQ5TNNVNsscLYUQ5YZ6oBGxcRDh45TXHz7ifcYaH2j0lm0lH9hFMxR3SzHCpW4+8et+5C
	 4x2BHMtZEljoxWGdoAOX7G8o6hN1DBU5FPV5OoFJF70UbBxvZ7gw48jEWsyN4ANprttu3
	 8JjE0gjwUfSyhyZRXIPWP73xWcvDSvUXu2nvGYr/0OIpeBy/nHNqXuifPbMMqGLUGhA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531167;
	bh=R+ok8htgSTv6cjMUNxeyZWkBjnxhijtEqsphsNEnd+w=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IylYnQ7bXxV9TdIPu8wTqr7wVHZMWOPV56u5LiYdS9FBMX7imwBhbI7eZOyFOTNgX
	 99AmJgrfftgrMfxU5axZWPNNFop/NQnaU9cBlNiMxd1nqXCx76aHQV7z/6PnuwBq7X
	 gkxYA5fOXyl6Pn5RjzMwpvYk5TBCwImRNdgL2VRotEscQirnVnIeXyGEbssAvrtIGN
	 1Sjck/AB/u6L7XhxsFjhv7MvEsRsdbO9IyHyAlYhERr35UAV5O0M4/t8nUGTfWuEby
	 v3gKgCvv4TJXsF80KQeDUxamC9nY2+XjpPvJQ3/YmXkq6SQ2roxSHOlRL4t1pvdlmN
	 YKB1JHXxdGDJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E75280DF4;
	Tue, 20 Oct 2026 21:19:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D2F603A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B8C0D4073C
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:19:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5hHzXRwL_HBq for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:19:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 107A5407BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531164;
 b=Yc7TzDopRC/B4hFHQS0PqB0Ve5JMg8jzfPeNgT0BChvQrQ6xJp3rDAD7LpQOVyO+SXu8
 deoXnq3Zrfvqf26yfGK37p7KbFL20XW2oZ3eob2HxfOVdY0AEELxNlttmYBNMoveIo+YL
 /ZmiJ8FHY4yzaR3uSF9Vza1q7yoToQCkPza4jUU0HPjI7dYLDnPIB8PLTqE5xrU/JkjQE
 EuFNOWRzDTqovYvpYU7BPqFL85lR+fibv3u/PwBdUVvPMmLcO61trGzl0tILFPmFc686e
 RJ5kL4NNGcNeph56w69e7LNcrbNWiMNdF6VNRp2499olpKi+K9qaU66ANfs2mveTM5w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531164;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=dlD9GJg7qI+0J7scgB4uqu3MNRG9O49DvOA1bITgE/Q=;
 b=fWA2eriwEdaTIqvba700ZETtMinFhgDPK2rx5jAMA5S9Kceiz4KAX8Gg7E6EwPdG/KQ+
 3E9ME46e5Y9JHfZSOGS6ME+lkF5yoMcoIYxna8+KaV0fK9oWXmfBlcffVgIg4IhhaoMG8
 LFv96T3D60EJlwRI3oai1YOc1YLae2Ib7mC/kGCFMf9kHsbNrJXmwPXZ1LC9oZvVUpJPk
 34s+NhDF/FPdjbUtNojXeWkCenx0JiQWxX0bvxDLVUuEG27MoWgaaV4z7GvCrOj8VPvVA
 kH/q2lDwPOH+/YHcTv/AXjGriORY8lfRCQxlvLStY0GkybK/zCuFiZQoQSTt1eSRXXg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=WcnSq0op; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 107A5407BC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:19:21 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id BB4214E41290;
 Tue, 20 Oct 2026 21:19:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7982360393;
 Tue, 20 Oct 2026 21:19:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BF19B10328D20; 
 Tue, 20 Oct 2026 23:19:12 +0200 (CEST)
Date: Tue, 20 Oct 2026 23:19:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
Message-ID: <atfahdwTiFb2QEI-@windsurf>
References: <20261002192648.3757582-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261002192648.3757582-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 1/3] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
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
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 02, 2026 at 01:26:46PM -0600, James Hilliard wrote:
> This change sets the default GOPROXY value to match Go's built-in
> default of "https://proxy.golang.org,direct" which provides several
> benefits:
> 
> - Avoid package breakages due to missing module sources
> - Better alignment with upstream Go toolchain defaults
> - Faster downloads via the proxy compared to direct Git clones
> - Maintains reproducible builds through Go's module checksum validation
> 
> The default value from the toolchain can be read with "go env GOPROXY"
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Thanks, series applied. To be honest, I hesitated a bit on PATCH 2/3
because I'm not quite sure to understand under which (realistic)
circumstances one would want to tweak BR2_GOPROXY. But fair enough,
since both Christian and you agreed on that, I took the patch. It
would have been nice to have some explanation of the "why" in the
commit message: as it is the commit message only explains the "how"
which is already clear by looking at the code.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
