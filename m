From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Dec 2018 16:34:30 +0100
Subject: [Buildroot] [PATCH v2 2/2] [RFC] package/pkg-waf.mk: mimic
 selection of host-waf
In-Reply-To: <20181221002221.16024-2-casantos@datacom.com.br>
References: <20181221002221.16024-1-casantos@datacom.com.br>
 <20181221002221.16024-2-casantos@datacom.com.br>
Message-ID: <20181221163430.56a34588@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 20 Dec 2018 22:22:21 -0200, Carlos Santos wrote:
> Since host-waf's Config.in.host is blind, it is not possible to select
> it in the configuration menu. There are two possible solutions for this
> problem:
> 
> - Add "select BR2_PACKAGE_HOST_WAF" to package/mpv/Config.in (currently
>   only mpv requires host-waf). Also, document that BR2_PACKAGE_HOST_WAF
>   must be selected when <PKG>_NEEDS_EXTERNAL_WAF is YES.
> 
> - Set BR2_PACKAGE_HOST_WAF to 'y' in the waf-package macro. This one is
>   simpler because it does not require changing anything else.
> 
> Signed-off-by: Carlos Santos <casantos@datacom.com.br>

I understand the idea that doing this avoids repeating a "select
BR2_PACKAGE_HOST_WAF" in all packages using host-waf. However, I don't
think we want to go down the route of setting those variables from the
make logic. I don't have a very strong argument to defend this
position, but to me it looks more logical that we continue to use
kconfig-level "select" to enable those config options.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
