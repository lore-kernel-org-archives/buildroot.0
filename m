From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Sep 2019 22:13:15 +0200
Subject: [Buildroot] [PATCH 4/5] support/docker: add python3
In-Reply-To: <20190808231015.14330-5-ricardo.martincoski@gmail.com>
References: <20190808231015.14330-1-ricardo.martincoski@gmail.com>
 <20190808231015.14330-5-ricardo.martincoski@gmail.com>
Message-ID: <20190923221315.5ca5261a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Ricardo,

On Thu,  8 Aug 2019 20:10:14 -0300
Ricardo Martincoski <ricardo.martincoski@gmail.com> wrote:

> The test infra will soon be converted to Python 3 only.
> So add the interpreter and also the Python 3 variant of modules nose2
> and pexpect to the docker image used to run runtime tests.
> 
> Keep the Python 2 variant of those modules to allow a gradual
> transition.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  support/docker/Dockerfile | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
> index 36cd3b28a4..03acde85d2 100644
> --- a/support/docker/Dockerfile
> +++ b/support/docker/Dockerfile
> @@ -39,6 +39,9 @@ RUN apt-get install -y --no-install-recommends \
>          python-flake8 \
>          python-nose2 \
>          python-pexpect \
> +        python3 \
> +        python3-nose2 \
> +        python3-pexpect \

But then, can we remove python-nose2 and python-pexpect at the same
time ?

Yann: how do we regenerate/reupload the Docker image after this commit ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
