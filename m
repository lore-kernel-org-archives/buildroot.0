From: yuvaraj.patil at wipro.com <yuvaraj.patil@wipro.com>
Date: Sat, 19 Jul 2014 17:44:11 +0000
Subject: [Buildroot] Help : Blackfin - Target Binary Format (FDPIC/FLAT) and
 BR2_PREFER_STATIC_LIB option dependency
Message-ID: <C89D20716E201D428CB114157FC1F4E380F18E6A@BLR-SJP-MBX-1.wipro.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas and All,

For below packages (and few more packages) building failure is reported on Blackfin.

1.       Prboom-2.5.0 (http://autobuild.buildroot.net/results/c3ea501d2ba5e17ccb3f88c0588ddf00fd0a4649/<http://autobuild.buildroot.net/results/c3ea501d2ba5e17ccb3f88c0588ddf00fd0a4649>)

2.       Gnuplot-4.6.2 (http://autobuild.buildroot.net/results/14846b8d1a054409d1cee9f3ce1413f08b4c3634/<http://autobuild.buildroot.net/results/14846b8d1a054409d1cee9f3ce1413f08b4c3634>)

In the config files provided at the above autobuild log links, "FLAT" binary format is selected and BR2_PREFER_STATIC_LIB option gets selected by default.
I tried to build these packages with few combinations for target binary format on Blackfin and my observation is as below.


a.       If "FLAT" binary format is selected, BR2_PREFER_STATIC_LIB option gets selected by default and the package fails to build.

b.      If "FDPIC" is selected and BR2_PREFER_STATIC_LIB  option is selected, the package fails to build

c.       If "FDPIC" is selected and BR2_PREFER_STATIC_LIB  is NOT selected, the package builds successfully.

So looks like static linking is not supported on Blackfin for these packages.

I need your help to understand how we can add dependency on BR2_PREFER_STATIC_LIB  option (disable this option) while building the packages. Can you please suggest?

Thank you in advance.

Thanks
Yuvaraj Patil
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140719/3388418a/attachment.html>
