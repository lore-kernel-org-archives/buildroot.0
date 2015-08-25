From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 25 Aug 2015 11:51:35 +0200
Subject: [Buildroot] [git commit] package: rename opencv -> opencv3
Message-ID: <20150825095807.6C75781E7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ba8dc3561090c817cdc123d9182b0f0d5d326c0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there is a couple of API breaks between OpenCV 2.4 and 3.0, two
distinct packages mutually exclusive will be integrated in the package
tree.

So, this change prepares the re-introduction of the OpenCV-2.4 package
by renaming the current opencv package (which provides OpenCV-3.0) to
opencv3.

Reverse dependencies (vlc) is fixed to use the new symbols.

Cc: Jonathan Ben Avraham <yba@tkos.co.il>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[yann.morin.1998 at free.fr:
  - fix missed usage in vlc.mk
  - don't remove legacy OpenCV symbols
  - fix 'endif' comment
  - slightly reword commit log (reverse deps)
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                                  |    2 +-
 ...pthread-based-parallel_for-with-gcc-4.4.3.patch |    0
 ...002-fix-support-for-pthreads-parallel_for.patch |    0
 package/{opencv => opencv3}/Config.in              |  152 +++++++-------
 package/{opencv/opencv.mk => opencv3/opencv3.mk}   |  230 ++++++++++----------
 package/vlc/Config.in                              |    4 +-
 package/vlc/vlc.mk                                 |    4 +-
 7 files changed, 196 insertions(+), 196 deletions(-)

Patch is too large, so refusing to show it
