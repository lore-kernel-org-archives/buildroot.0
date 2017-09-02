From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 23:17:28 +0200
Subject: [Buildroot] [PATCH] package/sysdig: fix missing curlbuild
 include
In-Reply-To: <1504281081-11201-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1504281081-11201-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20170902231728.2be2989f@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Sep 2017 17:51:21 +0200, Angelo Compagnucci wrote:
> curlbuild.h was removed in recent versions of curl, backporting a
> patch from mainline to fix sysdig until a newer version is
> released.
> 
> Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>

Thanks a lot, looks good, except...

> ---
>  .../sysdig/0001-Don-t-include-curlbuild.h.patch    | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 package/sysdig/0001-Don-t-include-curlbuild.h.patch
> 
> diff --git a/package/sysdig/0001-Don-t-include-curlbuild.h.patch b/package/sysdig/0001-Don-t-include-curlbuild.h.patch
> new file mode 100644
> index 0000000..ae406c0
> --- /dev/null
> +++ b/package/sysdig/0001-Don-t-include-curlbuild.h.patch
> @@ -0,0 +1,56 @@
> +From 8a6670ea4b57c0e2bf8588d4534b22d1ea860989 Mon Sep 17 00:00:00 2001
> +From: Mark Stemm <mark.stemm@gmail.com>
> +Date: Tue, 15 Aug 2017 17:49:53 -0700
> +Subject: [PATCH] Don't include curlbuild.h
> +
> +It's not required to build and it's not present with some newer versions
> +of libcurl, so removing it.
> +
> +Thanks to https://github.com/hhoffstaette for the tip.
> +
> +This fixes https://github.com/draios/sysdig/issues/895.

You must add your Signed-off-by here.

Could you resend with this fixed ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
