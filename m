From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:28:00 +0200
Subject: [Buildroot] [PATCH 1/2] uboot: fix build when libfdt-devel is
 installed system-wide
In-Reply-To: <20180308095846.7618-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 8 Mar 2018 10:58:45 +0100")
References: <20180308095846.7618-1-thomas.petazzoni@bootlin.com>
Message-ID: <87o9j5xnhb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > When libfdt-devel is installed system-wide, the build of U-Boot host
 > programs currently fails with lots of:

 >   HOSTCC  tools/aisimage.o
 > In file included from tools/../include/../lib/libfdt/libfdt.h:10:0,
 >                  from tools/../include/libfdt.h:1,
 >                  from tools/fdt_host.h:11,
 >                  from tools/imagetool.h:24,
 >                  from tools/aisimage.c:8:
 > /usr/include/libfdt_env.h:70:30: error: conflicting types for ?fdt64_t?
 >  typedef uint64_t FDT_BITWISE fdt64_t;
 >                               ^~~~~~~
 > In file included from <command-line>:0:0:
 > ././include/libfdt_env.h:19:16: note: previous declaration of ?fdt64_t? was here
 >  typedef __be64 fdt64_t;
 >                 ^~~~~~~
 > In file included from ././include/libfdt_env.h:12:0,
 >                  from <command-line>:0:
 > /usr/include/libfdt_env.h:90:24: error: expected ?)? before ?x?
 >  static inline uint32_t fdt32_to_cpu(fdt32_t x)
 >                         ^

 > This commit adds a fixup in the U-Boot code to fix this problem. The
 > fixup is equivalent to applying upstream commit
 > http://git.denx.de/?p=u-boot.git;a=commitdiff;h=e0d20dc1521e74b82dbd69be53a048847798a90a,
 > but we can't use a patch for the uboot package, since people are using
 > arbitrary versions.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
