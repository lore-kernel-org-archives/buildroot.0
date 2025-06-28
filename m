Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116ECC7EE39
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 21:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C284360720;
	Sat, 28 Jun 2025 21:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lv1v3F8x1uGn; Sat, 28 Jun 2025 21:08:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C66A66079F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C66A66079F;
	Sat, 28 Jun 2025 21:08:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C29AF7
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9BDA414BC
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lqVy4kA1sOjK for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 21:08:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2839540B6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2839540B6D
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2839540B6D
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 21:08:21 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 721797620; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 28 Jun 2025 21:08:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uVcmY-003wq3-32;
 Sat, 28 Jun 2025 23:08:18 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Julien Olivain via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Giulio Benetti
 <giulio.benetti@benettiengineering.com>,  Romain Naour
 <romain.naour@gmail.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250628161620.1866792-1-ju.o@free.fr>
Date: Sat, 28 Jun 2025 23:08:18 +0200
In-Reply-To: <20250628161620.1866792-1-ju.o@free.fr> (Julien Olivain via
 buildroot's message of "Sat, 28 Jun 2025 18:16:20 +0200")
Message-ID: <877c0v1sn1.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=epNNFnYBq5eNqf4WkplgAbPdSg+R7NjI3DVWCSfr+n0dwqz8r26E69Ki3OIkimsJTCTGQNWt4G85ZhJj77fxTMm8F/PAS7IrGjgayIwKHKbgeynwnaHXYOGeg5JkAXcqxCQjubkY8ZQizHvov1ObV92aDGtmdLlKPL8ltsnQTkUqNNlzN+Omx0WNWtFX+LbJuT85WuaSnbFfnQLJ54a38v7e0cRDNn9f64tS7Wf9NU+AJQii71BECa3BxL1xJS2PUoJ7dpUdeS8GSw02o7q+u3MeuJHxfv61816TVc3tUjJbb2TDeIIGx+zes56okG/50yhHuYaqruYmc+kqf69mrA==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=IffH4HjEG3zYM7JY1nieny38etRD7aJnBha1h/GDvFg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=epNNFnYB
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc/Config.in.host: hide gcc
 version for unsupported CPUs
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Julien" == Julien Olivain via buildroot <buildroot@buildroot.org> writes:

 > When a new gcc version is introduced, for example gcc 15 in
 > commit [1], it should have also added a "depends on
 > !BR2_ARCH_NEEDS_GCC_AT_LEAST_15" to the previous gcc version.

 > This logic is described for external toolchains in commit [2],
 > for example. The internal Buildroot toolchains should have the
 > same logic. This logic existed for previous gcc version. See for
 > example the removal of gcc 12 in commit [3].

 > There is ususally no problem, because all the three latest active gcc
 > versions supports all CPUs present in Buildroot.

 > However, the commit [4] recently added the support for the Arm
 > Cortex-A720 CPU, which needs at least gcc 14. Since there is no
 > logic preventing the selection of the gcc version, it is possible
 > to select an unsupported gcc version (i.e. gcc 13).

 > In such a case, the host-gcc-initial package configuration fails
 > with output:

 >     Unknown cpu used in --with-cpu=cortex-a720

 > This commit fixes the issue by adding those missing dependencies.

 > Fixes:
 > https://autobuild.buildroot.org/results/918b90aee0b65f01efc241622015cb847b4e23a8/

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/75891397abe60dbe3d82a1ec39654ff81d1b1406
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/f577d8218f3f18016aa084255e337a7f589eeed1
 > [3] https://gitlab.com/buildroot.org/buildroot/-/commit/58cf7c51da3ae4804332f68ee934e153d695d047#66f7e875db173e5538d3511c8297acc1ba30da33_27_25
 > [4] https://gitlab.com/buildroot.org/buildroot/-/commit/de374e06d856dd5079fc792c883b06563af950b0

 > Cc: Romain Naour <romain.naour@gmail.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Signed-off-by: Julien Olivain <ju.o@free.fr>
 > ---
 > When authoring this patch, I was wondering if when adding a new
 > gcc version X, we should also introduce the Kconfig symbol
 > BR2_ARCH_NEEDS_GCC_AT_LEAST_(X+1) to make sure all the gcc versions
 > have their dependencies. What do you think?

Yes, that makes sense!

> ---
 >  package/gcc/Config.in.host | 2 ++
 >  1 file changed, 2 insertions(+)

 > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
 > index 5e4da0aa85..8640280fdf 100644
 > --- a/package/gcc/Config.in.host
 > +++ b/package/gcc/Config.in.host
 > @@ -24,6 +24,7 @@ config BR2_GCC_VERSION_POWERPC_SPE
 
 >  config BR2_GCC_VERSION_13_X
 >  	bool "gcc 13.x"
 > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 >  	# powerpc spe support has been deprecated since gcc 8.x.
 >  	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 >  	depends on !BR2_POWERPC_CPU_HAS_SPE
 > @@ -31,6 +32,7 @@ config BR2_GCC_VERSION_13_X
 
 >  config BR2_GCC_VERSION_14_X
 >  	bool "gcc 14.x"
 > +	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 >  	# powerpc spe support has been deprecated since gcc 8.x.
 >  	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
 >  	depends on !BR2_POWERPC_CPU_HAS_SPE
 > -- 

 > 2.50.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot@buildroot.org
 > https://lists.buildroot.org/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
