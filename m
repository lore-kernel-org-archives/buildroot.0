From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 27 Oct 2019 04:57:04 -0500
Subject: [Buildroot] [PATCH] package/flannel: remove 'v' prefix
In-Reply-To: <a6bc6fb0-a5ea-df8b-ba36-c705b90afef7@mind.be>
References: <20191027065629.16426-1-matthew.weber@rockwellcollins.com>
 <a6bc6fb0-a5ea-df8b-ba36-c705b90afef7@mind.be>
Message-ID: <CANQCQpb_hwu+CEdkT0aVyLq8A0irbrXM=AgLCZWGHQ8k27+wcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Sun, Oct 27, 2019 at 3:13 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 27/10/2019 07:56, Matt Weber wrote:
> > Fixes version parsing for release-monitoring.org support.
> >
> > Cc: Heiko Thiery <heiko.thiery@kontron.com>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/flannel/flannel.mk | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
> > index d00d2df92c..e944012358 100644
> > --- a/package/flannel/flannel.mk
> > +++ b/package/flannel/flannel.mk
> > @@ -4,14 +4,14 @@
> >  #
> >  ################################################################################
> >
> > -FLANNEL_VERSION = v0.5.5
> > +FLANNEL_VERSION = 0.5.5
> >  FLANNEL_SITE = https://github.com/coreos/flannel/archive
> > -FLANNEL_SOURCE = $(FLANNEL_VERSION).tar.gz
> > +FLANNEL_SOURCE = v$(FLANNEL_VERSION).tar.gz
> >
> >  FLANNEL_LICENSE = Apache-2.0
> >  FLANNEL_LICENSE_FILES = LICENSE
> >
> > -FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=$(FLANNEL_VERSION)
> > +FLANNEL_LDFLAGS = -X github.com/coreos/flannel/version.Version=v$(FLANNEL_VERSION)
>
>  I'm not a Go expert, but I would think that this can also be without the v.

I did a quick test and it doesn't seem to matter if we drop the v from
the LDFLAGS line.  I'll make this fixup in the v2

Regards,
Matt
