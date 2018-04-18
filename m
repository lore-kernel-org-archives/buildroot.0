From: Carlos Santos <casantos@datacom.ind.br>
Date: Wed, 18 Apr 2018 11:33:42 -0300 (BRT)
Subject: [Buildroot] modem-manager: build issue
In-Reply-To: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
References: <CAGm1_kusSpWv2dmQyzerpouB+LUvf84jZAi6rBMyZdieUUosow@mail.gmail.com>
Message-ID: <1730967127.450971.1524062022318.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Yegor Yefremov" <yegorslists@googlemail.com>
> To: "buildroot" <buildroot@buildroot.org>
> Cc: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>, "Carlos Santos" <casantos@datacom.ind.br>, "Aleksander
> Morgado" <aleksander@aleksander.es>
> Sent: Wednesday, April 18, 2018 9:32:06 AM
> Subject: modem-manager: build issue

> Current mm 1.6.12 produces following errors both when compiling an ARM
> or MIPS target:
> 
>  CC       ModemManager-mm-base-modem.o
> mm-base-manager.c: In function ?handle_set_logging?:
> mm-base-manager.c:680:15: error: assignment from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>     ctx->self = g_object_ref (manager);
>               ^
> mm-base-manager.c: In function ?handle_scan_devices?:
> mm-base-manager.c:736:15: error: assignment from incompatible pointer
> type [-Werror=incompatible-pointer-types]
>     ctx->self = g_object_ref (manager);
>               ^
> mm-device.c: In function ?mm_device_get_plugin?:
> mm-device.c:628:12: error: return from incompatible pointer type
> [-Werror=incompatible-pointer-types]
>     return (self->priv->plugin ?
> 
> So far I've seen only one build failure in our autobuilders [0]. I can
> reproduce this error building mm 1.6.12 locally with my host GCC. But
> the master branch of mm compiles without any issue. We don't seem to
> be the only ones who is affected [1], [2].
> 
> Any ideas?
> 
> [0]
> http://autobuild.buildroot.net/results/5d9e299ff12726d07e8a584a213c1d2a2e419594/
> [1]
> https://fedorapeople.org/groups/risc-v/logs/ModemManager-1.6.12-3.fc28.src.rpm/build.log
> [2]
> https://www.linuxquestions.org/questions/slackware-14/slackware-from-scratch-and-x11-4175560702/page19.html
> 
> Yegor

I'm quite busy right now but will try to reproduce the error tonight.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
