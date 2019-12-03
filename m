From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 03 Dec 2019 13:26:04 +0100
Subject: [Buildroot] [PATCH] package/jpeg-turbo: security bump to
 version 2.0.3
In-Reply-To: <20191124212309.31678-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sun, 24 Nov 2019 22:23:09 +0100")
References: <20191124212309.31678-1-peter@korsgaard.com>
Message-ID: <87h82hmw83.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes the following security vulnerabilities:
 > - CVE-2019-2201: In generate_jsimd_ycc_rgb_convert_neon of
 >   jsimd_arm64_neon.S, there is a possible out of bounds write due to a
 >   missing bounds check.  This could lead to remote code execution in an
 >   unprivileged process with no additional execution privileges needed.

 > For more details, see the upstream bugtracker:
 > https://github.com/libjpeg-turbo/libjpeg-turbo/issues/361

 > Additionally, it fixes a number of other issues.  From the release notes:

 > - Fixed a regression in the SIMD feature detection code, introduced by the
 >   AVX2 SIMD extensions (2.0 beta1[1]), that was known to cause an illegal
 >   instruction exception, in rare cases, on CPUs that lack support for CPUID
 >   leaf 07H (or on which the maximum CPUID leaf has been limited by way of a
 >   BIOS setting.)

 > - The 4:4:0 (h1v2) fancy (smooth) chroma upsampling algorithm in the
 >   decompressor now uses a similar bias pattern to that of the 4:2:2 (h2v1)
 >   fancy chroma upsampling algorithm, rounding up or down the upsampled
 >   result for alternate pixels rather than always rounding down.  This
 >   ensures that, regardless of whether a 4:2:2 JPEG image is rotated or
 >   transposed prior to decompression (in the frequency domain) or after
 >   decompression (in the spatial domain), the final image will be similar.

 > - Fixed a regression introduced by 2.0 beta1[15] whereby attempting to
 >   generate a progressive JPEG image on an SSE2-capable CPU using a scan
 >   script containing one or more scans with lengths divisible by 16 would
 >   result in an error ("Missing Huffman code table entry") and an invalid
 >   JPEG image.

 > - Fixed an issue whereby tjDecodeYUV() and tjDecodeYUVPlanes() would throw
 >   an error ("Invalid progressive parameters") or a warning ("Inconsistent
 >   progression sequence") if passed a TurboJPEG instance that was previously
 >   used to decompress a progressive JPEG image.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2019.02.x and 2019.08.x, thanks.

-- 
Bye, Peter Korsgaard
