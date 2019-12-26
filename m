From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Dec 2019 20:44:33 +0100
Subject: [Buildroot] [PATCH v3,
 1/1] package/ecryptfs-utils: fix parallel build
In-Reply-To: <20191226164748.28083-1-fontaine.fabrice@gmail.com>
References: <20191226164748.28083-1-fontaine.fabrice@gmail.com>
Message-ID: <20191226204433.785cbbc2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 26 Dec 2019 17:47:48 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build randomly fails since December 2017 on:
> 
> make[5]: Entering directory '/home/buildroot/autobuild/instance-2/output-1/build/ecryptfs-utils-111/src/utils'
>  /bin/mkdir -p '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
>   /bin/bash ../../libtool   --mode=install /usr/bin/install -c mount.ecryptfs umount.ecryptfs mount.ecryptfs_private '/home/buildroot/autobuild/instance-2/output-1/target/sbin'
> libtool: install: /usr/bin/install -c mount.ecryptfs /home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs
> /usr/bin/install: cannot create regular file '/home/buildroot/autobuild/instance-2/output-1/target/sbin/mount.ecryptfs': File exists
> Makefile:832: recipe for target 'install-rootsbinPROGRAMS' failed
> make[5]: *** [install-rootsbinPROGRAMS] Error 1
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2063bd18830ef02dca0bed889c43639009bc688e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Update Makefile.in instead of Makefile.am to avoid running autoreconf
>    which depends on AM_GLIB_GNU_GETTEXT

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
