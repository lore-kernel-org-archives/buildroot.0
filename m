From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 18:58:00 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: move mkdir rule to after
 HOST_DIR is defined
In-Reply-To: <20170804163130.15772-1-arnout@mind.be>
References: <20170804163130.15772-1-arnout@mind.be>
Message-ID: <20180331185800.04ad0c18@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 4 Aug 2017 18:31:29 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> HOST_DIR is defined twice: once to its default value before .config is
> included, and once more to BR2_HOST_DIR after .config is included.
> However, the rule that defines the mkdir for HOST_DIR comes between
> these two, so it will always use the default definition. Therefore,
> if a non-default BR2_HOST_DIR is used, there will be no rule to create
> that directory, while the dirs target depends on it.
> 
> This happens to work at the moment, because in the dirs target,
> $(STAGING_DIR) comes before $(HOST_DIR), so $(HOST_DIR) will be created
> implicitly. However, this will fail in top-level parallel builds where
> both will be created in parallel.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  Makefile | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

Both applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
