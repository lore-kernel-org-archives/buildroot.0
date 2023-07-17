Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FB6EB64DC
	for <buildroot@archiver.kernel.org>; Mon, 17 Jul 2023 11:50:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C23C0405A7;
	Mon, 17 Jul 2023 11:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C23C0405A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y9OjIwdPWY6F; Mon, 17 Jul 2023 11:50:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AE0C400EF;
	Mon, 17 Jul 2023 11:50:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE0C400EF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A11FD1BF352
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B1A760A5F
 for <buildroot@lists.busybox.net>; Mon, 17 Jul 2023 11:50:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B1A760A5F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6S6A_lxtDfO2 for <buildroot@lists.busybox.net>;
 Mon, 17 Jul 2023 11:50:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 268956068B
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 268956068B
 for <buildroot@buildroot.org>; Mon, 17 Jul 2023 11:50:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BCFB460002;
 Mon, 17 Jul 2023 11:50:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qLMkL-00DNJx-0V; Mon, 17 Jul 2023 13:50:33 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20230702144829.3356214-1-bernd@kuhls.net>
 <20230703200327.GJ2510@scaer> <20230703200618.GK2510@scaer>
Date: Mon, 17 Jul 2023 13:50:32 +0200
In-Reply-To: <20230703200618.GK2510@scaer> (Yann E. MORIN's message of "Mon, 3
 Jul 2023 22:06:18 +0200")
Message-ID: <87r0p6ah9z.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] libgcrypt: disable assembly for i386
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Bernd, All,
 > On 2023-07-03 22:03 +0200, Yann E. MORIN spake thusly:
 >> On 2023-07-02 16:48 +0200, Bernd Kuhls spake thusly:
 >> > Fixes:
 >> > http://autobuild.buildroot.net/results/3df/3df96fe36802d8c6ac5487bf3d7d7b6c97591d5e/
 >> > 
 >> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 >> > ---
 >> >  package/libgcrypt/libgcrypt.mk | 4 ++--
 >> >  1 file changed, 2 insertions(+), 2 deletions(-)
 >> > 
 >> > diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
 >> > index 4fffe5360e..bd7b1aa091 100644
 >> > --- a/package/libgcrypt/libgcrypt.mk
 >> > +++ b/package/libgcrypt/libgcrypt.mk
 >> > @@ -21,8 +21,8 @@ LIBGCRYPT_CONF_OPTS = \
 >> >  	$(if $(BR2_OPTIMIZE_0),--disable-ppc-crypto-support,) \
 >> >  	--with-gpg-error-prefix=$(STAGING_DIR)/usr
 >> >  
 >> > -# Libgcrypt doesn't support assembly for coldfire
 >> > -ifeq ($(BR2_m68k_cf),y)
 >> > +# Libgcrypt doesn't support assembly for coldfire & i386
 >> 
 >> This is relatively weird, especially, since they do have upstream commit
 >> that try to make it work on "old CPUs":
 >> 
 >> a5d126c61cc0  configure: fix avx512 check for i386
 >> f01d4b7a601f  mpi/longlong.h: i386: use tzcnt instruction for trailing zeros
 >> 
 >> So maybe this is a bug that should be reported and fixed upstream?

 > Anyway: applied to master, thanks.

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
