Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D852606A321
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lYOGzMBD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1588860635;
	Sun, 25 Oct 2026 20:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZLpZU4dble_e; Sun, 25 Oct 2026 20:54:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F51760619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961681;
	b=F8pDIZ9b42FNqiQGQh4oiLVVUDkWQQc483ndq2h272IiQep4YPcwZjfIYeCRkwQpCCVe
	 5aMVd3iAPimWQ5mbNbBKkTPXlt5lz72VQqaQND4WYWUJ89ub6MhMeCYdrkIfv4n9gEQ9Y
	 sWFxPvrngTCsui3D5UNU04tMXRwrB68PeUeo4R3Mg8OvLkG6Kpsg0tZHObfu5+QB+HVIU
	 uqdl4NvaV6IcH1Hl+FuyuyViQffqToZ0KDQstocYEIjL2vQPPuSerOhYrmIJp43nhIuCB
	 dLcPiLHGeWJ/kFGwweK2oa5tmk3K9NjQzTTvIL5tti93rkQUdHY6M9xQ6YwcXuKAhVg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961681;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5xA+M+UvmNg6MaNC/URmqQHLk7pHeTCH7GStc+dANpI=;
	b=dsg686ef/kjKQ0yMQ25Y795TrZizU7MJ06O6G6+GIGYLNRV7xu0kJAaniS8MDAbQTJnC
	 4eYhTHYsmU+ctIY95QnFkLYgMqvQZ8c5KqE2lBhrjtdHysEUDBztUR7AI+HtoeKXoGLnH
	 I9Ncuco2ENIH5BjmaNZviscgXbgfbQPWi2Mq0cgcvaglSfnigiA9yaULP98cZRf9pCCot
	 LikYux2pLdRAof/h84RhwV9mepzsGdIZzFAEejZw/3bLAkR6CKf7hawCA0VD8XzWj/uvH
	 lhVfmZ7nDzoY1U9ji+thhzxaGXHV8DB216LY35EcnJpTEJdNOT5DJOYkrjuHMyOyjcA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961681;
	bh=5xA+M+UvmNg6MaNC/URmqQHLk7pHeTCH7GStc+dANpI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lYOGzMBDbJ/BJsGoKJfidVnoqAWhN05y9l9dONH7x1ozmJZqmJEsg64a3nvxavWFu
	 nd/OXT+y6y9C1zP+L4dmFNhpVNyi4XKnhVPqH4BVsRcaULQx0O/Cq/yeL3RAPKfede
	 07z3cKSGaHr9G+EWyz7apsPaYHrRLPLf9Biu4Q1GatPPweePRiRYUjcbP98mbUHHz/
	 wERsImv+kaKkFizpmo2Ksc8yGV5yo9K3Qv3coZS2MuAf0lh0kie1o3RAqW5NC8iTZq
	 8CudSfShmHLTrbrKfozv2baVpAYcHs1dqIBi9V1A3D3dJtR/VpmGs3skFc4H7WEPIN
	 8jVqR7NjbShEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F51760619;
	Sun, 25 Oct 2026 20:54:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6817380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AC88D80C9A
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E-P1KbHGpsom for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:54:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 680E380C95
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961678;
 b=QzxVidrrVyc7bmBepty/wiNjInBaLGWusCglO3ioyEb0TcyOSGepx9MpKUJhIyIjf7zu
 Itl4KCiVJGsBqNjgSAzj6yqpOaLBmTfMyNQQ0+PtmynzamGRJ33GK9kbGzRw1OiDiCBEd
 ZbWaqO4C+5kascQaccaDH5QPISPlw8CDUtwoXGFlXWoAncChgLFg9L/S9fI1j/YlMxFLJ
 TfUF7+FFAx7ie1+oS5o2aeIPsDUfGNtTwrEHEPMLChvN+e6BeRb0E/hJydCWukAIxFryq
 vXqMAav7ytzozjy9HX+Dp4M0K5anHLDgozYgoC3A64FerNnujG+dFbFOIFCXT8Lclkw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961678;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=IwC7UvCzqom9Y0/bumnjcJ1w7HilyaHaHFHTT9H0n1M=;
 b=ZTu2N3cDGe2GRE9ij2aktdMUlnB9uPNrFkIjyjyQHYY+rZbuC4H9Fx+v/kqQXb3Kknxe
 Drz18c+OsFCEIfqQJWS6UgM7EaKgutiA7LhIQVcQEQz2B5QKjqqmZUrNPSM7c1fguPsIr
 RFz5GLtlxPJ80YkD93JqjIM4kGLt8n9lAlbO8Jwh5lXuoqVy/9JL4W7G7rkrhlsAVVrdR
 gWKtUoK8qRlukTQlvqyrhtOBhbxUKqNiqgNTxBtiKn7sZgSh3TQ7gUVE0FBAe97iAylDo
 zIxdbJE3LeGm5JSNbf4w1XRhGU+CYDJbvYnkT4ugs0G5++eb5kbvgdMk7aI572PSBwA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=zXOMEscH; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 680E380C95
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:37 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 005CE4E41308
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:54:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id C27B160740;
 Sun, 25 Oct 2026 20:54:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id D0D1B10328E76; Sun, 25 Oct 2026 21:54:34 +0100 (CET)
Date: Sun, 25 Oct 2026 21:54:33 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org, "Wojciech M . Zabolotny" <wzab01@gmail.com>
Message-ID: <at5sfsDK6z8l5vD2@windsurf>
References: <20261023110216.1414214-1-yegorslists@googlemail.com>
 <20261023225751.2614512-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261023225751.2614512-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v2 1/2] package/avrdude: fix readline
 dependency
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

On Sat, Oct 24, 2026 at 12:57:50AM +0200, Yegor Yefremov wrote:
> avrdude automatically detects and links against readline when it finds
> libreadline in the sysroot (find_library(HAVE_LIBREADLINE ...) in
> CMakeLists.txt; AC_CHECK_LIB([readline], [readline]) with the former
> autotools build system), and there is no option to disable it.
> 
> Buildroot never declared this dependency, so the result depended on
> whether readline happened to be built before avrdude. Even worse, some
> external toolchains (e.g. the Bootlin ones) ship libreadline in their
> sysroot. In that case avrdude ends up linked against it without
> BR2_PACKAGE_READLINE being enabled:
> 
>   $ readelf -d target/usr/bin/avrdude | grep readline
>    0x0000000000000001 (NEEDED)    Shared library: [libreadline.so.8]
> 
> but libreadline is not installed to the target, so avrdude fails to
> run.
> 
> Add readline to the dependencies when it is enabled, and otherwise
> pass -DHAVE_LIBREADLINE=OFF, so that find_library() skips the search
> and readline support is disabled.
> 
> This issue has been present since commit dc776f0d0546 ("avrdude: new
> package"), as avrdude has always detected readline automatically. It
> therefore affects 2014.02 and later, including all maintained
> branches.
> 
> Fixes: dc776f0d0546900b22d1552f3e522be2080016c6 ("avrdude: new package")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Series applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
