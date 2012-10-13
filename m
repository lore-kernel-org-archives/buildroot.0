From: Alexander Khryukin <alexander@mezon.ru>
Date: Sat, 13 Oct 2012 18:54:36 +0400
Subject: [Buildroot] [PATCH] beecrypt: enable OpenMP if Buildroot GCC
 supports it
In-Reply-To: <507975A3.8080009@petroprogram.com>
References: <1350071690-11279-1-git-send-email-stefan.froberg@petroprogram.com>
 <50793478.1090305@mind.be> <50796BDA.3040008@petroprogram.com>
 <50796CB1.8040106@mind.be> <507975A3.8080009@petroprogram.com>
Message-ID: <CABtOAfyEmazbYa6k1ctPWvBEgBLug87oQPBkMcjoFX=ZvVEW-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/10/13 Stefan Fr?berg <stefan.froberg@petroprogram.com>

>  13.10.2012 16:29, Arnout Vandecappelle kirjoitti:
>
> On 13/10/12 15:25, Stefan Fr?berg wrote:
>
> And the automatic detection didn't work for Alexander and he was even
> using the internal toolchain
>
>
>  The automatic detection did work (and it's part of autoconf, BTW).
> However,
> beecrypt uses the OPENMP_CFLAGS given by autoconf to determine if OpenMP
> is
> available or not - but *OPENMP_CFLAGS may be empty if OpenMP is already
> enabled
> without any CFLAGS*.  So it should instead check on ac_cv_prog_c_openmp.
>
>  Regards,
>  Arnout
>
>
> Isn't that ac_cv_prog_c_openmp in configure file the same as AC_OPENMP
> macro ?
>
> And from:
>
> https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Generic-Compiler-Characteristics.html
>
> *"If the current language is C, the macro **AC_OPENMP** sets the variable
> **OPENMP_CFLAGS** to the C compiler flags needed for supporting OpenMP. **
> OPENMP_CFLAGS** is set to empty if the compiler already supports OpenMP,
> if it has no way to activate OpenMP support, or if the user rejects OpenMP
> support by invoking ?**configure**? with the ?**--disable-openmp**?
> option. **"**
> *
> So from that:
> 1 ) If compiler *supports* OpenMP it set's  OPENMP_CFLAGS to empty. No
> OpenMP for you.
> 2 ) If compiler has no clue how to activate OpenMP, it will set
> OPENMP_CFLAGS to empty. No OpenMP for you.
> 3 ) If user refuses to use OpenMP with --disable-openmp (like in that my
> patch) it will set OPENMP_CFLAGS to empty. No OpenMP for you.
>
>
> Quick grepping of beecrypt-4.2.1 configure file shows that
> OPENMP_CFLAGS=ac_cv_prog_c_openmp
>
> grep -n ac_cv_prog_c configure
>
> configure:17706     OPENMP_CFLAGS=$ac_cv_prog_c_openmp ;;
>
> This all sounds soooo messy.
>
> Regards:
> Stefan
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


Use my patch please

http://pastie.org/pastes/5052617/text
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20121013/9e124293/attachment-0001.html>
