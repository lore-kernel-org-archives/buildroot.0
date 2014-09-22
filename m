From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 13:34:32 +0200
Subject: [Buildroot] Buidroot zic command
In-Reply-To: <CAK6UBYnckKz+jEULybXADyGk-C+xL6-mEFNEOXqsvfYfz+YcyQ@mail.gmail.com>
References: <CAK6UBYnckKz+jEULybXADyGk-C+xL6-mEFNEOXqsvfYfz+YcyQ@mail.gmail.com>
Message-ID: <CAHXCMML5tqfMj2UM4bFBNaX2j4RxyYFdC6qawVbAPbX7Yx5HYA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Please put Buildroot mailling in cc, since some people may wonder the
same thing, and others will be able to help.

On Mon, Sep 22, 2014 at 12:25 PM, Idoia Mazkiaran Zelaia
<idoia.mazkiaran@gmail.com> wrote:
> Hello Samuel,
> I would like to know how can we have the zic command in Buildroot rootfs
> when the toolchain is external and for instance it is not a libc compiler.
>
> Because we have already choosen in Buildroot 2014.08 Install time zone info,
> but here comes only the zone information in /usr/share/zoneinfo but not the
> zic command to create our own zone in execution time.
>

The zic program is a host program that is installed in
<output>/host/usr/bin/zic.
It belongs to the zip package (that is part of the Buildroot 2014.08
release) which is automatically selected when you select tzdata or
tzdump.

There is currently no rule to build and install the zic package for the target.

If you need it in the target rootfs, you can add the commands to build
and install the the package for the target.
If you do so, don't forget to post your patch to the mailling-list
[1], so the whole Buildroot community will benefit from your changes.
;-)

> Thanks a lot,
> Best Regards,
>
> Idoia Mazkiaran.

Regards,

-- 
Samuel
