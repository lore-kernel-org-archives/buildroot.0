From: Will Wagner <will_wagner@carallon.com>
Date: Fri, 07 Mar 2014 10:11:13 +0000
Subject: [Buildroot] Problem with autoreconf mesa3d
Message-ID: <53199B41.5050509@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am seeing a build error whilst building mesa3d in 2014.02. The error 
occurs when autoreconf rebuilds the configure file.

In configure.ac there is the following to determine the version of mes3d:

m4_define([mesa_version],
     [m4_esyscmd([${MAKE-make} -s -f bin/version.mk version | tr -d '\n' 
| tr -d '\r'])])

The output of this should be "7.10.3"

My problem is that I have a wrapper Makefile that calls buildroot. This 
then means that when autoreconf is called make will print out the 
directory like "make: Entering directory `/foo/bar/mesa3d'."

So what I get is version being defined as

"make: Entering directory `/foo/bar/mesa3d'.7.10.3make: Leaving 
directory `/foo/bar/mesa3d'."

It easy for me to fix because I can use --no-print-directory when 
invoking buildroot from my wrapper makefile but it feels like this is an 
issue with mesa3d.

This feels like a poorly written configure.ac file. Would people agree? 
Is it worth patching it to prevent this? I know people are working on 
bumping the version of mesa so perhaps this would just go away with that?

Thanks
Will

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7471 9224
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
