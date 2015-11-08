From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 8 Nov 2015 15:01:18 +0100
Subject: [Buildroot] [PATCH] gcc-final: hard link TARGET-cc -> TARGET-gcc
In-Reply-To: <1446622467-21916-1-git-send-email-steven@uplinklabs.net>
References: <1446622467-21916-1-git-send-email-steven@uplinklabs.net>
Message-ID: <20151108150118.1471b0da@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Steven Noonan,

On Tue,  3 Nov 2015 23:34:27 -0800, Steven Noonan wrote:
> Doing a symlink results in incorrect behavior:
> 
>     $ x86_64-buildroot-linux-gnux32-cc
>     --version
>     ccache: error: execv of [...]/x86_64-buildroot-linux-gnux32-cc.br_real.br_real failed: No such file or directory
> 
>     $ x86_64-buildroot-linux-gnux32-gcc --version
>     x86_64-buildroot-linux-gnux32-gcc.br_real (Buildroot 2015.11-git-00965-g8d89653-dirty) 5.2.0
>     Copyright (C) 2015 Free Software Foundation, Inc.
>     This is free software; see the source for copying conditions.  There is NO
>     warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
> 
> Note the double .br_real on the invocation by toolchain-wrapper.
> 
> Signed-off-by: Steven Noonan <steven@uplinklabs.net>
> ---
>  package/gcc/gcc-final/gcc-final.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied after changing to use 'ln -f' instead of 'cp -l', as
suggested by Arnout. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
