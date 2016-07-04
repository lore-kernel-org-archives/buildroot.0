From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Mon, 4 Jul 2016 10:43:15 +0200
Subject: [Buildroot] [PATCH v6] package/python-pillow: new package
In-Reply-To: <XnsA63ACEA291BC5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <1467233456-17500-1-git-send-email-angelo.compagnucci@gmail.com>
 <XnsA63ACEA291BC5berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <CA+TH9VnhmDCyhW1jj_BjX0FjyXzzbiF6Ps0qPw+i9pPNZ8a4hQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

2016-07-03 20:18 GMT+02:00 Bernd Kuhls <bernd.kuhls@t-online.de>:
>
>
> Hi,
>
> my first try to get this package to work with Kodi failed due to segfaults I
> have yet to investigate. I am sending this mail to inform you about some
> other stuff I found out while working on the package.
>
> [posted and mailed]
>
>>  ...y-add-option-to-disable-platform-guessing.patch | 65
> ++++++++++++++++++++++
>
> You can remove this patch because python-pillow-3.3.0, released 2016-07-01
> includes it.
>
>> +PYTHON_PILLOW_VERSION = 3.2.0
>
> See above, please bump to 3.3.0.

Wonderful news!

>> +PYTHON_PILLOW_INSTALL_TARGET_CMDS = $(PYTHON_PILLOW_BUILD_CMDS) install
>
> With my setup I needed to remove this line, otherwise the files installed by
> this package would end up in $(HOST_DIR) instead of $(TARGET_DIR).

I'll give a look at this but I have used this package several times in
the past and never encountered such a problem. Probably something
related to the latests releases.

> While investigating the Kodi segfault I saw that they carry their own cross
> compile patch in
> https://github.com/xbmc/xbmc/tree/master/tools/depends/target/pythonmodule-
> pil
>
> Though aimed at pillow-3.0.0, it is possible to rebase the patch for 3.3.0,
> but I am lacking time atm to continue working on it.

I had a look at this patch but it implements in a cruder way what I've
done with the implementation of --disable-platform-guessing
configuration switch.

>
> Regards, Bernd
>

Sincerely, Angelo
