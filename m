From: Sabri Altunbas <sabraltu61@gmail.com>
Date: Sat, 12 Oct 2013 14:11:10 +0200
Subject: [Buildroot] buildroot requires a password
Message-ID: <0F793FF065914549A7D55A219164CACB@M58p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi folks,

I created a initramfs with buildroot.
I attach my config

It works. But it requires a password which I have not configured and I wanna
have no password.

I investigate in forums and find out 
 
http://buildroot-busybox.2317881.n4.nabble.com/Console-login-root-needing-a-
password-td15155.html

http://buildroot-busybox.2317881.n4.nabble.com/Bug-5366-New-can-t-login-root
-or-default-td30020.html

I followed all recommendations

- taking output/images/rootfs.cpio
-  BR2_PACKAGE_UTIL_LINUX_LOGIN_UTILS not defined

but only the following solution worked

#ttyS0::respawn:/sbin/getty -L ttyS0 115200 vt100 # GENERIC_SERIAL
ttyS0::respawn:/bin/sh  # GENERIC_SERIAL

overlooked something ?

regards,
s.altunbas


-------------- next part --------------
A non-text attachment was scrubbed...
Name: .config
Type: application/octet-stream
Size: 31759 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131012/07b6ec16/attachment-0001.obj>
