From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 May 2017 22:21:45 +0200
Subject: [Buildroot] [PATCH] package/google-breakpad: use PRE_CONFIGURE
 hooks to copy linux_syscall_support.h
In-Reply-To: <20170529201329.13455-1-romain.naour@gmail.com>
References: <20170529201329.13455-1-romain.naour@gmail.com>
Message-ID: <20170529222145.3e8adabb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 May 2017 22:13:29 +0200, Romain Naour wrote:
> As reported by Bernd [1], using POST_EXTRACT to copy
> linux_syscall_support.h break the legal-info target when
> google-breakpad package is selected.
> 
> Step to reproduce:
> 
> Create a foo defconfig with google-breakpad package:
> $ make foo_defconfig

This explanation is a bit weird, you clearly don't need to create a
defconfig to reproduce the problem. You simply need to create any
configuration that has google-breakpad enabled.

> Use PRE_CONFIGURE hooks instead since there are not used by legal-info.

This is not the point. The point is that this linux_syscall_support.h
file is installed by a dependency of google-breakpad, and dependencies
are not guaranteed to be available before the configure step of the
package.

I've applied to master after adjusting the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
