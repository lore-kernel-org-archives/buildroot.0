From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 01:38:12 +0100
Subject: [Buildroot] [PATCH 1/2 v3] xtensa: add support for the Xtensa
 architecture
In-Reply-To: <509d9da3.e2d5440a.1892.015f@mx.google.com>
References: <509d9da3.e2d5440a.1892.015f@mx.google.com>
Message-ID: <509DA1F4.7010009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/10/12 01:19, Chris Zankel wrote:
> diff --git a/package/autoconf/Config.in b/package/autoconf/Config.in
> index c304572..3622f3d 100644
> --- a/package/autoconf/Config.in
> +++ b/package/autoconf/Config.in
> @@ -1,6 +1,7 @@
>   config BR2_PACKAGE_AUTOCONF
>   	bool "autoconf"
> -	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3 || BR2_sh3eb || BR2_sh64)
> +	depends on !(BR2_avr32 || BR2_bfin || BR2_sh2 || BR2_sh2a || BR2_sh3)
> +	depends on !(BR2_sh3eb || BR2_sh64 || BR2_xtensa)
>   	select BR2_PACKAGE_PERL
>   	help
>   	  Extensible program for developing configure scripts.  These

  Actually, these dependencies can be removed again, because perl no longer
depends on host-qemu. I'll post a patch removing them.

  And anyway, host-qemu exists for xtensa, no?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
