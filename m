From: don <don_reid@comcast.net>
Date: Thu, 23 Aug 2007 20:52:43 -0700
Subject: [Buildroot] Compiler, GNU_HOST_NAME, HOST_ARCH
Message-ID: <20070824035243.GA4318@reid1.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am having trouble with the latest buildroot from svn.

Some of the early compiles are failing because it cannot find 
"i386-pc-linux-gnu-gcc".  This is a Gentoo based system which has
all the tools as i686-pc-linuc-gnu...  

I can see in packages/Makefile.in where sed is used with s/i[3-9]86/i386 .

Are the tools supposed to also exist as i386*?

I have always had CHOST="i686-pc-linux-gnu".
gcc-config shows:

	 $ gcc-config -l
	  [1] avr-3.4.6 *
	  [2] avr-3.4.6-hardened
	  [3] avr-3.4.6-hardenednopie
	  [4] avr-3.4.6-hardenednopiessp
	  [5] avr-3.4.6-hardenednossp
	  [6] i686-pc-linux-gnu-3.4.6
	  [7] i686-pc-linux-gnu-3.4.6-hardened
	  [8] i686-pc-linux-gnu-3.4.6-hardenednopie
	  [9] i686-pc-linux-gnu-3.4.6-hardenednopiessp
	  [10] i686-pc-linux-gnu-3.4.6-hardened
	  [11] i686-pc-linux-gnu-4.1.2 *

Buildroot worked for me in the past without any such problems which has
me puzzled.

Thanks for any ideas or help
Don Reid
