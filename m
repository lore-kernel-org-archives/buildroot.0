Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4FADEB64D9
	for <buildroot@archiver.kernel.org>; Wed, 14 Jun 2023 14:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 746E261369;
	Wed, 14 Jun 2023 14:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 746E261369
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ut2bAYZa5Rr0; Wed, 14 Jun 2023 14:54:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8025361340;
	Wed, 14 Jun 2023 14:54:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8025361340
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 58F171BF2B7
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 405C9813C9
 for <buildroot@lists.busybox.net>; Wed, 14 Jun 2023 14:53:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 405C9813C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MfN67xrkcSRb for <buildroot@lists.busybox.net>;
 Wed, 14 Jun 2023 14:53:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24820813BE
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24820813BE
 for <buildroot@buildroot.org>; Wed, 14 Jun 2023 14:53:52 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0637820014;
 Wed, 14 Jun 2023 14:53:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1q9Rsc-008AP1-97; Wed, 14 Jun 2023 16:53:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour <romain.naour@gmail.com>
References: <20230605095607.332091-1-romain.naour@gmail.com>
 <87cz2849z0.fsf@48ers.dk>
Date: Wed, 14 Jun 2023 16:53:50 +0200
In-Reply-To: <87cz2849z0.fsf@48ers.dk> (Peter Korsgaard's message of "Tue, 06
 Jun 2023 22:22:27 +0200")
Message-ID: <87r0qem6wx.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] support/dependencies: introduce
 BR2_HOST_CMAKE_AT_LEAST
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
Cc: Julien Olivain <ju.o@free.fr>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
 >> Some packages (e.g. libjxl) requires a quite recent cmake version,
 >> that is not yet available in most distributions, especially those
 >> LTS versions.

 >> Currently, when we bump the minum cmake version we require, it gets
 >> bumped for all packages, regardless of their own minimum required
 >> version, which means that a given configuration will trigger the
 >> build of our host-cmake even if the packages that require it are not
 >> enabled and those that are would be content with the system-provided
 >> cmake.

 >> Since host-cmake can take quite some time to build, this can get a
 >> bit annoying to pay the price of a host-cmake build that would
 >> otherwise not be needed.

 >> Some packages even use an alternative build system when available
 >> since they requires a more recent version of cmake than the our
 >> minum cmake version
 >> (wpewebkit use Ninja: 78d499409f71d8a22b0632c8ebc06f67ee6ae6dd).

 >> We introduce config options that packages can select to indicate
 >> what minimal cmake version they require, and use that version as the
 >> required minimal version required by the current configuration [0].

 >> We would like to ensure that the currently selected minimum cmake
 >> version is indeed lower (or equal) to the cmake version we package,
 >> but that is not possible: dependencies.mk is parsed before we parse
 >> packages, so we do not yet know the cmake version we have, and we
 >> can't invert the parsing order as we need to know the requires
 >> dependencies before we parse packages (so that we can build their
 >> dependency rules in Makefile). So we can only add comments in both
 >> places, that refer to the other location.

 >> [0] note that this is yet not optimal, as in such a case, host-cmake
 >> would be in the dependency chain of all cmake-based packages, even
 >> for those packages that do not require it. The optimum would be for
 >> each package to gain such a dependency on an as-needed basis, but
 >> this is by far more complex to achieve, and would only speed up
 >> cases where a single package is built from scratch (e.g. with:
 >> make clean; make foo), which is not worth optimising (yet?)

 >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
 >> Cc: Julien Olivain <ju.o@free.fr>
 >> Cc: Arnout Vandecappelle <arnout@mind.be>
 >> Cc: Peter Korsgaard <peter@korsgaard.com>
 >> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 >> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> ---
 >> v2: Use the commit log suggested by Yann
 >> http://lists.busybox.net/pipermail/buildroot/2023-June/668312.html

 > Committed, thanks.

Committed to 2023.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
