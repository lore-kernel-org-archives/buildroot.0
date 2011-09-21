From: Vincent BENOIT <sinseman44@gmail.com>
Date: Wed, 21 Sep 2011 13:57:45 +0200
Subject: [Buildroot] Patches to use buildroot kernel version in crosstool-ng
Message-ID: <CACdd115iK5hJd8q9ie_VMDzyYgHKUzG+JLOpXrVnyBinbS7QSQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I create patches to use the current kernel version chosen in buildroot in
crosstool-ng
with a new parameter (boolean) in buildroot (BR2_TOOLCHAIN_CTNG_BUILDROOT_
KERNEL), the user can choose if he wants to use the same kernel version in
crosstool-ng
the makefile of package crosstool-ng is changed to download the kernel and
apply patches before compile crosstool-ng.

4 patches for buildroot :

crosstool_ng_add_new_param.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6c9aef47abb&attid=0.1&disp=safe&realattid=f_gsu4z6f90&zw>
makefile_crosstool_ng_package.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6c9aef47abb&attid=0.2&disp=safe&realattid=f_gsu54dgi1&zw>
makefile_download_kernel.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6c9aef47abb&attid=0.3&disp=safe&realattid=f_gsu54lcf2&zw>
makefile_toolchain_crosstool_ng.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6c9aef47abb&attid=0.4&disp=safe&realattid=f_gsu54q1h3&zw>

2 patches for crosstool-ng (add them in directory package/crosstool-ng/) :
create a sym link (linux-custom) and install kernel headers

crosstool-ng-001-makefile-buildroot-kernel-version.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6ed82b16d8f&attid=0.5&disp=safe&realattid=f_gsu57n3h4&zw>
crosstool-ng-002-config-buildroot-kernel-version.patch<http:///?ui=2&ik=374619ac2b&view=att&th=1328b6ed82b16d8f&attid=0.6&disp=safe&realattid=f_gsu57zhp5&zw>

It's the first time for me sending patches and i don't know if it's the best
way to send them by email

Sincerely
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0001.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: crosstool_ng_add_new_param.patch
Type: text/x-diff
Size: 428 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0006.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile_crosstool_ng_package.patch
Type: text/x-diff
Size: 721 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0007.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile_download_kernel.patch
Type: text/x-diff
Size: 553 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0008.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: makefile_toolchain_crosstool_ng.patch
Type: text/x-diff
Size: 707 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0009.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: crosstool-ng-001-makefile-buildroot-kernel-version.patch
Type: text/x-diff
Size: 2248 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0010.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: crosstool-ng-002-config-buildroot-kernel-version.patch
Type: text/x-diff
Size: 812 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110921/27ca7a7a/attachment-0011.bin>
