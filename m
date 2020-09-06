From: Noah Cain <nmcain@gmail.com>
Date: Sat, 5 Sep 2020 20:38:59 -0700
Subject: [Buildroot] How do I create a compressed buildroot system image
 that expands to fill the available storage of the media it is flashed to?
Message-ID: <CAKA8WzJfF+qgykyqzhOk=otG_qma6bKc1vGKrsB9MaYHtyc1hg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!  I need to make a Buildroot system for various x86_64 EFI systems with
varying storage sizes, but unfortunately, the pc_x86_64_efi_defconfig
config creates an IMG file with a fixed partition size, not one that
expands to the full size of the media it is flashed to. If I want it to
fill the various drives, I need to manually specify the size of each drive
in the filesystem config, and then recompile, which is a major pain and
ends up making a massive 128GB+ image file. I tried causing it to resize
from within the running system using resize2fs, but that did not work.
Ideally, I would like it to either expand to the full size of the drive
when it is flashed or to have it resize when it first boots. Is this
possible, or is it outside the limits of Buildroot?

Thanks for your help, Noah Cain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200905/3e8e7252/attachment.html>
