From: John Parten <john.parten@passivsystems.com>
Date: Sun, 17 Dec 2017 17:15:22 +0000
Subject: [Buildroot] How to configure prefix in package-config files
Message-ID: <c79b43c3-e314-7283-d280-cafc5dbe8449@passivsystems.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Everyone in the Buildroot Community,

I am a novice with Buildroot so I hope someone can easily help me.
I have a requirement to build a cross compiled (x86->arm) toolchain, and 
then copy this to an independent path (eg /opt/XXX)
I don't seem to be able to find the mechanism to adjust the prefix in 
the package-config (.pc) files that are generated for the libraries.
I think I am looking for something in menuconfig, but perhaps that is 
where I am going wrong.
When I attempt to compile a project using the new toolchain installed at 
/opt/XXX various header files cannot be found because the library 
package control files refer to /usr/bin instead of /opt/XXX
My steps are ...
make clean
make menuconfig
... adjust for extra libraries
make
copy new toolchain to /opt/XXX

For example if I look at the zlib.pc file I see the following ...
---
prefix=/usr/bin
exec_prefix=${prefix}
libdir=${exec_prefix}/lib
sharedlibdir=${libdir}
includedir=${prefix}/include

Name: zlib
Description: zlib compression library
Version: 1.2.8

Requires:
Libs: -L${libdir} -L${sharedlibdir} -lz
Cflags: -I${includedir}
---

So how do we control the first line of this pc file?
I have tried to discern the answer from the buildroot user guide but 
maybe I missed something.
A similar question was asked here ...
http://lists.busybox.net/pipermail/buildroot/2008-April/020216.html
... but I could not see the answer
... any help much appreciated
... thanks JP
