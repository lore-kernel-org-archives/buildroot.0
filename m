From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2019 11:43:07 +0100
Subject: [Buildroot] [PATCH] package/network-manager: add missing
 dependency on libglib2
In-Reply-To: <20191127222724.353622-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 27 Nov 2019 23:27:23 +0100")
References: <20191127222724.353622-1-thomas.petazzoni@bootlin.com>
Message-ID: <874kykxr5w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Commit 7643ab05de860011e749aa720c92d5de150bee0a
 > ("package/network-manager: drop obsolete dependencies") was a bit too
 > brutal in its dependency removal, as it forgot that removing dbus-glib
 > as a dependency would make libglib2 no longer part of the dependencies
 > of network-manager.

 > However, network-manager does require libglib2. From configure.ac:

 > PKG_CHECK_MODULES(GLIB, [gio-unix-2.0 >= 2.37.6 gmodule-2.0],
 >                   [AC_SUBST(LOG_DRIVER, '$(top_srcdir)/build-aux/tap-driver.sh')
 >                    AC_SUBST(AM_TESTS_FD_REDIRECT, '--tap')],
 >                   [PKG_CHECK_MODULES(GLIB, gio-unix-2.0 >= 2.40 gmodule-2.0)
 >                    AC_SUBST(LOG_DRIVER, '$(top_srcdir)/build-aux/test-driver')])

 > So this commit re-adds libglib2 as a dependency, and propagates the
 > appropriate "depends on". Nothing selects BR2_PACKAGE_NETWORK_MANAGER,
 > so we don't have to propagate these additional "depends on" anywhere.

 > Fixes:

 >   http://autobuild.buildroot.net/results/2025b1bd721bb5c5fa6638ccf389d2fd8fd10339/
 >   https://bugs.busybox.net/show_bug.cgi?id=12326

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Lubomir Rintel <lkundrak@v3.sk>
 > Cc: Christian Stewart <christian@paral.in>

Committed, thanks.

-- 
Bye, Peter Korsgaard
