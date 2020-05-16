From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 May 2020 15:42:36 +0200
Subject: [Buildroot] [PATCH] package/libunwind: enable on AArch64
In-Reply-To: <20200503212640.189571-1-thomas.petazzoni@bootlin.com>
References: <20200503212640.189571-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200516154236.7c52b169@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  3 May 2020 23:26:39 +0200
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Since version 1.2, libunwind has support for the AArch64 architecture.
> 
> It builds fine on glibc, needs a small patch on musl, but doesn't
> build with uClibc (stack_t undefined).
> 
> Fixes:
> 
>   https://bugs.busybox.net/show_bug.cgi?id=12836
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  ...t_t-instead-of-__sigset_t-on-AArch64.patch | 46 +++++++++++++++++++
>  package/libunwind/Config.in                   |  7 +--
>  2 files changed, 50 insertions(+), 3 deletions(-)
>  create mode 100644 package/libunwind/0002-Use-sigset_t-instead-of-__sigset_t-on-AArch64.patch

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
