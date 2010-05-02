From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] uClibc: add UCLIBC_HAS_NFTW to
	default configuration
Message-ID: <20100502220950.7890E8A6CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf27314fa6fc31ccf1cbfce661a799ba6d2c4671
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

UCLIBC_HAS_NFTW is a new knob in 0.9.31, which allows the obsolete and
deprecated ftw() to be compiled-out separatly from nftw(), which is
part of POSIX. nftw() should probably be enabled by default in uClibc,
and a bug has been opened about this on uClibc bug tracker
(https://bugs.busybox.net/show_bug.cgi?id=1597).

nftw() is, for example, used in Gtk+.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/uClibc/uClibc-0.9.31.config |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
index 091f179..d2e54ad 100644
--- a/toolchain/uClibc/uClibc-0.9.31.config
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -191,7 +191,7 @@ UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_FNMATCH=y
 # UCLIBC_HAS_FNMATCH_OLD is not set
 # UCLIBC_HAS_WORDEXP is not set
-# UCLIBC_HAS_NFTW is not set
+UCLIBC_HAS_NFTW=y
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
 UCLIBC_HAS_GNU_GLOB=y
-- 
1.6.3.3
