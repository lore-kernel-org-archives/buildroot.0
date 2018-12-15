From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 15 Dec 2018 09:50:10 +0100
Subject: [Buildroot] [PATCH] package/libgtk3: don't use pkgconf directly
 for host build
In-Reply-To: <20181211142851.27318-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 11 Dec 2018 15:28:51 +0100")
References: <20181211142851.27318-1-thomas.petazzoni@bootlin.com>
Message-ID: <874lbfcgxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The build of host-libgtk3 calls $(HOST_DIR)/bin/pkgconf directly,
 > assuming that it will return correct results when building host
 > tools. It did work in practice without per-package directories, but is
 > not how pkg-config is used for host build in general: we recommend to
 > use $(HOST_DIR)/bin/pkg-config and we have in $(HOST_MAKE_ENV) a
 > number of environment variables that tell pkg-config to return results
 > relevant for host builds.

 > With per-package directories, calling $(HOST_DIR)/bin/pkgconf fails
 > badly, because it searches for .pc files in the per-package directory
 > of host-pkgconf itself, which obviously is empty.

 > So, we switch to using $(HOST_MAKE_ENV) $(PKG_CONFIG_HOST_BINARY),
 > which uses the regular pkg-config with the right environment
 > variables.

 > This allows the build of host-libgtk3 to find gdk-pixbuf-2.0 and
 > gio-2.0 built for the host, even in the context of
 > BR2_PER_PACKAGE_DIRECTORIES=y.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
