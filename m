From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Jul 2013 19:51:08 +0200
Subject: [Buildroot] [git commit] gcc: common definitions
In-Reply-To: <20130704095649.AD5849A29F@busybox.osuosl.org>
References: <20130704095649.AD5849A29F@busybox.osuosl.org>
Message-ID: <51D5B60C.2010603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/03/13 22:58, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=f198318fa564bead33bb0e389ddae1f5cbec0b6c
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> [Peter: tweak file header]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>   package/gcc/Config.in.host |  128 ++++++++++++++++++++++++++++++++++
>   package/gcc/gcc.mk         |  162 ++++++++++++++++++++++++++++++++++++++++++++
>   2 files changed, 290 insertions(+), 0 deletions(-)
>
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> new file mode 100644
> index 0000000..7ecf2fb
> --- /dev/null
> +++ b/package/gcc/Config.in.host
> @@ -0,0 +1,128 @@
> +comment "GCC Options"
> +
> +config BR2_GCC_NEEDS_MPC
> +	bool
> +
> +choice
> +	prompt "GCC compiler Version"
> +	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
> +	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr3

  avr3?


  Regards,
  Arnout


[snip]
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
