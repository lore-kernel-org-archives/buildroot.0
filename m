From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 24 Jan 2011 17:11:32 +0100
Subject: [Buildroot] [PATCH 1/4] libpcap: update static handling
In-Reply-To: <1295493032-4705-1-git-send-email-vapier@gentoo.org>
References: <1295493022-4659-1-git-send-email-vapier@gentoo.org>
	<1295493032-4705-1-git-send-email-vapier@gentoo.org>
Message-ID: <20110124171132.6baad50c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Completely unrelated to Mike's change, but still spotted while looking
at the patch context:

On Wed, 19 Jan 2011 22:10:29 -0500
Mike Frysinger <vapier@gentoo.org> wrote:

>  LIBPCAP_CONF_ENV:=ac_cv_linux_vers=$(firstword $(subst .,$(space),$(firstword $(call qstrip,$(BR2_DEFAULT_KERNEL_HEADERS))))) \

Both libpcap and tcpdump use this and I never noticed, but this is
completely broken with external toolchains and the Crosstool-NG backend,
since BR2_DEFAULT_KERNEL_HEADERS is only set with internal toolchains.

I haven't thought of what the right fix would be, but it's definitely
not that one.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
