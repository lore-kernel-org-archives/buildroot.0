Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F705C43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 06:04:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA0EA82F4F;
	Tue, 28 Jun 2022 06:04:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA0EA82F4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z9v1xn_7rAN7; Tue, 28 Jun 2022 06:04:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B213882EC7;
	Tue, 28 Jun 2022 06:04:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B213882EC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878A11BF293
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 714E882C5E
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 06:04:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 714E882C5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3w1lhHOe8dMi for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 06:04:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4687E82C04
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4687E82C04
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 06:04:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 04069240007;
 Tue, 28 Jun 2022 06:04:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1o64Kh-00DKB4-T1; Tue, 28 Jun 2022 08:04:19 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220619173206.812991-1-fontaine.fabrice@gmail.com>
Date: Tue, 28 Jun 2022 08:04:19 +0200
In-Reply-To: <20220619173206.812991-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 19 Jun 2022 19:32:06 +0200")
Message-ID: <87o7ydqq70.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/upower: bump to version 0.99.19
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Switch site to get latest release
 > - Switch to meson-package (autotools dropped since version 0.99.14)
 > - libusb is not a dependency since
 >   https://gitlab.freedesktop.org/upower/upower/-/commit/64582256a8c75127c3de23f5542c8467e2e9484a
 > - Update indentation in hash file (two spaces)

 > https://gitlab.freedesktop.org/upower/upower/-/blob/v0.99.19/NEWS

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/upower/Config.in   |  9 +++------
 >  package/upower/upower.hash |  4 ++--
 >  package/upower/upower.mk   | 20 ++++++++++++--------
 >  3 files changed, 17 insertions(+), 16 deletions(-)

 > diff --git a/package/upower/Config.in b/package/upower/Config.in
 > index 612a2b74b9..e2bcdd12c3 100644
 > --- a/package/upower/Config.in
 > +++ b/package/upower/Config.in
 > @@ -1,12 +1,10 @@
 >  config BR2_PACKAGE_UPOWER
 >  	bool "upower"
 >  	depends on BR2_PACKAGE_HAS_UDEV
 > -	depends on BR2_TOOLCHAIN_HAS_THREADS # libgudev, libusb
 > -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb

thermald selects upower, but you forgot to drop the gcc dependency from
thermald.
 
 > -UPOWER_CONF_OPTS = --disable-man-pages --disable-tests
 > +UPOWER_CONF_OPTS = \
 > +	-Dgtk-doc=false \
 > +	-Dman=false \
 > +	-Dsystemdsystemunitdir=/usr/lib/systemd/system \
 > +	-Dudevhwdbdir=/lib/udev/hwdb.d \
 > +	-Dudevrulesdir=/lib/udev/rules.d

No flag to disable tests?

Committed with the dependencies of thermald fixed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
