Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8953FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 08:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6594409CF;
	Sat,  4 Dec 2021 08:21:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Rb7F3IBkfE3; Sat,  4 Dec 2021 08:21:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A0D54098F;
	Sat,  4 Dec 2021 08:21:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8F3E91BF5E9
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7F355832D4
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 08:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gbu6WyhiNnNq for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 08:21:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC3C483276
 for <buildroot@uclibc.org>; Sat,  4 Dec 2021 08:21:13 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 0F74F240002;
 Sat,  4 Dec 2021 08:21:09 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mtQI9-00008J-53; Sat, 04 Dec 2021 09:21:09 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
References: <20211013184307.1869426-1-fontaine.fabrice__26650.7906302408$1634150681$gmane$org@gmail.com>
 <pan$cec66$f51dbfab$bb733bd2$2be5b0d8@ID-313208.user.individual.net>
Date: Sat, 04 Dec 2021 09:21:09 +0100
In-Reply-To: <pan$cec66$f51dbfab$bb733bd2$2be5b0d8@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Thu, 02 Dec 2021 07:24:47 +0100")
Message-ID: <87lf10bx1m.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > Am Wed, 13 Oct 2021 20:43:07 +0200 schrieb Fabrice Fontaine:
 >> Touch ar-lib as suggested by upstream in
 >> https://github.com/eclipse/tinydtls/pull/103 and
 >> https://github.com/eclipse/tinydtls/commit/
 > 5c6fd178e83cec7ccc40ac3ab13a15ce611da8a8
 >> to avoid the following build failure since bump of automake to version
 >> 1.16.4 in commit fe90272b5128987ee7492fff950660e05324838d:
 >> 
 >> configure.ac: error: required file 'ar-lib' not found
 >> 
 >> Fixes:
 >> -
 >> http://autobuild.buildroot.org/results/
 > fa23cdf0d454c2ad11af3cdcc2810cd442918667
 >> 
 >> Signed-off-by: Fabrice Fontaine
 >> <fontaine.fabrice@gmail.com>
 >> ---
 >> package/tinydtls/tinydtls.mk | 6 ++++++
 >> 1 file changed, 6 insertions(+)
 >> 
 >> diff --git a/package/tinydtls/tinydtls.mk b/package/tinydtls/tinydtls.mk
 >> index 6d839bc05a..bba9e5f6fa 100644 --- a/package/tinydtls/tinydtls.mk
 >> +++ b/package/tinydtls/tinydtls.mk @@ -16,4 +16,10 @@
 >> TINYDTLS_AUTORECONF = YES
 >> # use inttypes.h data types instead of u_intXX_t for musl compatibility
 >> TINYDTLS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -DSHA2_USE_INTTYPES_H"
 >> 
 >> +# Fix build with automake >= 1.16.4 +define TINYDTLS_TOUCH_AR_LIB +
 >> touch $(@D)/ar-lib +endef +TINYDTLS_PRE_CONFIGURE_HOOKS +=
 >> TINYDTLS_TOUCH_AR_LIB +
 >> $(eval $(autotools-package))

 > Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > [build-tested defconfig 2ec4d2e0fc0a1832774a4f3ce918492427302ba2]

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
