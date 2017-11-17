From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 17 Nov 2017 10:50:12 +0100
Subject: [Buildroot] How to configure the kernel with allnoconfig and my
 own customizations
In-Reply-To: <5A0E3C9B.5000100@centtech.com>
References: <5A0E3C9B.5000100@centtech.com>
Message-ID: <20171117105012.16d90509@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 16 Nov 2017 19:34:19 -0600, Stephen Polkowski wrote:
>      Does anyone know how to setup buildroot to automatically configure 
> the kernel with allnoconfig and then apply my own customizations?  For 
> example:
> 
> cd output/build/linux-4.11.3
> 
> make KCONFIG_ALLCONFIG=custom.config allnoconfig

This is not possible today, it would require extended the
kconfig-package infrastructure a bit.

What you can do today (obviously), is generate this kernel
configuration, possibly by going in output/build/linux-4.11.3, save it
as a defconfig that you then tell Buildroot to use. Not ideal perhaps,
but it works :)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
