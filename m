From: Montag, Gil <gil.montag@intel.com>
Date: Sun, 19 May 2019 06:57:36 +0000
Subject: [Buildroot] =?windows-1252?q?suggestion_to_add_info_to_buildroot?=
 =?windows-1252?q?_manual_section_10=2E1=2E_=22The_boot_hangs_after_Starti?=
 =?windows-1252?q?ng_network=85=22?=
In-Reply-To: <2C6957468785C14D8F47AB016E1D8F4B6E4B9E50@hasmsx107.ger.corp.intel.com>
References: <2C6957468785C14D8F47AB016E1D8F4B6E4B9E50@hasmsx107.ger.corp.intel.com>
Message-ID: <2C6957468785C14D8F47AB016E1D8F4B6E4BBE95@hasmsx107.ger.corp.intel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi,
Lately I faced an issue with an OS I build using BR2019.2
The issue was that when I enabled SSH on my OS, system hanged during boot and I did not get login prompt on the serial console.
After analyzing it on buildroot irc channel forum, I figured out the hang is related to /usr/bin/ssh-keygen ?A hanging trying to get a random number (getrandom() syscall)
Googling a bit explained this as kernel?s entropy pool is empty for some reason and hence random number generation hanged.
Solution (for me) was to enable HAVEGED package on BR.
I suggest to add a hint on this on BR manual (above section) or to add some hint to BR menuconfig tool
The problem was not happening to me on older BR version (2018) as that version uses also an older SSH package which somehow could live without the HAVEGED or so.
Thanks,
Gil



---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
---------------------------------------------------------------------
Intel Israel (74) Limited

This e-mail and any attachments may contain confidential material for
the sole use of the intended recipient(s). Any review or distribution
by others is strictly prohibited. If you are not the intended
recipient, please contact the sender and delete all copies.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190519/64b0ad38/attachment.html>
