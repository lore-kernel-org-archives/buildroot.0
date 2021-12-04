Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 000F7C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 851524054D;
	Sat,  4 Dec 2021 21:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KUvCtjCbmFhT; Sat,  4 Dec 2021 21:10:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E993840493;
	Sat,  4 Dec 2021 21:10:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D02251BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAD57401FD
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4qOuTfzEjjs for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:10:00 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 94A4E40156
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:10:00 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id C512760006;
 Sat,  4 Dec 2021 21:09:56 +0000 (UTC)
Date: Sat, 4 Dec 2021 22:09:55 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20211204220955.36d387d2@windsurf>
In-Reply-To: <20211127182306.207728-1-giulio.benetti@benettiengineering.com>
References: <20211127182306.207728-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/harfbuzz: bump to version 3.1.2
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, 27 Nov 2021 19:23:06 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Bump to version 3.1.2 by:
> - requiring BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 instead of _4_8 in this
> package taking care of reverse dependencies, since now harfbuzz requires
> gcc 4.9 to be built successfully.
> - local patch is still necessary since upstream harfbuzz points the problem
> to meson itself.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/cwiid/Config.in                        |  2 +-
>  package/enlightenment/Config.in                |  6 +++---
>  package/gstreamer1/gst1-plugins-bad/Config.in  | 12 ++++++------
>  package/gstreamer1/gst1-plugins-base/Config.in |  6 +++---
>  package/harfbuzz/Config.in                     |  6 +++---
>  package/harfbuzz/harfbuzz.hash                 |  2 +-
>  package/harfbuzz/harfbuzz.mk                   |  2 +-
>  package/libass/Config.in                       |  6 +++---
>  package/libfm/Config.in                        |  6 +++---
>  package/libgtk2/Config.in                      |  6 +++---
>  package/libgtk3/Config.in                      |  6 +++---
>  package/librsvg/Config.in                      |  6 +++---
>  package/mupdf/Config.in                        |  6 +++---
>  package/openbox/Config.in                      |  6 +++---
>  package/pango/Config.in                        |  6 +++---
>  package/pcmanfm/Config.in                      |  6 +++---
>  package/pinentry/Config.in                     |  6 +++---
>  package/python-pymupdf/Config.in               |  6 +++---
>  package/qt5/qt5base/Config.in                  |  2 +-
>  package/rrdtool/Config.in                      |  6 +++---
>  package/supertuxkart/Config.in                 |  2 +-
>  package/xscreensaver/Config.in                 |  6 +++---
>  22 files changed, 59 insertions(+), 59 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
