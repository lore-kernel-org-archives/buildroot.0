Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99E7BC07CA9
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 21:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43B2060B68;
	Thu, 30 Nov 2023 21:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43B2060B68
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9oT4eAXYPeph; Thu, 30 Nov 2023 21:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86EB46FA34;
	Thu, 30 Nov 2023 21:16:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 86EB46FA34
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E9D01BF2F0
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 27E648458D
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:16:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27E648458D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzOeCcHlfG2m for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 21:16:38 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8972A8458C
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 21:16:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8972A8458C
Received: by mail.gandi.net (Postfix) with ESMTPSA id 474161C0002;
 Thu, 30 Nov 2023 21:16:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8oOf-003Jz8-1J;
 Thu, 30 Nov 2023 22:16:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231129220843.1712894-1-fontaine.fabrice@gmail.com>
Date: Thu, 30 Nov 2023 22:16:32 +0100
In-Reply-To: <20231129220843.1712894-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 29 Nov 2023 23:08:43 +0100")
Message-ID: <87cyvr7xhr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openfpgaloader: bump to version
 0.11.0
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
Cc: Jean Burgat <jeanburgat33@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > This bump will fix the following build failure thanks to
 > https://github.com/trabucayre/openFPGALoader/commit/933ed793e85dea7e16ddd6540791097fd3a299f5:

Hmm, but that commit is about adding support for libgpiod v2.x, and we
use v1.6.x?

Probably it is only the missing #include <cstdint> that fixes it. I gave
it a try here, but there were unfortunately a number of other files also
missing it so ended up applying it after all.

Committed, thanks.

Interesting enough I cannot reproduce the build issue with 2023.08.x, so
presumably it is related to the libgpiod 1.6.4 bump.


 > In file included from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/jtag.hpp:13,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/device.hpp:13,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.hpp:11,
 >                  from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.cpp:6:
 > /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:49:9: error: 'uint8_t' does not name a type
 >    49 |         uint8_t tms_pin; /*! TMS pin value */
 >       |         ^~~~~~~
 > /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:12:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
 >    11 | #include "cable.hpp"
 >   +++ |+#include <cstdint>
 >    12 |

 > https://github.com/trabucayre/openFPGALoader/releases/tag/v0.11.0

 > Fixes:
 >  - http://autobuild.buildroot.org/results/ee89dcc7430079195e2e9ff300e1320de848d3e3

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  package/openfpgaloader/openfpgaloader.hash | 2 +-
 >  package/openfpgaloader/openfpgaloader.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
 > index a8b537782c..6fa81a98a2 100644
 > --- a/package/openfpgaloader/openfpgaloader.hash
 > +++ b/package/openfpgaloader/openfpgaloader.hash
 > @@ -1,3 +1,3 @@
 >  # Locally computed
 > -sha256  966b4629df86b1d520ddd8a4e0a3fc00060b26b5ab4e172b596bd9d4659a196e  openfpgaloader-0.10.0.tar.gz
 > +sha256  a463690358d2510919472c2f460039a304d016a08a45970821e667eea1c48cc8  openfpgaloader-0.11.0.tar.gz
 >  sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
 > diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
 > index 6d7fbd9850..0fd172b532 100644
 > --- a/package/openfpgaloader/openfpgaloader.mk
 > +++ b/package/openfpgaloader/openfpgaloader.mk
 > @@ -4,7 +4,7 @@
 >  #
 >  ################################################################################
 
 > -OPENFPGALOADER_VERSION = 0.10.0
 > +OPENFPGALOADER_VERSION = 0.11.0
 >  OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 >  OPENFPGALOADER_LICENSE = Apache-2.0
 >  OPENFPGALOADER_LICENSE_FILES = LICENSE
 > -- 

 > 2.42.0

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
