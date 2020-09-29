From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Sep 2020 20:42:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: fix
 segfault on brcm platforms
In-Reply-To: <20200922002916.3621404-1-joseph.kogut@gmail.com> (Joseph Kogut's
 message of "Mon, 21 Sep 2020 17:29:16 -0700")
References: <20200922002916.3621404-1-joseph.kogut@gmail.com>
Message-ID: <87tuvgv2z2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Joseph" == Joseph Kogut <joseph.kogut@gmail.com> writes:

 > According to the original patch message:
 >     Some Broadcom set-top-box boards have PCI busses, but the GPU is
 >     still probed through DT.  We would dereference a null busid here
 >     in that case.

 > Fixes a segfault on at least the RPi 4 w/ xserver 1.20.9, probably
 > others as well.

 > Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
 > ---

 > Somehow this patch was merged to master a year ago, but didn't make it
 > into 1.20.9. Consider applying this to stable branches w/ 1.20.9 as
 > well, Xorg is broken on Broadcom platforms without it.

Committed to 2020.02.x, 2020.05.x and 2020.08.x after moving the patch
to the 1.20.9 subdir, thanks.

-- 
Bye, Peter Korsgaard
