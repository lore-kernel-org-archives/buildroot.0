Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A73A8C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 16:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4826040FCA;
	Wed,  1 Jun 2022 16:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0UnATu994hI; Wed,  1 Jun 2022 16:13:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6946E40C09;
	Wed,  1 Jun 2022 16:13:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D7BB91BF573
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D583682560
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 16:13:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PE1lmjWbCNDP for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 16:13:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 88E4281425
 for <buildroot@busybox.net>; Wed,  1 Jun 2022 16:13:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FD861BF208;
 Wed,  1 Jun 2022 16:13:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nwQyH-008tWw-NP; Wed, 01 Jun 2022 18:13:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>
References: <bec277739a5ac72c0dc81e9b0566a0c77c90823d.1652850100.git.baruch@tkos.co.il>
 <6a9969d764424f349d12b3f48c18ebcaaa16ecb4.1652850100.git.baruch@tkos.co.il>
Date: Wed, 01 Jun 2022 18:13:21 +0200
In-Reply-To: <6a9969d764424f349d12b3f48c18ebcaaa16ecb4.1652850100.git.baruch@tkos.co.il>
 (Baruch Siach via buildroot's message of "Wed, 18 May 2022 08:01:40
 +0300")
Message-ID: <87k0a02wgu.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] toolchain-external: codescape-img-mips:
 needs shared library support
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach via buildroot <buildroot@buildroot.org> writes:

 > This is a glibc toolchain that does not support static linking.
 > Fixes:
 > http://autobuild.buildroot.net/results/4dcccda4e1600100c942a3f5793bd7a20165fff3/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2022.02.x, thanks.

> ---
 >  .../toolchain-external-codescape-img-mips/Config.in              | 1 +
 >  1 file changed, 1 insertion(+)

 > diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 > index 2341d0883256..8ea9508f9f89 100644
 > --- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 > +++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
 > @@ -4,6 +4,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 >  	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 >  	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 >  	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 > +	depends on !BR2_STATIC_LIBS
 >  	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 >  	select BR2_INSTALL_LIBSTDCPP
 >  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 > -- 

 > 2.35.1

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
