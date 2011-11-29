From: Jeff Krasky <jeff.krasky@dspcg.com>
Date: Tue, 29 Nov 2011 08:28:56 -0600
Subject: [Buildroot] LIBFOO_SITE in .mk file
In-Reply-To: <20111129083710.1a83fad6@skate>
References: <003b01cca958$91486a00$0400a8c0@dspcgrnzks9p98>
 <201111281139.37028.minimod@morethan.org>
 <002701ccadfe$961b9430$0400a8c0@dspcgrnzks9p98>
 <201111281324.38619.minimod@morethan.org>
 <003601ccae04$ada02e80$0400a8c0@dspcgrnzks9p98>
 <003801ccae12$a7781190$0400a8c0@dspcgrnzks9p98>
 <003901ccae1b$2d82f950$0400a8c0@dspcgrnzks9p98>
 <20111129083710.1a83fad6@skate>
Message-ID: <001201ccaea3$3ad7df70$0400a8c0@dspcgrnzks9p98>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> > This error message is what got me started down the path of adding the
> > package in Buildroot.  I used to build EtherCAT outside of Buildroot
> > and then that build process would put EtherCAT in the linux image.
> > But I'd get this error, so the suggestion was made to make the
> > EtherCAT build part of Buildroot.  Somehow the kernel needs to be
> > told of this module.  The Buildroot process must not be doing a 'make
> > install'?  Or is there a command I should run on the board itself
> > once Linux is running?
>
> It depends on :
> 
> * what your ethercat.mk file looks like (could you post it on the
>   list ?)
> * how the EtherCAT build system works

EtherCAT.mk:

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

$(eval $(call AUTOTARGETS,package,ethercat))



Regarding how the EtherCAT build system works, how do I answer this for you?
Are there some Makefiles that would explain it?  Some other file I can post
that will explain it?
