From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 9 Dec 2018 21:29:21 +0100
Subject: [Buildroot] [PATCH 1/3] .gitlab-ci.yml: add trigger per type of
 job
In-Reply-To: <20181028235839.22472-2-ricardo.martincoski@gmail.com>
References: <20181028235839.22472-1-ricardo.martincoski@gmail.com>
 <20181028235839.22472-2-ricardo.martincoski@gmail.com>
Message-ID: <20181209212921.3897992e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 28 Oct 2018 20:58:37 -0300, Ricardo Martincoski wrote:
> Currently the user has 2 sets of jobs that can be triggered on a GitLab
> pipeline.
>  - to trigger all defconfigs, all runtime tests and all check-* jobs:
>    $ git tag <name>
>    $ git push gitlab <name>                     # currently 260 jobs
>  - to trigger only the check-* jobs:
>    $ git push gitlab HEAD:<name>                # currently   4 jobs
> 
> This is not much versatile, so the user ends up hand-editing the
> .gitlab-ci.yml in order to trigger some subsets, even the common ones,
> for instance all runtime tests.
> 
> Add 2 more subsets that can be triggered based on the name of the
> branch pushed.
>  - to trigger all defconfigs and all check-* jobs:
>    $ git push gitlab HEAD:<name>-defconfigs     # currently 192 jobs
>  - to trigger all runtime tests and all check-* jobs:
>    $ git push gitlab HEAD:<name>-runtime-tests  # currently  72 jobs
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

This commit was applied by Arnout a while ago:
https://git.buildroot.org/buildroot/commit/?id=f177fd66e47879a72bb678a2de7ce658410cc4b9.
But apparently, the notification was not sent to the mailing list, and
the patchwork state was not updated. This mail does the former, and I'm
going to the latter :-)

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
