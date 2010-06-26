From: Patrick McNeil <patrick@phidgets.com>
Date: Fri, 25 Jun 2010 19:11:09 -0600
Subject: [Buildroot] problem with BR2_HAVE_DEVFILES/BR2_PACKAGE_GCC_TARGET
	when BR2_SOFT_FLOAT=y
Message-ID: <BBC73B7A-204B-4176-AEBF-101C56B131AB@phidgets.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Compiling for ARM920T EABI. BR2_SOFT_FLOAT=y. The rootfs works well with installed gcc/devfiles, but when I include target gcc/devfiles in rootfs, I start gettting "can't resolve symbol '__aeabi_d2iz'" errors. Further examination show that the soft-float functions are not in libm.so anymore after adding in gcc/devfiles, but they are in libm.a, and they were in libm.so in the smaller rootfs.

--
Patrick McNeil
Lead Developer | Phidgets Inc.
patrick at phidgets.com | www.phidgets.com
--
There are two ways to write error-free programs; only the third works.
-Alan J. Perlis

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100625/823e0417/attachment-0001.html>
