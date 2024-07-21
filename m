Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE8C3DA5D
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 09:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 096FC40572;
	Sun, 21 Jul 2024 09:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vbb11cfZ7qMY; Sun, 21 Jul 2024 09:17:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E16E6404A0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E16E6404A0;
	Sun, 21 Jul 2024 09:17:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2CDCD1BF86C
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A45960755
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 09:17:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qp3GVy7kI5Ee for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 09:17:42 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom; client-ip=176.9.89.163;
 helo=serv15.avernis.de; envelope-from=br015@umbiko.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 91B896074E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91B896074E
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 91B896074E
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 09:17:40 +0000 (UTC)
Received: by serv15.avernis.de (Postfix) with ESMTPSA id 98BF3BDE5E0F;
 Sun, 21 Jul 2024 11:17:37 +0200 (CEST)
MIME-Version: 1.0
Date: Sun, 21 Jul 2024 09:17:37 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: frank-w@public-files.de
In-Reply-To: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
References: <mailman.12142.1721505316.24059.buildroot@buildroot.org>
Message-ID: <f49923df9029dfb3217cb858d0be4f69@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 1.0.5 at serv15.avernis.de
X-Virus-Status: Clean
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=umbiko.net; s=mail; 
 t=1721553457; bh=HbeTDzWTVxbgOWkGOTK/9c9POK/2Ebt+klmx3KuKtYg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References;
 b=S0D9JYULto1ZfqSXfu6HBLDd/I/DVxHh0xx4n9NTSUxYm93JxMyWgNb4OGf6TEOGC
 XpIl76g5wYkN8ly+mtJ8Ljw0j/w75OovQN52Z/ZrqCaFIzls18HBggSm3mF8L847+f
 6mSC4bmmeyBiArdS1Dwe2/3FBT5biUdHhBcqFMV4=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=umbiko.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=umbiko.net header.i=@umbiko.net header.a=rsa-sha256
 header.s=mail header.b=S0D9JYUL
Subject: Re: [Buildroot] lvm2 seems to require systemd
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Frank,

On 2024-07-20 14:34, Frank Wunderlich wrote:
> Hi,
> 
> i try to build a buildroot (2024.05) initrd with lvm2 support
> 
> so basicly added these options:
> 
> #to select BR2_PACKAGE_HAS_UDEV
> BR2_PACKAGE_EUDEV=y
> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
> BR2_PACKAGE_LIBBLOCKDEV=y
> BR2_PACKAGE_LVM2=y
> 
> build is fine, but i see this while bootup:
> 
> [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run' 
> '/usr/bin/systemd-run --no-block --property DefaultDependencies=
> no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay 
> --autoactivation event vg-nvme': No such file or directory
> done

lvm2 installs a bunch of udev rules; one of them relies on systemd-run 
to execute a command in the background:

# pvscan will check if this device completes a VG,
# i.e. all PVs in the VG are now present with the
# arrival of this PV.  If so, it prints to stdout:
# LVM_VG_NAME_COMPLETE='foo'
#
# When the VG is complete it can be activated, so
# vgchange -aay <vgname> is run.  It is run via
# systemd since it can take longer to run than
# udev wants to block when processing rules.
# (if there are hundreds of LVs to activate,
# the vgchange can take many seconds.)

...

IMPORT{program}="/usr/sbin/lvm pvscan --cache --listvg --checkcomplete 
--vgonline --autoactivation event --udevoutput --journal=output 
$env{DEVNAME}"
ENV{LVM_VG_NAME_COMPLETE}=="?*", RUN+="/usr/bin/systemd-run --no-block 
--property DefaultDependencies=no --unit 
lvm-activate-$env{LVM_VG_NAME_COMPLETE} /usr/sbin/lvm vgchange -aay 
--autoactivation event $env{LVM_VG_NAME_COMPLETE}"
GOTO="lvm_end"

> i see the physical volume, but logical volumes are disabled
> 
> # pvscan
>   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
> # vgscan
>   Found volume group "vg-nvme" using metadata type lvm2
> # lvscan
>   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
> 
> and so i cannot mount the logical volume
> 
> # mount /dev/vg-nvme/var /mnt
> [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
> [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
> mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or 
> directory
> 
> any ideas?

I would try to run vgchange manually to see if the setup works at all, 
then create a /usr/bin/systemd-run script that is able to execute 
commands in the background. Something like this (untested):

   #!/bin/sh
   prg=$1
   shift
   (
     $prg $@ < /dev/zero > /tmp/error.log 2>&1
   )&

Kind regards,
Andreas

> regards Frank
> 
> 
> 
> ------------------------------
> 
> Message: 16
> Date: Sat, 20 Jul 2024 14:40:08 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Kelvin Cheung <keguang.zhang@gmail.com>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/cpuload: fix build with gcc
> 	>= 14
> Message-ID: <20240720124008.460751-1-fontaine.fabrice@gmail.com>
> 
> Fix the following build failure with gcc >= 14:
> 
> read_cpu_stat.c: In function 'cpudata_new':
> read_cpu_stat.c:49:17: error: implicit declaration of function 'error'; 
> did you mean 'perror'? [-Wimplicit-function-declaration]
>    49 |                 error("too many cpus");
>       |                 ^~~~~
>       |                 perror
> 
> Fixes:
>  - 
> http://autobuild.buildroot.org/results/3bca2659011d123d7b7a0ca19c4e868643d45766
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0001-Changed-error-calls-to-perror.patch  | 115 ++++++++++++++++++
>  1 file changed, 115 insertions(+)
>  create mode 100644 
> package/cpuload/0001-Changed-error-calls-to-perror.patch
> 
> diff --git a/package/cpuload/0001-Changed-error-calls-to-perror.patch 
> b/package/cpuload/0001-Changed-error-calls-to-perror.patch
> new file mode 100644
> index 0000000000..6672bec677
> --- /dev/null
> +++ b/package/cpuload/0001-Changed-error-calls-to-perror.patch
> @@ -0,0 +1,115 @@
> +From ffd61eaa72acf123dea0c80ed3774656289ab49f Mon Sep 17 00:00:00 2001
> +From: roiec <roiec@D-H-ROIEC-LX-WW1.com>
> +Date: Wed, 5 Jan 2022 17:12:05 +0200
> +Subject: [PATCH] Changed 'error' calls to 'perror'
> +
> +Upstream: https://github.com/kelvincheung/cpuload/pull/1
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + .gitignore           | 60 
> ++++++++++++++++++++++++++++++++++++++++++++
> + src/graph_cpu_load.c |  4 +--
> + src/read_cpu_stat.c  |  2 +-
> + 3 files changed, 63 insertions(+), 3 deletions(-)
> + create mode 100644 .gitignore
> +
> +diff --git a/.gitignore b/.gitignore
> +new file mode 100644
> +index 0000000..c2ae907
> +--- /dev/null
> ++++ b/.gitignore
> +@@ -0,0 +1,60 @@
> ++# Prerequisites
> ++*.d
> ++
> ++# Object files
> ++*.o
> ++*.ko
> ++*.obj
> ++*.elf
> ++
> ++# Linker output
> ++*.ilk
> ++*.map
> ++*.exp
> ++
> ++# Precompiled Headers
> ++*.gch
> ++*.pch
> ++
> ++# Libraries
> ++*.lib
> ++*.a
> ++*.la
> ++*.lo
> ++
> ++# Shared objects (inc. Windows DLLs)
> ++*.dll
> ++*.so
> ++*.so.*
> ++*.dylib
> ++
> ++# Executables
> ++*.exe
> ++*.out
> ++*.app
> ++*.i*86
> ++*.x86_64
> ++*.hex
> ++
> ++# Debug files
> ++*.dSYM/
> ++*.su
> ++*.idb
> ++*.pdb
> ++
> ++# Kernel Module Compile Results
> ++*.mod*
> ++*.cmd
> ++.tmp_versions/
> ++modules.order
> ++Module.symvers
> ++Mkfile.old
> ++dkms.conf
> ++
> ++#images
> ++*.tgz
> ++*.img
> ++
> ++
> ++#build
> ++configure
> +diff --git a/src/graph_cpu_load.c b/src/graph_cpu_load.c
> +index e4b7785..525d9ed 100644
> +--- a/src/graph_cpu_load.c
> ++++ b/src/graph_cpu_load.c
> +@@ -132,7 +132,7 @@ void graph_new_line(char *str, unsigned long 
> color)
> + 	graph_last_x = graph_last_y = -1;
> +
> + 	if (graph_data_index >= MAX_GRAPH_DATA - 2)
> +-		error("Too many graph data.");
> ++		perror("Too many graph data.");
> +
> + 	graph_data[graph_data_index++] = DATUM_COLOR;
> + 	graph_data[graph_data_index++] = color;
> +@@ -145,7 +145,7 @@ void graph_new_line(char *str, unsigned long 
> color)
> + void graph_add_point(int size, int amount)
> + {
> + 	if (graph_data_index >= MAX_GRAPH_DATA - 4)
> +-		error("Too many graph data.");
> ++		perror("Too many graph data.");
> +
> + 	graph_data[graph_data_index++] = DATUM_SIZE;
> + 	graph_data[graph_data_index++] = size;
> +diff --git a/src/read_cpu_stat.c b/src/read_cpu_stat.c
> +index 3d014be..ff51d7f 100644
> +--- a/src/read_cpu_stat.c
> ++++ b/src/read_cpu_stat.c
> +@@ -46,7 +46,7 @@ ProcessList *cpudata_new(void)
> + 	fclose(file);
> +
> + 	if (cpu > cpus -1) {
> +-		error("too many cpus");
> ++		perror("too many cpus");
> + 		exit(1);
> + 	}
> +
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 17
> Date: Sat, 20 Jul 2024 16:26:29 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/autossh: fix build with gcc
> 	>= 14
> Message-ID: <20240720142629.747083-1-fontaine.fabrice@gmail.com>
> 
> Include stdio.h to avoid that __progname check wrongly returned that
> the function is unavailable with gcc >= 14 which enables
> -Werror=implicit-function-declaration
> (https://gcc.gnu.org/gcc-14/porting_to.html):
> 
> configure:5231: checking if libc defines __progname
> configure:5249: 
> /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc 
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
> conftest.c: In function 'main':
> conftest.c:73:27: error: implicit declaration of function 'printf' 
> [-Wimplicit-function-declaration]
>    73 |  extern char *__progname; printf("%s", __progname);
>       |                           ^~~~~~
> conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 
> 'printf'
>     1 | /* confdefs.h */
> conftest.c:73:27: warning: incompatible implicit declaration of 
> built-in function 'printf' [-Wbuiltin-declaration-mismatch]
>    73 |  extern char *__progname; printf("%s", __progname);
>       |                           ^~~~~~
> conftest.c:73:27: note: include '<stdio.h>' or provide a declaration of 
> 'printf'
> 
> resulting in the following static build failure:
> 
> /home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: 
> /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): 
> multiple definition of `__progname'; autossh.o:(.bss+0x120): first 
> defined here
> 
> Fixes:
>  - 
> http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ....ac-fix-__progname-check-with-gcc-14.patch | 52 +++++++++++++++++++
>  package/autossh/autossh.mk                    |  1 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 
> package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
> 
> diff --git 
> a/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch 
> b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
> new file mode 100644
> index 0000000000..a517328110
> --- /dev/null
> +++ 
> b/package/autossh/0001-configure.ac-fix-__progname-check-with-gcc-14.patch
> @@ -0,0 +1,52 @@
> +From 3a74eff481f37975e04f00db4923b1c16f93497d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Sat, 20 Jul 2024 16:06:37 +0200
> +Subject: [PATCH] configure.ac: fix __progname check with gcc >= 14
> +
> +Include stdio.h to avoid that __progname check wrongly returns that
> +the function is unavailable with gcc >= 14 which enables
> +-Werror=implicit-function-declaration
> +(https://gcc.gnu.org/gcc-14/porting_to.html):
> +
> +configure:5231: checking if libc defines __progname
> +configure:5249: 
> /home/autobuild/autobuild/instance-7/output-1/host/bin/sh4-buildroot-linux-musl-gcc 
> -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
> -D_FILE_OFFSET_BITS=64  -Os -g0  -static -Wall -D_LARGEFILE_SOURCE 
> -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -static conftest.c  >&5
> +conftest.c: In function 'main':
> +conftest.c:73:27: error: implicit declaration of function 'printf' 
> [-Wimplicit-function-declaration]
> +   73 |  extern char *__progname; printf("%s", __progname);
> +      |                           ^~~~~~
> +conftest.c:1:1: note: include '<stdio.h>' or provide a declaration of 
> 'printf'
> +    1 | /* confdefs.h */
> +conftest.c:73:27: warning: incompatible implicit declaration of 
> built-in function 'printf' [-Wbuiltin-declaration-mismatch]
> +   73 |  extern char *__progname; printf("%s", __progname);
> +      |                           ^~~~~~
> +conftest.c:73:27: note: include '<stdio.h>' or provide a declaration 
> of 'printf'
> +
> +resulting in the following static build failure:
> +
> +/home/autobuild/autobuild/instance-7/output-1/host/lib/gcc/sh4-buildroot-linux-musl/14.1.0/../../../../sh4-buildroot-linux-musl/bin/ld: 
> /home/autobuild/autobuild/instance-7/output-1/host/sh4-buildroot-linux-musl/sysroot/lib/libc.a(libc.o):(.bss.__progname+0x0): 
> multiple definition of `__progname'; autossh.o:(.bss+0x120): first 
> defined here
> +
> +Fixes:
> + - 
> http://autobuild.buildroot.org/results/5d80a8096d0f5529cbd86903a74f3bab3d230f4a
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/Autossh/autossh/pull/9
> +---
> + configure.ac | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 4bb9380..dadb523 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -132,7 +132,7 @@ AC_CHECK_LIB(socket, connect)
> + # ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING 
> OUT OF
> + # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
> + AC_CACHE_CHECK([if libc defines __progname], 
> ac_cv_libc_defines___progname, [
> +-	AC_TRY_LINK([],
> ++	AC_TRY_LINK([ #include <stdio.h> ],
> + 		[ extern char *__progname; printf("%s", __progname); ],
> + 		[ ac_cv_libc_defines___progname="yes" ],
> + 		[ ac_cv_libc_defines___progname="no" ]
> +--
> +2.43.0
> +
> diff --git a/package/autossh/autossh.mk b/package/autossh/autossh.mk
> index 899e5cdb52..fbb525bcca 100644
> --- a/package/autossh/autossh.mk
> +++ b/package/autossh/autossh.mk
> @@ -10,6 +10,7 @@ AUTOSSH_SOURCE = autossh-$(AUTOSSH_VERSION).tgz
>  AUTOSSH_LICENSE = Modified BSD
>  AUTOSSH_LICENSE_FILES = autossh.c
>  # Fix AC_ARG_WITH code generation for --with-ssh
> +# 0001-configure.ac-fix-__progname-check-with-gcc-14.patch
>  AUTOSSH_AUTORECONF = YES
> 
>  AUTOSSH_CONF_OPTS = --with-ssh=/usr/bin/ssh
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 18
> Date: Sat, 20 Jul 2024 16:48:31 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable -Werror
> Message-ID: <20240720144831.1085523-1-fontaine.fabrice@gmail.com>
> 
> Disable -Werror to avoid the following build failure raised since 
> switch
> to meson-package in commit 37dded43ae681e8319d7b76f9a612c71991467a9:
> 
> ../stlinkv3_spi.c: In function 'stlinkv3_spi_init':
> ../stlinkv3_spi.c:508:12: error: 'stlinkv3_handle' may be used 
> uninitialized [-Werror=maybe-uninitialized]
>   508 |         if (!stlinkv3_handle) {
>       |            ^
> ../stlinkv3_spi.c:485:31: note: 'stlinkv3_handle' was declared here
>   485 |         libusb_device_handle *stlinkv3_handle;
>       |                               ^~~~~~~~~~~~~~~
> 
> Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
>  - 
> http://autobuild.buildroot.org/results/eecabbdd0d21344991379a57e605845e73ef679e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flashrom/flashrom.mk 
> b/package/flashrom/flashrom.mk
> index 60774b9621..0b474caab4 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -15,7 +15,8 @@ FLASHROM_CONF_OPTS = \
>  	-Dclassic_cli_print_wiki=disabled \
>  	-Dich_descriptors_tool=enabled \
>  	-Dtests=disabled \
> -	-Duse_internal_dmi=true
> +	-Duse_internal_dmi=true \
> +	-Dwerror=false
> 
>  FLASHROM_PROGRAMMERS = \
>  	buspirate_spi \
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 19
> Date: Sat, 20 Jul 2024 16:50:18 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/flashrom: fix satamv handling
> Message-ID: <20240720145018.1087079-1-fontaine.fabrice@gmail.com>
> 
> satamv is only available on x86 resulting in the following build 
> failure
> since switch to meson-package in commit
> 37dded43ae681e8319d7b76f9a612c71991467a9:
> 
> ../output-1/build/flashrom-1.3.0/meson.build:475:6: ERROR: Problem 
> encountered: satamv selected but not supported on this platform
> 
> Fixes: 37dded43ae681e8319d7b76f9a612c71991467a9
>  - 
> http://autobuild.buildroot.org/results/c689bf039d7686a9b42c6fcb84f87b555a9bcfb6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/flashrom/flashrom.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/flashrom/flashrom.mk 
> b/package/flashrom/flashrom.mk
> index 0b474caab4..478b53e1ac 100644
> --- a/package/flashrom/flashrom.mk
> +++ b/package/flashrom/flashrom.mk
> @@ -65,7 +65,6 @@ FLASHROM_PROGRAMMERS += \
>  	nicintel_eeprom \
>  	nicintel_spi \
>  	ogp_spi \
> -	satamv \
>  	satasii
> 
>  ifeq ($(BR2_i386)$(BR2_x86_64),y)
> @@ -74,7 +73,8 @@ FLASHROM_PROGRAMMERS += \
>  	atapromise \
>  	nic3com \
>  	nicnatsemi \
> -	nicrealtek
> +	nicrealtek \
> +	satamv
>  endif
>  endif
> 
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 20
> Date: Sat, 20 Jul 2024 17:31:13 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Alexey Lukyanchuk <skif@skif-web.ru>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/zabbix: fix patch fuzz
> Message-ID: <20240720153113.1371411-1-fontaine.fabrice@gmail.com>
> 
> Fix patch fuzz to avoid the following build failure raised since commit
> 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:
> 
> Applying 0002-fix-build-with-libressl-3.5.0.patch using patch:
> patching file include/zbxcomms.h
> Hunk #1 succeeded at 210 (offset -43 lines).
> patching file src/libs/zbxcomms/tls.c
> Hunk #1 FAILED at 30.
> 1 out of 1 hunk FAILED -- saving rejects to file 
> src/libs/zbxcomms/tls.c.rej
> 
> While at it, also fix Upstream tags
> 
> Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
>  - 
> http://autobuild.buildroot.org/results/75dfe12312b5479669fcdfea623d93880c675e13
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .checkpackageignore                                       | 2 --
>  .../0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch     | 2 +-
>  package/zabbix/0002-fix-build-with-libressl-3.5.0.patch   | 8 ++++----
>  3 files changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index f0fa13eb4f..6d51e80b99 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -1478,8 +1478,6 @@ 
> package/yajl/0003-Link-with-shared-libyajl-in-a-shared-build.patch 
> lib_patch.Ups
>  
> package/yajl/0004-Link-libyajl-_s-with-libm-when-isnan-is-not-brought-.patch 
> lib_patch.Upstream
>  package/ympd/0001-only-c-language.patch lib_patch.Upstream
>  package/ympd/0002-added-forward-declarations.patch lib_patch.Upstream
> -package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch 
> lib_patch.Upstream
> -package/zabbix/0002-fix-build-with-libressl-3.5.0.patch 
> lib_patch.Upstream
>  package/zic/0001-remove-dependency-check-on-version-file.patch 
> lib_patch.Upstream
>  
> package/zip/0001-configure-Remove-Check-C-compiler-type-optimization-.patch 
> lib_patch.Upstream
>  package/zip/0002-configure-Don-t-use-host-CPP.patch lib_patch.Upstream
> diff --git 
> a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch 
> b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> index ffb1f54ba2..6c742b0d0a 100644
> --- a/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> +++ b/package/zabbix/0001-m4-netsnmp.m4-fix-shared-netsnmp-build.patch
> @@ -16,7 +16,7 @@ Fixes:
>   - 
> http://autobuild.buildroot.org/results/0f541e45d1fa27b3302968683bf64949131ec1c9
> 
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/zabbix/zabbix/pull/61]
> +Upstream: https://github.com/zabbix/zabbix/pull/61
>  ---
>   m4/netsnmp.m4 | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> diff --git a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch 
> b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
> index acb5cfc9a6..ad6960f329 100644
> --- a/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
> +++ b/package/zabbix/0002-fix-build-with-libressl-3.5.0.patch
> @@ -30,7 +30,7 @@ Fixes:
>   - 
> http://autobuild.buildroot.org/results/acdfcb17b39d438ccf5e4621707a10f60577d233
> 
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: not sent (no feedback on first patch)]
> +Upstream: not sent (no feedback on first patch)
>  ---
>   include/zbxcomms.h      | 3 ++-
>   src/libs/zbxcomms/tls.c | 5 +++--
> @@ -54,9 +54,9 @@ diff --git a/src/libs/zbxcomms/tls.c 
> b/src/libs/zbxcomms/tls.c
>  index 54ab0a6ef4..bd4075b3e4 100644
>  --- a/src/libs/zbxcomms/tls.c
>  +++ b/src/libs/zbxcomms/tls.c
> -@@ -30,8 +30,9 @@
> - #include "zbxstr.h"
> - #include "zbxtime.h"
> +@@ -28,8 +28,9 @@
> + #include "log.h"
> + #include "zbxcrypto.h"
> 
>  -#if defined(HAVE_OPENSSL) && OPENSSL_VERSION_NUMBER < 0x1010000fL || 
> defined(LIBRESSL_VERSION_NUMBER)
>  -/* for OpenSSL 1.0.1/1.0.2 (before 1.1.0) or LibreSSL */
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 21
> Date: Sat, 20 Jul 2024 19:38:34 +0200
> From: Julien Olivain <ju.o@free.fr>
> To: buildroot@buildroot.org
> Cc: Julien Olivain <ju.o@free.fr>
> Subject: [Buildroot] [PATCH 1/1] support/testing: add gpsd runtime
> 	testing
> Message-ID: <20240720173834.302209-1-ju.o@free.fr>
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  DEVELOPERS                                    |  2 +
>  support/testing/tests/package/test_gpsd.py    | 56 +++++++++++++++++++
>  .../rootfs-overlay/root/udp-nmea.log          |  6 ++
>  3 files changed, 64 insertions(+)
>  create mode 100644 support/testing/tests/package/test_gpsd.py
>  create mode 100644 
> support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c4f1565edd..5495f7a3f2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1870,6 +1870,8 @@ F:	support/testing/tests/package/test_gnuplot.py
>  F:	support/testing/tests/package/test_gnuplot/
>  F:	support/testing/tests/package/test_gnuradio.py
>  F:	support/testing/tests/package/test_gnuradio/
> +F:	support/testing/tests/package/test_gpsd.py
> +F:	support/testing/tests/package/test_gpsd/
>  F:	support/testing/tests/package/test_gzip.py
>  F:	support/testing/tests/package/test_highway.py
>  F:	support/testing/tests/package/test_hwloc.py
> diff --git a/support/testing/tests/package/test_gpsd.py 
> b/support/testing/tests/package/test_gpsd.py
> new file mode 100644
> index 0000000000..deed586c17
> --- /dev/null
> +++ b/support/testing/tests/package/test_gpsd.py
> @@ -0,0 +1,56 @@
> +import os
> +import time
> +
> +import infra.basetest
> +
> +
> +class TestGpsd(infra.basetest.BRTest):
> +    rootfs_overlay = \
> +        infra.filepath("tests/package/test_gpsd/rootfs-overlay")
> +    # This test is using the gpsfake Python script.
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        f"""
> +        BR2_PACKAGE_GPSD=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_ROOTFS_OVERLAY="{rootfs_overlay}"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", 
> "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        # We check the program can execute.
> +        self.assertRunOk("gpsd --version")
> +
> +        # Since gpsd needs a real GPS device, we stop the service.
> +        self.assertRunOk("/etc/init.d/S50gpsd stop")
> +
> +        # We start the "gpsfake" GPS emulator instead.
> +        cmd = "gpsfake"
> +        cmd += " --slow --cycle 0.1 --quiet"
> +        cmd += "/root/udp-nmea.log &> /dev/null &"
> +        self.assertRunOk(cmd)
> +
> +        # Wait a bit, to let the gpsfake and gpsd to settle...
> +        time.sleep(3 * self.timeout_multiplier)
> +
> +        # List the GPS devices. We should see our local UDP test GPS.
> +        out, ret = self.emulator.run("gpsctl")
> +        self.assertEqual(ret, 0)
> +        self.assertTrue(out[0].startswith("udp://127.0.0.1"))
> +        self.assertIn("NMEA0183", out[0])
> +
> +        # Collect some of our fake GPS data, and check we got the
> +        # coordinates from our test data file.
> +        # Our expected coordinates are:
> +        # https://www.openstreetmap.org/#map=19/43.60439/1.44336
> +        out, ret = self.emulator.run("gpscsv --header 0 --count 3")
> +        self.assertEqual(ret, 0)
> +        _, gps_lat, gps_long, _ = out[0].split(",")
> +        self.assertAlmostEqual(float(gps_lat), 43.60439)
> +        self.assertAlmostEqual(float(gps_long), 1.44336)
> diff --git 
> a/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log 
> b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
> new file mode 100644
> index 0000000000..f3730da7c5
> --- /dev/null
> +++ 
> b/support/testing/tests/package/test_gpsd/rootfs-overlay/root/udp-nmea.log
> @@ -0,0 +1,6 @@
> +# Name: NMEA 0183 messages for gpsd Buildroot test
> +# Transport: UDP
> +# For packet format, see:
> +# https://gpsd.gitlab.io/gpsd/NMEA.html
> +$GPGGA,123456.789,4336.2634,N,0126.6016,E,1,04,1.7,143.5,M,,,,*3A
> +$GPZDA,123456.789,20,07,2024,2,00*64
> --
> 2.45.2
> 
> 
> 
> ------------------------------
> 
> Message: 22
> Date: Sat, 20 Jul 2024 21:01:40 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Joris Lijssens <joris.lijssens@gmail.com>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/libcoap: enable required
> 	libopenssl options
> Message-ID: <20240720190140.342416-1-fontaine.fabrice@gmail.com>
> 
> libcoap unconditionally calls the (deprecated) ENGINE_* logic in
> libopenssl resulting in a build failure when
> !BR2_PACKAGE_LIBOPENSSL_ENGINES since commit
> 623d3bbe43e9193aa8e3395367d01af59071b859
> 
> libcoap also unconditionally uses PSK
> 
> Fixes: 623d3bbe43e9193aa8e3395367d01af59071b859
>  - 
> http://autobuild.buildroot.org/results/6bd3e1390cbbc59b9b3d030c2a401e45e9d173da
>  - 
> http://autobuild.buildroot.org/results/f243209454feed4f33f759786c2023c576a2cd3d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libcoap/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libcoap/Config.in b/package/libcoap/Config.in
> index 6e0c1905bc..950aee5279 100644
> --- a/package/libcoap/Config.in
> +++ b/package/libcoap/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_LIBCOAP
>  	bool "libcoap"
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_PSK if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENGINES if BR2_PACKAGE_LIBOPENSSL
>  	help
>  	  libcoap is a C implementation of a lightweight
>  	  application-protocol for devices that are constrained their
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 23
> Date: Sat, 20 Jul 2024 21:31:42 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/openswan: select libxcrypt if
> 	needed
> Message-ID: <20240720193142.770839-1-fontaine.fabrice@gmail.com>
> 
> Fix the following build failure raised since bump of glibc to version
> 2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:
> 
> /home/autobuild/autobuild/instance-7/output-1/build/openswan-3.0.0/programs/pluto/xauth.c:36:10: 
> fatal error: crypt.h: No such file or directory
>    36 | #include <crypt.h>
>       |          ^~~~~~~~~
> 
> Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
>  - 
> http://autobuild.buildroot.org/results/df7cce809e3e4aa92e700a3fc5105c6c20f21f6b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/openswan/Config.in   | 1 +
>  package/openswan/openswan.mk | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/package/openswan/Config.in b/package/openswan/Config.in
> index 724654e984..31c4a66b35 100644
> --- a/package/openswan/Config.in
> +++ b/package/openswan/Config.in
> @@ -4,6 +4,7 @@ config BR2_PACKAGE_OPENSWAN
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
>  	select BR2_PACKAGE_GMP
>  	select BR2_PACKAGE_IPROUTE2
> +	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
>  	help
>  	  Openswan is an implementation of IPsec for Linux
> 
> diff --git a/package/openswan/openswan.mk 
> b/package/openswan/openswan.mk
> index 4c6a779f0d..64218810f8 100644
> --- a/package/openswan/openswan.mk
> +++ b/package/openswan/openswan.mk
> @@ -22,6 +22,10 @@ OPENSWAN_DEPENDENCIES += libcurl
>  OPENSWAN_MAKE_OPTS += USE_LIBCURL=true
>  endif
> 
> +ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
> +OPENSWAN_DEPENDENCIES += libxcrypt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENSSL),y)
>  OPENSWAN_DEPENDENCIES += openssl
>  OPENSWAN_MAKE_OPTS += HAVE_OPENSSL=true
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Message: 24
> Date: Sat, 20 Jul 2024 21:39:13 +0200
> From: Andreas Hilse <andreas.hilse@googlemail.com>
> To: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>, Joachim Wiberg
> 	<troglobit@gmail.com>, Christian Stewart <christian@aperture.us>,
> 	Buildroot Mailing List <buildroot@buildroot.org>
> Subject: Re: [Buildroot] package/openssh: please backport bump to
> 	9.8p1
> Message-ID:
> 	<CANabuZfTRZwbAyVZ5Ha27Ch5r+nTb6YjFgM2Pu1vC16wi1v4TA@mail.gmail.com>
> Content-Type: text/plain; charset="UTF-8"
> 
> Hi,
> 
> On Fri, Jul 19, 2024 at 5:32?PM Arnout Vandecappelle <arnout@mind.be> 
> wrote:
>>   I would say, in that case, fix your vulnerability scanner. We have 
>> dozens of
>> packages where CVEs are patched. See the IGNORE_CVES variables in 
>> various packages.
> 
> I know about that, but the problem lies not with our vulnerability
> scanner, that alone we can handle.
> The problem is that our customers conduct their own scans or hire a
> 3rd party to do blackbox tests. When they see openssh 9.7 they will
> complain.
> 
> Regards,
> Andreas
> 
> 
> ------------------------------
> 
> Message: 25
> Date: Sat, 20 Jul 2024 21:49:42 +0200
> From: Frank Wunderlich <frank-w@public-files.de>
> To: Frank Wunderlich <frank-w@public-files.de>
> Cc: buildroot@buildroot.org
> Subject: Re: [Buildroot] lvm2 seems to require systemd
> Message-ID:
> 	<trinity-6ec563fa-da3b-425d-9184-a34393e6d9b5-1721504982908@3c-app-gmx-bs02>
> 
> Content-Type: text/plain; charset=UTF-8
> 
> Hi
> 
> in the meantime i tried to add systemd (which i want to avoid due to 
> size and complexity)
> 
> BR2_PACKAGE_SYSTEMD=y
> BR2_INIT_SYSTEMD=y
> 
> but hang on this:
> 
> Found CMake: 
> /media/data_ext/git/buildroot/output/per-package/systemd/host/bin/cmake 
> (3.28.3)
> Run-time dependency libbpf found: NO (tried pkgconfig and cmake)
> Run-time dependency mount found: NO (tried pkgconfig and cmake)
> 
> output/build/systemd-254.13/meson.build:1188:11: ERROR: Dependency 
> "mount" not found, tried pkgconfig and cmake
> 
> tried installing libmount-dev pkgconf-bin libbpf-dev on my 
> building-machine without success
> 
> also tried without BR2_INIT_SYSTEMD, which compiles good, but the error 
> below is on running bootup (before login)
> so i guess i need systemd as init, but maybe i'm wrong
> 
> regards Frank
> 
> 
>> Gesendet: Samstag, 20. Juli 2024 um 14:34 Uhr
>> Von: "Frank Wunderlich" <frank-w@public-files.de>
>> An: buildroot@buildroot.org
>> Betreff: lvm2 seems to require systemd
>> 
>> Hi,
>> 
>> i try to build a buildroot (2024.05) initrd with lvm2 support
>> 
>> so basicly added these options:
>> 
>> #to select BR2_PACKAGE_HAS_UDEV
>> BR2_PACKAGE_EUDEV=y
>> BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
>> BR2_PACKAGE_LIBBLOCKDEV=y
>> BR2_PACKAGE_LVM2=y
>> 
>> build is fine, but i see this while bootup:
>> 
>> [    3.665010] udevd[1520]: failed to execute '/usr/bin/systemd-run' 
>> '/usr/bin/systemd-run --no-block --property DefaultDependencies=
>> no --unit lvm-activate-vg-nvme /usr/sbin/lvm vgchange -aay 
>> --autoactivation event vg-nvme': No such file or directory
>> done
>> 
>> i see the physical volume, but logical volumes are disabled
>> 
>> # pvscan
>>   PV /dev/nvme0n1p5   VG vg-nvme   lvm2 [<1.79 TiB / <1.78 TiB free]
>>   Total: 1 [<1.79 TiB] / in use: 1 [<1.79 TiB] / in no VG: 0 [0   ]
>> # vgscan
>>   Found volume group "vg-nvme" using metadata type lvm2
>> # lvscan
>>   inactive          '/dev/vg-nvme/var' [10.00 GiB] inherit
>> 
>> and so i cannot mount the logical volume
>> 
>> # mount /dev/vg-nvme/var /mnt
>> [  281.006375] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.011279] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.016202] /dev/vg-nvme/var: Can't lookup blockdev
>> [  281.021080] /dev/vg-nvme/var: Can't lookup blockdev
>> mount: mounting /dev/vg-nvme/var on /mnt failed: No such file or 
>> directory
>> 
>> any ideas?
>> 
>> regards Frank
>> 
>> 
> 
> 
> ------------------------------
> 
> Message: 26
> Date: Sat, 20 Jul 2024 21:55:05 +0200
> From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> To: buildroot@buildroot.org
> Cc: Phil Eichinger <phil.eichinger@gmail.com>, Fabrice Fontaine
> 	<fontaine.fabrice@gmail.com>
> Subject: [Buildroot] [PATCH 1/1] package/zsh: fix build with gcc >= 14
> Message-ID: <20240720195505.1052184-1-fontaine.fabrice@gmail.com>
> 
> Fix the following build failure with gcc >= 14:
> 
> termcap.c:45:14: error: conflicting types for 'boolcodes'; have 'char 
> *[]'
>    45 | static char *boolcodes[] = {
>       |              ^~~~~~~~~
> In file included from ../../Src/zshterm.h:1,
>                  from ../../Src/zsh_system.h:932,
>                  from ../../Src/zsh.mdh:17,
>                  from termcap.mdh:17,
>                  from termcap.c:38:
> /home/autobuild/autobuild/instance-0/output-1/host/or1k-buildroot-linux-uclibc/sysroot/usr/include/term.h:764:56: 
> note: previous declaration of 'boolcodes' with type 'const char * 
> const[]'
>   764 | extern NCURSES_EXPORT_VAR(NCURSES_CONST char * const ) 
> boolcodes[];
>       |                                                        
> ^~~~~~~~~
> 
> Fixes:
>  - 
> http://autobuild.buildroot.org/results/fe2f7170465e96cc1de3dae139a25f615331f4b9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...er-types-in-terminfo-global-variable.patch | 51 +++++++++++++++++++
>  package/zsh/zsh.mk                            |  2 +
>  2 files changed, 53 insertions(+)
>  create mode 100644 
> package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
> 
> diff --git 
> a/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch 
> b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
> new file mode 100644
> index 0000000000..c67c374918
> --- /dev/null
> +++ 
> b/package/zsh/0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
> @@ -0,0 +1,51 @@
> +From 4c89849c98172c951a9def3690e8647dae76308f Mon Sep 17 00:00:00 2001
> +From: Florian Weimer <fweimer@redhat.com>
> +Date: Fri, 8 Dec 2023 21:58:07 +0100
> +Subject: [PATCH] 52383: Avoid incompatible pointer types in terminfo 
> global
> + variable checks
> +
> +Upstream: 
> https://sourceforge.net/p/zsh/code/ci/4c89849c98172c951a9def3690e8647dae76308f
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + ChangeLog    |  3 +++
> + configure.ac | 12 ++++++------
> + 2 files changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/configure.ac b/configure.ac
> +index 2a8221e1f..2871dcb7c 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -1768,27 +1768,27 @@ if test x$zsh_cv_path_term_header != xnone; 
> then
> +   fi
> +
> +   AC_MSG_CHECKING(if boolcodes is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) 
> boolcodes=yes],[boolcodes=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)boolcodes; puts(*test);]])],[AC_DEFINE(HAVE_BOOLCODES) 
> boolcodes=yes],[boolcodes=no])
> +   AC_MSG_RESULT($boolcodes)
> +
> +   AC_MSG_CHECKING(if numcodes is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) 
> numcodes=yes],[numcodes=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)numcodes; puts(*test);]])],[AC_DEFINE(HAVE_NUMCODES) 
> numcodes=yes],[numcodes=no])
> +   AC_MSG_RESULT($numcodes)
> +
> +   AC_MSG_CHECKING(if strcodes is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) 
> strcodes=yes],[strcodes=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)strcodes; puts(*test);]])],[AC_DEFINE(HAVE_STRCODES) 
> strcodes=yes],[strcodes=no])
> +   AC_MSG_RESULT($strcodes)
> +
> +   AC_MSG_CHECKING(if boolnames is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) 
> boolnames=yes],[boolnames=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)boolnames; puts(*test);]])],[AC_DEFINE(HAVE_BOOLNAMES) 
> boolnames=yes],[boolnames=no])
> +   AC_MSG_RESULT($boolnames)
> +
> +   AC_MSG_CHECKING(if numnames is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) 
> numnames=yes],[numnames=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)numnames; puts(*test);]])],[AC_DEFINE(HAVE_NUMNAMES) 
> numnames=yes],[numnames=no])
> +   AC_MSG_RESULT($numnames)
> +
> +   AC_MSG_CHECKING(if strnames is available)
> +-  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) 
> strnames=yes],[strnames=no])
> ++  AC_LINK_IFELSE([AC_LANG_PROGRAM([[$term_includes]], [[char **test = 
> (char **)strnames; puts(*test);]])],[AC_DEFINE(HAVE_STRNAMES) 
> strnames=yes],[strnames=no])
> +   AC_MSG_RESULT($strnames)
> +
> +   dnl There are apparently defective terminal library headers on some
> diff --git a/package/zsh/zsh.mk b/package/zsh/zsh.mk
> index e790bf4c5e..7e577fa9e1 100644
> --- a/package/zsh/zsh.mk
> +++ b/package/zsh/zsh.mk
> @@ -13,6 +13,8 @@ ZSH_CONF_ENV = zsh_cv_sys_nis=no 
> zsh_cv_sys_nis_plus=no
>  ZSH_LICENSE = MIT-like
>  ZSH_LICENSE_FILES = LICENCE
>  ZSH_CPE_ID_VENDOR = zsh
> +# 
> 0001-52383-Avoid-incompatible-pointer-types-in-terminfo-global-variable.patch
> +ZSH_AUTORECONF = YES
> 
>  # zsh uses TRY_RUN to determine these
>  ZSH_CONF_OPTS += \
> --
> 2.43.0
> 
> 
> 
> ------------------------------
> 
> Subject: Digest Footer
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> 
> ------------------------------
> 
> End of buildroot Digest, Vol 217, Issue 67
> ******************************************
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
