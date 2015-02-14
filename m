From: Gregory Dymarek <gregd72002@gmail.com>
Date: Sat, 14 Feb 2015 22:37:04 +0000
Subject: [Buildroot] BR2_ROOTFS_POST_IMAGE_SCRIPT fdisk anomaly
Message-ID: <CAEbDrgmWrn8Jf4VYgk0RtVBMgUf2DehNx3BS63Bqfte2+OhLrg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've seen this problem before in buildroot but now I have a reproducible
example.

My BR2_ROOTFS_POST_IMAGE_SCRIPT looks like:

#!/bin/sh

dd if=/dev/zero of=image.img count=50000

(echo n; echo p; echo 1; echo ; echo "+30000"; echo w;) | fdisk -u image.img



The problem is it creates a very different image than when executing the
above command manually from shell.


When executed manually the created partition is:

        Device Boot      Start         End      Blocks   Id  System

image.img1            2048       32048       15000+  83  Linux



When executed though the hook it reports:

    Device Boot      Start         End      Blocks   Id  System

image.img1            2048       32767       15360   83  Linux


Where is the difference coming from?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150214/fd63c85d/attachment.html>
