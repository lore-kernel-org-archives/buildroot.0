From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 19 Apr 2018 22:38:45 +0200
Subject: [Buildroot] [PATCH 1/4] download/git: ensure we always work in
 the expected repository
In-Reply-To: <e9b0b62a20acfcd0641cbfee758982245a19b8fa.1523983687.git.yann.morin.1998@free.fr>
References: <cover.1523983687.git.yann.morin.1998@free.fr>
 <e9b0b62a20acfcd0641cbfee758982245a19b8fa.1523983687.git.yann.morin.1998@free.fr>
Message-ID: <20180419223845.704c48eb@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Apr 2018 18:48:20 +0200, Yann E. MORIN wrote:
> git always look directories up until it finds a repository. In case
> the git cache is broken, it may no longer be identified as a repository,
> and git will look higher in the directories until it finds one.
> 
> In the default conditions, this would be Buildroot's own git tree
> (because DL_DIR is a subdir of Buildroot), but in some situations may
> very well be any repository the user has Buildroot in, like a
> br2-external tree...
> 
> So, we force git to use our git cache and never look elsewhere, as
> Suggested by Ricardo.
> 
> Use GIT_DIR, as it has been there for ages now, while --git-dir was
> only introduced later (even if most distros ship an later version),
> as suggested by Arnout.
> 
> Also fix the one call to git that was not using the wrapper.
> 
> Reported-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/download/git | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
