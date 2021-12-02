Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FED9C433EF
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 06:25:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6DF282C04;
	Thu,  2 Dec 2021 06:25:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LAo4b_ORTHG3; Thu,  2 Dec 2021 06:25:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33DAF81B17;
	Thu,  2 Dec 2021 06:25:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A0461BF340
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 06:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3826D40181
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 06:25:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OpXUt7fC4Xb3 for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 06:25:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6381400DE
 for <buildroot@uclibc.org>; Thu,  2 Dec 2021 06:25:41 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1msfXG-0006Ix-Qh
 for buildroot@uclibc.org; Thu, 02 Dec 2021 07:25:38 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 02 Dec 2021 07:24:47 +0100
Message-ID: <pan$cec66$f51dbfab$bb733bd2$2be5b0d8@ID-313208.user.individual.net>
References: <20211013184307.1869426-1-fontaine.fabrice__26650.7906302408$1634150681$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.148 (Chamechaude; a70bd74)
Subject: Re: [Buildroot] [PATCH 1/1] package/tinydtls: fix build with
 automake >= 1.16.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Wed, 13 Oct 2021 20:43:07 +0200 schrieb Fabrice Fontaine:

> Touch ar-lib as suggested by upstream in
> https://github.com/eclipse/tinydtls/pull/103 and
> https://github.com/eclipse/tinydtls/commit/
5c6fd178e83cec7ccc40ac3ab13a15ce611da8a8
> to avoid the following build failure since bump of automake to version
> 1.16.4 in commit fe90272b5128987ee7492fff950660e05324838d:
> 
> configure.ac: error: required file 'ar-lib' not found
> 
> Fixes:
>  -
>  http://autobuild.buildroot.org/results/
fa23cdf0d454c2ad11af3cdcc2810cd442918667
> 
> Signed-off-by: Fabrice Fontaine
> <fontaine.fabrice@gmail.com>
> ---
>  package/tinydtls/tinydtls.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
> index 6d839bc05a..bba9e5f6fa 100644 --- a/package/tinydtls/tinydtls.mk
> +++ b/package/tinydtls/tinydtls.mk @@ -16,4 +16,10 @@
> TINYDTLS_AUTORECONF = YES
>  # use inttypes.h data types instead of u_intXX_t for musl compatibility
>  TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
>  
> +# Fix build with automake >= 1.16.4 +define TINYDTLS_TOUCH_AR_LIB +
> touch $(@D)/ar-lib +endef +TINYDTLS_PRE_CONFIGURE_HOOKS +=
> TINYDTLS_TOUCH_AR_LIB +
>  $(eval $(autotools-package))

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[build-tested defconfig 2ec4d2e0fc0a1832774a4f3ce918492427302ba2]

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
