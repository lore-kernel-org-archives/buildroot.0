From: Scott Moore <scott.moore@sri.com>
Date: Fri, 27 Jul 2012 15:27:23 -0700
Subject: [Buildroot] Help adding a prerequisite to GCC
Message-ID: <501315CB.2080809@sri.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I'm trying to compile a toolchain with LTO support in gcc.
I tried to do this by adding the additional gcc flag "--enable-lto", but 
the build fails (unsurprisingly) because building gcc with lto support 
requires libelf, which is not currently a prerequisite for gcc in buildroot.

To fix this, I tried adding libelf to gcc-uclibc-4.x.mk by adding:
GCC_HOST_PREREQ += host-libelf
GCC_TARGET_PREREQ += libelf

The resulting build fails because their is "no make target host-libelf, 
required for gcc_initial". Can anyone help me figure out where I went 
wrong? I realize just hacking it in to the .mk like that probably isn't 
ideal. I was planning to add it as a menuconfig option once I get it 
building at all.
Thanks in advance,
Scott
