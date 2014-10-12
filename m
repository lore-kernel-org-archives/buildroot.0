From: Alexey Brodkin <alexey.brodkin@gmail.com>
Date: Sun, 12 Oct 2014 18:34:43 +0200
Subject: [Buildroot] [PATCH 0/2] infra: BR2_PREFER_STATIC_LIB now selects
	static building of packages
Message-ID: <1413131685-5567-1-git-send-email-abrodkin@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series corrects description of BR2_PREFER_STATIC_LIB so it matches
currenlty implemented ("do not build dynamic libs and build statically linked
applications") and also takes care of uClibc so it doesn't have built-in support
of shared libraries as well as no shared versions of libc libs are built.

Alexey Brodkin (2):
  Config.in: update description of BR2_PREFER_STATIC_LIB
  uclibc: explicitly set HAVE_SHARED depending on BR2_PREFER_STATIC_LIB

 Config.in                             | 15 +++++++++------
 package/uclibc/uClibc-0.9.31.config   |  1 -
 package/uclibc/uClibc-0.9.33.config   |  1 -
 package/uclibc/uClibc-snapshot.config |  1 -
 package/uclibc/uclibc.mk              | 11 +++++++++++
 5 files changed, 20 insertions(+), 9 deletions(-)

-- 
1.9.3
