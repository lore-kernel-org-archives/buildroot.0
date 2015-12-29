From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 Dec 2015 23:54:00 +0100
Subject: [Buildroot] [PATCH 0/7] linux: simplify requesting kernel
	modules (branch yem/needs-modules)
In-Reply-To: <cover.1449771844.git.yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Thu, 10 Dec 2015 19:53:15 +0100")
References: <cover.1449771844.git.yann.morin.1998@free.fr>
Message-ID: <87twn0c1dj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

> Hello All!
> This series is a proposal to make it easier and mor esimple for packages
> to request that the Linux kernel be built with support for loadable
> modules.

> This work was prompted by a comment from Thomas on IRC, who did not like
> much that packages had to write things like:

>     ifeq ($(BR2_PACKAGE_FOO),y)
>     LINUX_NEEDS_MODULES = y
>     endif

> The LINUX_NEEDS_MODULES variable was introduced as a pure make variable,
> because we needed it to implement the kernel-module infra. So, we just
> turned to using it even from packages that do not use that infra.

> However, that's indeed quite cumbersome that packages do have to write
> this code in their .mk files, when we already have the logic in two
> places:

>   - in the Config.in, since that's handled natively by Kconfig,
>   - in the generic package infra, in which we already have that
>     condition to add packages to the list.

> So, this series introduce BR2_LINUX_NEEDS_MODULES, the Kconfig
> counter-part of LINUX_NEEDS_MODULES. LINUX_NEEDS_MODULES still gets set
> by the kernel-module infra when the package is enabled, but is also set
> when BR2_LINUX_NEEDS_MODULES is.

Committed series, thanks.

-- 
Bye, Peter Korsgaard
