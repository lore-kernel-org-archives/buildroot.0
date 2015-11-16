From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Nov 2015 20:07:24 +0200
Subject: [Buildroot] [PATCH] hidapi: new package
In-Reply-To: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1447692852-21669-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20151116180724.GK9908@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vincent,

On Mon, Nov 16, 2015 at 04:54:12PM +0000, Vicente Olivert Riera wrote:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

[...]

> +HIDAPI_DEPENDENCIES = libusb
> +# When eudev is used as the udev provider, libgudev is automatically
> +# provided as it is part of eudev. However, when systemd is used as the
> +# udev provider, libgudev is not provided, and needs to be built
> +# separately. This is why we select the libgudev package only if systemd
> +# is used.
> +ifeq ($(BR2_PACKAGE_SYSTEMD),y)

Should be 'ifeq ($(BR2_PACKAGE_LIBGUDEV),y)', in think, since all we need is 
to have libgudev built before this package, regardless of systemd. With this 
change the comment becomes redundant. The comment in Config.in should be 
enough.

> +HIDAPI_DEPENDENCIES += libgudev
> +endif

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
