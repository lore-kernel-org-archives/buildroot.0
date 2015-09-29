From: kei-k at ca2.so-net.ne.jp <kei-k@ca2.so-net.ne.jp>
Date: Tue, 29 Sep 2015 20:05:34 +0900
Subject: [Buildroot] [PATCH v13 1/1] squeezelite: new package
In-Reply-To: Your message of Mon, 28 Sep 2015 23:03:37 +0200.
 <20150928230337.105c6648@free-electrons.com>
Message-ID: <201509291105.t8TB5Yv6028815@ms-omx03.plus.so-net.ne.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas.

Thank you for your comment.

I will send v14 patch with reflecting following your comment
in next e-mail.

> > I've fixed SQUEEZELITE_BUILD_CMDS issue.
> > I hope this will be the final version, and be pulled up.
> 
> Unfortunately you are still not following the good comments from
> Vicente. Your commit log should *not* contain any "personal" messages.
> All "personal" messages should go below the "---" sign.
OK.

> > +config BR2_PACKAGE_SQUEEZELITE_FF
> Option should be suffixed _FFMPEG
OK.

> > 	bool "Enable wma, alac decoding (by ffmpeg)"
> "(by ffmpeg)" part not needed.
> Also, please use:
> 	Enable WMA and ALAC decoding
OK.

> > +	help
> > +	  Enable wma, alac decoding
> The help is useless here, so get rid of it.
OK. I remove it.

> > +	bool "Enable dsd decoding"
> Please use:
> 	"Enable Direct Speech Decoding"
> or at least put DSD in capital letters.
OK.
DSD is not 'Direct Speech Decoding', but 'Direct Stream Digital'.
Anyway I will use DSD here.

> > +	help
> > +	  Enable built-in DSD decoder
> > +config BR2_PACKAGE_SQUEEZELITE_RESAMPLE
> > +	bool "Enable resampling function"
> Rather than "function" use "support"
OK.

> > +	select BR2_PACKAGE_LIBSOXR
> > +	help
> > +	  Enable resampling function
> Again help text useless if it's just copy/pasting the prompt of the
> option.
OK. removed.

> > +config BR2_PACKAGE_SQUEEZELITE_VISEXPORT
> > +	bool "Enable Visualiser support"
> 	"Enable visualiser support"
> (no need for a capital V)
OK.

> > +	help
> > +	  Enable Visualiser support
> Useless help, should be removed.
OK, removed.

> > +define SQUEEZELITE_CONFIGURE_CMDS
> > +	sed -e '1aoverride CFLAGS += $$(OPTS)' \
> > +		-e 's/LDFLAGS +=/override LDFLAGS +=/' \
> > +		-e 's/LDFLAGS ?=/override LDFLAGS +=/' \
> > +		$(@D)/Makefile >$(@D)/$(SQUEEZELITE_MAKEFILE)
> > +endef
> Don't do this. Create a patch for the Makefile that does the necessary
> changes.
OK, I will make patch file.

> > +define SQUEEZELITE_BUILD_CMDS
> > +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> > +		OPTS="$(SQUEEZELITE_MAKE_OPTS)" \
> > +		-f $(SQUEEZELITE_MAKEFILE) -C $(@D) all
> > +endef
> > +define SQUEEZELITE_INSTALL_TARGET_CMDS
> > +	$(INSTALL) -D -m 0755 $(@D)/squeezelite $(TARGET_DIR)/usr/bin
> You must use a full path as the destination, i.e:
OK.

> Can you fix the above issues and send an updated version? Please be
> careful to take into account all the comments. If you have some doubts
> about certain comments, simply ask questions as a reply to this e-mail
> rather than sending many iterations of the patch.
> 
> Thanks a lot!
> 
> Thomas
============================================================
    Hiroshi Kawashima
