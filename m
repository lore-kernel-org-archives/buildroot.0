From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 19 Jul 2017 22:39:06 +0200
Subject: [Buildroot] [PATCH (2017.05.x)] protobuf: don't download patch
	from Github
In-Reply-To: <1500496210-2946-1-git-send-email-casantos@datacom.ind.br>
References: <1500496210-2946-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20170719223906.764e5ccf@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 19 Jul 2017 17:30:10 -0300, Carlos Santos wrote:
> Patches downloaded from Github are not stable, so bring them in the
> tree.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
> ---
>  package/protobuf/0001-Fix-freebsd-build.patch | 143 ++++++++++++++++++++++++++
>  package/protobuf/protobuf.hash                |   1 -
>  package/protobuf/protobuf.mk                  |   2 -
>  3 files changed, 143 insertions(+), 3 deletions(-)
>  create mode 100644 package/protobuf/0001-Fix-freebsd-build.patch
> 
> diff --git a/package/protobuf/0001-Fix-freebsd-build.patch b/package/protobuf/0001-Fix-freebsd-build.patch
> new file mode 100644
> index 0000000..0cdcfa6
> --- /dev/null
> +++ b/package/protobuf/0001-Fix-freebsd-build.patch
> @@ -0,0 +1,143 @@
> +From 416f90939d4de58fe1a4e2489120010313183291 Mon Sep 17 00:00:00 2001
> +From: Feng Xiao <xfxyjwf@gmail.com>
> +Date: Tue, 14 Mar 2017 23:12:52 +0000
> +Subject: [PATCH] Fix freebsd build.
> +
> +It turns out system headers included by generated plugin.pb.h file already contains
> +major/minor macro definitions when built on FreeBSD and we need to add #undefs to
> +the generated header file.
> +
> +This change also fixes another compile error regarding EXPECT_DEATH on FreeBSD.

We need your SoB here.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
