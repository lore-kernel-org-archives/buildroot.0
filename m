From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 14 Dec 2018 21:23:17 +0100
Subject: [Buildroot] [PATCH 1/1] xapp_xmap: fix build with pkgconf 1.5.3
In-Reply-To: <20181214152517.7067-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 14 Dec 2018 16:25:17 +0100")
References: <20181214152517.7067-1-fontaine.fabrice@gmail.com>
Message-ID: <871s6jg8ne.fsf@dell.be.48ers.dk>
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

 > xapp_xmap uses the appdefaultdir variable from xt.pc to decide where to
 > install things. Since DESTDIR is prepended to the install destination,
 > this will end up in the wrong location.

 > Until a better solution is found in pkgconf, pass the appdefaultdir to
 > use explicitly instead of relying on xt.pc.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/725c20ec9621a9c2d4b94784785bb481ff74f0e7

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
