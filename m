From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Apr 2017 21:04:47 +0200
Subject: [Buildroot] [PATCH] package/xenomai: update udev rules search
 path
In-Reply-To: <20170430111438.11069-1-romain.naour@gmail.com>
References: <20170430111438.11069-1-romain.naour@gmail.com>
Message-ID: <20170430210447.0ca0ac5f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 30 Apr 2017 13:14:38 +0200, Romain Naour wrote:
> The udev rules has been moved to kernel/cobalt/udev.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8eb/8eb4643faed523ffccd421f20c2955adfde634a6
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied, thanks!

> Do we want to keep the old path in the .mk for backward compatibility
> with Xenomai < 3 ?

No, there are already lots of things that no longer work with Xenomai <
3.

>  define XENOMAI_INSTALL_UDEV_RULES
>  	if test -d $(TARGET_DIR)/etc/udev/rules.d ; then \

Why do we have this test here? XENOMAI_INSTALL_UDEV_RULES is only used
when udev is enabled, so this folder should already exist, no?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
