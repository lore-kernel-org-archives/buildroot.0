From: Patrick McNeil <patrick@phidgets.com>
Date: Tue, 9 Dec 2008 10:23:13 -0700
Subject: [Buildroot] uClibc, gcc get rebuilt on every make
Message-ID: <0E8C14EA-CCA7-4F45-8E17-14321FFB4407@phidgets.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm using svn24232, arm920t, with gcc and headers on the target. Every  
time I run make, even if I haven't made any changes, the cross  
compiler toolchain, as well as the target gcc, and uClibc gets  
rebuilt, taking about half an hour. Any ideas what this is depending  
on? I know that buildroot from a few months ago did not do this.

Also, what is the proper way to rebuild root if I have changed  
something - ie changed files in target_skeleton, updates something in  
a package directory, etc.? Right now I run this script and it seems to  
work ok. If I don't delete /root and .root, the system doesn't seem to  
realize that things have changed.


#!/bin/bash

[ -e project_build_arm/phidget_sbc/.root ] && {
	echo "Removing Root..."
	rm -rf project_build_arm/phidget_sbc/root/
	rm project_build_arm/phidget_sbc/.root
}
[ -e build_arm/webif-0.2/.built ] && {
	echo "Removing webif..."
	rm build_arm/webif-0.2/.built
}
for stamp in $( find build_arm/ | grep .stamp_staging_installed ); do
	echo "Removing $stamp..."
	rm $stamp
done
for stamp in $( find project_build_arm/phidget_sbc/autotools-stamps - 
type f ); do
	echo "Removing $stamp..."
	rm $stamp
done

--
Patrick McNeil
Lead Developer | Phidgets Inc.
patrick at phidgets.com | www.phidgets.com
--
There are two ways to write error-free programs; only the third works.
-Alan J. Perlis

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20081209/2686a70e/attachment.htm 
