From: Mike Musterd <MMusterd@kns.com>
Date: Tue, 21 Apr 2015 06:30:29 +0000
Subject: [Buildroot] grub on target
Message-ID: <HKXPR01MB0312A3D64DA648D6B74794C9C2EF0@HKXPR01MB0312.apcprd01.prod.exchangelabs.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello list,

I am developing a small OS that functions as a sort of bootloader for windows. Its primary function is to check whether windows is available and if so, reboot to windows once (then, after that, boot into the bootloader again).
If not it will repartition disk, install itself on new partition, and format drives and clone windows (from a network source) all from within this bootloader.

I am using grub for that, with some custom fixes to the grub-reboot script to make it behave as required.

However to my dismay I found that the grub package does not actually build grub for the target.

grub.mk claims as much:
# We're cheating here as we're installing the grub binary not in the
# target directory (where it is useless), but in the host
# directory. This grub binary can be used to install grub into the MBR
# of a disk or disk image.

In my use case I need grub in the target directory, and it's not useless at all. So I modified the grub.mk to actually make grub for the target, and it all works.

Now my question is: is my usecase generic enough to warrant a patch submission, or is the 'useless' part always true except in my case?

Kind regards,

Mike

This email is non-binding, is subject to contract, and neither Kulicke and Soffa Industries, Inc. nor its subsidiaries (each and collectively "K&S") shall have any obligation to you to consummate the transactions herein or to enter into any agreement, other than in accordance with the terms and conditions of a definitive agreement if and when negotiated, finalized and executed between the parties. This email and all its contents are protected by International and United States copyright laws. Any reproduction or use of all or any part of this email without the express written consent of K&S is prohibited.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150421/f7b7a377/attachment.html>
