From: Rod Boyce <buildroot@teamboyce.co.uk>
Date: Sun, 01 Jul 2007 23:43:31 +0100
Subject: [Buildroot] bug when installing C++ compiler
Message-ID: <46882E13.7040803@teamboyce.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

I have discovered on my setup that when I try and make the C++ compiler 
and install the libraries I get an error message about not being able to 
find the library libstdc++.so at the stripping stage of the 
installation.  It seems the library is installed into /lib but the strip 
command is looking at /usr/lib and this causes the build to fail.  The 
attached patch fixes this problem.

Regards,
Rod Boyce
-------------- next part --------------
A non-text attachment was scrubbed...
Name: gcc-uclibc-3.x.mk.patch
Type: text/x-patch
Size: 567 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070701/b416b940/attachment.bin 
