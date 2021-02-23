From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Date: Tue, 23 Feb 2021 09:28:10 +0100
Subject: [Buildroot] [PATCH] package/avrdude: Switch to upstream
In-Reply-To: <20210222213804.GG2276@scaer>
References: <20210222022606.491102-1-alexander.sverdlin@gmail.com>
 <20210222213804.GG2276@scaer>
Message-ID: <e656a8e909b3c8f312636f7db8f8966960105318.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

On Mon, 2021-02-22 at 22:38 +0100, Yann E. MORIN wrote:
> > -AVRDUDE_VERSION = f8893ccf0aceeff67c45f95ae4e86bc7fbe342aa
> > -AVRDUDE_SITE = $(call github,kcuzner,avrdude,$(AVRDUDE_VERSION))
> > +AVRDUDE_VERSION = r1450
> > +AVRDUDE_SITE_METHOD = svn
> > +AVRDUDE_SITE = http://svn.savannah.nongnu.org/svn/avrdude/trunk
> > ? AVRDUDE_LICENSE = GPL-2.0+
> > ? AVRDUDE_LICENSE_FILES = avrdude/COPYING
> > ? AVRDUDE_SUBDIR = avrdude
> > -# Sources coming from git, without generated configure and Makefile.in
> > +# Sources coming from svn, without generated configure and Makefile.in
> > ? # files.
> > ? AVRDUDE_AUTORECONF = YES
> > -AVRDUDE_CONF_OPTS = --enable-linuxgpio
> > +AVRDUDE_CONF_OPTS = --enable-linuxgpio --enable-linuxspi
> 
> So I was wondering why we would enable a new feature at the same time we
> do the bump.
> 
> So the fork we were using did auto-detection of kernel headers to detect
> whether spidev.h was present or not, and thuse whether to enable or
> disable its linuxspi 'driver'.
> 
> But upstream went a slightly diffferent route, and added a configure
> option (and they do no validity check). Since spidev.h has been present
> since linux-2.6.22, we can quite easily conclude that spidev support was
> always enabled in the fork, and thus that we should keep it enabled now
> that we switch back to the upstream.
> 
> That would have been good to have this explanations (or at least a
> trimmed-down vesion) in the commit log, because it is a bit ambiguous as
> it is now...
> 
> No need to respin, I can fix when applying...

This old fork from kcuzner was focused on "linuxspi", that's why I thought,
whoever has chosen non-upstream version of the programmer wanted this
programmer explicitly.

-- 
Alexander Sverdlin.
