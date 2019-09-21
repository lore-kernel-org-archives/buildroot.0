From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Sep 2019 15:47:20 +0200
Subject: [Buildroot] [PATCH 1/3] package/docker-engine: security bump to
 version 18.09.7
In-Reply-To: <20190920060959.28210-1-peter@korsgaard.com>
References: <20190920060959.28210-1-peter@korsgaard.com>
Message-ID: <e1e0b0d6-04ea-4b7d-2265-0828b6337700@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Typo in the subject line: you're bumping to 18.09.9, not .7.

 Fixed that and applied all three to master, thanks.

 Regards,
 Arnout

On 20/09/2019 08:09, Peter Korsgaard wrote:
> Fixes the following security vulnerability:
> 
> CVE-2019-13509: Docker Engine in debug mode may sometimes add secrets to the
> debug log.  This applies to a scenario where docker stack deploy is run to
> redeploy a stack that includes (non external) secrets.  It potentially
> applies to other API users of the stack API if they resend the secret.
> 
> And a number of other non-security issues.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index 4ef6905b5d..b89310f993 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256	b4f55831f5e7c5a92cd91f77aad1541ccd572eb18df2f44a01c372bceb3f9b6b  docker-engine-18.09.7.tar.gz
> +sha256	fa3a9e998627418d648495d06d168c4d26ed07859c9370d5fddbfd29c26d8592  docker-engine-18.09.9.tar.gz
>  sha256	2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index 99e3088f65..6a225ee5f0 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = 18.09.7
> +DOCKER_ENGINE_VERSION = 18.09.9
>  DOCKER_ENGINE_SITE = $(call github,docker,engine,v$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
> 
