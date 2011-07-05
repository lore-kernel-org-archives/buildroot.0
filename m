From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 5 Jul 2011 23:00:18 +0200
Subject: [Buildroot] [PATCH] new package: minidlna
In-Reply-To: <0MKxYi-1QcgdO2zs8-00018x@mrelayeu.kundenserver.de>
References: <0MKxYi-1QcgdO2zs8-00018x@mrelayeu.kundenserver.de>
Message-ID: <20110705230018.01be536a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Wolfram,

Le Fri, 01 Jul 2011 18:32:02 +0200,
Wolfram Gloger <wg@malloc.de> a ?crit :

> MiniDLNA is server software with the aim of being fully compliant with
> DLNA/UPnP-AV clients.
> 
> This new package depends on libav (see my other patch) as I could not
> get it to work with the current ffmpeg package in buildroot.
> 
> Signed-off-by: Wolfram Gloger <wg@malloc.de>

Could you sent your patch inline ?

Your .mk file lists multiple dependencies, but your Config.in forgets
to "depends on" or "select" them.

Your minidlna-1.0.20-cross.patch file must come with a header detailing
what the patch does and why it is needed, along with a Signed-off-by
line identifying the author of the patch. This patch uses STAGING_DIR
in several places, which makes the patch completely unsuitable for
upstream inclusion. Isn't there a way of making this a little bit more
generic so that there's at least a hope of getting this patch merged
upstream in the minidlna project ?

In the .mk file, remove all useless commented lines.

Also remove the

+		BR2_DEFAULT_KERNEL_HEADERS=$(BR2_DEFAULT_KERNEL_HEADERS) \

line, which apparently is useless.

Regarding the dependencies, is it directly minidlna that depends on
libvorbis, flac, libogg, etc. ? Or is it libav that depends on those ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
