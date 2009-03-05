From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 05 Mar 2009 14:57:06 +0100
Subject: [Buildroot] AT91RM9200df,
	some applications depend on libintl/libiconv
In-Reply-To: <1236122909.5689.22.camel@bernd-desktop> (Thomas's message of
	"Wed\, 04 Mar 2009 00\:28\:29 +0100")
References: <1236122909.5689.22.camel@bernd-desktop>
Message-ID: <87ljrkf4y5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas  <tokant@gmx.net> writes:

 Thomas> Hello,

 Thomas> I am trying to create a "light" root file system for an
 Thomas> AT91RM9200df system with the latest 2009.02 buildroot
 Thomas> release. So I disabled a lot of the packages and libraries
 Thomas> (for example libintl and libiconv) and got a partly working
 Thomas> root file system.

Did you do a clean rebuild after doing this?

 Thomas> Some of the package applications do not work, because they
 Thomas> seem to depend on libintl/libiconv: wget, chattr, lsattr
 Thomas> uuidgen, e2fsck, mke2fs and badblocks for example. They

I take this is "big" wget, and not the busybox applet? I would be
suprised if wget/e2fsprogs could build with libintl support if you
don't have that enabled.

 Thomas> terminate with "can't load library 'libintl.so.8'". These
 Thomas> applications work, if I enable libintl and libiconv, but I
 Thomas> would like to save the 800 kB which where occupied by
 Thomas> libiconv.

Any special reason why you don't use the busybox wget applet instead?

-- 
Bye, Peter Korsgaard
