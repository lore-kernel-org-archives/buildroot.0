From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 21:39:14 +0100
Subject: [Buildroot] [git commit] libvorbis: bump version
Message-ID: <20140122204038.23E4B9C5BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=df7684b5b6312ad7d723e91e890d6c48fae3b430
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Shrinks library size. From the release notes:

   Nathan Froyd at Mozilla noticed something odd in the libvorbis
   sourcebase. Codebook 'length lists' only use integers in the range
   of 0 to 32. Well, worse than integers, actually, longs. And the
   lengthlists are big; the static data comprises the bulk of
   libvorbisenc.

   In the earliest days of Vorbis development 15 years ago, codebooks
   were constructed differently and the lengthlists were quite small.
   Longs still weren't necessary, but the wasted space was
   negligible. When the coding strategy shifted and these lists
   became much larger, no one caught the wasted space. The vast
   majority of optimization was always for speed, not space. The only
   concentrated effort in trimming Vorbis library size down over the
   past decade had been in the decoder.

   But now browsers need to ship encoders, and size matters. Add that
   to 64 bit taking over (and doubling the wasted space in the
   lengthlists), someone finally noticed the oversight.

   That's a long way of saying [1]"Xiph.Org is pleased to announce
   the release of libvorbis 1.3.4..."

   No functional changes, but the encoder lib is now a shade over 25%
   the size it was in the 1.3.3 release.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvorbis/libvorbis.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libvorbis/libvorbis.mk b/package/libvorbis/libvorbis.mk
index 948a43d..d5e290f 100644
--- a/package/libvorbis/libvorbis.mk
+++ b/package/libvorbis/libvorbis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVORBIS_VERSION = 1.3.3
+LIBVORBIS_VERSION = 1.3.4
 LIBVORBIS_SOURCE = libvorbis-$(LIBVORBIS_VERSION).tar.xz
 LIBVORBIS_SITE = http://downloads.xiph.org/releases/vorbis/
 LIBVORBIS_INSTALL_STAGING = YES
