From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jun 2013 18:00:54 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
Message-ID: <20130616180054.58f52914@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I've made a number of small changes in the autobuilders configuration
and setup:

 *) I've extended the mail notification script to be able to send
    per-architecture notification to persons who are specifically taking
    care of a given architecture. So far, Sonic Zhang is receiving a
    notification for Blackfin related failures, and Mischa Jonker is
    receiving a notification for ARC related failures.

 *) On the Free Electrons build server, I've modified the build script
    so that before every build, it removes 5 random files from the
    download directory. This will allow to make sure the autobuilders
    sometimes re-download tarballs or git trees, and therefore we
    should notice sooner when something is no longer available. For
    example, I've discovered that both the axel and the Blackfin
    toolchain downloads were broken, but that wasn't noticeable due to
    the tarballs already being in the download cache of the
    autobuilders.

 *) I've updated the toolchain configurations on the Free Electrons
    build server. All external toolchains built by Buildroot have been
    rebuilt using Buildroot 2013.05 (tarballs available at
    http://autobuild.buildroot.org/toolchains/tarballs/). Many
    configurations that used external toolchains have been updated to
    use the latest available versions of those toolchains and I've added
    a MIPS64 configuration that uses the Sourcery toolchain. See
    http://autobuild.buildroot.org/toolchains/configs/free-electrons/
    for the complete list of toolchains.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
