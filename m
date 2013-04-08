From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 08 Apr 2013 18:47:50 +0200
Subject: [Buildroot] [PATCH] post-build: reimplement using a for loop
 and make verbose
In-Reply-To: <CANxTyt5nMrA3a7qq3sCmavGmnydBS_h3bCXufGqa8aFE+7xXyg@mail.gmail.com>
References: <1364977729-27519-1-git-send-email-luca@lucaceresoli.net>
 <CANxTyt5nMrA3a7qq3sCmavGmnydBS_h3bCXufGqa8aFE+7xXyg@mail.gmail.com>
Message-ID: <5162F4B6.7070107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi Manchego wrote:
> Alternatively, you could just move the MESSAGE into the loop instead
> of relying on shell loops.  That would keep things more in make, if
> that's desired.
>
> 	@$(foreach s, $(call qstrip,$(BR2_ROOTFS_POST_BUILD_SCRIPT)), \
> 		$(call MESSAGE,"Executing $(s)"); \
> 		$(s) $(TARGET_DIR)$(sep))

It is actually cleanerand should also be more efficient(FWIW).

Sending a v2 patchset with this implementation.

Luca
