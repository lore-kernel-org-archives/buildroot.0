From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 23:28:09 +0200
Subject: [Buildroot] [PATCH 2/2] uboot-tools: backport patch fixing
 build failure with libfdt-devel installed
In-Reply-To: <20180308095846.7618-2-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Thu, 8 Mar 2018 10:58:46 +0100")
References: <20180308095846.7618-1-thomas.petazzoni@bootlin.com>
 <20180308095846.7618-2-thomas.petazzoni@bootlin.com>
Message-ID: <87k1ttxnh2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > U-Boot host programs fail to build when libfdt-devel is installed
 > system-wide, with errors like this:

 >       HOSTCC  tools/aisimage.o
 >     In file included from tools/../include/../lib/libfdt/libfdt.h:10:0,
 >                      from tools/../include/libfdt.h:1,
 >                      from tools/fdt_host.h:11,
 >                      from tools/imagetool.h:24,
 >                      from tools/aisimage.c:8:
 >     /usr/include/libfdt_env.h:70:30: error: conflicting types for ?fdt64_t?
 >      typedef uint64_t FDT_BITWISE fdt64_t;
 >                                   ^~~~~~~
 >     In file included from <command-line>:0:0:
 >     ././include/libfdt_env.h:19:16: note: previous declaration of ?fdt64_t? was here
 >      typedef __be64 fdt64_t;
 >                     ^~~~~~~
 >     In file included from ././include/libfdt_env.h:12:0,
 >                      from <command-line>:0:
 >     /usr/include/libfdt_env.h:90:24: error: expected ?)? before ?x?
 >      static inline uint32_t fdt32_to_cpu(fdt32_t x)
 >                             ^
 > This commit backports an upstream patch that fixes this problem.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
