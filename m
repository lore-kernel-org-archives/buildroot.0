From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:55:32 +0200
Subject: [Buildroot] [PATCH] binutils: backport xtensa ld optimizations
In-Reply-To: <1428598551-14838-1-git-send-email-jcmvbkbc@gmail.com>
References: <1428598551-14838-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20150409215532.32383d6f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Max Filippov,

On Thu,  9 Apr 2015 19:55:51 +0300, Max Filippov wrote:
> This series optimizes most time-consuming algorithms and data structures
> in the xtensa link-time relaxation code, leaving relaxation logic intact.
> 
> Speedup linking typical linux kernel is ~8 times (1 minute instead of 8),
> pathological cases (linking objects partially linked without relaxation)
> are handled ~60 times faster (1 minute instead of an hour).
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>

Applied, thanks. I must say I'm not super happy with having such large
patches, especially as they will only disappear when we get rid of the
corresponding binutils version. But oh well, it's on the other side
really nice to see that you're maintaining the xtensa support in
Buildroot on a regular basis, and it's probably needed to have a proper
support for this architecture.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
