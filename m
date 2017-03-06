From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Mar 2017 09:03:13 +0100
Subject: [Buildroot] [PATCH 2/2] package/cwiid: add optional dependency
 to bluez5_utils
In-Reply-To: <c592221b-1de8-f298-2628-c346f443c9a2@mind.be>
References: <20170219131834.27844-1-bernd.kuhls@t-online.de>
 <20170219131834.27844-2-bernd.kuhls@t-online.de>
 <20170301222352.1f97ef44@free-electrons.com>
 <c592221b-1de8-f298-2628-c346f443c9a2@mind.be>
Message-ID: <20170306090313.6dfadac1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 6 Mar 2017 00:37:38 +0100, Arnout Vandecappelle wrote:

> > This causes a circular dependency:
> > 
> > package/bluez_utils/Config.in:1:error: recursive dependency detected!
> > package/bluez_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ_UTILS is selected by BR2_PACKAGE_BLUEZ5_UTILS
> > package/bluez5_utils/Config.in:1:	symbol BR2_PACKAGE_BLUEZ5_UTILS depends on BR2_PACKAGE_BLUEZ_UTILS  
> 
>  I think it's just a matter of swapping them:
> 
> select BR2_PACKAGE_BLUEZ5_UTILS if !BR2_PACKAGE_BLUEZ_UTILS

Yeah but that one changes the current behavior: if you have a defconfig
with BR2_PACKAGE_CWIID=y, then you have been using bluez_utils, and
your change would move to use bluez5_utils instead.

That being said, I don't know if it matters that much.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
