From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Nov 2010 18:43:10 +0100
Subject: [Buildroot] Buildroot creates broken jffs2 image
In-Reply-To: <AANLkTi=zp_NcMLOBTK5v+Hc=ryLOwT5YuNg9TXrrtdu=@mail.gmail.com>
References: <AANLkTi=zp_NcMLOBTK5v+Hc=ryLOwT5YuNg9TXrrtdu=@mail.gmail.com>
Message-ID: <20101109184310.257314b0@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 9 Nov 2010 16:25:23 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> 3) look at the build log and retrieve the mkfs.jffs2 command that
> buildroot used:
> echo
> "	/home/bjornfor/forks/buildroot-skipper/output/host/usr/sbin/mkfs.jffs2
> -e 0x20000 -p -l -s 0x800 -n
> -d /home/bjornfor/forks/buildroot-skipper/output/target
> -o /home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2"
> >> /home/bjornfor/forks/buildroot-skipper/output/build/_fakeroot.fs
> 
> 4) issue the command with *host* mkfs.jffs2 instead (using the exact
> same arguments):
> mkfs.jffs2 -e 0x20000 -p -l -s 0x800 -n -d
> /home/bjornfor/forks/buildroot-skipper/output/target -o
> /home/bjornfor/forks/buildroot-skipper/output/images/rootfs.jffs2.v2
> 
> 5) flash new jffs2 image and mount. This time with *no errors*.
> 
> Any ideas on why this is happening?

Not sure, but steps 3) and steps 4) are not identical. In step 3),
mkfs.jffs2 is called by fakeroot, which first creates the device files.
In step 4), you don't have anything creating the device files.

Could you try doing step 4 (i.e calling mkfs.jffs2 directly), but by
calling the mkfs.jffs2 built by Buildroot (in $(HOST_DIR)) ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
