From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 12:21:37 +0200
Subject: [Buildroot] [PATCH] zeromq: disable test_fork when fork() is no
 available
In-Reply-To: <536CA383.404@trzebnica.net>
References: <1399134782-18013-1-git-send-email-yann.morin.1998@free.fr>
 <536CA383.404@trzebnica.net>
Message-ID: <20140509102136.GD3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy, All,

[forgot to cc the Buildroot list on previous mail, sorry]

On 2014-05-09 11:44 +0200, Jerzy Grzegorek spake thusly:
> >From: Samuel Martin <s.martin49@gmail.com>
> >
> >zeromp's configure script correctly detects the fork availability, but
> >unconditionally build test_fork program whatever the fork() availability.
> >
> >This patch fixes the build-system by disabling test_fork when fork is
> >not available (e.g. when !BR2_USEMMU).
> >
> >Fixes:
> >   http://autobuild.buildroot.org/results/359/3599cc3b7bf2bb22a78961cd84d21cb03cbd7015/
> >
> >Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> >[yann.morin.1998 at free.fr: remove Makefile.in hunks]
> >Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >[yann.morin.1998 at free.fr: tested against the failed bfin config, as well as
> >  a i686 target]
> >Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >---
> >  ...isable-test_fork-if-fork-is-not-available.patch | 52 ++++++++++++++++++++++
> >  package/zeromq/zeromq.mk                           |  1 +
> >  2 files changed, 53 insertions(+)
> >  create mode 100644 package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
> >
> >diff --git a/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch b/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
> >new file mode 100644
> >index 0000000..1eefdc3
> >--- /dev/null
> >+++ b/package/zeromq/zeromq-0001-tests-disable-test_fork-if-fork-is-not-available.patch
> >@@ -0,0 +1,52 @@
> >+From b50912f2eecec1ea7accc155f8132116f8702075 Mon Sep 17 00:00:00 2001
> >+From: Samuel Martin <s.martin49@gmail.com>
> >+Date: Sat, 3 May 2014 12:22:38 +0200
> >+Subject: [PATCH] tests: disable test_fork if fork() is not available
> >+
> >+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> >+---
> >+ configure.ac      | 1 +
> >+ tests/Makefile.am | 8 ++++++--
> >+ tests/Makefile.in | 8 ++++----
> 
> What about the changes in Makefile.in file?
> I don't see them here.

Ah, right. When I edited the patch to remove them, I forgot to remove
Makefile.in from the diffstat. We do not need the changes to Makefile.in
in this patch, since we do autoreconf the beast, so Makefile.in gets
re-generated.

See the commit log that states;
    [yann.morin.1998 at free.fr: remove Makefile.in hunks]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
