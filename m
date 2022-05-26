Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B2E9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 26 May 2022 08:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52011845D3;
	Thu, 26 May 2022 08:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yta2JnR8Jd94; Thu, 26 May 2022 08:20:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 366F1845CF;
	Thu, 26 May 2022 08:20:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 900871BF3D9
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B5B42560
 for <buildroot@lists.busybox.net>; Thu, 26 May 2022 08:20:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pRGMhfs96BBm for <buildroot@lists.busybox.net>;
 Thu, 26 May 2022 08:20:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E70B42551
 for <buildroot@buildroot.org>; Thu, 26 May 2022 08:20:05 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 733741BF206;
 Thu, 26 May 2022 08:20:03 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nu8iw-00HIVo-F2; Thu, 26 May 2022 10:20:02 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220420081939.295448-1-fontaine.fabrice@gmail.com>
Date: Thu, 26 May 2022 10:20:02 +0200
In-Reply-To: <20220420081939.295448-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 20 Apr 2022 10:19:39 +0200")
Message-ID: <875ylsso25.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: all features needs
 dynamic library
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Jianhui Zhao <zhaojh329@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Add dynamic library dependency to BR2_PACKAGE_WOLFSSL_ALL to fix the
 > following static build failure with ibrdtnd, a "wolfssl all"-enabled
 > libcurl and openssl:

 > /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/opt/ext-toolchain/bin/../lib/gcc/sh4aeb-buildroot-linux-musl/11.2.0/../../../../sh4aeb-buildroot-linux-musl/bin/ld:
 > /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/bin/../sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libssl.a(ssl_ciph.o):
 > in function `SSL_COMP_get_compression_methods':
 > ssl_ciph.c:(.text+0x25ac): multiple definition of
 > `SSL_COMP_get_compression_methods';
 > /nvmedata/autobuild/instance-5/output-1/per-package/ibrdtnd/host/sh4aeb-buildroot-linux-musl/sysroot/usr/lib/libwolfssl.a(libwolfssl_la-ssl.o):ssl.c:(.text+0x1ca60):
 > first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/be1d327ed4c91a6280a88906a399dfe146f0b64e

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
