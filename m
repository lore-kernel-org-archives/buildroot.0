From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 29 Jul 2009 23:05:34 +0200
Subject: [Buildroot] [git commit] openssl: fix arch handling
In-Reply-To: <20090729220919.7fd03212@surf>
References: <20090729195158.099A8777F5@busybox.osuosl.org>
	<20090729220919.7fd03212@surf>
Message-ID: <20090729210534.GT14135@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jul 29, 2009 at 10:09:19PM +0200, Thomas Petazzoni wrote:

>ifeq ($(BR2_ARCH),"x86_64")
>
>BTW, any clue why we have quotes around the value of BR2_ARCH ?

project/Makefile.in:ARCH:=$(strip $(subst ",, $(BR2_ARCH)))
scripts/test/Makefile:  @echo   $(strip $(subst ",,$(BR2_ARCH)))
target/Config.in.arch:config BR2_ARCH

i.e. it's a string.
