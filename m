From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Aug 2018 10:46:12 +0200
Subject: [Buildroot] [PATCH] package/m4: fix build in host with
 glibc-2.28
In-Reply-To: <20180817123803.13807-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 17 Aug 2018 14:38:03 +0200")
References: <20180817123803.13807-1-yann.morin.1998@free.fr>
Message-ID: <878t4wjgob.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > glibc-2.28 did quite some lifting in their headers, which breaks the
 > way some packages were detecting glibc, like gnulib.

 > However, packages do bundle gnulib (it was meant to be bundled),
 > and so does m4.

 > Since m4 hasn't seen the slightest commit since 2017-01-09, it is
 > bundling an old gnulib version, that predates glibc-2.28, and thus
 > breaks. It also means that upstream hasn't already fixed the issue.

 > Furthermore, as upstream is using a git submodule for gnulib, and
 > that the paths are not the same in the release tarball (in lib/)
 > and in the git ttree (in gnulib/), we can't do a plain backport.

 > So, we selectively backport the two patches from gnulib upstream,
 > restricted to only the files that happen to be used in m4.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Reported-by: c32 on IRC

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
