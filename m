From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 22:53:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: security bump to
 version 0.9.13
In-Reply-To: <20200625220058.1690231-1-fontaine.fabrice@gmail.com>
References: <20200625220058.1690231-1-fontaine.fabrice@gmail.com>
Message-ID: <20200714225317.4f6aabb0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 26 Jun 2020 00:00:58 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Drop all patches (already in version)
> - Fix CVE-2018-21247: An issue was discovered in LibVNCServer before
>   0.9.13. There is an information leak (of uninitialized memory contents)
>   in the libvncclient/rfbproto.c ConnectToRFBRepeater function.
> - Fix CVE-2019-20839: libvncclient/sockets.c in LibVNCServer before
>   0.9.13 has a buffer overflow via a long socket filename.
> - Fix CVE-2019-20840: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/ws_decode.c can lead to a crash because of
>   unaligned accesses in hybiReadAndDecode.
> - Fix CVE-2020-14396: An issue was discovered in LibVNCServer before
>   0.9.13. libvncclient/tls_openssl.c has a NULL pointer dereference.
> - Fix CVE-2020-14397: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/rfbregion.c has a NULL pointer dereference.
> - Fix CVE-2020-14398: An issue was discovered in LibVNCServer before
>   0.9.13. An improperly closed TCP connection causes an infinite loop in
>   libvncclient/sockets.c.
> - Fix CVE-2020-14399: An issue was discovered in LibVNCServer before
>   0.9.13. Byte-aligned data is accessed through uint32_t pointers in
>   libvncclient/rfbproto.c.
> - Fix CVE-2020-14400: An issue was discovered in LibVNCServer before
>   0.9.13. Byte-aligned data is accessed through uint16_t pointers in
>   libvncserver/translate.c.
> - Fix CVE-2020-14401: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/scale.c has a pixel_value integer overflow.
> - Fix CVE-2020-14402: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/corre.c allows out-of-bounds access via
>   encodings.
> - Fix CVE-2020-14403: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/hextile.c allows out-of-bounds access via
>   encodings.
> - Fix CVE-2020-14404: An issue was discovered in LibVNCServer before
>   0.9.13. libvncserver/rre.c allows out-of-bounds access via encodings.
> - Fix CVE-2020-14405: An issue was discovered in LibVNCServer before
>   0.9.13. libvncclient/rfbproto.c does not limit TextChat size.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...1-CMakeLists.txt-fix-build-without-C.patch | 33 ------------
>  ...lient-server-.pc.cmakein-remove-zlib.patch | 45 ----------------
>  ...-in-rfbProcessFileTransferReadBuffer.patch | 47 ----------------
>  ...on-t-leak-stack-memory-to-the-remote.patch | 26 ---------
>  ...on-t-build-tight.c-without-png-or-zl.patch | 54 -------------------
>  ...rsor-limit-width-height-input-values.patch | 40 --------------
>  package/libvncserver/libvncserver.hash        |  2 +-
>  package/libvncserver/libvncserver.mk          | 11 +---
>  8 files changed, 2 insertions(+), 256 deletions(-)
>  delete mode 100644 package/libvncserver/0001-CMakeLists.txt-fix-build-without-C.patch
>  delete mode 100644 package/libvncserver/0002-libvnc-client-server-.pc.cmakein-remove-zlib.patch
>  delete mode 100644 package/libvncserver/0003-Limit-lenght-to-INT_MAX-bytes-in-rfbProcessFileTransferReadBuffer.patch
>  delete mode 100644 package/libvncserver/0004-rfbserver-don-t-leak-stack-memory-to-the-remote.patch
>  delete mode 100644 package/libvncserver/0005-CMakeLists.txt-don-t-build-tight.c-without-png-or-zl.patch
>  delete mode 100644 package/libvncserver/0006-libvncclient-cursor-limit-width-height-input-values.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
