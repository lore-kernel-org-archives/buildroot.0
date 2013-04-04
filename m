From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 3 Apr 2013 21:35:55 -0400
Subject: [Buildroot] [PATCH] post-build: reimplement using a for loop
 and make verbose
In-Reply-To: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
References: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <CANxTyt5nMrA3a7qq3sCmavGmnydBS_h3bCXufGqa8aFE+7xXyg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alternatively, you could just move the MESSAGE into the loop instead
of relying on shell loops.  That would keep things more in make, if
that's desired.

	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
		$(call MESSAGE,"Executing $(s)"); \
		$(s) $(TARGET_DIR)$(sep))

Danomi -
