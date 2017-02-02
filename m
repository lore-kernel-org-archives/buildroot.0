From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Feb 2017 14:55:58 +0100
Subject: [Buildroot] [PATCH 1/1] grub2: add option to specify grub.cfg
	file.
In-Reply-To: <20170202134023.25002-1-Adamduskett@outlook.com>
References: <20170202134023.25002-1-Adamduskett@outlook.com>
Message-ID: <20170202145558.2f6b5923@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Feb 2017 08:40:23 -0500, Adam Duskett wrote:
> Currently the menu file for grub is copied from boot/grub2/grub.cfg
> with no way for a user to change the preset settings.  This is a small
> patch but being able to specify a menu file allows for much more flexibility
> that is desired.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>

I'm really not sure this is needed. You can just have a post-build
script or a rootfs overlay that adds your custom grub.cfg file
in /boot/grub2 at the end of the build. The one installed by the
package is merely an initial example that works for some basic
situations. But there is no need for an additional option to override
this file, just use a rootfs overlay or a post-build script.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
