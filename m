From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 03 Jun 2018 01:21:46 -0300
Subject: [Buildroot] [PATCH 2/4] support/docker: sort the list of
 installed packages
References: <ed5028f2849286aef3ec10937f4fe7d03a2137b8.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <5b136cda73b5f_208c3fee3611587852799@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, Jun 02, 2018 at 07:19 PM, Yann E. MORIN wrote:

[snip]
>  RUN apt-get install -y --no-install-recommends \
> -        build-essential cmake libc6:i386 g++-multilib \
> -        bc ca-certificates file locales rsync \
> -        cvs bzr git mercurial subversion wget \
> -        cpio unzip \
> +        bc \
> +        build-essential \
> +        bzr \
> +        ca-certificates \
> +        cpio \
> +        cvs \
> +        file \
> +        g++-multilib \
> +        git \
> +        libc6:i386 \
>          libncurses5-dev \
> -        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 \
> -        python-pip && \

With only patches 1 and 2 applied the 'docker build' command will fail:
/usr/bin/python: No module named pip

This removal should be part of patch 4.

> +        locales \
> +        mercurial \
> +        python-nose2 \
> +        python-pexpect \
> +        qemu-system-arm \
> +        qemu-system-x86 \
> +        rsync \
> +        subversion \
> +        unzip \
> +        wget \
> +        && \

We usually don't put && in a separate line.
I am not really against it if no one else complains.


Regards,
Ricardo
