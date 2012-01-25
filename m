From: Poole, Donald R. <drpoole@swri.org>
Date: Wed, 25 Jan 2012 20:56:34 +0000
Subject: [Buildroot] Buildroot RFS Login Question
In-Reply-To: <87hazj4j42.fsf@macbook.be.48ers.dk>
Message-ID: <CB45C55B.2D94%donald.poole@swri.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 1/25/12 2:34 PM, "Peter Korsgaard" <jacmet@uclibc.org> wrote:


>>>>>> "Donald" == Poole, Donald R <drpoole@swri.org> writes:
>
> Peter> Ok, and how do you boot the system, what kind of filesystem
>output are
> Peter> you using?
>
> Donald> I am booting the kernel with u-boot (Freescales u-boot for
> Donald> i.MX53 processors version rel_imx_2.6.35_11.01.00) with the
> Donald> boot arguments
>
> Donald> console=ttymxc0,115200 video=mxcdi1fb:GBR24,XGA di1_primary tve
> Donald> root=/dev/mmcblk0p1 rw rootwait rootflags=barrier=1
>
>Ok, good. How do you create the file system on the SD card exactly?

I create the file system by first creating a single partition (sudo fdisk
/dev/sdc && sync && sync in my case and selecting the appropriate
commands).  Then, I format the partition (sudo mkfs.ext3 /dev/sdc1 && sync
&& sync).  Finally, I mount the partition (sudo mount /dev/sdc1
<some_mount_point>) and untar the generated root.tar filesystem tarball to
the mount point (sudo tar -xvf root.tar -C <some_mount_point> && sync &&
sync).
