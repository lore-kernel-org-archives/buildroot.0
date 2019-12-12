From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 12 Dec 2019 11:14:38 +0100
Subject: [Buildroot] [PATCH v4 00/13] use host-systemd to enable units
In-Reply-To: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
References: <20191212075400.1499536-1-jeremy.rosen@smile.fr>
Message-ID: <20191212111438.562923cb@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello J?r?my,

I have a very minor comment, no need to resend just for that: I'd like
the commit titles to be a bit nicer. See below for some suggestions.

On Thu, 12 Dec 2019 08:53:47 +0100
J?r?my Rosen <jeremy.rosen@smile.fr> wrote:

> J?r?my Rosen (13):
>   new recipe : host-systemd

Should be:

	package/systemd: add host variant

>   use host-systemctl preset all to enable units

	package/systemd: use host-systemctl preset-all to enable units

>   fix tty handling

	package/systemd: fix tty handling

>   fix trivial packages with buildroot-provided services

	package: rely on systemctl preset-all for buildroot-provided services

>   fix trivial cases, upstream-provided services

	package: rely on systemctl preset-all for upstream-provided services

>   package/connman: adapt to preset-all

	package/commman: adapt to systemctl preset-all

>   package/linuxptp adapt to preset-all
>   package/network-manager: adapt to preset-all
>   package/wpa_supplicant: adapt for preset-all

Ditto for those ones.

>   package/sysrepo: update to new systemd
>   package/syslog-ng: implement default using DefaultInstance
>   package/rauc: add a WantedBy section to the unit
>   package/alsa-utils: add a WantedBy section to the unit

In those last three ones, perhaps have "systemd" somewhere in the
commit title.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
