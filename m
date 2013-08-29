From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 29 Aug 2013 10:34:19 +0200
Subject: [Buildroot] [PATCH 10/12] toolchain: refactor Stack Smashing
 Protection support
In-Reply-To: <521EE62A.9000805@mind.be>
References: <1377671731-28656-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1377671731-28656-11-git-send-email-thomas.petazzoni@free-electrons.com>
 <521EE62A.9000805@mind.be>
Message-ID: <20130829103419.1ed476b9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Thu, 29 Aug 2013 08:11:54 +0200, Arnout Vandecappelle wrote:
> On 08/28/13 08:35, Thomas Petazzoni wrote:
> [snip]
> > diff --git a/package/psmisc/psmisc.mk b/package/psmisc/psmisc.mk
> > index 1340ee6..61faeab 100644
> > --- a/package/psmisc/psmisc.mk
> > +++ b/package/psmisc/psmisc.mk
> > @@ -10,7 +10,7 @@ PSMISC_LICENSE = GPLv2
> >   PSMISC_LICENSE_FILES = COPYING
> >   PSMISC_DEPENDENCIES = ncurses $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext)
> >
> > -ifneq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
> > +ifneq ($(BR2_ENABLE_SSP),y)
> >   # Don't force -fstack-protector
> >   PSMISC_CONF_OPT = --disable-harden-flags
> >   endif
> 
>   If psmisc normally uses -fstack-protector, then I wouldn't disable that 
> just because the user hasn't chosen to enable the option globally.
> 
>   In other words, I'd put
> 
> ifneq ($(BR2_TOOLCHAIN_HAS_SSP),y)

Sure, why not.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
