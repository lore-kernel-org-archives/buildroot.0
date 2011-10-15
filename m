From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 15 Oct 2011 21:09:52 +0200
Subject: [Buildroot] [PATCH v5 3/3] New package: feh
In-Reply-To: <201110151224.54761.arnout@mind.be>
References: <1318584328-6080-1-git-send-email-yegorslists@googlemail.com>
 <1318584328-6080-4-git-send-email-yegorslists@googlemail.com>
 <201110151224.54761.arnout@mind.be>
Message-ID: <CAGm1_ksQbk3SdP0PuFJ5G0oeSqnL=iN4uZiCR84Yk=M7UoHNdA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Oct 15, 2011 at 12:24 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
> On Friday 14 October 2011 11:25:28, yegorslists at googlemail.com wrote:
>
>> +config BR2_PACKAGE_FEH
>
>> +???????bool "feh"
>
>> +???????depends on BR2_PACKAGE_XORG7
>
>> +???????select BR2_PACKAGE_XLIB_LIBXINERAMA
>
>> +???????select BR2_PACKAGE_XLIB_LIBXT
>
>> +???????select BR2_PACKAGE_IMLIB2_PNG
>
> I've asked this before so you probably already considered it: is the
>
> selection of PNG really necessary, or is it there to make sure there
>
> is at least one useful backend?

Please look at config.mk:

LDLIBS += -lm -lpng -lX11 -lImlib2 -lgiblib

so it is hard wired.

Perhaps we should also add JPEG as default. Because it is very popular
format, especially as wallpaper. What do you think about it?

Yegor
