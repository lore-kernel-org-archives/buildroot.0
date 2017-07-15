From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 15 Jul 2017 11:44:32 +0200
Subject: [Buildroot] [PATCH 1/2] uclibc-ng: enable fts in default config
 file.
In-Reply-To: <20170713142549.28078-1-aduskett@gmail.com>
References: <20170713142549.28078-1-aduskett@gmail.com>
Message-ID: <20170715114432.0b01a373@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 13 Jul 2017 10:25:48 -0400, Adam Duskett wrote:
> currently there are a few packages in buildroot that are set to not
> be selectable unless the user wishes to use glibc specifically because
> the package uses fts.h.
> 
> uClibc actually does have a fts implimentation, and it's selectable in
> uclib-menuconfig.  However; this has two issues with it:
> 
> 1) Most users wouldn't know that there is even a uClibc-menuconfig
> 2) Even if the user does select fts support in uClibc-menuconfig, the
>    packages that would now compile and work would still not be selectable
>    because they explicitly require BR2_TOOLCHAIN_USES_GLIBC.
> 
> Enabling fts support increases the size of uclibc by 75~kb according to
> the menuconfig option.  This is a acceptable size increase to fix the
> few packages that require fts.h support.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Peter, what is your thought on enabling FTS by default in our uClibc-ng
configuration ?

Note that contrary to what Adam commit log says, the size increase is
7.5 KB.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
