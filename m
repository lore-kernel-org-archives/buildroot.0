From: Jerry Richards <jerryr@tonecommander.com>
Date: Wed, 26 Sep 2007 13:41:49 -0700
Subject: [Buildroot] Compilation Error Using Buildroot
Message-ID: <001f01c8007d$aa3e22d0$2c48a8c0@greyhawk.tonecommander.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All,

Just wanted to report that I have a work-around for the problem below.  The
build process was apparently grabbing the wrong ranlib, so just prior to
compiling the application in question, I pre-pended $PATH with the path to
the uClibc ranlib binary and the build completes successfully.

Best Regards,
Jerry



-----Original Message-----
From:
Sent: Wednesday, September 26, 2007 1:04 PM
To: 'buildroot at uclibc.org'
Subject: Compilation Error Using Buildroot


Hello All

I am using buildroot for a MIPS processor and encountered a compilation
error in an application module I added to the build environment (see build
output excerpt attachment).  It states "./.libs/libsu.a: could not read
symbols: Archive has no index; run ranlib to add one", yet a couple of lines
earlier shows "ranlib .libs/libsu.a" already executed.

Could someone take a quick look at this?  I don't see how GCC gets this
error.  Perhaps there is some configuration option missing?

Best Regards,
Jerry
-------------- next part --------------
An embedded and charset-unspecified text was scrubbed...
Name: CompilerError.txt
Url: http://busybox.net/lists/buildroot/attachments/20070926/17807678/attachment.txt 
