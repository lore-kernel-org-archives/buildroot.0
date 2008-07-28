From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Mon, 28 Jul 2008 14:05:54 +0200
Subject: [Buildroot] [RFC] Fix Makefile.autotools.in target installation rule
Message-ID: <1217246754.7955.20.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

This is a first try to fix the Makefile.autotools.in target installation
rule. It works by adding a new variable which should be defined for each
package.

FOO_INSTALL_TARGET_FILE

If the variable is not defined (like all packages today), the Makefile
will fallback to the old way of doing it.

There is an example for the popt package in the patch included.

POPT_INSTALL_TARGET_FILE = /usr/lib/libpopt.so

Comments?

The really ugly redundant target install rule was the only way I managed
to get it working. ifeq/ifdef did not work, because I think the $(PKG)
variable is defined later?

I am no Makefile magician ;)

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
-------------- next part --------------
A non-text attachment was scrubbed...
Name: fix-target-installation-using-makefile.autotools.in.patch
Type: text/x-patch
Size: 2681 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20080728/fae94e2d/attachment.bin 
