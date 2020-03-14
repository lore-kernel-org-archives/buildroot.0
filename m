From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Mar 2020 15:36:10 +0100
Subject: [Buildroot] [PATCH 1/3] fs/cramfs: add depends on
 !BR2_PACKAGE_LIBSELINUX
In-Reply-To: <20200312182941.3322627-1-aduskett@gmail.com>
References: <20200312182941.3322627-1-aduskett@gmail.com>
Message-ID: <20200314153610.582f6fe9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 12 Mar 2020 11:29:38 -0700
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> cramfs does not support extended attributes (xattrs) needed for SELinux to
> function.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

I quickly discussed this with Peter on IRC, and we both agreed we
didn't like these direct dependencies.

One solution I suggested is to do something like this:

 - Introduce some hidden boolean like BR2_SYSTEM_NEEDS_XATTR_FS (or
   some better name)

 - Have libselinux select this

 - Have the filesystems that don't support xattr have a depends on
   !BR2_SYSTEM_NEEDS_XATTR_FS.

I'm just not sure about where to define BR2_SYSTEM_NEEDS_XATTR_FS, and
I'm not sure about the naming. Should it be in fs/Config.in? In
system/Config.in?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
