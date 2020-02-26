From: Andreas Ronneberg <buildroot@bombe20.de>
Date: Wed, 26 Feb 2020 12:58:16 +0100
Subject: [Buildroot] package/ntfs-3g: suggest patches for compatibility with
 changes to NTFS in Win 10
Message-ID: <eff75da12b39285d222de6e3d08f38f1@bombe20.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I suggest applying the following two patches to ntfs-3g. Both are taken 
from the Fedora bug tracker, since to my knowledge the second bug is 
fixed in Fedora/Redhat only.

The first patch fixes the "$MFTMirr does not match $MFT" error after an 
NTFS volume was mounted using Windows 10 (fall 2017 update and later) 
and is found here:

https://bugzilla.redhat.com/show_bug.cgi?id=1527231

The second patch allows to mount NTFS volumes with cluster size above 64 
kByte and is found here:

https://bugzilla.redhat.com/show_bug.cgi?id=1575227

If including the patches is acceptable, can you please advice me how to 
create a pull request with the necessary changes?

Cheers
Andi
