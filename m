From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 03 Jun 2018 01:20:11 -0300
Subject: [Buildroot] [PATCH 1/4] support/docker: run apt-get update and
 apt-get install in two RUNs
References: <5d55cfc92761a84d7b10aae602b05c147b56f95e.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <5b136c7b72b9c_208c3fee3607128c525f4@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:

> In commit 7517aef4d (support/docker: limit the number of layers),
> we reduced the number of layers by coalescing multiple RUN commands
> into less commands.
> 
> In doing so, we especially coalesced "apt-get update" with "apt-get
> install".

That is exactly what is recommended in the 'best practices':
https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#run
"Always combine RUN apt-get update with apt-get install in the same RUN
statement."

But the 'gotchas' used to justify the recommendation don't apply in our case,
as you describe below.

> However, the distribution we used is a pinned version of stretch, so
> we know that running apt-get update will always yield the same apt
> database.
> 
> If we split the two apt-get commands, then we can re-use any local
> intermediate image when we need to update the list of packages to
> install; this helps quite a bit when testing the docker files over
> and over again, with just slight variants in the packages list.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

[I use docker only with the buildroot image, so my experience is limited, but
 for what it's worth]
Reviewed-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
