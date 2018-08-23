From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 23 Aug 2018 11:47:14 +0200
Subject: [Buildroot] [PATCH] libssh: fix cross compile with older cmake
In-Reply-To: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
References: <9dce5a842ebb73937268fa66a3ee699785c5ae7c.1534975110.git.baruch@tkos.co.il>
Message-ID: <20180823114714.27bb3e9b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Thu, 23 Aug 2018 00:58:30 +0300, Baruch Siach wrote:
> Old version of cmake break cross-compilation when FindThreads is used
> because of a try_run call. Add a workaround that avoids try_run.
> 
> cmake bug report: https://gitlab.kitware.com/cmake/cmake/issues/16920
> 
> Should fix:
> http://autobuild.buildroot.net/results/8aa/8aa2bd894416a4508ca7140f8947ff46243f8b78/
> http://autobuild.buildroot.net/results/f2c/f2cc965bb134bf4fd9e625eb267b67c949c202fc/
> 
> Cc: Scott Fan <fancp2007@gmail.com>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

It wasn't clear from your commit log if this patch was for next or
master. However, the build issue only happened on next for now, and
is probably related to the libssh version bump that we have in next, so
I applied your patch to the next branch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
