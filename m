From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 18 Apr 2020 11:08:45 -0600
Subject: [Buildroot] [PATCH v2 1/1] package/exfatprogs: new package
In-Reply-To: <20200418150914.35648975@windsurf.home>
References: <20200417201405.109657-1-james.hilliard1@gmail.com>
 <20200418150914.35648975@windsurf.home>
Message-ID: <CADvTj4riQd-VT-=sjsnJG7WaLMb-vyZD8rMekqWFXj3PVXEMtQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Apr 18, 2020 at 7:09 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello,
>
> On Fri, 17 Apr 2020 14:14:05 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > exFAT filesystem userspace utilities
> >
> > We need a patch to fix:
> > error: unknown type name ?ssize_t?
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> I was about to apply... but we already have package/exfat-utils/ in
> Buildroot. It's not the same source, but there seems to be a
> significant overlap between the two. Do you know why there are two
> projects ?
exfat-utils is basically the FUSE version of exfatprogs
>
> > +EXFATPROGS_VERSION = 1.0.1
> > +EXFATPROGS_SITE = $(call github,exfatprogs,exfatprogs,$(EXFATPROGS_VERSION))
> > +EXFATPROGS_LICENSE = GPL-2.0
>
> License is GPL-2.0+, as indicated by the SPDX statements. No need to
> resend a new version just for that.
>
> > +EXFATPROGS_LICENSE_FILES = COPYING
> > +EXFATPROGS_AUTORECONF = YES
> > +EXFATPROGS_DEPENDENCIES = host-pkgconf
> > +HOST_EXFATPROGS_DEPENDENCIES = host-pkgconf
>
> It is a bit silly that they require pkg-config... they don't use it for
> anything at all. They only check that pkg-config is available.
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
