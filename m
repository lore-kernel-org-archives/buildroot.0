From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 08:45:45 +0200
Subject: [Buildroot] [PATCH v3] Bump gpsd from version 2.95 to version
 3.7
In-Reply-To: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
References: <1343071776-1689-1-git-send-email-spdawson@gmail.com>
Message-ID: <20120724084545.6c0cedab@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Mon, 23 Jul 2012 20:29:36 +0100,
spdawson at gmail.com a ?crit :

>  package/gpsd/Config.in                             |   22 ++-
>  package/gpsd/gpsd-fix-acs_map-compile-errors.patch |   29 +++
>  package/gpsd/gpsd-fix-libgpsmm.patch               |   23 ---
>  package/gpsd/gpsd-navcom.patch                     |   47 -----
>  package/gpsd/gpsd.mk                               |  191 ++++++++++++--------

Other than the ncurses issue I already posted, it is also causing other
build issues:

 (1)

gpsd.c: In function 'main':
gpsd.c:1852:12: error: 'struct gps_context_t' has no member named 'pps_hook'

See
http://autobuild.buildroot.org/results/434fd6beca8349bf66b6615fd83bdce8be3ef590/build-end.log
and
http://autobuild.buildroot.org/results/434fd6beca8349bf66b6615fd83bdce8be3ef590/defconfig.

 (2)

gpsutils.c:26: fatal error: QDateTime: No such file or directory
compilation terminated.

See
http://autobuild.buildroot.org/results/c76888749337788c9ae9a04499f1fc1e1c5a2e81/build-end.log
and
http://autobuild.buildroot.org/results/c76888749337788c9ae9a04499f1fc1e1c5a2e81/defconfig.

 (3) The same ncurses issue

See
http://autobuild.buildroot.org/results/40b7b67a679a91f65fec113ed0b5e737bd20558e/build-end.log
and
http://autobuild.buildroot.org/results/40b7b67a679a91f65fec113ed0b5e737bd20558e/defconfig.

 (4) Maybe a host Python version problem

/home/peko/scratch/build/gpsd-3.7/SConstruct:369: Warning: 'with' will become a reserved keyword in Python 2.6
  File "/home/peko/scratch/build/gpsd-3.7/SConstruct", line 369

    with open("xmltest.xml", "w") as ofp:

            ^

SyntaxError: invalid syntax

See
http://autobuild.buildroot.org/results/5020a09f093412c3d725d8ae457d68ed72dcbf8e/build-end.log
and
http://autobuild.buildroot.org/results/5020a09f093412c3d725d8ae457d68ed72dcbf8e/defconfig.

Can you look into these issues?

Thomas Petazzoni
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
