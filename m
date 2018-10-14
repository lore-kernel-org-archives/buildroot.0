From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 14 Oct 2018 20:04:54 +0200
Subject: [Buildroot] [PATCH] sedutil: disable for MIPS Codesourcery
 toolchain
In-Reply-To: <20181013202225.22359-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 13 Oct 2018 22:22:24 +0200")
References: <20181013202225.22359-1-peter@korsgaard.com>
Message-ID: <874ldoqu9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/005/00588d7cd37ba9620f01e970bf328540527558fc/
 > http://autobuild.buildroot.net/results/2fc/2fc2d0111e467671ee4cec427234a9b2aada1cc9/

 > Linux 4.4 moved the NVME ioctl definitions from nvme.h to nvme_ioctl.h in
 > commit 9d99a8dda154 (nvme: move hardware structures out of the uapi version
 > of nvme.h), but nvme_ioctl.h was only exported to user space in 4.4.4 in
 > commit 7712c014b16f64d3 (uapi: update install list after nvme.h rename).

 > sedutil contains the needed logic to look at either nvme.h or nvme_ioctl.h,
 > but as the ioctl definitions are not exported in 4.4..4.4.3, it fails to
 > build.

 > The MIPS Codesourcery toolchain uses 4.4.1 kernel headers, so disable the
 > sedutil package if this toolchain is used.

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
