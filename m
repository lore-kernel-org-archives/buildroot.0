Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2EE4C3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 14:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304BD41574;
	Wed, 10 Jul 2024 14:39:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f0Dc8upCEBD2; Wed, 10 Jul 2024 14:39:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E511A41591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E511A41591;
	Wed, 10 Jul 2024 14:39:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B1E91BF232
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:39:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46A588101F
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 14:39:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZNULMgvVnVVV for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 14:39:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ABBA980F3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABBA980F3A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABBA980F3A
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 14:39:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8EFA1C0003;
 Wed, 10 Jul 2024 14:39:30 +0000 (UTC)
Date: Wed, 10 Jul 2024 16:39:28 +0200
To: "Michael Nosthoff" <buildroot@heine.tech>
Message-ID: <20240710163928.4fd390b1@windsurf>
In-Reply-To: <25518-668e5180-5-147108a0@236288521>
References: <20240710081348.60978-1-buildroot@heine.tech>
 <20240710104842.16dbf85c@windsurf>
 <25518-668e5180-5-147108a0@236288521>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720622371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3OUgcYcVl7XYRnZJNASCtYBUC6LGw0Ti05U46l9znT0=;
 b=c+UviRUDaiBWOZekY/aWiKWa1WwGi3Q0lnR9i+vMMSSN6J8ufvwVnGXnDowbCaHaP3YaCf
 Aw1SmwxpJuZwrb6PCd5XyjTvQXYHETkbdMoWc9rTeNeWQ0ZSz9y8lbduz9zlUHQT2sXh2M
 ieR2ATEZhuBANMN3tDRHQOoRVW1wDXHUAxBxITyN1aCYnWWMMJ0RxAe4zBdOkPCuZTFODD
 hpcXvxWnWq1rNgJCddPZEay3WVF5SUiWJ7ATaYsCvsyFSm3ZdR0gO9Hdc665cyLqD0/XXT
 S3fqwD2usg2VxoNgSzH+g+Gv3jLalit5sFefD9596BDpa4lwMXo9Bt0Lo2v4lw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=c+UviRUD
Subject: Re: [Buildroot] [PATCH] package/sqlitecpp: new  package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Samuel Martin <s.martin49@gmail.com>,
 Michael Nosthoff via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Michael,

On Wed, 10 Jul 2024 11:16:24 +0200
"Michael Nosthoff" <buildroot@heine.tech> wrote:

> One additional thing: This library requires C++11, I think all compilers we have currently in buildroot should
> be recent enough to support it. Or do we need a gcc version check here as well?

We need a gcc version check. Which version depends on which C++11
features are used. Some packages need gcc 4.7, some gcc 4.8, some gcc
4.9:

package/cli11/Config.in:        depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
package/clpeak/Config.in:       depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
package/cutelyst/Config.in:     depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
package/docopt-cpp/Config.in:   depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
package/edid-decode/Config.in:  depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
package/efl/Config.in:  depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
etc.

some even need gcc 5.x:

package/qt5/Config.in:  depends on BR2_HOST_GCC_AT_LEAST_5 # Full C++11

> Related: I'm currently looking at bumping boost. And in the last versions many libs dropped their support for C++98.
> So if we could just rely on the availability of C++11 this would make this much easier.

If that also requires a gcc version dependency, then we would have to
add it to Boost, and then to all its reverse dependencies:

package/azmq/Config.in: select BR2_PACKAGE_BOOST
package/bitcoin/Config.in:      select BR2_PACKAGE_BOOST
package/cc-tool/Config.in:      select BR2_PACKAGE_BOOST
package/domoticz/Config.in:     select BR2_PACKAGE_BOOST
package/gnuradio/Config.in:     select BR2_PACKAGE_BOOST
package/gqrx/Config.in: select BR2_PACKAGE_BOOST
package/i2pd/Config.in: select BR2_PACKAGE_BOOST
package/libcamera-apps/Config.in:       select BR2_PACKAGE_BOOST
package/libcamera/Config.in:    select BR2_PACKAGE_BOOST
package/libcpprestsdk/Config.in:        select BR2_PACKAGE_BOOST
package/libftdi/Config.in:      select BR2_PACKAGE_BOOST
package/libftdi1/Config.in:     select BR2_PACKAGE_BOOST
package/libosmium/Config.in:    select BR2_PACKAGE_BOOST
package/libserial/Config.in:    select BR2_PACKAGE_BOOST
package/libtorrent-rasterbar/Config.in: select BR2_PACKAGE_BOOST
package/mongodb/Config.in:      select BR2_PACKAGE_BOOST
package/mpd/Config.in:  select BR2_PACKAGE_BOOST
package/osm2pgsql/Config.in:    select BR2_PACKAGE_BOOST
package/pulseview/Config.in:    select BR2_PACKAGE_BOOST
package/python-libconfig/Config.in:     select BR2_PACKAGE_BOOST
package/resiprocate/Config.in:  select BR2_PACKAGE_BOOST
package/supertux/Config.in:     select BR2_PACKAGE_BOOST
package/thrift/Config.in:       select BR2_PACKAGE_BOOST
package/uhd/Config.in:  select BR2_PACKAGE_BOOST
package/zmqpp/Config.in:        select BR2_PACKAGE_BOOST

and then recursively to their reverse dependencies. It's a bit of work,
but I believe it's inevitable that at some point Boost, being a complex
C++ library, will require a certain version of gcc.

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
