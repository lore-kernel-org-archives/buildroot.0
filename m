From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Dec 2017 07:32:17 +0100
Subject: [Buildroot] [PATCH 1/2] luadbi: new package
In-Reply-To: <20171209091711.20226-1-francois.perrad@gadz.org>
References: <20171209091711.20226-1-francois.perrad@gadz.org>
Message-ID: <20171214073217.2f36cfb1@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  9 Dec 2017 10:17:10 +0100, Francois Perrad wrote:

> diff --git a/package/luadbi/Config.in b/package/luadbi/Config.in
> new file mode 100644
> index 000000000..663c6f9fb
> --- /dev/null
> +++ b/package/luadbi/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LUADBI
> +	bool "luadbi"
> +	depends on BR2_PACKAGE_HAS_LUAINTERPRETER

This dependency is not necessary, since the Config.in file inclusion is
already enclosed in a BR2_PACKAGE_HAS_LUAINTERPRETER dependency.

Applied with this fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
