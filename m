From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Tue, 20 Oct 2015 18:52:05 +0200
Subject: [Buildroot] What is the preferred way install additional cmake
	modules?
Message-ID: <56267135.7050303@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Dear All,

i am about to add the modemmanager-qt[1] package to Buildroot, which
for building depends on a set of additional cmake modules also
provided by the KDE project, called extra-cmake-modules[2], which
itself also uses cmake for building and installing.

 I managed to set up a working configuration to install the
extra-cmake-modules package with the following in my
extra-cmake-modules/extra-cmake-modules.mk file (_VERSION and other
variables are omitted here):


EXTRA_CMAKE_MODULES_INSTALL_STAGING = YES
EXTRA_CMAKE_MODULES_INSTALL_TARGET = NO

$(eval $(cmake-package))


and in my target package i add the 'extra-cmake-modules' to the
dependencies. In this case the .cmake files get installed in the

path-to-buildroot/output/host/usr/arm-buildroot-linux-gnueabi/sysroot/us
r/share/ECM/cmake/

directory.

 My instinct would say that extra-cmake-modules is supposed to be a
host package (as then i wouldn't need to explicitly set
EXTRA_CMAKE_MODULES_INSTALL_TARGET to NO), so i tried this to define
as a host-cmake-package, make modemmanager-qt depending on
host-extra-cmake-modules, but then the cmake modules not found by the
modemmanager-qt build config.

In this latter case the .cmake files gets installed under:
path-to-buildroot/output/host/usr/share/ECM/cmake/


What is the preferred way to install this package? Install it as a
host-package, and specify a custom install target dir, or leave it as
plain cmake-package?



Thanks, regards
zgyarmati


[1]
https://projects.kde.org/projects/frameworks/modemmanager-qt/repository

[2] https://projects.kde.org/projects/kdesupport/extra-cmake-modules
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQEcBAEBAgAGBQJWJnE1AAoJEAGmEeeR8iVhh20IAJPBBxS0h2nYHnqeNsaLg7nr
Om9yviFOVSfyPB2kouFP/C9bGZ5DGXM66tMgjjVbUpxbLkLyUoFAFLXp2ORdwTT2
aMJWLGurDD16iePOKyDjxEgv4C6Fl7gWgzPLHTRyyLAdJIxzHP5dykCZBwo1t2hW
AXH9mCS+pAM1yfa5Mk5Nw4uYeLqJ0NAttDQmXnMwilu9AV1bNejyzLeGSge5gdjb
YvbBDRkVRS8KMlZ2aG5JI/RKbK/RabSM4Mhtka4NYOGOqhDyQ2FpDj4b+FVaFeQn
opSJFuAecKT9RRb73N9ZT3Se+sYuBwB2sMdUZT3A30KzLbNnmoSDR9Itw/0RSfw=
=tPVc
-----END PGP SIGNATURE-----
