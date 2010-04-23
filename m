From: Nataraj S Narayan <natarajsn@gmail.com>
Date: Fri, 23 Apr 2010 11:20:22 +0000
Subject: [Buildroot] uclibc / glibc rfs issues
In-Reply-To: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
References: <j2n630286c71004230401i8b185fd2jd5fa0a5465b577f@mail.gmail.com>
Message-ID: <i2l630286c71004230420g4d62616fj325361740ef7518c@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi

At the end of build getting this too:-

echo "  /home/noy/buildroot/output/host/usr/sbin/mkfs.jffs2 -e 0x20000
-l -s 0x800 -n -D target/generic/device_table.txt -d
/home/noy/buildroot/output/target -o
/home/noy/buildroot/output/images/rootfs.jffs2" >>
/home/noy/buildroot/output/build/_fakeroot.fs
chmod a+x /home/noy/buildroot/output/build/_fakeroot.fs
/home/noy/buildroot/output/host/usr/bin/fakeroot --
/home/noy/buildroot/output/build/_fakeroot.fs
rootdir=/home/noy/buildroot/output/target
table='target/generic/device_table.txt'
makedevs: line 49: regular file
'/home/noy/buildroot/output/target/usr/share/udhcpc/default.script'
does not exist: No such file or directory
mkfs.jffs2: skipping device_table entry
'/usr/share/udhcpc/default.script': no parent directory!
mkdir -p /home/noy/buildroot/output/target/etc
echo "buildroot" > /home/noy/buildroot/output/target/etc/hostname
mkdir -p /home/noy/buildroot/output/target/etc
echo "Welcome to MMFSL ucLibc" > /home/noy/buildroot/output/target/etc/issue
rm -f /home/noy/buildroot/output/build/.fakeroot*

regards

Nataraj

On Fri, Apr 23, 2010 at 11:01 AM, Nataraj S Narayan <natarajsn@gmail.com> wrote:
> Hi
>
> I use at91sam9263ek.
>
> I am on BR ?latest git. I was trying to duplicate same .config for
> uclibc and for , glibc using COdesourcery toolchain. ?Both are
> building full, but unfortunately I am getting the following for both
> toolchains file systems. It waits endlessly without giving login
> prompt.
>
> regards
>
> Nataraj
>
> TCP cubic registered
> NET: Registered protocol family 17
> VFS: Mounted root (jffs2 filesystem) on device 31:0.
> Freeing init memory: 136K
> g_ether gadget: full speed config #1: CDC Ethernet (ECM)
> mount: mounting none on /proc failed: No such file or directory
> /bin/sh: can't create /proc/sys/kernel/hotplug: nonexistent directory
> mount: can't read /proc/mounts: No such file or directory
> mount: mounting proc on /proc failed: No such file or directory
> mount: mounting configfs on /config failed: No such device
> Initializing random number generator... done.
> Starting network...
> ip: RTNETLINK answers: File exists
> Starting dropbear sshd: generating rsa key... generating dsa key... OK
>
