From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 14 Apr 2020 12:31:33 -0500
Subject: [Buildroot] [PATCH] package/swupdate: Add basic systemd service
In-Reply-To: <20200414182350.34184f96@windsurf.home>
References: <20200414135231.27737-1-matthew.weber@rockwellcollins.com>
 <20200414182350.34184f96@windsurf.home>
Message-ID: <CANQCQpbw3B7mRiMeX-amqFCoHfypheBP2mSaCtKQc68nK9gErQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Tue, Apr 14, 2020 at 11:24 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Tue, 14 Apr 2020 08:52:31 -0500
> Matt Weber <matthew.weber@rockwellcollins.com> wrote:
>
> > From: Sam Voss <sam.voss@rockwellcollins.com>
> >
> > Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  package/swupdate/swupdate.mk      | 10 ++++++++++
> >  package/swupdate/swupdate.service | 17 +++++++++++++++++
> >  2 files changed, 27 insertions(+)
> >  create mode 100644 package/swupdate/swupdate.service
> >
> > diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
> > index 2b51edb66d..2300220d93 100644
> > --- a/package/swupdate/swupdate.mk
> > +++ b/package/swupdate/swupdate.mk
> > @@ -189,4 +189,14 @@ $(error No Swupdate configuration file specified, check your BR2_PACKAGE_SWUPDAT
> >  endif
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE),y)
> > +define SWUPDATE_INSTALL_INIT_SYSTEMD
> > +     $(INSTALL) -D -m 644 package/swupdate/swupdate.service \
> > +             $(TARGET_DIR)/usr/lib/systemd/system/swupdate.service
> > +     mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
> > +     ln -sf ../../../../usr/lib/systemd/system/swupdate.service \
> > +             $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/swupdate.service
>
> This symlink is no longer needed now that we have host-systemd as far
> as I understand.
>

Is there a good example of how that works?

Matt
