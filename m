From: Pavel Roskin <proski@gnu.org>
Date: Fri, 01 Dec 2006 03:17:20 -0500
Subject: [Buildroot] Build fails with zlib.h not found
In-Reply-To: <456F5CEE.7060405@moser-engineering.de>
References: <456F5CEE.7060405@moser-engineering.de>
Message-ID: <1164961040.4870.74.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2006-11-30 at 23:36 +0100, Michael Moser wrote:
> I try to build a tool chain and initial filesystem for a xscale
> prozessor which uses a jffs2 file system. This fails with the following
> messages:
> 
>  > make[1]: Entering directory `/home/michael/development/buildroot/toolchain_build_arm/mtd_orig/util'
>  > gcc -I../include -O2 -Wall -g -c -o mkfs.jffs2.o mkfs.jffs2.c -g -Wp,-MD,.mkfs.jffs2.c.dep
>  > mkfs.jffs2.c:68:18: zlib.h: File or Directory not found
[skip]
> Can anyone give me some hints?

Since mkfs.jffs2.c is compiled by gcc for the host system, you need the
zlib development package on the host system.  It's called zlib-devel on
Fedora and provides both the header and the library.  I'm not sure about
other distros, but it's likely a similar name, something matching
{libz,zlib}{,1}-{dev,devel}

-- 
Regards,
Pavel Roskin
