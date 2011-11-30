From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Wed, 30 Nov 2011 10:20:41 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111130170450.2f33e6c2@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
 <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
 <20111129153619.4f080721@skate>
 <001301ccaea5$37ec1f40$0400a8c0@dspcgrnzks9p98>
 <001401ccaedf$e5751f60$0400a8c0@dspcgrnzks9p98>
 <001501ccaee8$34c408d0$0400a8c0@dspcgrnzks9p98>
 <000b01ccaf79$085d0800$0400a8c0@dspcgrnzks9p98>
 <20111130170450.2f33e6c2@skate>
Message-ID: <000c01ccaf7c$01f3c460$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > Since this is what needs to be done, can someone mention how to do it in
> > Buildroot?  Maybe I need the Makefile for Generic Packages, not the
> > autotools-based packages makefile?
>
> You'll need to pass the INSTALL_MOD_PATH environment variable, but also
> the ARCH= and CROSS_COMPILE variable. The easiest way is probably to use
> $(LINUX_MAKE_FLAGS) variable defined in linux/linux.mk.

Thank you so much for the reply.  I just checked and I don't see
"LINUX_MAKE_FLAGS" in buildroot-2011.05/linux/linux.mk.  Maybe that's in the
2011.11 version?  But, are you saying that I could still use the
autotools-based makefile and just add INSTALL_MOD_PATH, ARCH, and
CROSS_COMPILE?  I have it running now, but the build takes a while, so if
this is wrong can you tell me?

#############################################################
#
# EtherCAT
#
#############################################################
ETHERCAT_VERSION = 1.0
ETHERCAT_SOURCE = etherlabmaster-1.0.tar.bz2
###ETHERCAT_SITE = file:///home/user1/Desktop/EtherCAT4Atmel/
ETHERCAT_SITE = http://127.0.0.1/home/user1/Desktop/EtherCAT4Atmel/
ETHERCAT_INSTALL_STAGING = YES
ETHERCAT_INSTALL_TARGET = YES
ETHERCAT_CONF_OPT = --enable-generic
#####LIBFOO_DEPENDENCIES = libglib2 host-pkg-config
#####ETHERCAT_MAKE_OPT = INSTALL_MOD_DIR="ethercat" modules_install
ETHERCAT_INSTALL_MOD_PATH = /lib/modules/2.6.33/ethercat
ETHERCAT_ARCH = arm
ETHERCAT_CROSS_COMPILE = arm-unknown-linux-uclibcgnueabi-

$(eval $(call AUTOTARGETS,package,ethercat))
