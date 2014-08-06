From: Pieter De Gendt <pieter.degendt@gmail.com>
Date: Wed, 6 Aug 2014 10:08:22 +0200
Subject: [Buildroot] [PATCH 1/1] jack2: Added staging
In-Reply-To: <fb1133f6-4157-4458-9fb4-ede779eb6dea@email.android.com>
References: <1407311713-30045-1-git-send-email-pieter.degendt@gmail.com>
 <fb1133f6-4157-4458-9fb4-ede779eb6dea@email.android.com>
Message-ID: <CAFfn7Uk7k+q1QxhOteqy_NT+4-cPYN8UMRi1wP7ASi4_RVi2Tw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

No, I'm just not that familiar yet with the makefile mechanism, I looked at
other packages for examples, this seemed to be the easiest solution.


On Wed, Aug 6, 2014 at 10:04 AM, Thomas De Schampheleire <
patrickdepinguin@gmail.com> wrote:

> Pieter De Gendt <pieter.degendt@gmail.com> schreef:
> >
> >Signed-off-by: Pieter De Gendt <pieter.degendt@gmail.com>
> >---
> > package/jack2/jack2.mk |    7 +++++++
> > 1 file changed, 7 insertions(+)
> >
> >diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> >index 68f6e42..e1c3197 100644
> >--- a/package/jack2/jack2.mk
> >+++ b/package/jack2/jack2.mk
> >@@ -8,6 +8,7 @@ JACK2_VERSION = ab409a65df95bc261ff72b52d6b3f4a65cf3266a
> > JACK2_SITE = $(call github,jackaudio,jack2,$(JACK2_VERSION))
> > JACK2_LICENSE = GPLv2+ (jack server), LGPLv2.1+ (jack library)
> > JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python
> >+JACK2_INSTALL_STAGING = YES
> >
> > define JACK2_CONFIGURE_CMDS
> >       (cd $(@D); \
> >@@ -27,4 +28,10 @@ define JACK2_INSTALL_TARGET_CMDS
> >               install)
> > endef
> >
> >+define JACK2_INSTALL_STAGING_CMDS
> >+      $(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/jack
> >+      $(INSTALL) -m 0644 $(@D)/common/jack/*.h \
> >+              $(STAGING_DIR)/usr/include/jack
> >+endef
>
> Is there a particular reason why you did manual copies here instead of
> just running 'make install'?
>
>
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140806/bc083c95/attachment.html>
