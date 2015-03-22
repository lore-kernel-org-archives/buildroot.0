From: Christopher Stone <chris@sombrio.com>
Date: Sun, 22 Mar 2015 12:02:55 -0400
Subject: [Buildroot] [PATCH] Busybox libselinux dependency.
Message-ID: <CAJ9_1op-4Ztin9kfON97ktjEiXaCXUaNiDwqzmu6gr_=xDBk8g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you select the selinux applets when configuring busybox then the busybox
build fails due to a missing selinux.h file. This is because there is no
dependency on libselinux in the busybox make. The lack of dependency is
completely understandable, since there is no such dependency when a user
does not configure in the selinux applets. The attached patch adds a
libselinux dependency to the busybox make when the libselinux package has
been selected for the target. It is not unreasonable to assume that if a
user selects libselinux, then he may also select the busybox selinux
applets. Additionally, if the user has already selected libselinux for the
target, then adding a dependency to libselinx to busybox does no harm, even
if the user does not configure in the selinux applet, yet the build will
not fail if the user does select those applets.

Thus, I submit the attached patch for your consideration.

Cheers,
   Chris Stone.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150322/2789b1b5/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: busybox-libselinux-dependency.patch
Type: text/x-patch
Size: 1076 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150322/2789b1b5/attachment.bin>
