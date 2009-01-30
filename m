From: Maxim Grigoriev <maxim@tensilica.com>
Date: Fri, 30 Jan 2009 15:02:36 -0800
Subject: [Buildroot] {buildroot 0004384]: GCC 4.3.1 fails with cannot
 compute suffix of object files
Message-ID: <4983870C.6010607@hq.tensilica.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a buildroot issue 0004384:

    http://lists.uclibc.org/pipermail/buildroot/2008-September/010792.html

I understand it's a generic architecture-independent GCC 4.3.1+ compiler 
problem
mentioned several times in different places ( e.g. bugzilla PRs 35577, 
35693 ).

On the buildroot mailing, list I found a reference to the patch

  gcc-4.3.1-compile.patch 

introduced by "antezedens" somewhere around 09-10-08.
But, I was not able to find this patch. Looks like it was withdrawn.

                          * * * * *

My question is: is this build failure supposed to be fixed on
the BUILDROOT makefiles/scripts level ? Or, setting 

LD_LIBRARY_PATH=$PWD/toolchain_build_arm/mpfr/lib:$LD_LIBRARY_PATH

from the top of buildroot tree is assumed to be a standard
setup for the buildroot build ? Is it documented anywhere ?

Thanks,
-- Maxim
