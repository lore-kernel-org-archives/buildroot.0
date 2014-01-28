From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 Jan 2014 17:58:51 +0100
Subject: [Buildroot] [PATCH] uboot-tools: Allow users to use uboot's
	sources
In-Reply-To: <CAAXf6LWTv2M+AsoXNkzckUzdZdLnPJL_d5TxvLiPK03VTm=dhA@mail.gmail.com>
References: <1390696553-4163-1-git-send-email-maxime.hadjinlian@gmail.com>	<52E530D5.20405@lucaceresoli.net>	<CAGduivwtd5SeEOSi6NNCegk7L7oem0+dF9eqkvoGtYk1_xODVw@mail.gmail.com>	<52E5816F.9080102@lucaceresoli.net>	<52E69898.2080805@mind.be>
 <CAAXf6LWTv2M+AsoXNkzckUzdZdLnPJL_d5TxvLiPK03VTm=dhA@mail.gmail.com>
Message-ID: <52E7E1CB.3090605@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/01/14 07:02, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> Op 27-jan.-2014 22:28 schreef "Arnout Vandecappelle" <arnout@mind.be
> <mailto:arnout@mind.be>>:
>  >
>  > On 26/01/14 22:43, Luca Ceresoli wrote:
>  >>
>  >> Going a step ahead, to be more uniform with these packages, you may use
>  >> a choice construct to allow choosing between two alternatives.
>  >> Example (modified version of the code in barebox.mk <http://barebox.mk>):
>  >>
>  >> choice
>  >>          prompt "version"
>  >>          help
>  >>            Select the specific uboot-tools version you want to use
>  >>
>  >> config BR2_PACKAGE_UBOOT_TOOLS_LATEST_VERSION
>  >>          bool "Use a recent upstream version"
>  >>
>  >> config BR2_PACKAGE_UBOOT_TOOLS_USE_UBOOT_VERSION
>  >>          bool "Use the same sources of the uboot package"
>  >>
>  >> endchoice
>  >
>  >
>  >  Actually, I don't even see the need to ask the user anything. If we
> are building U-Boot, I don't see why we would ever want to use the U-Boot
> tools from upstream - that just adds a risk of incompatibility between
> the two.
>  >
>  >  So I would propose to remove the BR2_PACKAGE_UBOOT_TOOLS_UBOOT_SOURCE
> option, and instead make it conditional on BR2_TARGET_UBOOT.
>
> I don't agree here. Real life example: we are using vendor-provided
> uboot, and want to set an env-image in our flash devices' factory image.
> While this version of uboot clearly supports handling the env at a
> specified location, it does not (yet) provide the mkenvimage tool.
> In this case, we actually want a more recent uboot tools package that
> does have mkenvimage. My conclusion is thus that we should provide the
> choice.

  OK. In that case, I prefer the choice over the bare option. Note that 
Kconfig doesn't support help text on the choice itself, only on the 
config entries. Also the default (_LATEST_VERSION) should be selected 
explicitly.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
