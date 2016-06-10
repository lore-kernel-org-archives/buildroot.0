From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 Jun 2016 20:16:49 +0200
Subject: [Buildroot] [PATCH] build: cleanup remaining references to
 BR2_STRIP_sstrip
In-Reply-To: <1465558082-3941-1-git-send-email-julien.floret@6wind.com>
References: <1465558082-3941-1-git-send-email-julien.floret@6wind.com>
Message-ID: <20160610201649.79d0ea1e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 10 Jun 2016 13:28:02 +0200, Julien Floret wrote:
> sstrip option has been removed in commit
> 106f5b8c5093 ("build: remove deprecated sstrip option").
> 
> Signed-off-by: Julien Floret <julien.floret@6wind.com>
> ---
>  package/Makefile.in                  | 8 --------
>  support/dependencies/dependencies.mk | 4 ----
>  2 files changed, 12 deletions(-)

Applied to master, thanks. I think package/sstrip/sstrip.mk could also
be simplified to get rid of the host variant, since it's not used
anywhere anymore.

It would be me, I would also remove the target variant, or at least
mark it as deprecated.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
