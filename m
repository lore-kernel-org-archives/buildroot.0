From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 22:55:18 +0200
Subject: [Buildroot] [PATCH 1/1] package/mpd: fix build on sparc
In-Reply-To: <20190817211936.21844-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 17 Aug 2019 23:19:36 +0200")
References: <20190817211936.21844-1-fontaine.fabrice@gmail.com>
Message-ID: <87tvacg9jd.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8d757c4390facade75dd6cef808ea6ead9798c12

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 >  ...build-add-atomic-dependency-for-spar.patch | 39 +++++++++++++++++++
 >  1 file changed, 39 insertions(+)
 >  create mode 100644 package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch

 > diff --git
 > a/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
 > b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
 > new file mode 100644
 > index 0000000000..81bd981d65
 > --- /dev/null
 > +++ b/package/mpd/0001-src-event-meson.build-add-atomic-dependency-for-spar.patch
 > @@ -0,0 +1,39 @@
 > +From cb190801706da046823c74f89472af83ff947ce1 Mon Sep 17 00:00:00 2001
 > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +Date: Sat, 17 Aug 2019 22:25:06 +0200
 > +Subject: [PATCH] src/event/meson.build: add atomic dependency for sparc
 > +
 > +Linking with libatomic is needed on sparc otherwise build fails on:
 > +/usr/lfs/v0/rc-buildroot-test/scripts/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/7.4.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 > src/event/libevent.a(MaskMonitor.cxx.o): undefined reference to symbol
 > '__atomic_fetch_or_4@@LIBATOMIC_1.0'
 > +
 > +Fixes:
 > + - http://autobuild.buildroot.org/results/7a9fdb7e323892fb6ed85a2441054303e889c089
 > +
 > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > +[Upstream status: not sent (the same kind of patch for ncmpc was
 > +refused: https://github.com/MusicPlayerDaemon/ncmpc/pull/45)]

:/

Committed, thanks.

-- 
Bye, Peter Korsgaard
