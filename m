From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Apr 2009 16:23:19 +0200
Subject: [Buildroot] Simple glibc-based external toolchain support
In-Reply-To: <87zleivwbi.fsf@macbook.be.48ers.dk>
References: <20090413221219.0819d500@surf> <20090415160314.1de1229f@surf>
	<87zleivwbi.fsf@macbook.be.48ers.dk>
Message-ID: <20090415162319.757eadd8@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 15 Apr 2009 16:13:53 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> I don't have a use for it myself, but I don't have a problem with it
> getting added (as long as someone is willing to supports its
> users).

Ok, thanks. My approach has one drawback: when one selects uClibc, the
Kconfig system picks up the default uClibc values for
BR2_TOOLCHAIN_EXTERNAL_LIB_C and BR2_TOOLCHAIN_EXTERNAL_LIBS. If the
user then later changes to glibc, then Kconfig doesn't change the
BR2_TOOLCHAIN_EXTERNAL_LIB_C and BR2_TOOLCHAIN_EXTERNAL_LIBS : they are
kept to their uClibc defaults. That may confuse users.

This raises the following point: do we need these options at all ?
Can't we just hardcode in ext-took.mk the list of libraries that have
to be imported in the target, depending on the choosen C library ?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
