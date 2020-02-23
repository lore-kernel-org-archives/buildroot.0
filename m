From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 22:12:25 +0100
Subject: [Buildroot] [RFC v1] WIP: package/qt5webengine: fix compile
 flags for rpi zero
In-Reply-To: <20200220224938.13945-1-ps.report@gmx.net>
References: <20200220224938.13945-1-ps.report@gmx.net>
Message-ID: <20200223221225.212c8f4a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

On Thu, 20 Feb 2020 23:49:38 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> The qt5webengine configure simple takes QT_ARCH ('arm') to determine the
> chromium compiler flags resulting in wrong defaults for the rpi
> zero case (resulting in illegal instruction failure), e.g.:
> 	-march=armv7-a -mfloat-abi=hard -mtune=generic-armv7-a -mfpu=vfpv3-d16
> 
> Add patch to overwrite the chromium settings with suitable values
> for the rpi zero case in the file rc/3rdparty/chromium/build/config/arm.gni.
> 
> Fixes:
> 
>   $ /usr/lib/qt/examples/webengine/minimal/minimal
>   Illegal instruction
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>   - Work-In-Progress patch to test the prinziple of chromium configuration
>     for the rpi zero case, do not apply. A real fix should set the
>     values in arm.gni determined from the buildroot configuration.

I was indeed going to ask: why do we care about the RPi Zero
specifically?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
