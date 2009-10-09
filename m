From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2009 12:04:06 +0200
Subject: [Buildroot] Patch: parted support
In-Reply-To: <20091008174543.GA2266@mx.loc>
References: <20091008153036.GV25852@moomers.org> <20091008174543.GA2266@mx.loc>
Message-ID: <20091009120406.37806183@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Thu, 8 Oct 2009 19:45:44 +0200,
Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> a ?crit :

> nowadays packages have to be written differently, like (completely
> untested):

Yes.

> ($(BR2_ENABLE_DEBUG),y)
> PARTED_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR)
> INSTALLCMD='./install-sh -c' \ install
> else
> PARTED_INSTALL_TARGET_OPT:=DESTDIR=$(TARGET_DIR)
> INSTALLCMD='./install-sh -c' \
> 			  STRIPPROG="$(TARGET_STRIP)" install-strip
> endif

What is this INSTALLCMD thing ?

Concerning the ENABLE_DEBUG test, it is not necessary.
Makefile.autotools.in already does:

ifeq ($(BR2_ENABLE_DEBUG),y)
$(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install-exec
else
$(2)_INSTALL_TARGET_OPT         ?= DESTDIR=$$(TARGET_DIR)  install-strip
endif


Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
