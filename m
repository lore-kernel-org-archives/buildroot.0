From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Apr 2017 14:33:33 +0200
Subject: [Buildroot] [PATCH] tiff: add upstream security fixes
In-Reply-To: <20170426215814.21533-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 26 Apr 2017 23:58:14 +0200")
References: <20170426215814.21533-1-peter@korsgaard.com>
Message-ID: <87lgqkhftu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Add upstream post-4.0.7 commits (except for ChangeLog modifications) fixing
 > the following security issues:

 > CVE-2016-10266 - LibTIFF 4.0.7 allows remote attackers to cause a denial of
 > service (divide-by-zero error and application crash) via a crafted TIFF
 > image, related to libtiff/tif_read.c:351:22.

 > CVE-2016-10267 - LibTIFF 4.0.7 allows remote attackers to cause a denial of
 > service (divide-by-zero error and application crash) via a crafted TIFF
 > image, related to libtiff/tif_ojpeg.c:816:8.

 > CVE-2016-10269 - LibTIFF 4.0.7 allows remote attackers to cause a denial of
 > service (heap-based buffer over-read) or possibly have unspecified other
 > impact via a crafted TIFF image, related to "READ of size 512" and
 > libtiff/tif_unix.c:340:2.

 > CVE-2016-10270 - LibTIFF 4.0.7 allows remote attackers to cause a denial of
 > service (heap-based buffer over-read) or possibly have unspecified other
 > impact via a crafted TIFF image, related to "READ of size 8" and
 > libtiff/tif_read.c:523:22.

 > CVE-2017-5225 - LibTIFF version 4.0.7 is vulnerable to a heap buffer
 > overflow in the tools/tiffcp resulting in DoS or code execution via a
 > crafted BitsPerSample value.

 > CVE-2017-7592 - The putagreytile function in tif_getimage.c in LibTIFF 4.0.7
 > has a left-shift undefined behavior issue, which might allow remote
 > attackers to cause a denial of service (application crash) or possibly have
 > unspecified other impact via a crafted image.

 > CVE-2017-7593 - tif_read.c in LibTIFF 4.0.7 does not ensure that tif_rawdata
 > is properly initialized, which might allow remote attackers to obtain
 > sensitive information from process memory via a crafted image.

 > CVE-2017-7594 - The OJPEGReadHeaderInfoSecTablesDcTable function in
 > tif_ojpeg.c in LibTIFF 4.0.7 allows remote attackers to cause a denial of
 > service (memory leak) via a crafted image.

 > CVE-2017-7595 - The JPEGSetupEncode function in tiff_jpeg.c in LibTIFF 4.0.7
 > allows remote attackers to cause a denial of service (divide-by-zero error
 > and application crash) via a crafted image.

 > CVE-2017-7598 - tif_dirread.c in LibTIFF 4.0.7 might allow remote attackers
 > to cause a denial of service (divide-by-zero error and application crash)
 > via a crafted image.

 > CVE-2017-7601 - LibTIFF 4.0.7 has a "shift exponent too large for 64-bit
 > type long" undefined behavior issue, which might allow remote attackers to
 > cause a denial of service (application crash) or possibly have unspecified
 > other impact via a crafted image.

 > CVE-2017-7602 - LibTIFF 4.0.7 has a signed integer overflow, which might
 > allow remote attackers to cause a denial of service (application crash) or
 > possibly have unspecified other impact via a crafted image.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x, thanks.

-- 
Bye, Peter Korsgaard
