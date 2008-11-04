From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Nov 2008 18:14:09 +0100
Subject: [Buildroot] svn commit: trunk/buildroot
In-Reply-To: <87prlb96au.fsf@macbook.be.48ers.dk>
References: <20081103201104.190E7F8015@busybox.net>
	<20081104082320.667f3022@surf> <87prlb96au.fsf@macbook.be.48ers.dk>
Message-ID: <20081104181409.63a40a42@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 04 Nov 2008 10:41:45 +0100,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> That looks more like a problem about glib-genmarshal not being
> installed on the host (E.G. something like a libglib2.0-dev package)

Yep, there are two solutions:

 * Require glib-genmarshal to be installed on the host, in which case
   it should be checked prior to the compilation process ;

 * Since the source code of glib-genmarshal is already available in the
   package we're compiling, compile it for the host and use this
   version instead of looking in /usr/bin.

The current glib source code seems to indicate that the first solution
is preferred when doing cross-compilation:

if test $cross_compiling = yes; then
  AC_PATH_PROG(GLIB_GENMARSHAL, glib-genmarshal, no)
  if test x$GLIB_GENMARSHAL = xno; then
    AC_MSG_ERROR(Could not find a glib-genmarshal in your PATH)
  fi
fi

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
