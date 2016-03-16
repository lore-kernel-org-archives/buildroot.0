From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Mar 2016 22:42:57 +0100
Subject: [Buildroot] [PATCH 1/1] syslinux: Allow to build multiple
 flavors simultaneously
In-Reply-To: <56E9D0A6.6040104@mind.be>
References: <1458143420-23193-1-git-send-email-benoit.allard@greenbone.net>
 <56E9D0A6.6040104@mind.be>
Message-ID: <20160316224257.46555e32@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 16 Mar 2016 22:31:18 +0100, Arnout Vandecappelle wrote:

>   It is now possible that no image is selected at all. I think this will be 
> pretty bad for the build - probably, everything will be built but nothing 
> installed. So we either have to force one of the images to be selected, or add a 
> check in the .mk file that at least one of them is selected. I'm not sure what 
> the best solution is here.

Ensure in Config.in that one of them is enabled, like in the main
option:

	select BR2_TARGET_SYSLINUX_ISOLINUX \
		if !BR2_TARGET_SYSLINUX_PXELINUX && \
		   !BR2_TARGET_SYSLINUX_MBR && \
		   !BR2_TARGET_SYSLINUX_EFI

At least, that's my preference.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
