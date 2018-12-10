From: Marcin =?utf-8?Q?Niestr=C3=B3j?= <m.niestroj@grinn-global.com>
Date: Mon, 10 Dec 2018 12:12:28 +0100
Subject: [Buildroot] [PATCH] configs/chiliboard: remove explicit getty
 port
In-Reply-To: <875zw21kuu.fsf@dell.be.48ers.dk>
References: <20181121210142.21769-1-m.niestroj@grinn-global.com>
 <875zw21kuu.fsf@dell.be.48ers.dk>
Message-ID: <877eghd49v.fsf@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Peter Korsgaard <peter@korsgaard.com> writes:

>>>>>> "Marcin" == Marcin Niestroj <m.niestroj@grinn-global.com> writes:
>
>  > Using default value (console) works well, so there is no reason to set
>  > tty explicitly. Additionally after selecting newer kernels (tested
>  > with 4.19 and 4.20-rc3) ttyO0 no longer works due to missing device
>  > node.
>
> Do you know why this is so? Did ttyO0 get renamed?

I don't know what exactly has changed, as I have not investigated it
deeply. I think that CONFIG_SERIAL_8250_OMAP_TTYO_FIXUP changed the
behavior a little bit, so now there are only ttySx devices, with no
ttyOx anymore. Another possibility is that ttyO0 was created in older
kernel versions, because it was passed by u-boot directly as boot
argument to kernel.

>
> Committed, thanks.

Thanks!

--
Marcin Niestr?j
