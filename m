From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 31 Mar 2019 15:13:47 +0200
Subject: [Buildroot] [PATCH v2,1/2] package/oniguruma: new package
In-Reply-To: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
References: <20190320203617.27496-1-fontaine.fabrice@gmail.com>
Message-ID: <20190331151347.0c9af394@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 20 Mar 2019 21:36:16 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +libtool: compile: /home/fabrice/buildroot/output/host/bin/m68k-linux-gcc -DHAVE_CONFIG_H -I. -I.. -I/usr/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> +-D_FILE_OFFSET_BITS=64 -Wall -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -fno-dwarf2-cfi-asm -Wl,-elf2flt -c regparse.c -o regparse.o
> +m68k-linux-gcc: ERROR: unsafe header/library path used in cross-compilation: '-I/usr/include'

Just a quick comment: reporting this particular error message to
upstream projects doesn't make sense, because it's a special error
message added by the Buildroot toolchain wrapper, i.e it's Buildroot
specific.

When reporting this sort of issues upstream, you should simply say
something like "Adding -I/usr/include when cross-compiling is
incorrect, as /usr/include contains headers for the build system, not
the target system" or something like that.

The rest of the patch looks good to me, but I have some questions on
the second patch.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
