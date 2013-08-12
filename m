From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Aug 2013 21:36:49 +0200
Subject: [Buildroot] Removing/solving gettext dependencies in libuio
In-Reply-To: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
References: <CAAXf6LWskVXQjvLYeEBx_JJxuTujMZEq2JzqLMftXXUSaPTQHg@mail.gmail.com>
Message-ID: <52093951.7060608@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/07/13 14:28, Thomas De Schampheleire wrote:
> Hi,
>
> I'm adding the library libuio to buildroot
> (https://github.com/Linutronix/libuio/).
> This library expects gettext to be present, but I want to avoid adding
> this dependency to buildroot because it really isn't needed.
>
> What is the best way to solve this?

  Isn't docs/manual/adding-packages-gettext.txt sufficient?


  Regards,
  Arnout

> The first alternative is to patch the package and remove the
> problematic code. These changes are in configure.ac, Makefile.am, the
> patch is fairly short. This change is not acceptable upstream (I
> guess).
>
> A second alternative is to change libuio to recognize --disable-nls.
> However, I'm not sure how to do that.
> The configure.ac file contains:
>
>    AM_GNU_GETTEXT([external])
>    AM_GNU_GETTEXT_VERSION([0.17])
>
> This macro is provided by gettext itself, so without gettext this doesn't work.
> I tried something like:
>
> AC_ARG_ENABLE([nls], AC_HELP_STRING([--disable-nls], [Do not use
> Native Language Support]),
>                USE_NLS=$enableval, USE_NLS=yes)
>
> AC_SUBST(USE_NLS)
>
> AS_IF([test "x$enable_nls" == xyes],
>    AM_GNU_GETTEXT([external])
>    AM_GNU_GETTEXT_VERSION([0.17])
> )
>
> but I still get complaints about AM_GNU_GETTEXT not recognized.
> I have tried finding good examples of implementing --disable-nls
> without requiring gettext, but I can't find any.
>
>
> Any input welcome,
>
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
