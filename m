From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 26 Mar 2013 23:10:25 +0100
Subject: [Buildroot] [PATCH 04/15] Added package Gutenprint
In-Reply-To: <ba8ccd1c57b7707b1d8be160e941d456e0a4656b.1364253936.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Tue, 26 Mar 2013 00:27:59 +0100")
References: <cover.1364253936.git.yann.morin.1998@free.fr>
 <cover.1364253936.git.yann.morin.1998@free.fr>
 <ba8ccd1c57b7707b1d8be160e941d456e0a4656b.1364253936.git.yann.morin.1998@free.fr>
Message-ID: <87sj3h7qy6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 Yann> From: Olivier Schonken <olivier.schonken@gmail.com>
 Yann> Gutenprint, formerly named Gimp-Print, is a suite of printer
 Yann> drivers that may be used with most common UNIX print spooling
 Yann> systems, including CUPS, lpr, LPRng, or others

 Yann> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
 Yann> [yann.morin.1998 at free.fr: needs libiconv, cleanup]
 Yann> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 Yann> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

It needs host-pkgconf, otherwise it fails at configure time because of
the PKG_* checks:

checking whether to build foomatic data files... no
checking for foomatic-ppdfile... /usr/bin/foomatic-ppdfile
checking whether to make use of foomatic 3 extra features... no
checking for ijs-config... no
checking whether to build Ghostscript driver... no
checking whether to enable loadable modules... (automatic)
checking whether to turn on debugging in build... no
checking whether to turn on profiling in build... no
checking whether to use readline... yes
checking for gimptool-2.0... no
checking for gimptool... no
./configure: 13604: ./configure.lineno: Syntax error: word unexpected (expecting ")")
make: *** [/home/peko/source/buildroot/output/build/gutenprint-5.2.9/.stamp_configured] Error 2

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
