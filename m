From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Oct 2014 11:37:59 +0200
Subject: [Buildroot] [PATCH v2 2/2] pkg-infra: make timing of steps
 optional
In-Reply-To: <1410744672-32698-2-git-send-email-danomimanchego123@gmail.com>
References: <1410744672-32698-1-git-send-email-danomimanchego123@gmail.com>
 <1410744672-32698-2-git-send-email-danomimanchego123@gmail.com>
Message-ID: <20141012113759.7e73f645@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Danomi Manchego,

On Sun, 14 Sep 2014 21:31:12 -0400, Danomi Manchego wrote:
> Commit 17d4eb1e0261793a9f89e4a2253602c7ab926d2e added a hook to log timing
> of steps to a build-time.log file, which provides data for the "graph-build"
> target for examining build time stats.  If one uses buildroot on a daily
> basis as part of a build system, then its conceivable that there might be
> long periods of time between "make clean" ops.  So the log file continues
> to grow.  This patch makes the accumulation of the timing data optional, to
> avoid having a silent endlessly growing log in the build directory.
> 
> Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

We had some discussion at the Buildroot meeting today about this patch,
and the general opinion is the one already expressed by Yann. The
amount of data accumulated in this build-time.log file is very small,
so even if you do repeated builds without make clean for several days,
the file size will remain really small compared to the overall size of
a standard Buildroot build tree. Therefore, we don't think adding yet
another configuration option for this is really useful, and
consequently we have marked your patch as Rejected in patchwork.

Thanks,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
