From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 16 Jul 2015 17:59:33 -0300
Subject: [Buildroot] [PATCH] gcc: add gcc 5.2.0
In-Reply-To: <20150716225639.14772165@free-electrons.com>
References: <1437079928-9591-1-git-send-email-gustavo@zacarias.com.ar>
 <20150716225639.14772165@free-electrons.com>
Message-ID: <55A81B35.2040200@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/07/15 17:56, Thomas Petazzoni wrote:

> That's not the right way of adding gcc 5.2 support. The gcc
> release numbers have changed: 5 is the major release, and 5.{1,2} are
> the bug fix releases.
>
> Quoting https://gcc.gnu.org/ml/gcc/2015-07/msg00198.html:
>
>    GCC 5.2 is a bug-fix release from the GCC 5 branch
>    containing important fixes for regressions and serious bugs in
>    GCC 5.1 with more than 81 bugs fixed since the previous release.
>
> Therefore, we should instead rename BR2_GCC_VERSION_5_1_X to
> BR2_GCC_VERSION_5_X, and then simply update from 5.1 to 5.2 (keeping
> only 5.2 and removing 5.1), exactly like we were doing when the version
> was changed from 4.9.1 to 4.9.2 for example.
>
> Could you rework your patch in this direction?

Yes, i had a little talk with Yann about it and mostly agree.
However the diff is big enough (8 MB bzipped) and 5.2 doesn't build a 
bootable kernel for qemu-versatile where 5.1 IIRC does, hence 
introducing a regression.
Do we still want to step on 5.1 considering this?
Regards.
