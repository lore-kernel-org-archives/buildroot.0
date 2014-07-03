From: Robert Larsen <robert@the-playground.dk>
Date: Thu, 03 Jul 2014 12:40:27 +0200
Subject: [Buildroot] Filesystem being corrupted
Message-ID: <53B5331B.9030703@the-playground.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi list

I am having a problem with my root filesystem being corrupted.
When I halt a newly built system (simply log in and execute 'halt') get
this message:

---------------------------------------------------------------
# halt
The system is going down NOW!
Sent SIGTERM to all processes
Sent SIGKILL to all processes
Requesting system halt
Flash device refused suspend due to active operation (state 20)
Flash device refused suspend due to active operation (state 20)
reboot: System halted
---------------------------------------------------------------

Then when I restart it I get:

---------------------------------------------------------------
....
Starting network...
EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 625
EXT2-fs (mmcblk0): error: remounting filesystem read-only
Generating RSA Key...
No user exists for uid 0
EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 627
EXT2-fs (mmcblk0): error: remounting filesystem read-only
Generating DSA Key...

No user exists for uid 0
EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 629
EXT2-fs (mmcblk0): error: remounting filesystem read-only
Generating ECDSA Key...

No user exists for uid 0
EXT2-fs (mmcblk0): error: ext2_lookup: deleted inode referenced: 631
EXT2-fs (mmcblk0): error: remounting filesystem read-only
Generating ed25519 Key...

No user exists for uid 0
Starting sshd: Privilege separation user sshd does not exist
OK

ARM Testing System
arm-testing login:
---------------------------------------------------------------

I start it with this command:
sudo qemu-system-arm -M vexpress-a9 -m 512 -kernel zImage  -sd
rootfs.ext2 -append "root=/dev/mmcblk0 rw physmap.enabled=0
console=ttyAMA0" -net tap -net nic -net
user,hostfwd=tcp:0.0.0.0:2222-:22 -nographic

Any ideas as to what has happened and how to fix it?
You can view my buildroot config file here:
http://www.the-playground.dk/buildroot_config.txt

Robert

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 246 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140703/d561c064/attachment.asc>
