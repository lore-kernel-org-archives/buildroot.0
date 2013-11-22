From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 22 Nov 2013 10:39:17 +0100
Subject: [Buildroot] [PATCH v2] libcap-ng: disable on avr32 which lacks
	TLS
In-Reply-To: <OF66C8E7E4.7783087E-ON86257C2B.00344BCA-86257C2B.003487CA@rockwellcollins.com>
References: <1385112407-3569-1-git-send-email-s.martin49@gmail.com>
 <OF66C8E7E4.7783087E-ON86257C2B.00344BCA-86257C2B.003487CA@rockwellcollins.com>
Message-ID: <CAHXCMMK1f9QKw2PKp6KOdqopSgCh4m9GwuW8W4nJg5cNgL=07g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ryan,


2013/11/22 Ryan Barnett <rjbarnet@rockwellcollins.com>

> Samuel,
>
> Samuel Martin <s.martin49@gmail.com> wrote on 11/22/2013 03:26:47 AM:
>
> [...]
>
> > diff --git a/package/ofono/Config.in b/package/ofono/Config.in
> > index c431e08..1cb41ea 100644
> > --- a/package/ofono/Config.in
> > +++ b/package/ofono/Config.in
> > @@ -3,6 +3,7 @@ config BR2_PACKAGE_OFONO
> >     depends on BR2_USE_WCHAR # gettext, libglib2
> >     depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
> >     depends on BR2_USE_MMU # dbus
> > +   depends on !BR2_avr32 # libcap-ng
> >     select BR2_PACKAGE_LIBCAP_NG
> >     select BR2_PACKAGE_DBUS
> >     select BR2_PACKAGE_LIBGLIB2
> > @@ -15,5 +16,6 @@ config BR2_PACKAGE_OFONO
> >       http://ofono.org/
> >
> >  comment "ofono needs a toolchain w/ wchar, threads"
>
> Wouldn't you want comment above saying and !avr32 or something to that
> extent?
>
According to the manual (
http://git.buildroot.net/buildroot/tree/docs/manual/adding-packages-directory.txt#n213),
this is not needed.


> > +   depends on !BR2_avr32
> >     depends on BR2_USE_MMU
> >     depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
>
> Thanks,
> -Ryan
>
>
Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131122/cd0af86b/attachment.html>
