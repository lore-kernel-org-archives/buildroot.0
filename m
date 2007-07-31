From: Christopher Reder <creder@digitalcpt.com>
Date: Tue, 31 Jul 2007 13:38:00 -0500
Subject: [Buildroot] staging_dir/usr/lib vs staging_dir/lib
Message-ID: <07c301c7d3a1$ebb2fdc0$2600a8c0@engineering5>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It seems like there may be some confusion over what directories to use when
installing/hosting/storing libs.

 

I just pulled down the latest and enabled fbv which selected libungif.  In
doing so, it fails when it tries to remove libs from staging_dir/lib because
the libs are actually in staging_dir/usr/lib.  

 

Where should those libs be?  Are they being installed in the wrong directory
or are they trying to remove them from the wrong directory?

 

Can someone clarify this?  Same thing happened when trying to build libpng
as well when it was trying to cp libs over and it was copying from a
directory where they were not installed.

 

TIA

 

make[3]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/util'

make[2]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/util'

Making install in doc

make[2]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/doc'

make[3]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/doc'

make[3]: Nothing to be done for `install-exec-am'.

make[3]: Nothing to be done for `install-data-am'.

make[3]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/doc'

make[2]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/doc'

Making install in pic

make[2]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/pic'

make[3]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/pic'

make[3]: Nothing to be done for `install-exec-am'.

make[3]: Nothing to be done for `install-data-am'.

make[3]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/pic'

make[2]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4/pic'

make[2]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4'

make[3]: Entering directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4'

make[3]: Nothing to be done for `install-exec-am'.

make[3]: Nothing to be done for `install-data-am'.

make[3]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4'

make[2]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4'

make[1]: Leaving directory
`/home/christopher/svn_buildroot/buildroot/build_arm/libungif-4.1.4'

rm
/home/christopher/svn_buildroot/buildroot/build_arm/staging_dir/lib/libungif
.la

rm: cannot remove
`/home/christopher/svn_buildroot/buildroot/build_arm/staging_dir/lib/libungi
f.la': No such file or directory

make: ***
[/home/christopher/svn_buildroot/buildroot/build_arm/staging_dir/lib/libungi
f.a] Error 1

linuxbox:/home/christopher/svn_buildroot/buildroot#

-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070731/579cd6ff/attachment-0001.htm 
