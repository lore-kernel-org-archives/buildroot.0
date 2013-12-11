From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 11 Dec 2013 22:19:11 +0100
Subject: [Buildroot] [PATCH 1/1] evtest: bump to version 1.31
In-Reply-To: <1386750244-5169-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 (Jerzy Grzegorek's message of "Wed, 11 Dec 2013 09:24:04 +0100")
References: <1386750244-5169-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <8761qv3x2o.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jerzy" == Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net> writes:

 > Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
 > ---
 >  package/evtest/evtest.mk |    5 +++--
 >  1 file changed, 3 insertions(+), 2 deletions(-)

 > diff --git a/package/evtest/evtest.mk b/package/evtest/evtest.mk
 > index 2a87553..447a69a 100644
 > --- a/package/evtest/evtest.mk
 > +++ b/package/evtest/evtest.mk
 > @@ -4,13 +4,14 @@
 >  #
 >  ################################################################################
 
 > -EVTEST_VERSION = 1.30
 > +EVTEST_VERSION = 1.31
 >  EVTEST_SOURCE = evtest-$(EVTEST_VERSION).tar.bz2
 >  # no official upstream tarball
 > -EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-1.30.tar.bz2/27c0902839babfd07136f232c63c895c/
 > +EVTEST_SITE = http://pkgs.fedoraproject.org/repo/pkgs/evtest/evtest-$(EVTEST_VERSION).tar.bz2/1d95cd9952d34dd15f93adb197323073/
 >  EVTEST_LICENSE = GPLv2
 >  EVTEST_LICENSE_FILES = COPYING
 >  EVTEST_DEPENDENCIES = host-pkgconf
 > +EVTEST_AUTORECONF = YES

So this (funky) upstream doesn't have configure is basically just a
tarball of git? Wouldn't it then make more sense to just directly use
the git repo (git://anongit.freedesktop.org/evtest) instead?

According to the release notes
(http://lists.freedesktop.org/archives/xorg-announce/2013-June/002243.html),
this version drops evtest-capture, so we should remove the option in
Buildroot as well (and add it to Config.in.legacy and consider packaging
evemu).

-- 
Bye, Peter Korsgaard
