From: Joe Halpin <jhalpin@luminatorusa.com>
Date: Wed, 20 Feb 2013 20:12:28 +0000
Subject: [Buildroot] build error: "fixdep: permission denied"
In-Reply-To: <87ip5miw6b.fsf@dell.be.48ers.dk>
References: <7E1FF160F2C5E94FB297D1FE759079CAAD24@LUMEXCH3.luminatorusa.com>
 <87mwuzhqmf.fsf@dell.be.48ers.dk>
 <7E1FF160F2C5E94FB297D1FE759079CAAF6C@LUMEXCH3.luminatorusa.com>
 <87ip5miw6b.fsf@dell.be.48ers.dk>
Message-ID: <7E1FF160F2C5E94FB297D1FE759079CAB17F@LUMEXCH3.luminatorusa.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jhalpin-linux$ cat /proc/mounts
rootfs / rootfs rw 0 0
sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
udev /dev devtmpfs rw,relatime,size=2045216k,nr_inodes=206542,mode=755 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
tmpfs /run tmpfs rw,nosuid,relatime,size=821004k,mode=755 0 0
/dev/disk/by-uuid/6927ee6b-3a52-4cc7-9a8a-e3c841472fab / ext4 rw,relatime,errors=remount-ro,user_xattr,barrier=1,data=ordered 0 0
none /sys/fs/fuse/connections fusectl rw,relatime 0 0
none /sys/kernel/debug debugfs rw,relatime 0 0
none /sys/kernel/security securityfs rw,relatime 0 0
none /run/lock tmpfs rw,nosuid,nodev,noexec,relatime,size=5120k 0 0
none /run/shm tmpfs rw,nosuid,nodev,relatime 0 0
/dev/sda5 /home ext4 rw,relatime,user_xattr,barrier=1,data=ordered 0 0
/dev/sda7 /opt ext4 rw,relatime,user_xattr,barrier=1,data=ordered 0 0
binfmt_misc /proc/sys/fs/binfmt_misc binfmt_misc rw,nosuid,nodev,noexec,relatime 0 0
gvfs-fuse-daemon /home/jhalpin/.gvfs fuse.gvfs-fuse-daemon rw,nosuid,nodev,relatime,user_id=1000,group_id=1000 0 0

Thanks

Joe
-----Original Message-----
From: Peter Korsgaard [mailto:jacmet at gmail.com] On Behalf Of Peter Korsgaard
Sent: Wednesday, February 20, 2013 2:10 PM
To: Joe Halpin
Cc: 'Peter Korsgaard'; buildroot at busybox.net
Subject: Re: build error: "fixdep: permission denied"

>>>>> "Joe" == Joe Halpin <jhalpin@luminatorusa.com> writes:

 Joe> I'm using Xubuntu 12.04, with ext4 file system.

 Joe> And you're right, it doesn't happen when I build in my home
 Joe> directory. I'm not sure what that means, everything under /opt is
 Joe> owned by me.

Odd. Could you paste output of:

cat /proc/mounts

-- 
Bye, Peter Korsgaard
