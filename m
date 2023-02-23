Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE435C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 06:49:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D28381F64;
	Thu, 23 Feb 2023 06:49:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D28381F64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmty_kG24g_m; Thu, 23 Feb 2023 06:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA663820A0;
	Thu, 23 Feb 2023 06:49:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA663820A0
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 45E941BF842
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC7A419D9
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 06:49:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC7A419D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O8SzFlI-Gjz6 for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 06:49:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6F20419C3
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6F20419C3
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 06:49:28 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id E6DA7BDE1038;
 Thu, 23 Feb 2023 07:49:25 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 23 Feb 2023 06:49:25 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Alberto.Fahrenkrog@rigtechnologies.com.au
In-Reply-To: <mailman.16587.1677128985.134166.buildroot@buildroot.org>
References: <mailman.16587.1677128985.134166.buildroot@buildroot.org>
Message-ID: <40f9568e5843d49c2afd808bec856bde@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1677134966; bh=NrlYnXhhz+56cMHc0oNaATkqQmjxQLzhbeqefCc0PSw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=pbkAPAspVbD+rCWLj2HFDcmM0E4EV5t8d/t7p4nHSfNaJGJQ3Vl44IY7hPHtbqfOI
 gYRLvTe/ZKlR1YXLZmLFnxGdTYy2WjVqC05AUxmycQMhvgkHVYrxvjRgIqgEgVJPGw
 tLRsRWJJJ55hpzIz7dCM1ma45M0kw+1c1Mk7Envg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=umbiko.net header.i=@umbiko.net
 header.a=rsa-sha256 header.s=mail header.b=pbkAPAsp
Subject: Re: [Buildroot] [Help] Struggling to build external python package
 on out of tree build
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Alberto,

On 2023-02-23 04:47, Alberto Fahrenkrog wrote:
> Update,
> 
> if I change  $(eval $(python-koala)) to $(eval $(python-package)) I 
> still get the same error. I assume that might have been one mistake.
> 
> Cheers,
> 
> Alberto
> 
> Alberto Fahrenkrog Senior Embedded Engineer
> Orica - Perth Technology Centre
> p: +61 (0) 8 6365 4056
> e: Alberto.Fahrenkrog@rigtechnologies.com.au
> ________________________________
> From: buildroot <buildroot-bounces@buildroot.org> on behalf of Alberto 
> Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
> Sent: Thursday, February 23, 2023 12:42 PM
> To: buildroot@buildroot.org <buildroot@buildroot.org>
> Subject: [Buildroot] [Help] Struggling to build external python package 
> on out of tree build
> 
> You don't often get email from 
> alberto.fahrenkrog@rigtechnologies.com.au. Learn why this is 
> important<https://aka.ms/LearnAboutSenderIdentification>
> Hello all,
> 
> I'm trying to build a very simple custom python package following the 
> instructions on the manual, yet I must be doing something very wrong as 
> I get this result:
> 
> $ make python-koala
> make[1]: *** No rule to make target 'python-koala'.  Stop.
> make: *** [Makefile:23: _all] Error 2
> 
> I create my out of tree build with:
> make -C ~/opt/buildroot-2021.02/ BR2_EXTERNAL=~/Projects/br_build 
> O=~/Projects/br_build BR2_DL_DIR=~/Projects/br_build/downloads 
> br_build_defconfig
> 
> On my "br_build" folder I have a Config.in file:
> menu "Python-Libs"
>     source "~/Projects/br_build/package/python-koala/Config.in"
> endmenu

Similar to the include file for configs, you also need an external.mk 
file for the project make files, with this content:

   include $(sort $(wildcard ~/Projects/br_build/package/*/*.mk))

Otherwise your .mk files will not be picked up.

> In "br_build/packages/python-koala/Config.in"

The package directory is usually named 'package', not sure if this is 
relevant (but Config.in /external.mk have to match it).

> config BR2_PACKAGE_PYTHON_KOALA
> ??????bool "python-koala"
>   depends on BR2_PACKAGE_PYTHON3
> ??????help
> ??????  Python implementation of Koala Library
> 
> In "br_build/packages/python-koala/python-koala.mk"
> ################################################################################
> #
> # python-koala
> #
> ################################################################################
> 
> PYTHON_KOALA_VERSION = 1.3.3
> PYTHON_KOALA_SOURCE = $(PYTHON_KOALA_VERSION).tar.gz
> PYTHON_KOALA_SITE = 
> https://mywebsite.com.au/ExternalCode/koala/archive/
> PYTHON_KOALA_SETUP_TYPE = setuptools
> 
> $(eval $(python-koala))
> 
> If I run "make menuconfig" I can select or deselect the package, and 
> it's selected per default on the br_build_defconfig (and in .config):
> BR2_PACKAGE_PYTHON_KOALA=y
> 
> But if I try to run "make python-koala" I get the "no target" error. 
> I'll still have a read and see what I might be doing wrong, but I'm 
> very confused. Any ideas are very welcome.
> 
> Cheers,
> 
> Alberto

<cut>

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
