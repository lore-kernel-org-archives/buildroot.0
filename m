From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Nov 2020 10:04:46 +0100
Subject: [Buildroot] [PATCH 1/1] package/opencv: drop package
In-Reply-To: <20201018143200.1250673-1-fontaine.fabrice@gmail.com>
References: <20201018143200.1250673-1-fontaine.fabrice@gmail.com>
Message-ID: <20201101100446.52130bb6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 18 Oct 2020 16:32:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> opencv 2.x has seen no release since July 2018 and all buildroot
> packages are already compatible with opencv3 so drop it to ease the
> addition of opencv4 which is not fully backward compatible with opencv3
> as "a lot of C API from OpenCV 1.x has been removed.":
> https://opencv.org/opencv-4-0.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Thanks, I have applied this patch.

> +config BR2_PACKAGE_OPENCV
> +	bool "opencv package was removed"
> +	select BR2_LEGACY
> +	select BR2_PACKAGE_OPENCV3 if BR2_TOOLCHAIN_HAS_ATOMIC && \
> +		!BR2_STATIC_LIBS

I've just dropped this select. opencv3 is not really a drop-in
replacement for opencv, this it felt a bit "weird" to have this being
done automatically. Better have the user take care of this IMO.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
