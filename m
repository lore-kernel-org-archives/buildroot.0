From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 15 Sep 2020 21:47:13 +0200
Subject: [Buildroot] [PATCH] support/misc/gitlab-ci.yml.in: specify
 image to use
In-Reply-To: <20200915193832.291674-1-arnout@mind.be>
References: <20200915193832.291674-1-arnout@mind.be>
Message-ID: <5ed75a34-3772-53a1-2d68-58bf881e0553@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Arnout,

Le 15/09/2020 ? 21:38, Arnout Vandecappelle (Essensium/Mind) a ?crit?:
> Commit 93a2870966 split off the generated gitlab-ci.yml into a child
> pipeline. However, the generated gitlab-ci.yml file no longer had an
> 'image' tag. The result is that the jobs will use whatever image happens
> to be configured on the runner - which leads to frequent pipeline
> failures.
> 
> Fix this by explicitly specifying the image to use (the same one as in
> top-level .gitlab-ci.yml).
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  support/misc/gitlab-ci.yml.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/support/misc/gitlab-ci.yml.in b/support/misc/gitlab-ci.yml.in
> index fcfff5c6aa..892eb9ed64 100644
> --- a/support/misc/gitlab-ci.yml.in
> +++ b/support/misc/gitlab-ci.yml.in
> @@ -1,3 +1,5 @@
> +image: buildroot/base:20200814.2228
> +

Adding Yann in Cc:

This basically revert change from:

https://git.buildroot.net/buildroot/commit/?id=bef67390949dd6ba5cbfd658371c5df81bb5758c

commit 93a2870966 didn't remove the 'image' tag.

I guess you used support/scripts/generate-gitlab-ci-yml locally without gilab
environment variable (CI_JOB_IMAGE).

Best regards,
Romain


>  .check-DEVELOPERS_base:
>      # get-developers should print just "No action specified"; if it prints
>      # anything else, it's a parse error.
> 
