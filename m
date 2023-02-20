Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44BB2C05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF7B68226F;
	Mon, 20 Feb 2023 17:22:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF7B68226F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sv-etMicnPjz; Mon, 20 Feb 2023 17:22:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24C4882265;
	Mon, 20 Feb 2023 17:22:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24C4882265
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B2701BF2B9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:22:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21F5040BF1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:22:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 21F5040BF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyg3qIitQSJG for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:22:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E480340BE7
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E480340BE7
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:22:21 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 48F24E000A;
 Mon, 20 Feb 2023 17:22:17 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pU9rk-007VE0-DH; Mon, 20 Feb 2023 18:22:16 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-2-thomas.devoogdt@barco.com>
Date: Mon, 20 Feb 2023 18:22:16 +0100
In-Reply-To: <20230220090923.2155635-2-thomas.devoogdt@barco.com> (Thomas
 Devoogdt's message of "Mon, 20 Feb 2023 10:09:22 +0100")
Message-ID: <87edqkz1yv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 2/3] package/libgtk3: re-enable atk-bridge
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > The reason why it was not used was that at-spi2-core and at-spi2-atk were not available,
 > since then, it is, so drop this patch. This will also avoid warnings in webkitgtk.

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
 > ---
 >  package/libgtk3/0001-disable-atk-bridge.patch | 41 -------------------
 >  package/libgtk3/Config.in                     |  2 +
 >  package/libgtk3/libgtk3.mk                    |  4 +-
 >  3 files changed, 4 insertions(+), 43 deletions(-)
 >  delete mode 100644 package/libgtk3/0001-disable-atk-bridge.patch

 > diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
 > deleted file mode 100644
 > index f3e9bff2ba..0000000000
 > --- a/package/libgtk3/0001-disable-atk-bridge.patch
 > +++ /dev/null
 > @@ -1,41 +0,0 @@
 > -Remove atk-bridge support.
 > -
 > -atk-bridge doesn't seem useful for now in Buildroot and requires to
 > -add two new packages just for it: at-spi2-core and at-spi2-atk.
 > -
 > -Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
 > -
 > ---- a/gtk/a11y/gtkaccessibility.c
 > -+++ b/gtk/a11y/gtkaccessibility.c
 > -@@ -37,10 +37,6 @@
 > - #include <gtk/gtktogglebutton.h>
 > - #include <gtk/gtkaccessible.h>
 > -
 > --#ifdef GDK_WINDOWING_X11
 > --#include <atk-bridge.h>
 > --#endif
 > --
 > - static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
 > -                                          guint                  n_param_values,
 > -                                          const GValue          *param_values,
 > -@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
 > -   _gtk_accessibility_override_atk_util ();
 > -   do_window_event_initialization ();
 > -
 > --#ifdef GDK_WINDOWING_X11
 > --  atk_bridge_adaptor_init (NULL, NULL);

 > --#endif
 > --
 > -   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
 > - }
 > ---- a/meson.build
 > -+++ b/meson.build
 > -@@ -564,7 +564,7 @@ if x11_enabled
 > -   xfixes_dep     = dependency('xfixes', required: false)
 > -   xcomposite_dep = dependency('xcomposite', required: false)
 > -   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
 > --  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
 > -+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
 > - 
 > -   backend_immodules += ['xim']
 > - 

 > diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
 > index 82ca68d2da..d921f79226 100644
 > --- a/package/libgtk3/Config.in
 > +++ b/package/libgtk3/Config.in
 > @@ -24,6 +24,8 @@ config BR2_PACKAGE_LIBGTK3
 >  	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 >  		BR2_PACKAGE_HAS_LIBGL
 >  	select BR2_PACKAGE_ATK
 > +	select BR2_PACKAGE_AT_SPI2_ATK
 > +	select BR2_PACKAGE_AT_SPI2_CORE

at-spi2-core depends on xorg7 / xlib-libXtst, so that would mean that we
would pull that in even for libgtk3 builds with the broadway/wayland
backends, is that sensible?

Maybe it is? Does at-spi2 work under wayland?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
