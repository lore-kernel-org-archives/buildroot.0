From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Mon, 07 May 2007 12:07:41 +0100
Subject: [Buildroot] issue with ldconfig inside build-root
Message-ID: <463F087D.8010106@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have finally figured out my last problem with getting build root to 
produce a working i386 root file system.  It seems that when build root 
runs the ldconfig command to creates the file /etc/ld.so.cache it is 
adding glibc from my linux build system and not ld-uClibc from the 
uClibc build system.  This means that my root file system only ran 
static executables until I deleted this file or remade it on my target. 

I have tried to searching both the Build-root and the uClibc mailing 
lists for any reference to this but have been unable to find any mention 
of this.  So is this a known issue, am I still doing something wrong or 
am I missing something obvious?

Regards,
Rod Boyce
