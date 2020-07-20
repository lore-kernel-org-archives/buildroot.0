From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 20 Jul 2020 10:44:20 +0200
Subject: [Buildroot] [PATCH] gitlab-ci: convert only/except to rules
In-Reply-To: <20200718154713.38825-1-romain.naour@gmail.com>
References: <20200718154713.38825-1-romain.naour@gmail.com>
Message-ID: <882ddbc1-072d-4b14-891f-8cc0d7403194@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/07/2020 17:47, Romain Naour wrote:
> only/except keywords will be deprecated by upcoming gitlab release,
> upstream recommend to use rules keyword instead [1][2][3][4][5].
> 
> This patch convert .gitlab-ci.yml to use rules, no functional
> changes intended.
> 
> After this patch, we should still have the following behaviour
> while pushing commit, tag, branches:
> 
>      - to trigger only the check-* jobs:
>        $ git push gitlab HEAD:<name>
> 
>      - to trigger all defconfigs and all check-* jobs:
>        $ git push gitlab HEAD:<name>-defconfigs
> 
>      - to trigger all runtime tests and all check-* jobs:
>        $ git push gitlab HEAD:<name>-runtime-tests
> 
>      - to trigger one defconfig job:
>        $ git push gitlab HEAD:<name>-<defconfig name>
> 
>      - to trigger one runtime job:
>        $ git push gitlab HEAD:<name>-<test case name>
> 
> [1] https://gitlab.com/gitlab-org/gitlab/-/commit/7eaaa597e24bf24743bdd8f8d1d51ade83b3f6de
> [2] https://about.gitlab.com/releases/2020/06/22/gitlab-13-1-released/#templates-to-simplify-initial-rules-keyword-configuration
> [3] https://about.gitlab.com/releases/2020/05/22/gitlab-13-0-released/#auto-devops-and-secure-configuration-templates-are-changing-to-%60rules%60-instead-of-%60only/except%60
> [4] https://gitlab.com/gitlab-org/gitlab/issues/27449
> [5] https://gitlab.com/groups/gitlab-org/-/epics/2783
> [6] https://buildroot.org/downloads/manual/manual.html#_using_the_run_tests_framework
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 I'm still impressed with how elegant this solution with branch names is!

 Regards,
 Arnout
