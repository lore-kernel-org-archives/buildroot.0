From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 14:09:55 +0200
Subject: [Buildroot] [PATCH] package/x11r7/xutil_makedepend: add missing
 dependency on host-pkgconf
In-Reply-To: <20180923135007.5926-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 23 Sep 2018 15:50:07 +0200")
References: <20180923135007.5926-1-thomas.petazzoni@bootlin.com>
Message-ID: <87ftxk4mss.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The configure script of xutil_makedepend uses PKG_CHECK_MODULES(), so
 > it should depend on host-pkgconf. Otherwise, a "make
 > host-xutil_makedepend" fails with:

 > """
 > checking for X... configure: error: in
 > `/home/thomas/projets/buildroot/output/build/host-xutil_makedepend-1.0.5':
 > configure: error: The pkg-config script could not be found or is too old.  Make sure it
 > is in your PATH or set the PKG_CONFIG environment variable to the full
 > path to pkg-config.

 > Alternatively, you may set the environment variables X_CFLAGS
 > and X_LIBS to avoid the need to call pkg-config.
 > See the pkg-config man page for more details.

 > To get pkg-config, see <http://pkg-config.freedesktop.org/>.
 > """

 > This was detected using per-package host/target directories, but can
 > be reproduced without it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
