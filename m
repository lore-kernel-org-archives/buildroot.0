From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 10:49:50 +0200
Subject: [Buildroot] undefined macro: AM_PROG_LIBTOOL (buildroot failure)
In-Reply-To: <6306c640805281409v1bf5384ag2c1353fd4aead298@mail.gmail.com> (Ram
	kumar's message of "Thu\, 29 May 2008 02\:39\:28 +0530")
References: <6306c640805281409v1bf5384ag2c1353fd4aead298@mail.gmail.com>
Message-ID: <87k5gtyb0x.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ram" == Ram kumar <ramkumar.research@gmail.com> writes:

 Ram> hi,

 Ram>      Iam trying to build a development environment using
 Ram> buildroot for my atmel eval kit (AT91SAM9260 ek).I follow the
 Ram> instruaction in the website http://
 Ram> www.linux4sam.org/twiki/bin/view/Linux4SAM/BuildRoot. But my
 Ram> buildroot fails when it is trying to build libusb.

 Ram> First the buildroot throws 404 file not found error since
 Ram> http://ftp.debian.org /pool/main/libu/libusb/ doesn't have
 Ram> libusb_0.1.12-9.diff.gz which buildroot looks for......so i
 Ram> edited the /buildroot/package/libusb/libusb.mk file to download
 Ram> libusb_0.1.12-11.diff.gz which is present in the FTP server.

libusb missed a dependency on host-libtool and patch version bumped.
Fixed in r22311-r22313.

-- 
Bye, Peter Korsgaard
