From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 25 Jan 2018 14:14:18 -0200 (BRST)
Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues
In-Reply-To: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
References: <CAPzckP5y+dLADBwJ-pY52v_oNMyfJfwf73tJk-EdDN5VqLQ6fg@mail.gmail.com>
Message-ID: <1601364457.72803.1516896858319.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Sjoerd Venema" <srg.venema@gmail.com>
> To: buildroot at busybox.net
> Sent: Thursday, January 25, 2018 12:47:09 PM
> Subject: [Buildroot] Migrated from 2017.08 to 2017.11, rfkill issues

> Hi,
> I just installed 2017.11 on a fresh machine and imported my config.
> In 2017.11 I had used the rfkill package, so I got a notification that this is
> now legacy, so I unchecked it in the "legacy" section. I noticed that it was
> now selected at the util-linux section.

> However, I get the following error, no matter if rfkill is selected or not:

> >>> host-util-linux 2.31 Building

It happens building the host package. The selection only affects the
target package.

[...]
> CC sys-utils/rfkill-rfkill.o
> CCLD setsid
> sys-utils/rfkill.c:67: error: ?RFKILL_TYPE_FM? undeclared here (not in a
> function)

RFKILL_TYPE_FM should be defined in /usr/include/linux/rfkill.h, which is
included by sys-utils/rfkill.c (line 26).

Please edit package/util-linux/util-linux.mk and add "--disable-rfkill"
to HOST_UTIL_LINUX_CONF_OPTS.

-- 
Carlos Santos (Casantos) - DATACOM, P&D
?The greatest triumph that modern PR can offer is the transcendent 
success of having your words and actions judged by your reputation, 
rather than the other way about.? ? Christopher Hitchens
