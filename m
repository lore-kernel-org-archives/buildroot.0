From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 20 May 2020 19:09:57 +0200
Subject: [Buildroot] Console warning using the package aircrack-ng
In-Reply-To: <CALtfCQYSupq9++U=Ua74Y3aT5Z7pxzHcEmERW-D-je3ZPGZG3w@mail.gmail.com>
References: <CALtfCQYSupq9++U=Ua74Y3aT5Z7pxzHcEmERW-D-je3ZPGZG3w@mail.gmail.com>
Message-ID: <20200520190957.115bcdfb@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Oscar,

On Wed, 20 May 2020 18:18:43 +0200, Oscar Gomez Fuente <oscargomezf@gmail.com> wrote:

> Hi everyone,
>
>
> I am using a raspberry pi 3B with an usb WiFi dongle with the chipset rtl8192c.
>
> I have buildroot 2020.02 with the package aircrack-ng (ver1.6). I am
> using the USB dongle in monitor mode. When I execute this command:
>
> # /usr/sbin/airodump-ng wlan0mon --output-format csv --write /tmp/wifi_results
>
> I've got this warning:
>
> Warning: Detected you are using a non-UNICODE terminal character encoding.
>
> And it seems to be that airodump-ng doesn't work properly.
>
> Does anyone know how to fix this warning?

Run your command with:

	LANG=en_US.utf8 /usr/sbin/airodump-ng wlan0mon ...

in case en_US.utf8 is enabled in your buildroot config, otherwise rebuild with:

	BR2_GENERATE_LOCALE="en_US"

Regards,
Peter

>
>
> Oscar Gomez Fuente
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
