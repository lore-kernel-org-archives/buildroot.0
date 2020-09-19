From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 14:52:15 +0200
Subject: [Buildroot] [PATCH] package/live555: bump to version 2020.08.19
In-Reply-To: <20200917214317.23734-1-buildroot@heine.tech>
References: <20200917214317.23734-1-buildroot@heine.tech>
Message-ID: <20200919145215.20573071@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Michael,

+Fabrice in Cc.

On Thu, 17 Sep 2020 23:43:16 +0200
Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:

> According to [0] this version fixes memory leaks and buffer overflows.
> 
> Commit bc80c9121b70b576 added LIBS_FOR_LIVEMEDIA_LIB also for
> static builds. That broke those builds.
> With this commit it now only alters this parameter if it's there
> by replacing echo with sed.
> Also it explicitly links static against -pthread -lz as this
> seems neccessary.
> 
> Fixes:
> http://autobuild.buildroot.net/results/f13/f13f1e40a2749fec5ad8a93cd8eea9a6e4e577b
> 
> [0] http://live555.com/liveMedia/public/changelog.txt
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

The static linking fix seems unrelated to the version bump, and this is
the sort of fix we might want to backport.

However, Fabrice already took a look at that static linking issue and
has submitted a while ago some patches:

  https://patchwork.ozlabs.org/project/buildroot/patch/20200713155135.1214109-1-fontaine.fabrice at gmail.com/
  https://patchwork.ozlabs.org/project/buildroot/patch/20200713155135.1214109-2-fontaine.fabrice at gmail.com/

I guess we should try to apply these and then the version bump on its
own.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
