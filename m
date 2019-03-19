From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 12:11:27 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-03-17
In-Reply-To: <20190318131137.GA15193@lwo1-lhp-f71841> (Vadym Kochan's message
 of "Mon, 18 Mar 2019 15:11:37 +0200")
References: <20190318070113.E1E6A85CC3@whitealder.osuosl.org>
 <20190318131137.GA15193@lwo1-lhp-f71841>
Message-ID: <87va0f5db4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vadym" == Vadym Kochan <vadim4j@gmail.com> writes:

 > Hi All,
 > On Mon, Mar 18, 2019 at 07:01:08AM -0000, Thomas Petazzoni wrote:
 >> Hello,
 >> 
 >> Build statistics for 2019-03-17
 >> ===============================
 >> 
 >> branch |  OK | NOK | TIM | TOT |
 >> 2018.02.x |  31 |   0 |   0 |  31 |
 >> 2018.11.x |  21 |   3 |   0 |  24 |
 >> 2019.02.x |  30 |   2 |   0 |  32 |
 >> master | 245 |  62 |   3 | 310 |
 >> 
 >> Results for branch '2018.11.x'
 >> ==============================
 >> 
 >> Classification of failures by reason
 >> ------------------------------------
 >> 
 >> runc-v1.0.0-rc6 | 2 
 >> libsquish-1.15 | 1 
 >> 
 >> 
 >> Detail of failures
 >> ------------------
 >> 
 >> m68k |                 libsquish-1.15 | NOK | http://autobuild.buildroot.net/results/c7357d045b078c5742bde21c82904b4ec0defc35 |     
 >> i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/a63e9c9f026ce49dc299116affce0f85b567786d |     
 >> i686 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/0ab86addc477d45542a5cb283d3636fb73da22da |     
 > I did try this defconfig with runc and pulled latest 2018.11.x branch but build
 > succeed.

You probably didn't build runc as I recently cherry picked:

commit 82d40d87b0441ae4d88c05737f8d9322668b14da
Author: Christian Stewart <christian@paral.in>
Date:   Tue Feb 19 14:35:28 2019 -0800

    runc: depend on linux headers >= 3.11 for O_TMPFILE

    Fixes:
    http://autobuild.buildroot.net/results/63e9d88ae5177541be463f1e2aafec59aa410479

    Add dependency on headers >= 3.11 for O_TMPFILE, used by runc after the
    fix for CVE-2019-5736 and propagate to the reverse dependencies of runc.

    Notice that C library support for O_TMPFILE is also needed, which was added
    in glibc 2.19 and musl 0.9.15.

    Signed-off-by: Christian Stewart <christian@paral.in>
    [Peter: squash series, extend commit message, mention C library dependency,
            fix indentation]
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

    (cherry picked from commit 905e976a6af224b3ed015c46fcea2d717c155f55)
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

And the defconfig uses a toolchain with linux headers 3.9.

-- 
Bye, Peter Korsgaard
