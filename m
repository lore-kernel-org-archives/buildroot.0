From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 13:21:37 +0200
Subject: [Buildroot] [PATCH v7 3/4] BR2_FORTIFY*: toolchain wrapper
 limitation note
In-Reply-To: <1537219312-59962-4-git-send-email-matthew.weber@rockwellcollins.com>
 (Matt Weber's message of "Mon, 17 Sep 2018 16:21:51 -0500")
References: <1537219312-59962-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1537219312-59962-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <87ftx0euda.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > A note is added to tie off the discussion on why moving _FORTIFY_SOURCE
 > related flags into the toolchain wrapper doesn't currently work.

 >  - Currently -D_FORTIFY_SOURCE and optimizations are passed through
 >    CFLAGS

 >  - Packages like linux-tools ignore CFLAGS entirely and some
 >    autotools toolchain testing cases dependent on not using
 >    CFLAGS.

 >  - If FORTIFY_SOURCE is passed through the wrapper, then linux-tools
 >    will no longer be able to ignore it, because it's enforced at a
 >    lower-level and since the optimization -Os/g/1/2/3 are via CFLAGS,
 >    there is no optimization flag set.  Therefore linux-tools will do
 >    all its configuration tests with FORTIFY_SOURCE forcefully enabled
 >    at the wrapper level, but no optimization enabled, and consequently
 >    tests will fail.

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
