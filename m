From: Thomas <tokant@gmx.net>
Date: Mon, 24 May 2010 20:10:09 +0200
Subject: [Buildroot] buildroot-2010.05-rc2, problem with binutils-2.20.1
In-Reply-To: <20100522145508.10c885e7@surf>
References: <1274422785.5719.8.camel@bernd-desktop>
	<20100521122542.5c4b0907@surf> <1274479497.25288.3.camel@bernd-desktop>
	<20100522003018.1ef13985@surf> <1274517204.15163.3.camel@bernd-desktop>
	<20100522145508.10c885e7@surf>
Message-ID: <1274724609.13140.8.camel@bernd-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 2010-05-22 at 14:55 +0200, Thomas Petazzoni wrote:
> On Sat, 22 May 2010 10:33:24 +0200
> Thomas <tokant@gmx.net> wrote:
> 
> > > -HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> > > +HOST_LDFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
> > 
> > yes it works :-)
> 
> Ok, I will try to see if it still fixes the problem that the commit was
> originally fixing.

I noticed the same problem, as described in bug report 1789: When it
comes to root file generation (rootfs.ext2), buildroot terminates with
the following messages:

rm -f /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
touch /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/.fakeroot.00000
cat /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/.fakeroot* > /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
echo "chown -R 0:0 /media/disk/br1005rc2/buildroot-2010.05-rc2/output/target" >> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
echo "/media/disk/br1005rc2/buildroot-2010.05-rc2/output/host/usr/bin/makedevs -d target/device/Atmel/root/device_table.txt /media/disk/br1005rc2/buildroot-2010.05-rc2/output/target" >> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
echo "	PATH="/media/disk/br1005rc2/buildroot-2010.05-rc2/output/toolchain/bin:/media/disk/br1005rc2/buildroot-2010.05-rc2/output/host/bin:/media/disk/br1005rc2/buildroot-2010.05-rc2/output/host/usr/bin:/media/disk/br1005rc2/buildroot-2010.05-rc2/output/host/usr/sbin/:/media/disk/br1005rc2/buildroot-2010.05-rc2/output/staging/bin:/media/disk/br1005rc2/buildroot-2010.05-rc2/output/staging/usr/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games" fs/ext2/genext2fs.sh -d /media/disk/br1005rc2/buildroot-2010.05-rc2/output/target  -U /media/disk/br1005rc2/buildroot-2010.05-rc2/output/images/rootfs.ext2" >> /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
chmod a+x /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
/media/disk/br1005rc2/buildroot-2010.05-rc2/output/host/usr/bin/fakeroot -- /media/disk/br1005rc2/buildroot-2010.05-rc2/output/build/_fakeroot.fs
fakeroot: preload library not found, aborting.
make: *** [/media/disk/br1005rc2/buildroot-2010.05-rc2/output/images/rootfs.ext2] Error 1

Thanks, Thomas.
