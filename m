From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:25:19 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xdm: fix build with pkgconf 1.5.3
In-Reply-To: <20181214153039.7425-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 14 Dec 2018 16:30:39 +0100")
References: <20181214153039.7425-1-fontaine.fabrice@gmail.com>
Message-ID: <87ftuzetzk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
 > paths found in the .pc file. This is correct when the paths refer to
 > something in STAGING_DIR (e.g. libdir, includedir), but not when it
 > refers to something used for the target.

 > xapp_xdm uses the appdefaultdir variable from xt.pc to decide where to
 > install things. Since DESTDIR is prepended to the install destination,
 > this will end up in the wrong location.

 > Until a better solution is found in pkgconf, pass the appdefaultdir to
 > use explicitly instead of relying on xt.pc.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/08bcba7d7340f34dc66b5b2ab8fbcfbaee309e37

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
