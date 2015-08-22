From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Aug 2015 00:40:22 +0200
Subject: [Buildroot] [PATCH] package: add comment about ipkg/opkg/rpm
In-Reply-To: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
References: <1440085901-24479-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <55D8FA56.5020009@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/20/2015 05:51 PM, Yann E. MORIN wrote:
> Too often the question is raised, that ipkg, opkg and rpm do not work,
> and users complain they can not install packages.
> 
> Even though we do have a clear and clearly explained section in our
> manual, people do not read it (when will users read manuals? sigh...).
> 
> So, add a big fat comment about ipkg/opkg/rpm, that Buildroot does not
> generate binary packages and does not provide any package database for
> any of those package manager.

 Great plan!

 And guess what: not a single spelling mistake! Congrats, Yann!

 However...

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> 
> ---
> Please note the little dirty trick to avoid kconfig eating up all spaces
> on empty lines: the first space in those is U+00A0 (NO-BREAK SPACE). It
> differs from the legacy menu, where we use a single '*' to avoid that.
> ---
>  package/Config.in | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 47d14d7..c32c989 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1371,6 +1371,19 @@ endif
>  endmenu
>  
>  menu "Package managers"
> +comment "------------------------------------------------------------------------"
> +comment "Please note:                                                            "
> +comment "- Buildroot does *not* generate binary packages,                        "
> +comment "- Buildroot does *not* install any package database.                    "
> +# First space is U+00A0 (NO-BREAK SPACE), otherwise kconfig eats
> +# up all spaces:
> +comment "                                                                        "

 Nice trick, however:
- it requires a UTF-8 terminal;
- it breaks completely in nconfig;
- in menuconfig, the final *** gets shifted by one space when I tried.

 So I'd stick to the *

> +comment "It is up to you to provide those by yourself if you want                "
> +comment "to use any of those package managers.                                   "
> +comment "                                                                        "
> +comment "See the manual:                                                         "
> +comment "http://buildroot.org/downloads/manual/manual.html#faq-no-binary-packages"
> +comment "------------------------------------------------------------------------"

 Don't know how important this is, but on a 80-character display it gets chopped
off after the faq-no-. But I guess there's not much we can do about it.
Except perhaps: http://nightly.buildroot.org/manual.html#faq-no-binary-packages
- still doesn't fit but at least we get to the binary-pa :-)


 Regards,
 Arnout

>  	source "package/ipkg/Config.in"
>  	source "package/opkg/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
