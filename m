From: Kyle Sulek <kylesulek@gmail.com>
Date: Mon, 6 Nov 2017 21:25:49 -0600
Subject: [Buildroot] How do I pass arguments into autoconfig tools
 ./confgiure
Message-ID: <CAB8Uub1EsVQa-xKPqczyRdmL2eWW4UONkC4XZKBemct+BoPpQg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am trying to add a package to buildroot. The autogen.sh file in the
source directory is as follows

===================================================
#! /bin/sh

srcdir=`dirname $0`
echo "srdir: $srcdir"
test -z "$srcdir" && srcdir=.

ORIGDIR=`pwd`
cd $srcdir

autoreconf -v --install || exit 1
cd $ORIGDIR || exit $?

$srcdir/configure --enable-maintainer-mode "$@"

===================================================


This is what I have for my package .mk file
===================================================
############################################################
####################
#
# ti-gbm
#
############################################################
####################

# This correpsonds to SDK 02.00.00.00
TI_GBM_VERSION = 96f37555c7e82a417b02051661377b10e6b3966e
TI_GBM_SITE = git://git.ti.com/glsdk/libgbm.git
TI_GBM_LICENSE = GPL-2.0
TI_GBM_LICENSE_FILES = GPL-COPYING
TI_GBM_INSTALL_STAGING = YES
TT_GBM_INSTALL_TARGET = YES
TI_GBM_AUTORECONF = YES
TI_GBM_AUTORECONF_OPTS = -v --install

$(eval $(autotools-package))
===================================================

However, I cannot figure out how to pass --enable-maintainer-mode "$@" into
the configure script.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171106/e704760a/attachment.html>
