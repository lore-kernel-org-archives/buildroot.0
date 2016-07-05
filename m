From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2016 10:17:28 +0200
Subject: [Buildroot] [PATCH] libmicrohttpd: fix thread detection on ARC
 and Blackfin
In-Reply-To: <1467587383-30328-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1467587383-30328-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160705101728.17d5c952@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 01:09:43 +0200, Thomas Petazzoni wrote:
> Due to compiler deficiences, gcc on ARC and Blackfin doesn't define
> _REENTRANT, which the latest version of the ax_pthread.m4
> autoconf-archive macros looks at to determine whether thread support is
> available or not.
> 
> Fixing the compilers is definitely the right thing to do, but it's not
> doable for pre-built external toolchains like the Blackfin one, so for
> now, we simply define _REENTRANT manually on ARC and Blackfin. If more
> packages are affected by this problem, a more general solution will have
> to be found.
> 
> Fixes
> http://autobuild.buildroot.net/results/593/593b5050473a83a9ddcada9de39f8f14ab38d554/
> http://autobuild.buildroot.net/results/ff0/ff058a378b91740b5b399f32a6b375fbc3c8df06/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This commit is an improved solution based on the discussion that occured
> on Bernd's patch at https://patchwork.ozlabs.org/patch/634835/.
> ---
>  package/libmicrohttpd/libmicrohttpd.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
