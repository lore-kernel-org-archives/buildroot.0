Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DC28C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 06:39:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 382BD42AC4;
	Sat, 28 May 2022 06:39:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WDdk-DJyDVTN; Sat, 28 May 2022 06:39:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F039442ABE;
	Sat, 28 May 2022 06:39:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 857C41BF5DC
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70A6384CA4
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 06:39:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QPWau7b5hd9H for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 06:38:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 683C084CA2
 for <buildroot@buildroot.org>; Sat, 28 May 2022 06:38:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 78616100006;
 Sat, 28 May 2022 06:38:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuq6C-002rir-L1; Sat, 28 May 2022 08:38:56 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220426212026.712081-1-fontaine.fabrice@gmail.com>
Date: Sat, 28 May 2022 08:38:56 +0200
In-Reply-To: <20220426212026.712081-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 26 Apr 2022 23:20:26 +0200")
Message-ID: <874k1agnzz.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptodev-linux: needs
 CONFIG_CRYPTO_USER_API_AEAD
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > CONFIG_CRYPTO_USER_API_AEAD is needed to fix the following build
 > failure:

 > ERROR: modpost: "crypto_alloc_skcipher"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "scatterwalk_map_and_copy"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_ahash_final"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_aead_encrypt"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_aead_setkey"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_skcipher_decrypt"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_destroy_tfm"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_skcipher_setkey"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_aead_decrypt"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!
 > ERROR: modpost: "crypto_aead_setauthsize"
 > [/home/autobuild/autobuild/instance-2/output-1/build/cryptodev-linux-1.12/./cryptodev.ko]
 > undefined!

 > Fixes:
 >  - http://autobuild.buildroot.org/results/a06708369c233f6e60a1a3ffd7a77a4edd932c9a

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
