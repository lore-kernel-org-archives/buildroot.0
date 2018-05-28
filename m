From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 28 May 2018 16:29:51 +0200
Subject: [Buildroot] [PATCH] cifs-utils: unconditionally disable PIE
In-Reply-To: <20180507202034.28715-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Mon, 7 May 2018 22:20:34 +0200")
References: <20180507202034.28715-1-thomas.petazzoni@bootlin.com>
Message-ID: <87efhvx38g.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > PIE support in Buildroot should be enabled via the global option
 > BR2_RELRO_FULL option, and not done on a per-package basis, therefore
 > PIE should unconditionally be disabled in the cifs-utils package.

 > This has the added side-effect that it works around a binutils bug on
 > SPARC causing the linker to segfault when PIE is enabled:

 > sparc-linux-gcc -Wall -Wextra -D_FORTIFY_SOURCE=2 -fpie -pie -Wl,-z,relro,-z,now -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os    -o mount.cifs mount.cifs.o mtab.o resolve_host.o util.o  -lcap-ng
 > collect2: fatal error: ld terminated with signal 6 [Aborted], core dumped

 > This issue will reappear when we start testing BR2_RELRO_FULL in the
 > autobuilders, but in the mean time it avoids the problem.

 > Fixes:

 >   http://autobuild.buildroot.net/results/a5342890f39bdccae1324e7d3dbe0eab1aad28e5/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
