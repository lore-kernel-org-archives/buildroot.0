From: Alexandre Esse <alexandre.esse.dev@gmail.com>
Date: Sun, 18 Jun 2017 23:56:08 +0200
Subject: [Buildroot] [PATCH 1/1] kvazaar: new package
In-Reply-To: <20170618220554.14c6e59f@windsurf>
References: <1497655767-752-1-git-send-email-alexandre.esse.dev@gmail.com>
 <20170618220554.14c6e59f@windsurf>
Message-ID: <CALNP3k95oR1JL9qmgAMSV=c8y+6Y9O-nYARs9SLqTno_Fuk9tA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thank you for you feedback.

I am still novice into Buildroot. Even if I read the documentation, I
didn't know about support/scripts/check-package. Maybe, It should appear in
the new package submission part of the documentation?

About the cryptopp part, I have already the option --with-cryptopp working
on my PC with a custom cryptopp recipe I now need to patch the already
existing cryptopp package for it ;)

Alexandre

On 18 June 2017 at 22:05, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Hello,
>
> On Sat, 17 Jun 2017 01:29:27 +0200, Alexandre Esse wrote:
> > Kvazaar is an open-source HEVC encoder licensed under LGPLv2.1.
> > This provides tools to encode raw video into HEVC stream.
> >
> > website: http://ultravideo.cs.tut.fi/
> >
> > Signed-off-by: Alexandre Esse <alexandre.esse.dev@gmail.com>
>
> I've applied, after doing a few changes. See below.
>
> > diff --git a/package/kvazaar/Config.in b/package/kvazaar/Config.in
> > new file mode 100644
> > index 0000000..a720f17
> > --- /dev/null
> > +++ b/package/kvazaar/Config.in
> > @@ -0,0 +1,4 @@
> > +config BR2_PACKAGE_KVAZAAR
> > +     bool "kvazaar"
> > +     help
> > +                An open-source HEVC encoder licensed under LGPLv2.1
>
> Indentation for the help text is one tab + two spaces. Also, the
> Config.in help text should have an URL of the upstream project.
>
> Please run your package submissions through
> support/scripts/check-package, it detects this kind of mistakes.
>
> > +KVAZAAR_VERSION = v1.1.0
> > +KVAZAAR_SITE = $(call github,ultravideo,kvazaar,$(KVAZAAR_VERSION))
> > +KVAZAAR_LICENSE = LGPLv2.1
>
> It's in fact LGPLv2.1+, and we use SPDX license codes in Buildroot, so
> LGPL-2.1+.
>
> > +KVAZAAR_LICENSE_FILES = COPYING
> > +KVAZAAR_AUTORECONF = YES
> > +KVAZAAR_INSTALL_STAGING = YES
>
> I've added KVAZAAR_CONF_OPTS = --without-cryptopp to make sure it
> doesn't pick up this optional dependency, as it's not explicitly
> handled by kvazaar.mk.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170618/1c7f7b82/attachment.html>
