From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:22:44 +0200
Subject: [Buildroot] [PATCH] package/madplay: add custom libtool patch
In-Reply-To: <20170530145317.9552-1-romain.naour@gmail.com>
References: <20170530145317.9552-1-romain.naour@gmail.com>
Message-ID: <20170530232244.7d984efd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 30 May 2017 16:53:17 +0200, Romain Naour wrote:
> Madplay use a libtool script version 1.5.2 but the libtool patch
> "buildroot-libtool-v1.5.patch.patch" doesn't apply.
> 
> From [1]:
> "It's libtool dropping -static. That's because madplay has a
> weird version of libtool, on which our libtool patch doesn't apply so
> we have MADPLAY_LIBTOOL_PATCH = NO. Therefore, the hack we have that
> makes libtool -static behave like -all-static isn't applied, causing
> this build failure."
> 
> Fixes:
> http://autobuild.buildroot.net/results/60def1b15ea61d3cb5f50e9de3f354dd2e17d270
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2017-May/192959.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  .../0002-buildroot-libtool-v1.5.patch.patch        | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
>  create mode 100644 package/madplay/0002-buildroot-libtool-v1.5.patch.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
