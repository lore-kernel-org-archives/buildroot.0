From: Matthew Weber <matt@thewebers.ws>
Date: Mon, 8 Jan 2018 21:05:07 -0600
Subject: [Buildroot] [PATCH] package/ti-cgt-pru: bump to 2.2.1
In-Reply-To: <20180108231019.24969-1-romain.naour@gmail.com>
References: <20180108231019.24969-1-romain.naour@gmail.com>
Message-ID: <CAFt09wNHCt6j1p_9e3XfrGex-K=gnFHsOyQj375R9utH4s8GdQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain,

On Mon, Jan 8, 2018 at 5:10 PM, Romain Naour <romain.naour@gmail.com> wrote:
> See: http://www.ti.com/tool/download/PRU-CGT-2-2
>
> The ti-cgt-pru v2.1.x installer are affected by a bug with recent
> distribution (Fedora 27 and Ubuntu 17.10) using kernel 4.13 or 4.14
> with a glibc 2.26.
> The installer is stuck in a futex(wait) system call.
>
> Fixes:
> http://autobuild.buildroot.net/results/68f/68f60ad38d9b6eae83b5d233966616a25d8c9391
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Ash Charles <ash.charles@savoirfairelinux.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Tested the failing config form autobuilder with your update and it
passed.  I then ran it through test-pkg and found the legal info needs
update.
>>> host-ti-cgt-pru 2.2.1 Collecting legal info
ERROR: No hash found for PRU_Code_Generation_Tools_2.1.x_manifest.html
cp: cannot stat
'/nvme/rc-buildroot-upstreamtesting/ti-cgt/armv5-ctng-linux-gnueabi/build/host-ti-cgt-pru-2.2.1/PRU_Code_Generation_Tools_2.1.x_manifest.html':
No such file or directory
package/ti-cgt-pru/ti-cgt-pru.mk:33: recipe for target
'host-ti-cgt-pru-legal-info' failed

This seems to fix it.
TI_CGT_PRU_LICENSE_FILES = PRU_Code_Generation_Tools_2.2.x_manifest.html \
        pru_rts_2_2_0_82167478-F8C9-49b2-82BD-12F8550770F9.spdx

Matt
