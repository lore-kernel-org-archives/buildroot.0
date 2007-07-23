From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 23 Jul 2007 19:54:20 +0200
Subject: [Buildroot] GCC - march=geode doesn't exist?
In-Reply-To: <469EEA03.2020304@strudel-hound.com>
References: <469EEA03.2020304@strudel-hound.com>
Message-ID: <20070723175420.GE9995@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 19, 2007 at 02:35:15PM +1000, William Pettersson wrote:
>Ok, so I'm still working on this Soekris, using gcc-4.2.0.  4.2.0
>doesn't support -march=geode or -mtune=geode, but BR2_GCC_TARGET_ARCH
>and BR2_GCC_TARGET_TUNE are both set to "geode" if you select the geode.
> Now apparently gcc-4.3.0 has plans for a geode target, but as 4.3.0
>isn't stable yet, I've attached a patch which makes the "geode" select
>"i586" for BR2_GCC_TARGET_TUNE and BR2_GCC_TARGET_ARCH.

Yes, somebody already mentioned about the same for itanium. I added
those bits with just a copy of gcc-trunk at hand..

Can you check your manpage of gcc-4.2 to see what itanium variants are
supported there and fix those and geode according to:

default foo if BR2_foo && BR2_GCC_VERSION_4_3
default bar if BR2_foo && !BR2_GCC_VERSION_4_3

default baz1 if BR2_baz && (BR2_GCC_VERSION_3_4 || 4_0 || 4_1)
etc..

TIA,
>
>William
>

>--- Config.in.old	2007-07-19 10:55:37.000000000 +1000
>+++ Config.in	2007-07-19 14:02:18.000000000 +1000
>@@ -363,7 +364,7 @@
> 	default winchip-c6	if BR2_x86_winchip_c6
> 	default winchip2	if BR2_x86_winchip2
> 	default c3		if BR2_x86_c3
>-	default geode		if BR2_x86_geode
>+	default i586 		if BR2_x86_geode
> 	default nocona		if BR2_x86_64_nocona
> 	default core2		if BR2_x86_64_core2
> 	default k8		if BR2_x86_64_opteron
>@@ -480,7 +481,7 @@
> 	default winchip-c6	if BR2_x86_winchip_c6
> 	default winchip2	if BR2_x86_winchip2
> 	default c3		if BR2_x86_c3
>-	default geode		if BR2_x86_geode
>+	default i586		if BR2_x86_geode
> 	default iwmmxt		if BR2_iwmmxt
> 	default v0		if BR2_cris_unknown
> 	default v10		if BR2_cris_generic

>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
