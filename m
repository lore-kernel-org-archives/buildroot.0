From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Oct 2017 22:41:37 +0200
Subject: [Buildroot] [PATCH v2] package/turbolua: Fix build with gcc7
In-Reply-To: <20170926133716.8472-1-m.niestroj@grinn-global.com>
References: <20170926133716.8472-1-m.niestroj@grinn-global.com>
Message-ID: <20171003224137.2b5b21ab@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 26 Sep 2017 15:37:16 +0200, Marcin Niestroj wrote:
> gcc7 has -Wimplicit-fallthrough enabled by default. Together with
> -Werror in turbolua makefile it gives -Werror=implicit-fallthrough=
> build error.
> 
> Add upstreamable patch [1], which fixes typo in FALLTHROUGH comment,
> so it makes the fallthrough explicit for gcc.
> 
> [1] https://github.com/kernelsauce/turbo/pull/323
> 
> Fixes:
> http://autobuild.buildroot.net/results/6f107b62f105508044185576b071323e5d73dd83
> http://autobuild.buildroot.net/results/d303929960c667a21181d0bbdab64ba8a8d56a4f
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
> ---
> Changes v1 -> v2 (suggested by Baruch):
>  * Added Signed-off-by in patch
>  * Added link to upstream pull request in patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
