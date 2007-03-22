From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu, 22 Mar 2007 20:27:21 +0100
Subject: [Buildroot] CFLAGS patch
Message-ID: <02a601c76cb8$7e44aa40$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I sent a set of patches some time ago which ensured that 
CFLAGS=$(TARGET_CFLAGS)
was set in the "package/<package>/<package>.mk" files.

I found 32 packages with this problem.
This patch was rejected as "not needed".

When I try to apply my private patches, to the current svn,
then I find that the problem I tried to highlight 
has been fixed in 16 out the 32 packages.

They now all have CFLAGS=$(TARGET_CFLAGS)
My set of patches has not been used though.

I think we need to ask ourself:  Why only 16 out of the 32?`

Why should:
* acpid
* berkleydb
* hdparam
* hotplug
* iostat
* ltp_testsuite
* memtester
* mrouted
* netkitbnase
* procsps
* python
* sysklogd
* tinyx
* udhcp
* xorg

not be compiled with CFLAGS=$(TARGET_CFLAGS)

I can resubmit the patches for these packages...

Best Regards
Ulf Samuelsson
