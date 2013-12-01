From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 Dec 2013 11:16:29 +0100
Subject: [Buildroot] [PATCHv4 5/5] manual: fix manual generation with
 BR2_EXTERNAL support
In-Reply-To: <20131130231040.GE3500@free.fr>
References: <1385751626-28967-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1385751626-28967-6-git-send-email-thomas.petazzoni@free-electrons.com>
 <20131130231040.GE3500@free.fr>
Message-ID: <CAHXCMMK8GFx2F1FPqfo-aUFixWgDyvBV_KuxtfOT1_yo1-E0Vw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann, all


2013/12/1 Yann E. MORIN <yann.morin.1998@free.fr>

> Samuel, All,
>
> On 2013-11-29 20:00 +0100, Thomas Petazzoni spake thusly:
> > From: Samuel Martin <s.martin49@gmail.com>
> >
> > Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  docs/manual/manual.mk         | 1 +
> >  support/scripts/kconfiglib.py | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
> > index aeafd10..570318f 100644
> > --- a/docs/manual/manual.mk
> > +++ b/docs/manual/manual.mk
> > @@ -1,6 +1,7 @@
> >  manual-update-lists: manual-check-dependencies-lists
> >       $(Q)$(call MESSAGE,"Updating the manual lists...")
> >       $(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
> > +             BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
>
> I think I understand that change: we do not want to generate the manual
> with the external packages. Please extend the commit log.
>
Indeed. This patch aimed to fix the series beforehand, I didn't think it
would be integrated as is.
I'll repost it with an explanatory commit log shortly.


> >               $(TOPDIR)/support/scripts/gen-manual-lists.py
> >
> >  # we can't use suitable-host-package here because that's not available
> in
> > diff --git a/support/scripts/kconfiglib.py
> b/support/scripts/kconfiglib.py
> > index 0704cc0..e40947c 100644
> > --- a/support/scripts/kconfiglib.py
> > +++ b/support/scripts/kconfiglib.py
> > @@ -2074,7 +2074,7 @@ set_re   = re.compile(r"CONFIG_(\w+)=(.*)")
> >  unset_re = re.compile(r"# CONFIG_(\w+) is not set")
> >
> >  # Regular expression for finding $-references to symbols in strings
> > -sym_ref_re = re.compile(r"\$[A-Za-z_]+")
> > +sym_ref_re = re.compile(r"\$[A-Za-z_][0-9A-Za-z_]*")
>
> I fail to see how this change is related to BR2_EXTERNAL. Care to
> explain (and extend the commit log at the same time), please?
>
I'll explain it in the new version of the patch.

Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131201/dce87488/attachment.html>
