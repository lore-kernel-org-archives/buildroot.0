From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jul 2020 09:16:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/libvncserver: security bump to
 version 0.9.13
In-Reply-To: <20200625220058.1690231-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 26 Jun 2020 00:00:58 +0200")
References: <20200625220058.1690231-1-fontaine.fabrice@gmail.com>
Message-ID: <878sfcj9zj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

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

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2020.02.x and 2020.05.x, thanks.

-- 
Bye, Peter Korsgaard
