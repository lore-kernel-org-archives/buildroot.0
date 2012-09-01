From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 1 Sep 2012 14:16:05 +0200
Subject: [Buildroot] [RFC] Handling gettext
In-Reply-To: <201208310150.54511.yann.morin.1998@free.fr>
References: <201208310150.54511.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+tTZudQqRyO3x+TwaeC26KQJETEd7Yu+gVQu8yPAcddg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, all,

2012/8/31 Yann E. MORIN <yann.morin.1998@free.fr>:
> Hello All!
>
> Currently, defining dependency upon gettext is a bit convoluted:
>
>   config BR2_PACKAGE_FOO
>     select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
>     select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
>
> I think that packages should not have to do that in this way, because
> I believe they should not have to deal with that complexity.
>
> What I mean is, for example, should the gettext issue gains some complexity,
> of is simplified, of we decide to always use a library instead of the libc's
> gettext, it would mean updating all packages.
>
> Also, it breaks my script about the _AVAILABLE sutff.
>
> What I suggest is the following:
>
> 0) Rename the current options:
>
>   BR2_NEEDS_GETTEXT            -->  BR2_NEEDS_EXTERNAL_GETTEXT
>
> 1) Add blind options that do the conditional selects:
>
>   config BR2_NEEDS_GETTEXT
>     bool
>     select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT
>
>   config BR2_NEEDS_LIBINTL
>     bool
>     select BR2_PACKAGE_LIBINTL if BR2_NEEDS_EXTERNAL_GETTEXT
>
> 2) simplify packages by selecting appropriate options:
>
>   config BR2_PACKAGE_FOO
>     select BR2_NEEDS_GETTEXT
>     select BR2_NEEDS_LIBINTL
I do like having such explicit things in BR:)

However, IIRC,  gettext comes if needed with i18n/l10n option from the
toolchain menu.
I may miss something obvious, but I don't get what is the behavior of
this when the i18n/l10n support is disabled. :-|

I mean, in the case package foo requires i18n/l10n support:  how do
you express the package foo dependency on the i18n/l10n support?
Is it through the *_AVAILABLE infra you're working on too?


Cheers,

-- 
Sam
