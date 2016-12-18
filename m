From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 18 Dec 2016 15:17:59 +0100
Subject: [Buildroot] [PATCH 1/1] lxc: add dependency on gnutls
In-Reply-To: <20161218142230.65c0e57d@free-electrons.com>
References: <1482062185-97871-1-git-send-email-fabrice.fontaine@orange.com>
 <20161218142230.65c0e57d@free-electrons.com>
Message-ID: <CAPi7W82wboMBEsBGD==Y+75E17jwC3fD7Sox5F3kqrK5DeERMA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

2016-12-18 14:22 GMT+01:00 Thomas Petazzoni <thomas.petazzoni@free-
electrons.com>:

> Hello,
>
> On Sun, 18 Dec 2016 12:56:25 +0100, Fabrice Fontaine wrote:
> > lxc can use gnutls for various checksumming so add a dependency on it if
> > package is selected (there is no --enable-gnutls in configure)
> >
> > Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
>
> I was about to apply this... but in fact I don't see how lxc can use
> gnutls. The configure script indeed has:
>
> AC_CHECK_LIB([gnutls], [gnutls_hash_fast], [enable_gnutls=yes],
> [enable_gnutls=no])
>
> But ${enable_gnutls} is only used to print a message. In the source
> code, the gnutls related code is surrounded by HAVE_LIBGNUTLS
> conditions, but this is never defined anywhere.
>
My bad, you're completely right ... I will ask the status of gnutls to lxc
project.

>
> Bottom line, I don't see where gnutls is currently used in lxc in practice.
>
> Best regards,
>
> Thomas Petazzoni
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161218/e549d1c9/attachment.html>
