From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 17 Sep 2007 11:38:55 +0200
Subject: [Buildroot] vendor specific settings in generic configuration
In-Reply-To: <20070917092648.326B5A6830@busybox.net>
References: <20070917092648.326B5A6830@busybox.net>
Message-ID: <20070917093855.GA19167@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 17, 2007 at 02:26:48AM -0700, ulf at uclibc.org wrote:
>Author: ulf
>Date: 2007-09-17 02:26:47 -0700 (Mon, 17 Sep 2007)
>New Revision: 19863
>
>Log:
>Revert bad patch
>
>Modified:
>   trunk/buildroot/target/device/Mirrors.in
>
>
>Changeset:
>Modified: trunk/buildroot/target/device/Mirrors.in
>===================================================================
>--- trunk/buildroot/target/device/Mirrors.in	2007-09-17 07:54:52 UTC (rev 19862)
>+++ trunk/buildroot/target/device/Mirrors.in	2007-09-17 09:26:47 UTC (rev 19863)
>@@ -12,8 +12,6 @@
> 	  The list of mirrors is available here:
> 	  http://prdownloads.sourceforge.net/index-sf.html?download
> 
>-if BR2_avr32
> source	"target/device/Atmel/Mirrors.in"
>-endif

I strongly object to this wrong patch.

When building for anything but at91 or avr32, it is wrong to have vendor
specific stuff in the config.

Please explain _in detail_ why you think it is sane to have atmel
specific stuff in my config or rootfs when i build for i386 or arm.

regards,
