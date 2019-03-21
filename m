From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 Mar 2019 22:56:03 +0100
Subject: [Buildroot] Eigen Package Update
In-Reply-To: <CAPjgS+TBCbm65khaWX657uqui2sSvUPQxEEZb46M_9Fs-b6jXw@mail.gmail.com>
References: <CAPjgS+TBCbm65khaWX657uqui2sSvUPQxEEZb46M_9Fs-b6jXw@mail.gmail.com>
Message-ID: <20190321215603.GD2660@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reed, All,

On 2019-03-21 14:42 -0700, Reed Nightingale spake thusly:
> Hi all,
> First time doing this, so hopefully I'm doing it somewhat right. Basically, looking to update the eigen package to 3.3.7, since
> 3.3.4 doesn't play nicely with GCC7 (see? [1]http://eigen.tuxfamily.org/index.php?title=ChangeLog#Eigen_3.3.5 notes on
> Wint-in-bool-context)
> Patch below.

First, use git to perpare and send the patch. This will send a
plain-text email, as html is definitely not nice.

Secoind, preapre an appropriate commit log, which should look something
like:

    package/eigen: bump to 3.3.7

    Version 3.3.7 fixes [blablabla what you told me on IRC.]
    and further fixes [blabla some other gcc errors, whatever].

    Signed-off-by: Your Real NAME <you@somewhere>

Otherwise, the patch itself is pretty much what we'd expect, yes.

> Reed
> --------------
> diff --git a/buildroot/package/eigen/eigen.hash b/buildroot/package/eigen/eigen.hash
> index 4a1bcdf..e5c8404 100644
> --- a/buildroot/package/eigen/eigen.hash
> +++ b/buildroot/package/eigen/eigen.hash
> @@ -1,5 +1,5 @@
> ?# Locally computed
> -sha256 dd254beb0bafc695d0f62ae1a222ff85b52dbaa3a16f76e781dce22d0d20a4a6 3.3.4.tar.bz2
> +sha256 9f13cf90dedbe3e52a19f43000d71fdf72e986beb9a5436dddcd61ff9d77a3ce 3.3.7.tar.bz2
> ?sha256 4f877e5ae4672568ef82cfd0023e2cef4a7cf55d867ab249efc9569a7eb9e5b1 COPYING.BSD
> ?sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING.GPL
> ?sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551 COPYING.LGPL

Can you double-check that the hashes for the license are still correct,
by running:

    make eigen-legal-info

Regards,
Yann E. MORIN.

> diff --git a/buildroot/package/eigen/eigen.mk b/buildroot/package/eigen/eigen.mk
> index 27c4e21..5c9e028 100644
> --- a/buildroot/package/eigen/eigen.mk
> +++ b/buildroot/package/eigen/eigen.mk
> @@ -4,7 +4,7 @@
> ?#
> ?################################################################################
> ?
> -EIGEN_VERSION = 3.3.4
> +EIGEN_VERSION = 3.3.7
> ?EIGEN_SOURCE = $(EIGEN_VERSION).tar.bz2
> ?EIGEN_SITE = [6]https://bitbucket.org/eigen/eigen/get
> ?EIGEN_LICENSE = MPL2, BSD-3-Clause, LGPL-2.1

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
