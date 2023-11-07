Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21BEC4167D
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7B15260D4F;
	Tue,  7 Nov 2023 21:49:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B15260D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7qOZRZEFj6CQ; Tue,  7 Nov 2023 21:49:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C29AA60C0F;
	Tue,  7 Nov 2023 21:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C29AA60C0F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F65B1BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66ACE403E7
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:48:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 66ACE403E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SAQs1hRMhjxT for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:48:40 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB0A740182
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:48:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB0A740182
Received: by mail.gandi.net (Postfix) with ESMTPSA id 662F740003;
 Tue,  7 Nov 2023 21:48:35 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0Tw3-00HWPZ-1R;
 Tue, 07 Nov 2023 22:48:35 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20231101113444.E6EA286323@busybox.osuosl.org>
Date: Tue, 07 Nov 2023 22:48:35 +0100
In-Reply-To: <20231101113444.E6EA286323@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Wed, 1 Nov 2023 12:34:29 +0100")
Message-ID: <87pm0lute4.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/nettle: add missing host-gmp
 dependency
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=db3a730e8ce42b8f70f469eafe53e9e5981e57b7
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Since the generic package infrastructure removed auto derivation of
 > host dependencies [1] (2016.08), the host dependencies must be
 > explicitly set.

 > While adding the nettle host variant [2] the gmp dependency was not
 > duplicated and host-nettle was built without host-gmp (or built with
 > gmp installed on the build machine).

 > While building host-gnutls required for building mkeficapsule u-boot
 > tool, the configure script check if Libhogweed (nettle's companion
 > library) is build with libgmp support.

 > If internal toolchain is used, luckily host-gmp is built before
 > building host-nettle (and host-gnutls). But when using prebuilt
 > external toolchain, following error shows up :

 > Libhogweed (nettle's companion library) 3.6 was not found. Note that you must compile nettle with gmp support.

 > [1] https://gitlab.com/buildroot.org/buildroot/-/commit/4bdb067e380e72c3a6cb9c6ccf3791a6cf8661e0
 > [2] https://gitlab.com/buildroot.org/buildroot/-/commit/dac6e3011883ce3b35cbf64ec156186153bf0032
 > [3] https://gitlab.com/gnutls/gnutls/-/commit/eb24bfa808ee029e9b3b198d66d29256eea3fd08

 > Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
 > Reviewed-by: Romain Naour <romain.naour@smile.fr>
 > Acked-by: Romain Naour <romain.naour@smile.fr>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
