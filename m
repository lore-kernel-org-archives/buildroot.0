From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Oct 2010 11:17:15 +0200
Subject: [Buildroot] [PATCH 01/10] input-tools: convert to gentargets
In-Reply-To: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
References: <1286266963-23413-1-git-send-email-Martin.Banky@gmail.com>
Message-ID: <20101005111715.6559e7d2@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks Martin for doing all this conversion work, this is much
appreciated!

On Tue,  5 Oct 2010 01:22:34 -0700
Martin Banky <martin.banky@gmail.com> wrote:

> +define INPUT_TOOLS_DEBIAN_PATCHES
> +	if [ -d $(@D)/debian/patches ]; then \
> +		(cd $(@D)/debian/patches && for i in *; \
> +		 do $(SED) 's,^\+\+\+ .*joystick-$(INPUT_TOOLS_VERSION)/,+++ joystick-$(INPUT_TOOLS_VERSION)/,' $$i; \

I have seen this in several of your patches, but I don't understand why
it is here. There are several other packages that do apply the debian
patches, but such a sed step is not needed.

> +define INPUT_TOOLS_BUILD_CMDS
> +	$(INPUT_TOOLS_DEBIAN_PATCHES)

Even though it doesn't technically make any difference, I'd prefer to
have this as a post-patch hook.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
