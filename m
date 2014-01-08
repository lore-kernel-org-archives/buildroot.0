From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Jan 2014 22:28:59 +0100
Subject: [Buildroot] [PATCH] force devtmpfs and inotify kernel option
	when udev is used as dev handler
In-Reply-To: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
 (=?utf-8?B?IkrDqXLDqW15?= Rosen"'s message of "Wed, 8 Jan 2014 14:48:33
 +0100")
References: <1389188913-15173-1-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <87ha9enox0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?my" == J?r?my Rosen <jeremy.rosen@openwide.fr> writes:

 > Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>
 > ---
 > patch suggested by Thomas Petazzoni

 > I also added devtmpfs because it's documented as needed but wasn't enforced
 > ---
 >  linux/linux.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/linux/linux.mk b/linux/linux.mk
 > index fa8aa0c..2482952 100644
 > --- a/linux/linux.mk
 > +++ b/linux/linux.mk
 > @@ -185,6 +185,10 @@ define LINUX_CONFIGURE_CMDS
 >  		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))
 >  	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV),
 >  		$(call KCONFIG_SET_OPT,CONFIG_UEVENT_HELPER_PATH,\"/sbin/mdev\",$(@D)/.config))
 > +	$(if $(BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV),
 > +                $(call KCONFIG_ENABLE_OPT,CONFIG_INOTIFY_USER,$(@D)/.config)
 > +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
 > +		$(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

Committed with the indentation fixed and the unneeded devtmpfs handling
removed, thanks.

-- 
Bye, Peter Korsgaard
