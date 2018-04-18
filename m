From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Apr 2018 15:30:28 +0200
Subject: [Buildroot] modem-manager: build issue
In-Reply-To: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
References: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
Message-ID: <20180418153028.6ecd00e6@windsurf.numericable.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Apr 2018 14:32:06 +0200, Yegor Yefremov wrote:
> Current mm 1.6.12 produces following errors both when compiling an ARM
> or MIPS target:
> 
>   CC       ModemManager-mm-base-modem.o
> mm-base-manager.c: In function ?handle_set_logging?:
> mm-base-manager.c:680:15: error: assignment from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>      ctx->self = g_object_ref (manager);
>                ^
> mm-base-manager.c: In function ?handle_scan_devices?:
> mm-base-manager.c:736:15: error: assignment from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>      ctx->self = g_object_ref (manager);
>                ^
> mm-device.c: In function ?mm_device_get_plugin?:
> mm-device.c:628:12: error: return from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>      return (self->priv->plugin ?
> 
> So far I've seen only one build failure in our autobuilders [0]. I can
> reproduce this error building mm 1.6.12 locally with my host GCC. But
> the master branch of mm compiles without any issue. We don't seem to
> be the only ones who is affected [1], [2].
> 
> Any ideas?

Yes:
https://git.buildroot.org/buildroot/commit/?id=f9b6ec3b59746f3eddd387772ad60aa6bc52aa60

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
