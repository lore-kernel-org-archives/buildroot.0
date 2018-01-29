From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Jan 2018 23:14:01 +0100
Subject: [Buildroot] [PATCH 00/14] fix Python code style
In-Reply-To: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1516581882-30582-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <20180129231401.4670adba@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for working on this. I've applied a number of patches, but not
all of them. I'll say below which ones have been applied, and I will
comment on the patches themselves for those that have not been applied.

On Sun, 21 Jan 2018 22:44:28 -0200, Ricardo Martincoski wrote:

> I am ignoring this script for now:
> support/scripts/xorg-release
> I opened a thread about it:
> http://lists.busybox.net/pipermail/buildroot/2018-January/211557.html
> 
> The first 12 patches fix each script.
> I tried to do the minimum to accomplish the task avoiding any unrelated
> refactoring, what IMO brings these advantages:
>  - small chance of introducing regressions;
>  - easy code review;
>  - less testing effort.
> Most of the commit messages are terse as the changes I introduced are minimal.
> If I missed to explain any change that is not obvious, please ask me on the
> review.
> 
> Patch 13 adds support to install flake8 on the fly to the Docker image, needed
> by the next patch.
> 
> Patch 14 creates a job in gitlab to run flake8:
> https://gitlab.com/RicardoMartincoski/buildroot/-/jobs/48876752
> 
> And here a complete run on gitlab using current Docker image:
> https://gitlab.com/RicardoMartincoski/buildroot/pipelines/16432662

One rule that I find a bit silly in flake8 checks is "every function
must be separated from the previous function with two blank lines". But
OK, if flake8 wants that, and Python developers like it, why not.

> Ricardo Martincoski (14):
>   graph-depends: fix code style
>   check-uniq-files: fix code style
>   graph-build-time: fix code style
>   pycompile: fix code style
>   size-stats: fix code style
>   testing/tests/boot/test_atf: fix code style
>   check-package: fix code style

All those applied.

>   diffconfig: fix code style

Not applied.

>   genrandconfig: fix code style

Not applied.

>   get-developers: fix code style
>   scanpypi: fix code style

Both of these applied.

>   size-stats-compare: fix code style

Not applied.

>   support/dockerfile: allow to install packages
>   .gitlab-ci.yml: check flake8

And of course, I haven't applied those, because not all problems have
been fixed yet, due to me not applying all patches.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
