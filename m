From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 23:10:00 +0200
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.0.1
In-Reply-To: <20200907193759.1503418-1-francois.perrad@gadz.org>
References: <20200907193759.1503418-1-francois.perrad@gadz.org>
Message-ID: <20200907231000.19456dd1@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Sep 2020 21:37:58 +0200
Francois Perrad <fperrad@gmail.com> wrote:

> patches are now useless
> - https://github.com/hishamhm/htop/pull/770
> 	MakeHeader.py: Fix for non-utf8 environments
> - https://github.com/hishamhm/htop/pull/981

Links to pull requests are not very useful: pull requests do not
indicate that the code has been merged upstream. Instead, I've replaced
with the references to the upstream commits.

> -sha256  d9d6826f10ce3887950d709b53ee1d8c1849a70fa38e91d5896ad8cbc6ba3c57  htop-2.2.0.tar.gz
> -sha256  70466e76443cb5b68144d9fcedca9584e7bfdb6c50859daa5a0290ea27c58aad  COPYING
> +sha256  8465164bc085f5f1813e1d3f6c4b9b56bf4c95cc12226a5367e65794949b01ca  htop-3.0.1.tar.gz
> +sha256  c228cc14df980a23ea0c3c9ac957b904dd6a8514f6283db403de22e9179471be  COPYING

You forgot to explain the license change in the commit log.

> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index dc84e3270..8818f3423 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -4,11 +4,12 @@
>  #
>  ################################################################################
>  
> -HTOP_VERSION = 2.2.0
> -HTOP_SITE = http://hisham.hm/htop/releases/$(HTOP_VERSION)
> +HTOP_VERSION = 3.0.1
> +HTOP_SITE = https://github.com/htop-dev/htop/archive/$(HTOP_VERSION)

In fact, the project has tarballs available at
https://bintray.com/htop/source/htop, and they have the configure
script generated, which makes the additional of AUTORECONF = YES not
necessary.

I fixed those different issues, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
