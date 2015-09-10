From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Sep 2015 18:13:04 +0200
Subject: [Buildroot] [PATCH] modem-manager: now needs libgudev under
 systemd
In-Reply-To: <55F18E83.1020007@imgtec.com>
References: <1441889437-13931-1-git-send-email-yegorslists@googlemail.com>
 <55F18E83.1020007@imgtec.com>
Message-ID: <20150910181304.076e392d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, Yegor,

On Thu, 10 Sep 2015 15:06:59 +0100, Vicente Olivert Riera wrote:

> when you say that "modem-manager: now needs libgudev for systemd", what
> do you mean exactly by "now"? I would expect something like "since
> version X" or a better explanation.

Well, I think you're being a bit too picky here. It is indeed nicer
when the information is more specific, but since there is a clear
autobuilder failure, I think Yegor's commit log is good enough. Better
is better, for sure :-)


> > @@ -1,11 +1,12 @@
> >  config BR2_PACKAGE_MODEM_MANAGER
> >  	bool "modemmanager"
> >  	depends on BR2_PACKAGE_HAS_UDEV
> > -	select BR2_PACKAGE_DBUS
> >  	depends on BR2_USE_WCHAR # libglib2 and gnutls
> >  	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> >  	depends on BR2_USE_MMU # dbus
> > +	select BR2_PACKAGE_DBUS
> 
> I know you are trying to keep all the depends together and all the
> selects together, but since this is not related with the goal that your
> patch is trying to achieve, I would do it in a separate patch.

While I do agree that separating logical changes into separate commits
is important, we shouldn't be too zealous about that either. So I'm
personally fine with such small (but related) side changes. It's better
when the commit log contains something such as:

While at it, group the existing dbus select together with the dbus-glib
select, so that all "select" statements are together.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
