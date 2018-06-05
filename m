From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Mon, 04 Jun 2018 23:12:53 -0300
Subject: [Buildroot] [PATCH 3/5] support/docker: use the distro-provided
 flake8
References: <da9bacac268b43b39d8b6661d11157db36dacd4f.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <5b15f1a54eed5_5c1a2ae4ac2145d8695dd@ultri5.mail>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, Jun 03, 2018 at 06:08 AM, Yann E. MORIN wrote:

> Currently, we install flake8 and its dependencies via pip. We
> tried to be reproducible by pinning the version of those python
> packages, but we did forget quite a few of them, and thus some
> dependencies for flake8 are installed as uncontrolled versions.
> 
> Furthermore, before we install flake8 and its dependencies, we
> forcibly update pip, setuptools, and wheels packages to their
> latest versions. This explicitly breaks reproducibility.
> 
> While we could enforce a specific version of all those packages
> and still grab them from PyPI, we can simply grab them from the
> distribution-provided packages instead.
> 
> Since we're using a pinned version of stretch, this already
> guarantees we'll reproducibly get the same versions over and
> over again. Besides, we just need to list flake8 as a package to
> install to automatically get all its dependencies (again, in a
> reproducible way).
> 
> This has the slight unfortunate drawback of downgrading flake8
> to version 3.2.1, from version 3.5.0, as well as downgrading a
> few of flake8's dependencies, as noticed by Ricardo:
>     http://lists.busybox.net/pipermail/buildroot/2018-May/222376.html
> 
> However, as Ricardo said, there isn't "any serious limitation of
> this old version, the release notes for a version in the between
> mentions 'Dramatically improve the performance' but we have a
> limited number of scripts and running on Gitlab for all of them
> still takes less than 5 minutes".
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Acked-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>


Regards,
Ricardo
