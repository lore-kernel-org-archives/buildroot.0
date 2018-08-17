From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 17 Aug 2018 16:51:29 +0200
Subject: [Buildroot] [PATCH 1/3] sheevaplug_defconfig: bump u-boot to
 2018.07 to fix build issue
In-Reply-To: <20180816201139.19656-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 16 Aug 2018 22:11:37 +0200")
References: <20180816201139.19656-1-peter@korsgaard.com>
Message-ID: <876009caha.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > u-boot 2016.05 no longer builds with the default gcc/binutils versions:
 > https://gitlab.com/buildroot.org/buildroot/-/jobs/88314946

 >   LD      u-boot
 > fs/built-in.o: In function `read_symbol':
 > /builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:129: undefined reference to `pull_bit'
 > fs/built-in.o: In function `decompress_huffman':
 > /builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:159: undefined reference to `pull_bits'
 > /builds/buildroot.org/buildroot/output/build/uboot-2016.05/fs/jffs2/mini_inflate.c:170: undefined reference to `pull_bits'
 > ..
 > /builds/buildroot.org/buildroot/output/host/bin/arm-buildroot-linux-uclibcgnueabi-ld.bfd: BFD (GNU Binutils) 2.29.1 assertion fail elf32-arm.c:9509
 > Makefile:1192: recipe for target 'u-boot' failed
 > make[1]: *** [u-boot] Error 1
 > make[1]: Leaving directory '/builds/buildroot.org/buildroot/output/build/uboot-2016.05'

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed all 3, thanks.

-- 
Bye, Peter Korsgaard
