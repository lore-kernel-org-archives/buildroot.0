From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 25 May 2014 19:12:55 -0300
Subject: [Buildroot] [WIP PATCH 0/5] Static linking fixes
Message-ID: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As discussed on the mailing list here is my current patchset to get
static linking fixed.
This is a WIP (Work In Progress) patchset, that being said i consider
patches 1 and 3 pretty safe and ready for the tree.
Patch 2 and 4 are medium confidence level, how things should be IMHO.
Patch 5 is also how things should be however it's not extensively tested.

Gustavo Zacarias (5):
  uclibc: don't install tools to staging when static
  gcc-final: disable shared build for static
  libiconv: disable preloadable for static builds
  package infra: revert 0a4bd19f
  package infra: add -static to C/CXXFLAGS

 package/Makefile.in                |  4 +++-
 package/gcc/gcc-final/gcc-final.mk | 21 +++++++++++++++++++--
 package/libiconv/libiconv.mk       |  8 ++++++++
 package/uclibc/uclibc.mk           |  4 ++--
 4 files changed, 32 insertions(+), 5 deletions(-)

-- 
1.8.5.5
