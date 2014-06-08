From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jun 2014 21:04:01 +0200
Subject: [Buildroot] [PATCH 1/1] Option to copy Linaro gconv libs to
 target
In-Reply-To: <CAGduivyc7DUBHJcUHac=4Vu4r_erMo1rCarrjho6v0u9HOXb7A@mail.gmail.com>
References: <1383428236-3842-1-git-send-email-svlasic@gmail.com>
 <20140608172310.GO3266@free.fr>
 <CADYw_J+TWZWFa6vA=arnLymR46xwXpT56qOu9vQig2mar1v0rg@mail.gmail.com>
 <CAGduivyc7DUBHJcUHac=4Vu4r_erMo1rCarrjho6v0u9HOXb7A@mail.gmail.com>
Message-ID: <20140608190401.GP3266@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, Stanislav, All,

On 2014-06-08 20:53 +0200, Maxime Hadjinlian spake thusly:
> On Sun, Jun 8, 2014 at 8:18 PM, Stanislav Vlasic <svlasic@gmail.com> wrote:
> > Hi Yann, all,
> >
> > if GCONV_PATH is not exported, xbmc doesn't see it and decoding subtitles or
> > whatever which have special characters (eg cp1250) fails. Also, w/o gconv
> > libs XBMC 13.0+ doesn't draw menus etc. I exported GCONV_PATH in xbmc
> > startup script, but I guess exporting it in profile would also work.
> >
> Just a quick question, where did you export theses libraries ?
> As Yann stated, we did not need to export this variable to make it
> work for XBMC.
> And I can assure you that it's nowhere in my env.

I think the problem Stanislav had is that he is using a Linaro
toolchain, which puts the gconv module in /usr/lib/arm-linux-gnueabihf
and so expects them in that location at runtime.

But since Buildroot does not follow the multi-arch convention (and
rightfully, IMHO), it does not work for Stanislav.

I'm not very happy with the exporting of GCONV_PATH as-is. I'd prefer we
find another solution. I'll look into that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
