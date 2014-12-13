From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 13 Dec 2014 10:05:32 +0100
Subject: [Buildroot] [PATCH] package/nettle: fix shared-only build
In-Reply-To: <1418419668-13558-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Fri, 12 Dec 2014 22:27:48 +0100")
References: <1418419668-13558-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87zjarrkbn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Changeset f1d3e09 (Build shared libraries only as the default) broke the
 > nettle package.

 > nettle really wants to statically link its tools, examples and testsuite
 > against its own libraries. But for a shared-only build, static libraries
 > are not even built, so the build breaks when trying to link any of them.

 > Fix that in two ways:

 >   - the proper way, by using whatever libraries are available, with a
 >     preference toward using shared libraries;

 >   - disabling both examples and testsuite since we do not need them.

 > Fixes numerous build failures:
 >     http://autobuild.buildroot.net/results/e93/e93da743c5b84b1bb6274aeee3fe3b52962c560c/
 >     http://autobuild.buildroot.net/results/51d/51d0138ff39c45603315dcedf1f654c18604e1a8/
 >     http://autobuild.buildroot.net/results/521/521d979658e402103f1a18fcfeab3f9705f0c000/
 >     ...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > ---
 >  package/nettle/0001-fix-shared-only-build.patch    | 75 ++++++++++++++++++++++

Committed, thanks - Don't forget to send the patch upstream.

-- 
Bye, Peter Korsgaard
