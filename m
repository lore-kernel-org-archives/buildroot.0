From: Matthieu CASTET <matthieu.castet@parrot.fr>
Date: Thu, 15 Feb 2007 16:21:07 +0000 (UTC)
Subject: [Buildroot] external toolchain : lot's of package broken *.mk
	makefile
Message-ID: <loom.20070215T170827-634@post.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I am very interrested to use the external toolchain features, because we want to
use glibc.

The problem with lot's of pakage *.mk makefile is that they assume that the
external libs will be installed in the toolchain dir not another dir.

For example for the procps pakage, there is an error [1].
The solution is to add somethings like
CPPFLAGS=-I$(STAGING_DIR)/include CFLAGS=-I$(STAGING_DIR)/include
LDFLAGS="-L$(STAGING_DIR)/lib -L$(STAGING_DIR)/usr/lib" 

when calling the build process.

Matthieu


[1]
/opt/arm-2006q3/bin/../lib/gcc/arm-none-linux-gnueabi/4.1.1/../../../../
arm-none-linux-gnueabi/bin/ld:
cannot find -lncurses
