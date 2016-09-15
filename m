From: Sylvain LG <forum@sylvainlegourr.com>
Date: Thu, 15 Sep 2016 11:33:12 +0200
Subject: [Buildroot] systemd-timesyncd issue
Message-ID: <CAK9TtU2U4EsPGL2G48uLDDmuzDDXXnPMJy6iOE1=jCpJu0EjFA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I've got a problem with systemd-timesyncd.

The service is active:

# systemctl status systemd-timesyncd
> *?* systemd-timesyncd.service - Network Time Synchronization
>    Loaded: loaded (/usr/lib/systemd/system/systemd-timesyncd.service;
> enabled; vendor preset: enabled)
>    Active: *active (running)* since Thu 2016-02-11 16:28:04 UTC; 1h 4min
> ago
>      Docs: man:systemd-timesyncd.service(8)
>  Main PID: 257 (systemd-timesyn)
>    Status: "Idle."
>     Tasks: 2 (limit: 512)
>    CGroup: /system.slice/systemd-timesyncd.service
>            ??257 /lib/systemd/systemd-timesyncd


Here comes its configuration file:

> # more /etc/systemd/timesyncd.conf
> #  This file is part of systemd.
> #
> #  systemd is free software; you can redistribute it and/or modify it
> #  under the terms of the GNU Lesser General Public License as published by
> #  the Free Software Foundation; either version 2.1 of the License, or
> #  (at your option) any later version.
> #
> # Entries in this file show the compile time defaults.
> # You can change settings by editing this file.
> # Defaults can be restored by simply deleting this file.
> #
> # See timesyncd.conf(5) for details.
> [Time]
> NTP=time1.google.com time2.google.com time3.google.com time4.google.com
> FallbackNTP=time1.google.com time2.google.com time3.google.com
> time4.google.com


But synchronisation doesn't work (I tried with several different ntp
servers).

Command timedatectl returns:

> # timedatectl
>       Local time: Thu 2016-02-11 17:35:43 UTC
>   Universal time: Thu 2016-02-11 17:35:43 UTC
>         RTC time: Sat 2000-01-01 01:09:29
>        Time zone: Etc/UTC (UTC, +0000)
>  Network time on: yes
> NTP synchronized: no
>  RTC in local TZ: no


It should be : NTP enabled: yes

How can I fix this issue?

Thanks,


Sylvain
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160915/e8149c80/attachment.html>
