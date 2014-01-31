From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 31 Jan 2014 09:33:47 +0100
Subject: [Buildroot] [PATCH v3 6/6] Makefile: export PATH
In-Reply-To: <1391114333-28001-7-git-send-email-s.martin49@gmail.com>
References: <1391114333-28001-1-git-send-email-s.martin49@gmail.com>
 <1391114333-28001-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20140131093347.5c3bcbae@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 30 Jan 2014 21:38:53 +0100, Samuel Martin wrote:
> This can be useful for:
> - package using custom build system that are not aware that the host
>   tree is in $(O)/host/;
> - post-{build,image} scripts, in case some host-tools were specifically
>   built to be used by these scripts.
> 
> Note that, this patch only exports the PATH variables; cleaning up
> all the explicit PATH declarations leading some commands could be done
> in a followup patch.

So with this patch, passing PATH in all the package infrastructures
(cmake, autotools, python) becomes unnecessary?

I must say I am not entirely sure we want to globally export PATH.
Packages using custom build system should use TARGET_MAKE_ENV and
HOST_MAKE_ENV, post-build and post-image script have HOST_DIR defined
in their environment I believe.

But this is not a strong opinion, I'd just like to see
arguments/opinions from others on this specific change (the other
changes in the series, I'm happy with them on the principle, they are
just a few remaining details to sort out).

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
