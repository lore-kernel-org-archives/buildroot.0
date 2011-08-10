From: Heiko Helmle <helman@gmx.net>
Date: Wed, 10 Aug 2011 21:18:29 +0200
Subject: [Buildroot] host-libxml-parser-perl 2.36 won't install
Message-ID: <20110810191829.101270@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello List,

another little problem: host-libxml-parser-perl compiles okay but won't install correctly:

---
>>> host-libxml-parser-perl 2.36 Installing to host directory
PATH=/home/hel/buildroot/git/xtest/host/bin:/home/hel/buildroot/git/xtest/host/usr/bin:/usr/lib64/qt-3.3/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/hel/bin LD_LIBRARY_PATH="/home/hel/buildroot/git/xtest/host/usr/lib:" PKG_CONFIG="/home/hel/buildroot/git/xtest/host/usr/bin/pkg-config" PKG_CONFIG_LIBDIR="/home/hel/buildroot/git/xtest/host/usr/lib/pkgconfig" PERLLIB="/home/hel/buildroot/git/xtest/host/usr/lib/perl" /usr/bin/make -j5 -C /home/hel/buildroot/git/xtest/build/host-libxml-parser-perl-2.36 install
Appending installation info to /home/hel/buildroot/git/xtest/host/usr/lib64/perl5/perllocal.pod
Files found in blib/arch: installing files in blib/lib into architecture dependent library tree
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
ERROR: Can't create '/usr/local/lib64/perl5/XML'
mkdir /usr/local/lib64/perl5/XML: Keine Berechtigung at /usr/share/perl5/ExtUtils/Install.pm line 483

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
 at -e line 1
make[2]: *** [pure_site_install] Fehler 13
make[1]: *** [/home/hel/buildroot/git/xtest/build/host-libxml-parser-perl-2.36/.stamp_host_installed] Fehler 2
make: *** [all] Fehler 2
---

The problem seems to be in the generated Makefile. it sets:
