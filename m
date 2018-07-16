From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Jul 2018 22:05:14 -0300
Subject: [Buildroot] [PATCH 5/5] support/docker: add an Alpine-3.7 based
 image
References: <9f99ad9f8d86876a7e16185a9025223bc01edf9d.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <5b4bef4a7808a_7adf2afd8a7d089044369@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 13, 2018 at 03:38 AM, Yann E. MORIN wrote:

[snip]
> +RUN apk add \
> +    alpine-sdk \
> +    bash \
> +    bc \
> +    bzip2 \
> +    bzr \
> +    cpio \
> +    cvs \
> +    file \
> +    flake8 \

Not sure why it does not work. See:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81881805

Maybe it's a dependency issue that we can work around by adding py-enum34? (not
tested)

> +    grep \
> +    gzip \
> +    mercurial \
> +    ncurses-dev \
> +    perl \
> +    py2-nose \

No. We need nose2. See:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81881843
I am not sure it is packaged.

> +    py2-pexpect \
> +    python \

qemu-<something> ?

> +    rsync \
> +    subversion \
> +    unzip \
> +    wget
> +


Regards,
Ricardo
