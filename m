From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:29:49 +0200
Subject: [Buildroot] [PATCH] nginx: disallow AIO support on AArch64
In-Reply-To: <1413133117-8240-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sun, 12 Oct 2014 18:58:37 +0200")
References: <1413133117-8240-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87fvettcvm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The nginx AIO support cannot build on AArch64, because it hardcodes
 > the usage of SYS_eventfd(), while it should just use eventfd() from
 > the C library.

 > See https://bugs.launchpad.net/linaro-aarch64/+bug/1160013 for details.

 > Fixes:

 >   http://autobuild.buildroot.org/results/54b/54bb761f9e774d91066b78217efcd583fdd85ff3/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
