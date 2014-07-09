From: David Bachelart <david.bachelart@bbright.com>
Date: Wed, 9 Jul 2014 14:34:29 +0200
Subject: [Buildroot] [PATCH 1/1] ccrypt: new package
In-Reply-To: <20140709121457.GI3003@tarshish>
References: <1404906938-7965-1-git-send-email-david.bachelart@bbright.com>
 <20140709121457.GI3003@tarshish>
Message-ID: <CAJeZidKsYxMj5mJ6zzrmeuDG2856g8R7aE=Wx+TKuGFky_CBAg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok

Thanks !

David


2014-07-09 14:14 GMT+02:00 Baruch Siach <baruch@tkos.co.il>:

> Hi David,
>
> Thanks for following up.
>
> When sending a new version of a patch we usually mark this in the subject
> line
> with [PATCH v2]. You can use the --subject-prefix parameter of 'git
> format-patch' to do this. Something like:
>
>         git format-patch --subject-prefix='PATCH v2' ...
>
> For git version 1.8.2 and later this can be reduced to 'git format-patch
> -v2'
>
> One more comment below.
>
> On Wed, Jul 09, 2014 at 01:55:38PM +0200, David Bachelart wrote:
> > ccrypt is a utility for encrypting and decrypting files and streams.
> >
> > Signed-off-by: David Bachelart <david.bachelart@bbright.com>
> > ---
> >  package/Config.in        |    1 +
> >  package/ccrypt/Config.in |    6 ++++++
> >  package/ccrypt/ccrypt.mk |   12 ++++++++++++
> >  3 files changed, 19 insertions(+)
> >  create mode 100644 package/ccrypt/Config.in
> >  create mode 100644 package/ccrypt/ccrypt.mk
> >
> > diff --git a/package/Config.in b/package/Config.in
> > index f30c25f..c626968 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1094,6 +1094,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> >  endif
> >  comment "Utilities"
> >       source "package/at/Config.in"
> > +     source "package/ccrypt/Config.in"
> >       source "package/dialog/Config.in"
> >       source "package/dtach/Config.in"
> >       source "package/file/Config.in"
> > diff --git a/package/ccrypt/Config.in b/package/ccrypt/Config.in
> > new file mode 100644
> > index 0000000..99c4d47
> > --- /dev/null
> > +++ b/package/ccrypt/Config.in
> > @@ -0,0 +1,6 @@
> > +config BR2_PACKAGE_CCRYPT
> > +        bool "ccrypt"
> > +        help
> > +          ccrypt is a utility for encrypting and decrypting files and
> streams.
> > +
> > +          http://ccrypt.sourceforge.net/
> > diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
> > new file mode 100644
> > index 0000000..a32f149
> > --- /dev/null
> > +++ b/package/ccrypt/ccrypt.mk
> > @@ -0,0 +1,12 @@
> >
> +################################################################################
> > +#
> > +# ccrypt
> > +#
> >
> +################################################################################
> > +
> > +CCRYPT_VERSION = 1.10
> > +CCRYPT_SITE = http://ccrypt.sourceforge.net/download/
> > +
> > +CCRYPT_LICENSE = GPLv2+
>
> CCRYPT_LICENSE_FILES is missing.
>
> > +$(eval $(autotools-package))
>
> baruch
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140709/9a9d4d44/attachment.html>
