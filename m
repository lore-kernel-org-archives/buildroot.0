From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Aug 2013 01:10:30 +0200
Subject: [Buildroot] [PATCH] targets: move target options to their own
 sub-menu
In-Reply-To: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
References: <1376598482-9492-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <520D5FE6.2090007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/08/13 22:28, Yann E. MORIN wrote:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Currently, all target options lie in the top-level menu.
> This looks a bit clumsy, since all other options are neatly
> folded into their own sematic sub-menus each.
>
> Move the target option into their own sub-menu too.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>   arch/Config.in | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 0b5b218..640926a 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -1,3 +1,5 @@
> +menu "Target options"

  I completely agree with the idea - especially in the xconfig, the big 
list of architecture options is extremely annoying. However, the menu 
title is not very clear. How about "Target architecture selection"? Or maybe

Target CPU architecture

   Target CPU architecture family

   Target CPU architecture variant


  Regards,
  Arnout

> +
>   config BR2_ARCH_IS_64
>   	bool
>
> @@ -324,3 +326,5 @@ endif
>   if BR2_xtensa
>   source "arch/Config.in.xtensa"
>   endif
> +
> +endmenu # Target options
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
