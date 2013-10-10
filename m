From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 10 Oct 2013 22:59:39 +0200
Subject: [Buildroot] [PATCH 1/1] support/kconfig: fix compile warning
 because of missing include.
In-Reply-To: <1381429615-6689-1-git-send-email-ps.report@gmx.net>
References: <1381429615-6689-1-git-send-email-ps.report@gmx.net>
Message-ID: <20131010225939.03febe7a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Seiderer,

On Thu, 10 Oct 2013 20:26:55 +0200, Peter Seiderer wrote:
> With commit b58bf60b519353e983e372f5627d639e7cc72a7a the libgen.h
> include was removed from confdata.c, but it is needed for the dirname
> function declaration.
> 
> Fixes the following compile warning:
> ./confdata.c: In function ?conf_split_config?:
> ./confdata.c:849:6: warning: assignment makes pointer from integer
> without a cast
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Yes, this warning is annoying. However, we should not simply modify
kconfig code directly, the patches in support/kconfig/patches/ have to
be updated accordingly: they must contain *all* the changes that we
have applied on top of the kernel version of kconfig. This is needed
because when regularly update the kconfig code in support/kconfig/
using the latest one from the kernel. And if we want to do this without
losing our own changes, we must keep the patches in
support/kconfig/patches/ accurate.

Could you fix your patch so that it also includes a new patch in
support/kconfig/patches/ (or modifies one of the existing patch if it
makes more sense).

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
