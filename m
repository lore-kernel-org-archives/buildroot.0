From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 22 Nov 2020 15:27:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/cdrkit: fix static build with
 libmagic
In-Reply-To: <20201120180409.527540-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 20 Nov 2020 19:04:09 +0100")
References: <20201120180409.527540-1-fontaine.fabrice@gmail.com>
Message-ID: <87eeklwjo2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > libmagic is an optional dependency of gensoimage that can raise the
 > following build failure:

 > /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libmagic.a(compress.o):
 > in function `uncompressbuf':
 > compress.c:(.text+0x7bc): undefined reference to `lzma_auto_decoder'
 > /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > compress.c:(.text+0x828): undefined reference to `lzma_code'
 > /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/8.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > compress.c:(.text+0x848): undefined reference to `lzma_end'
 > collect2: error: ld returned 1 exit status
 > genisoimage/CMakeFiles/genisoimage.dir/build.make:628: recipe for target 'genisoimage/genisoimage' failed

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7e06edc363817c9c9a1687ec89e9984a90a2012d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
