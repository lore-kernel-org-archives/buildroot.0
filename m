From: Juerg Haefliger <juergh@gmail.com>
Date: Fri, 20 Mar 2020 07:23:30 +0100
Subject: [Buildroot] Problems with special characters in filenames
In-Reply-To: <20200318205428.6dec3cb9@gmx.net>
References: <CADLDEKtQdEPVwiKiYHrjpRc6On4sMhHbDRSU4UWq9wnmx2xEEg@mail.gmail.com>
 <20200318205428.6dec3cb9@gmx.net>
Message-ID: <CADLDEKtOuRg7w+D00-5Z=Ra6SiQGJXjJkiY9yR6ZHct9nVoD2w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 18, 2020 at 8:54 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello Juerg,
>
> On Sat, 14 Mar 2020 13:03:07 +0100, Juerg Haefliger <juergh@gmail.com> wrote:
>
> > Hi,
> >
> > I have filenames with umlauts (special German characters) that are
> > displayed as '??' in busybox shell. I've tried the below config
> > changes to get those umlauts to display properly but it's  not
> > working. What am I missing?
>
> Maybe
>         $ export LANG=en_US.utf8
> or
>         $ export LANG=de_CH.utf8

AH, yes. That helps :-)

Thanks a lot for the hint!

...Juerg

> Regards,
> Peter
>
> >
> > Thanks
> > ...Juerg
> >
> > - BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> > +BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
> > +# BR2_ENABLE_LOCALE_PURGE is not set
> > +BR2_GENERATE_LOCALE="en_US de_CH"
> >
> > busybox config fragment:
> > CONFIG_LOCALE_SUPPORT=y
> > CONFIG_UNICODE_SUPPORT=y
> > # CONFIG_UNICODE_USING_LOCALE is not set
> > CONFIG_FEATURE_CHECK_UNICODE_IN_ENV=y
> > CONFIG_SUBST_WCHAR=63
> > CONFIG_LAST_SUPPORTED_WCHAR=767
> > CONFIG_UNICODE_COMBINING_WCHARS=y
> > CONFIG_UNICODE_WIDE_WCHARS=y
> > # CONFIG_UNICODE_BIDI_SUPPORT is not set
> > # CONFIG_UNICODE_NEUTRAL_TABLE is not set
> > # CONFIG_UNICODE_PRESERVE_BROKEN is not set
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
