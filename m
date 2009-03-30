From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2009 08:24:42 +0200
Subject: [Buildroot] svn commit: [25880] trunk/buildroot/package:
 automake libtool pkgconfig
In-Reply-To: <20090329191026.8F79877487@busybox.osuosl.org>
References: <20090329191026.8F79877487@busybox.osuosl.org>
Message-ID: <20090330082442.34a53123@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le Sun, 29 Mar 2009 19:10:26 +0000 (UTC),
jacmet at uclibc.org a ?crit :

> Revert r25827 and instead copy over the host aclocal files of the
> stuff needed for auto* (libtool + pkgconfig). These logically belong
> with the target stuff, as they are used for the target auto*
> toolchain.
> 
> Long term we should probably consider using
> aclocal --acdir=$(STAGING_DIR)/usr/share/aclocal, so the host .m4
> files cannot interfere with the target build.

I must admit I'm far from being a auto* expert, and I'm quite confused
by the host vs. target auto* difference. So please excuse my silly
questions.

With your version, when a package sets FOO_AUTORECONF=YES, it will use
the autotools of the host (installed in $(HOST_DIR)), but these
autotools will be told to use the aclocal files in $(STAGING_DIR), and
therefore will only see the aclocal files for libtool and pkgconfig. Is
this what we want ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
