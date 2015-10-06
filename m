From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 06 Oct 2015 11:49:54 +0200
Subject: [Buildroot] [PATCH] glib-networking: specify GIO_MODULE_DIR for
	target
In-Reply-To: <1444074870-31815-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 5 Oct 2015 16:54:30 -0300")
References: <1444074870-31815-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <878u7gfhrx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > Since the upgrade to pkgconf 0.9.12 all directories and variables with
 > directories are sysroot-prefixed, whereas with the old patch only some
 > variables were (includedir, mapdir, sdkdir, libdir).

 > libglib2 uses a giomoduledir=${libdir}/gio/modules variable in
 > gio-2.0.pc, which when expanded via sysroot by pkgconf at configure time
 > points to the staging directory (via libdir expansion).
 > When target install gets called the gio module gets installed to staging
 > rather than target, with the obvious consequences this has.

 > Work-around this pkgconfig abuse by overriding GIO_MODULE_DIR at target
 > install time.

 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Committed, thanks.

Lets hope we won't have too much other fallout from the bump.

-- 
Bye, Peter Korsgaard
