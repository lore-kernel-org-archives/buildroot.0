From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 6 Feb 2017 21:54:27 +0000 (UTC)
Subject: [Buildroot] Interaction between SITE_METHOD=LOCAL and .patch files
Message-ID: <o7araj$clq$1@blaine.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've been chasing a bug in a package for a couple days, and have been
baffled because the executable failed with segfault when it was built
from a local package.tar.gz file located in thepackage directory
(where the package.mk file is).  However, if I unpack package.tar.gz
and then set the SITE_METHOD to LOCAL, the executable works fine.

After comparing build trees that worked with build trees that failed,
I finallythat setting SITE_METHOD = LOCAL prevents the application of
the .patch files present in the package directory. 

I don't find this behavior documented anywhere.  The description of
SITE_METHOD only says it affects how the sources are fetched.  It
doesn't say anything about it controlling whether or not patches are
applied.  Is it interaction intentional, or is it a bug?

[FWIW, the package in question is the most recent version of the ipkg
package, and the 0001-fix-musl-build.patch is what breaks it.  Since
that package has already been removed, I won't bother to file a bug
report.]

-- 
Grant Edwards               grant.b.edwards        Yow! Are we wet yet?
                                  at               
                              gmail.com            
