From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Feb 2021 21:44:41 +0100
Subject: [Buildroot] [PATCH] configs/avenger96_defconfig: add support
 for Arrow Avenger96 board
In-Reply-To: <87blcvy715.fsf@tarshish>
References: <20210207155534.7211-1-peter@korsgaard.com>
 <87h7mnyi4p.fsf@tarshish> <20210207165237.GP2384@scaer>
 <87eehryfr8.fsf@tarshish>
 <a86ec3d8-17d5-bd4d-d6e9-f0d29071eeb4@grinn-global.com>
 <87blcvy715.fsf@tarshish>
Message-ID: <20210207204441.GQ2384@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2021-02-07 22:09 +0200, Baruch Siach spake thusly:
> Hi Bartosz,
> 
> On Sun, Feb 07 2021, Bartosz Bilas wrote:
> > On 2/7/21 6:00 PM, Baruch Siach wrote:
> >> On Sun, Feb 07 2021, Yann E. MORIN wrote:
> >>> On 2021-02-07 18:09 +0200, Baruch Siach spake thusly:
> >>>> On Sun, Feb 07 2021, Peter Korsgaard wrote:
> >>>>> +  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
> >>>> Maybe warn that this overwrites data on the SD card.
> >>> As far as I could see, we don't do that in any of the 72 readme.txt we
> >>> already have...
> >> $ git grep WARNING -- board/
> >> ...
> >> board/chromebook/elm/readme.txt:WARNING: make sure there is nothing important on that card,
> >> board/chromebook/snow/readme.txt:WARNING: make sure there is nothing important on that card,
> >> board/engicam/geam6ul/readme.txt:*** WARNING! This will destroy all the card content. Use with care! ***
[--SNIP--]

OK, that's for sure not a small list, indeed...

I just had a look at a few readmes, and it seems my sampling was not
that fortunate:

    board/acmesystems/aria-g25/readme.txt
    board/acmesystems/arietta-g25/readme.txt
    board/amarula/vyasa/readme.txt
    board/asus/tinker/readme.txt
    board/csky/readme.txt
    board/orangepi/orangepi-plus/readme.txt
    board/raspberrypi/readme.txt
    board/warp7/readme.txt

And surely, we do not have that warning in all the readmes we have a
"sudo dd":

    $ git grep 'sudo dd ' |wc -l
    72

> > Is not that obvious that dd will overwrite the data? Imo it's superfluous
> > information at all.
> It might be obvious to you. Many newcomers don't know what dd is, or how
> filesystem works. A warning can't hurt.

I too believe that such a warning is superfluous. Working with things
like Buildroot really requires a bit of preliminary knowledge; we can't
take everyone by the hand and we should probably require quite some
prerequisites...

Yeah, the might sound haughty or elitist, but we have to draw the line
somewhere, and I believe usage of 'dd' and its consequences are below
that line...

Regards,
Yann E. MORIN.

> 
> baruch
> 
> -- 
>                                                      ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
