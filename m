From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 12:44:41 +0100
Subject: [Buildroot] [PATCH] glibc: security bump to the latest 2.26
 branch
In-Reply-To: <4f77d70e07b0ed078d79e0358ec3ff3d49ccb093.1512717176.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Fri, 8 Dec 2017 09:12:56 +0200")
References: <4f77d70e07b0ed078d79e0358ec3ff3d49ccb093.1512717176.git.baruch@tkos.co.il>
Message-ID: <874locs8d2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > List of fixes from the 2.26 branch NEWS files:
 >   CVE-2017-15670: The glob function, when invoked with GLOB_TILDE,
 >   suffered from a one-byte overflow during ~ operator processing (either
 >   on the stack or the heap, depending on the length of the user name).
 >   Reported by Tim R?hsen.

 >   CVE-2017-15671: The glob function, when invoked with GLOB_TILDE,
 >   would sometimes fail to free memory allocated during ~ operator
 >   processing, leading to a memory leak and, potentially, to a denial
 >   of service.

 >   CVE-2017-15804: The glob function, when invoked with GLOB_TILDE and
 >   without GLOB_NOESCAPE, could write past the end of a buffer while
 >   unescaping user names.  Reported by Tim R?hsen.

 >   CVE-2017-17426: The malloc function, when called with an object size near
 >   the value SIZE_MAX, would return a pointer to a buffer which is too small,
 >   instead of NULL.  This was a regression introduced with the new malloc
 >   thread cache in glibc 2.26.  Reported by Iain Buclaw.

 > Cc: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Committed to 2017.11.x, thanks.

> ---
 >  package/glibc/glibc.hash | 2 +-
 >  package/glibc/glibc.mk   | 2 +-
 >  2 files changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
 > index 4e5bc7f7bcbc..f3a6577d2a42 100644
 > --- a/package/glibc/glibc.hash
 > +++ b/package/glibc/glibc.hash
 > @@ -1,4 +1,4 @@
 >  # Locally calculated (fetched from Github)
 > -sha256  d66b3702961c846ead2bacf17a9b5239cc1e8a43ca6e322f3637e99f276efec1     glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e.tar.gz
 > +sha256  0766875391224153502c5542a71b6e46db53b44691078b3130e1a0df41586430     glibc-glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40.tar.gz
 >  # Locally calculated (fetched from Github)
 >  sha256  5aa9adeac09727db0b8a52794186563771e74d70410e9fd86431e339953fd4bb     glibc-arc-2017.09-release.tar.gz
 > diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
 > index d99b524ef9fa..cb3a84a9a779 100644
 > --- a/package/glibc/glibc.mk
 > +++ b/package/glibc/glibc.mk
 > @@ -11,7 +11,7 @@ GLIBC_SOURCE = glibc-$(GLIBC_VERSION).tar.gz
 >  else
 >  # Generate version string using:
 >  #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
 > -GLIBC_VERSION = glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e
 > +GLIBC_VERSION = glibc-2.26-107-g73a92363619e52c458146e903dfb9b1ba823aa40
 >  # Upstream doesn't officially provide an https download link.
 >  # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 >  # sometimes the connection times out. So use an unofficial github mirror.
 > -- 
 > 2.15.0

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot

-- 
Bye, Peter Korsgaard
