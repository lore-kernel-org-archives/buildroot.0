From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 23:09:17 +0200
Subject: [Buildroot] [PATCH 1/1] git: Fix libintl linking if there is no
 full gettext support
In-Reply-To: <20180824132049.20330-1-vadim4j@gmail.com>
References: <20180824132049.20330-1-vadim4j@gmail.com>
Message-ID: <20180824230917.20aaff8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Vadim,

On Fri, 24 Aug 2018 16:20:49 +0300, Vadim Kochan wrote:
> From: Vadim Kochan <vadim.kochan@petcube.com>
> 
> Git could not resolve libntl_xxx symbols if toolchain does no provide
> full gettext support but the gettext package is selected.
> 
> In case of ulibc/musl toolchain there is no full getttext support, but
> they still provides libintl stub which makes git think there is full
> gettext support hence -lintl is not passed to the linker.
> 
> Added workaround which checks if toolchain provides full gettext
> support, if no then -lintl will be added to EXTLIBS variable generated
> within config.mak file.
> 
> Signed-off-by: Vadim Kochan <vadim.kochan@petcube.com>

Could you give some minimal Buildroot configuration that exhibits the
issue ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
