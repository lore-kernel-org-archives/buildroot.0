From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 00:11:55 +0100
Subject: [Buildroot] [PATCH] package/shairport-sync: fix static builds
In-Reply-To: <1417347776-25907-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Sun, 30 Nov 2014 12:42:56 +0100")
References: <1417347776-25907-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87h9xgi8qs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Because shairport-sync uses AC_CHECK_LIB to find some of the needed
 > libraries (opensl, alsa, popt...), it fails to bring in the dependencies
 > of those libraries; for example, -lssl requires -lz.

 > When doing a dynamically-linked build, those dependent libraries are
 > pulled in thansk to the DT_NEEDED ELF tags, but those are not available
 > in static libraries.

 > Use PKG_CHECK_MODULES instead of AC_CHECK_LIB, and emulate the results
 > of AC_CJECK_LIB (i.e. set the HAVE_LIBxxx and the LIBS variable
 > appropriately) to minimise the amount of code touched.

 > This should fix:
 >     http://autobuild.buildroot.net/results/1a5/1a56dbff3583bed0d693508dfc16859086846ecd/
 >     http://autobuild.buildroot.net/results/6d5/6d5a8157592f7a2c9469bf71b0453796ef982ab1/

 > At the same time, remove a comment at the end of a variable assignment,
 > since this has proven to cause some problems.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: J?rg Krause <jkrause@posteo.de>
 > Cc: Baruch Siach <baruch@tkos.co.il>

 > ---
 > Changes v1 -> v2:
 >   - add missing host-pkgconf  (Baruch)
 >   - remove end-of-line comment

Committed, thanks.

-- 
Bye, Peter Korsgaard
