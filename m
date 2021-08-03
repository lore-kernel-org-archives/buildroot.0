Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40DECC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:57:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B600C60EE8
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 20:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B600C60EE8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79E7E4048C;
	Tue,  3 Aug 2021 20:57:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yu1WuOM62zEi; Tue,  3 Aug 2021 20:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D07F44044B;
	Tue,  3 Aug 2021 20:57:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 789DA1BF83C
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7510683372
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 20:57:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FK_vIKm-jGJm for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 20:57:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4853083267
 for <buildroot@busybox.net>; Tue,  3 Aug 2021 20:57:45 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 5E9C8240002;
 Tue,  3 Aug 2021 20:57:41 +0000 (UTC)
Date: Tue, 3 Aug 2021 22:57:39 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20210803225739.15e612d5@windsurf>
In-Reply-To: <fd67895e-5c9e-62bc-7a4b-dd41bed13c0d@mind.be>
References: <20210725111231.359830-1-arnout@mind.be>
 <20210725111231.359830-3-arnout@mind.be>
 <20210725175709.7338b4a5@x230_1.trabucayre.com>
 <fd67895e-5c9e-62bc-7a4b-dd41bed13c0d@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v5 3/3] package/armadillo: allow to select
 between lapack or openblas
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hello,

On Mon, 26 Jul 2021 08:24:37 +0200
Arnout Vandecappelle <arnout@mind.be> wrote:

> > fortran is only required if lapack has to be used: if lapack is said as optional this is
> > maybe not required ?  
> 
>  Oh, I intended to insert a comment there but apparently forgot: We need either
> openblas (which doesn't require fortran) or lapack (which does require fortran).
> Therefore, on architectures which do support openblas, we should have a comment
> that just says "C++", while on architectures that don't support openblas (but do
> support lapack) we should have a comment that says "C++ and Fortran".

... but this is exactly what your patch does:

comment "armadillo needs a toolchain w/ C++"
        depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
        depends on !BR2_INSTALL_LIBSTDCPP

comment "armadillo needs a toolchain w/ fortran, C++"
        depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
        depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
        depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP

If we're on an arch supported by openblas, "needs a toolchain w/ C++"
is displayed.

If we're on an arch not supported by openblas, but supported by lapack,
"needs a toolchain w/ fortran, C++" is displayed.

So it all looks good to me.


> > It's an open question:
> > until now armadillo was always built with blas and lapack support provided by
> > clapack. To avoid breaking current behaviour (lapack support) why not
> > considering selecting lapack package unconditionaly and let user choise for
> > blas support? I know the main issue is the dependency to fortran...  
> 
>  What you're basically saying is that in the choice between lapack and openblas,
> lapack should be the default, right?
> 
>  Can you maybe explain a bit what your original reason for this patch was?
> Armadillo basically hides the BLAS implementation, so unless it's buggy, you
> shouldn't even notice which implementation is behind. Also, the lapack package
> itself says that you should not use its BLAS implementation but you should use a
> better one instead.

I was also confused by Gwenhael's comment, including with his reply to
your question. So at this point, I've applied your patch as-is, we can
always improve/fix later on if needed.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
