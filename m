From: Thomas <tokant@gmx.net>
Date: Wed, 04 Mar 2009 00:28:29 +0100
Subject: [Buildroot] AT91RM9200df,
	some applications depend on libintl/libiconv
Message-ID: <1236122909.5689.22.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am trying to create a "light" root file system for an AT91RM9200df
system with the latest 2009.02 buildroot release. So I disabled a lot of
the packages and libraries (for example libintl and libiconv) and got a
partly working root file system.

Some of the package applications do not work, because they seem to
depend on libintl/libiconv: wget, chattr, lsattr uuidgen, e2fsck, mke2fs
and badblocks for example. They terminate with "can't load library
'libintl.so.8'". These applications work, if I enable libintl and
libiconv, but I would like to save the 800 kB which where occupied by
libiconv.

Is this by design now, or did I configure something wrong, or is this a
buildroot problem? 

Thanks, Thomas.
