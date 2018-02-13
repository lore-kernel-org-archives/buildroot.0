From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:12:10 +0100
Subject: [Buildroot] [PATCH] support/testing: fix job check-gitlab-ci.yml
In-Reply-To: <1518469328-5895-1-git-send-email-ricardo.martincoski@gmail.com>
References: <20180212090725.323e5a6c@windsurf.lan>
 <1518469328-5895-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180213231210.185efcfb@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 12 Feb 2018 19:02:08 -0200, Ricardo Martincoski wrote:
> Currently 'run-tests -l' is broken. It breaks 'make .gitlab-ci.yml' that
> in turn breaks the job in GitLab.
> 
> TestRustBase is not a test case by itself, so it can't have a method
> with the name starting with "test_" otherwise nose2 assumes it is a test
> case.
> Move the test_run method from the base class to the derived classes.
> 
> While at it, update .gitlab-ci.yml with the new test cases.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/52000035
> 
> Reported-by: Yegor Yefremov <yegorslists@googlemail.com>
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> check-gitlab-ci.yml after the fix:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/52092002
> which is part of a full run:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/17391318
> ---
>  .gitlab-ci.yml                             |  2 ++
>  support/testing/tests/package/test_rust.py | 18 ++++++++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
