From: Leach, Daniel J. <dleach@belcan.com>
Date: Wed, 17 Apr 2019 15:09:51 +0000
Subject: [Buildroot] [PATCH 1/1] dacapo: new package
In-Reply-To: <CANQCQpbz8EETZUXUKsCTJBJc8YTMJ=bGzJzmXUKSDde-9ZJAJA@mail.gmail.com>
References: <7B9EA298F6C566489E909E1B85615FB80186965B3A@AWHMBX02.belcan.com>
 <20190414154225.48347784@windsurf>,
 <CANQCQpbz8EETZUXUKsCTJBJc8YTMJ=bGzJzmXUKSDde-9ZJAJA@mail.gmail.com>
Message-ID: <7B9EA298F6C566489E909E1B85615FB80186971E12@AWHMBX02.belcan.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

Sorry about the patch formatting; I have limited email client options but will take
greater care in the future. Thanks for applying the patch and incorporating those fixes!
As Matt said, I contributed the package on his behalf.


Matt,

Thanks for providing clarification!

Dan


On Mon, Apr 15, 2019 at 2:40 PM Matthew Weber
<matthew.weber@collins.com> wrote:
> 
> Thomas,
> 
> 
> On Sun, Apr 14, 2019 at 8:42 AM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> >
> > Hello Daniel,
> >
> > On Mon, 18 Feb 2019 21:55:03 +0000
> > "Leach, Daniel J." <dleach@belcan.com> wrote:
> >
> > > The DaCapo benchmark suite is intended as a tool for Java benchmarking
> > > by the programming language, memory management and computer architecture
> > > communities.
> > >
> > > Depends on the OpenJDK package for Java runtime environment.
> > >
> > > Signed-off-by: Daniel J. Leach <dleach@belcan.com>
> >
> > Thanks for your contribution, I have applied after doing a few changes.
> > First of all, your patch didn't apply as-is, it was probably mangled by
> > your e-mail client. Please try to use "git send-email" to send patches
> > in the future.
> >
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index baa325eead..a64a671b56 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -1405,6 +1405,7 @@ F:        package/checksec/
> > >  F:      package/cgroupfs-mount/
> > >  F:      package/crda/
> > >  F:      package/cunit/
> > > +F:     package/dacapo
> >
> > Why was this added in the middle of Matt Weber entries ? It should have
> > been associated to your name, since you are the one contributing
> > dacapo. I fixed that up.
> 
> Sorry I should have responded and mentioned Dan was adding this
> package on behalf of me. I'll send a patch to fix-up.
> 
> >
> > > diff --git a/package/dacapo/dacapo.mk b/package/dacapo/dacapo.mk
> > > new file mode 100644
> > > index 0000000000..32d0cc0701
> > > --- /dev/null
> > > +++ b/package/dacapo/dacapo.mk
> > > @@ -0,0 +1,21 @@
> > > +################################################################################
> > > +#
> > > +# dacapo
> > > +#
> > > +################################################################################
> > > +
> > > +DACAPO_VERSION = 9.12-MR1-bach
> > > +DACAPO_SOURCE = dacapo-$(DACAPO_VERSION).jar
> > > +DACAPO_SITE = http://sourceforge.net/projects/dacapobench/files/9.12-bach-MR1
> > > +DACAPO_LICENSE = Apache-2.0
> > > +DACAPO_LICENSE_FILES = LICENSE
> > > +
> > > +define DACAPO_EXTRACT_CMDS
> > > +       unzip $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) LICENSE -d $(@D)
> > > +endef
> > > +
> > > +define DACAPO_INSTALL_TARGET_CMDS
> > > +       $(INSTALL) -D -m 755 $(DACAPO_DL_DIR)/$(DACAPO_SOURCE) $(TARGET_DIR)/usr/bin/
> >
> > The destination path should include the filename, so I also fixed that.
> >
> > Applied with those two issues fixed. Thanks!
> >
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
> 
> 
> 
> --
> 
> Matthew Weber | Pr. Software Engineer | Commercial Avionics
> 
> COLLINS AEROSPACE
> 
> 400 Collins Road NE, Cedar Rapids, Iowa 52498, USA
> 
> Tel: +1 319 295 7349 | FAX: +1 319 263 6099
> 
> matthew.weber at collins.com | collinsaerospace.com
> 
> 
> 
> CONFIDENTIALITY WARNING: This message may contain proprietary and/or
> privileged information of Collins Aerospace and its affiliated
> companies. If you are not the intended recipient, please 1) Do not
> disclose, copy, distribute or use this message or its contents. 2)
> Advise the sender by return email. 3) Delete all copies (including all
> attachments) from your computer. Your cooperation is greatly
> appreciated.
> 
> 
> Any export restricted material should be shared using my
> matthew.weber at corp.rockwellcollins.com address.
