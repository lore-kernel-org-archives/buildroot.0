From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 05 Oct 2018 19:43:13 +0200
Subject: [Buildroot] [PATCH] xlib_libXdmcp: add missing dependency on
 host-pkgconf
In-Reply-To: <20180921121350.22638-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 21 Sep 2018 14:13:50 +0200")
References: <20180921121350.22638-1-thomas.petazzoni@bootlin.com>
Message-ID: <8736tk47da.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The libXdmcp configure script uses pkg-config, but the Buildroot
 > package does not depend on host-pkgconf. This is not seen by the
 > autobuilders most likely because another package that is always built
 > before libXdmcp builds pkg-config.

 > However, running:

 > $ make xlib_libXdmcp

 > triggers the following build failure:

 > checking pkg-config is at least version 0.9.0... ./configure: line
 > 12323: /home/thomas/projets/buildroot/output/host/bin/pkg-config: No
 > such file or directory
 > no
 > [...]
 > checking for XDMCP... configure: error: in `/home/thomas/projets/buildroot/output/build/xlib_libXdmcp-1.1.2':
 > configure: error: The pkg-config script could not be found or is too old.  Make sure it
 > is in your PATH or set the PKG_CONFIG environment variable to the full
 > path to pkg-config.

 > This was detected using per-package target/host folders, because with
 > this, only the dependencies explicitly expressed by a package are
 > available to the package.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
