From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 14 Aug 2020 23:29:25 +0200
Subject: [Buildroot] [PATCH] support/docker: drop Python 2.x modules
In-Reply-To: <20200814195820.987824-1-thomas.petazzoni@bootlin.com>
References: <20200814195820.987824-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200814212925.GO13263@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-08-14 21:58 +0200, Thomas Petazzoni spake thusly:
> Since commit 4a40d36f131890941c1e482eb5f28ebcd81cb7a3
> ("support/testing: switch to Python 3 only") our runtime testing
> infrastructure is Python 3.x only.
> 
> Therefore, it is no longer needed to have python-nose2 and
> python-pexpect in the Docker container used to run our Gitlab CI jobs.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

I've rebuilt the image, it is now slowly being routed to the docker hub
via my snail-slow DSL lane...

This offers the nice opportunity for me to get ome rest. Tomorrow, I'll
update the version we use in gitlab-CI and push that.

Regards,
Yann E. MORIN.

> ---
>  support/docker/Dockerfile | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 8c555dcf7a..a9bacca3a0 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -36,8 +36,6 @@ RUN apt-get install -y --no-install-recommends \
>          libncurses5-dev \
>          locales \
>          mercurial \
> -        python-nose2 \
> -        python-pexpect \
>          python3 \
>          python3-flake8 \
>          python3-nose2 \
> -- 
> 2.26.2
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
