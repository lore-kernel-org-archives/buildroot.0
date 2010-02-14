From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Feb 2010 12:00:39 +0100
Subject: [Buildroot] avahi build failure on intltool-update
Message-ID: <20100214120039.2c7ff159@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

With the attached .config, I get the following build failure on avahi
(and I must leave so I don't have the time to dig into it now) :

=============================================================================================
checking for intltool >= 0.35.0... ./configure: line 28714: intltool-update: command not found
 found
configure: error: Your intltool is too old.  You need intltool 0.35.0 or later.
=============================================================================================

Looks strange to me, since intltool isn't packaged at all in Buildroot,
and I know that Peter is using avahi regularly. Peter, in
bc9512c09d59d731a2ad0b96ce778ca8f90964c1, you made some changes
regarding locale/gettext/intl support in avahi. Can you explain how
these things work, and maybe why intltool-update seems to be required
in my config ?

The configure.ac on avahi seems pretty clear that intltool is required
in any case.

The full build log is available at
http://free-electrons.com/~thomas/buildroot/avahi-intl/build.log.bz2
(bz2 compressed, because it is 25M uncompressed).

Cheers,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config
Type: application/octet-stream
Size: 31124 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100214/3481150d/attachment-0001.obj>
