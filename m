From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 15 Jul 2018 21:48:05 -0300
Subject: [Buildroot] [PATCH 3/5] support/docker: add a Fedore-28 based
 image
References: <2738bd4dedf368eb12a7564eff1c2c33b696691f.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <5b4beb451146b_7adf3f993c69335844119@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, Jul 13, 2018 at 03:38 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:

[snip]
> +RUN rm -f /etc/yum.repos.d/fedora-updates*.repo && \
> +    dnf -y install \
> +        @development-tools \
> +        bc \
> +        bzip2 \
> +        bzr \
> +        cpio \
> +        cvs \
> +        file \
> +        gcc-c++ \
> +        git \

> +        ncurses-devel \
> +        mercurial \

Er, the sort failed here. :-)

> +        perl-ExtUtils-MakeMaker \
> +        perl-Thread-Queue \
> +        python-nose2 \
> +        python-pexpect \

Maybe add python2-flake8.noarch (not tested) for consistency between the docker
images? See:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81878555

> +        qemu-system-arm \
> +        qemu-system-x86 \
> +        rsync \
> +        subversion \
> +        unzip \
> +        wget \
> +    && dnf -y clean all

I guess some *.i686 packages should also be added (not tested). See:
https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/81878562


Regards,
Ricardo
