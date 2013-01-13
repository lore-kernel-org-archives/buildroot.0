From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 13 Jan 2013 21:45:42 +0100
Subject: [Buildroot] [PATCH 1/3] Makefile: export BR2_CONFIG_FILE,
	pointing to our .config
In-Reply-To: <50EC2CE0.2050106@mind.be> (Arnout Vandecappelle's message of
 "Tue, 08 Jan 2013 15:27:44 +0100")
References: <cover.1357595083.git.yann.morin.1998@free.fr>
 <201301081351.38832.yann.morin.1998@free.fr>
 <50EC1A1B.5080804@mind.be>
 <201301081446.01172.yann.morin.1998@free.fr>
 <50EC2CE0.2050106@mind.be>
Message-ID: <87d2x8x155.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I was not referring to our .mk files, but rather to the packages themselves.
 >> I did a quick survey in 110+ packages, and:
 >> - kconfig-based packages are not affected: kernel, uClibc, busybox, ct-ng
 >> - packages using CONFIG_FILE:
 >> - gdb:     gdb/sim/ppc/Makefile.in:CONFIG_FILE = @sim_config@
 >> - xbmc:    xbmc/lib/freetype/builds/detect.mk:ifndef CONFIG_FILE
 >> - no package uses DOT_CONFIG
 >> - openbricks is using DOT_CONFIG, too

 Arnout>  But if you anyway change the name, BUILDROOT_CONFIG is better than
 Arnout> the non-specific DOT_CONFIG.

 Arnout>  How long can we discuss about a name? :-)

Long ;)

I like BUILDROOT_CONFIG. It's unique and it's meaning is very
obvious. Yann, care to rework the series to use BUILDROOT_CONFIG
instead?

-- 
Bye, Peter Korsgaard
