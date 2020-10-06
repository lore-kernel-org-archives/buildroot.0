From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 6 Oct 2020 22:42:17 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: include
 Branches workflow
In-Reply-To: <20200830155953.1650346-1-arnout@mind.be>
References: <20200830155953.1650346-1-arnout@mind.be>
Message-ID: <20201006204217.GS11621@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2020-08-30 17:59 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Recently, gitlab-ci has gained a lot more flexibility in when pipelines
> are created. As a side-effect of this, double pipelines may be created
> when a `when` clause is used in some job. Avoid this by adding a
> workflow that launches it only on branches. See [1] and [2].
> 
> Note that in reality, the duplicate pipelines only occur for merge
> requests. Since we don't have merge requests, we don't have this
> problem. Howver, gitlab also displays an annoying error message on the
> pipeline page [3], and it sends an error mail to the triggerer (i.e.,
> Arnout), so it's still useful to do this.
> 
> [1] https://docs.gitlab.com/ee/ci/yaml/README.html#prevent-duplicate-pipelines
> [2] https://docs.gitlab.com/ee/ci/yaml/README.html#workflowrules-templates
> [3] https://gitlab.com/buildroot.org/buildroot/-/pipelines/183589361/builds
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

We've no merged a better script that contains all the logic about
generating the child pipeline, so I believe this patch of yours is no
longer needed.

Regards,
Yann E. MORIN.

> ---
> I'd like to get this one in master, because the e-mails are annoying me
> :-)
> ---
>  support/misc/gitlab-ci.yml.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index dddebf09e9..8a031898ef 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,6 +1,9 @@
>  # Configuration for Gitlab-CI.
>  # Builds appear on https://gitlab.com/buildroot.org/buildroot/pipelines
>  
> +include:
> +  - template: 'Workflows/Branch-Pipelines.gitlab-ci.yml'
> +
>  image: buildroot/base:20200814.2228
>  
>  .check_base:
> -- 
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
