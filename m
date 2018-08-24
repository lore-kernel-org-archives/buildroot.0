From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Aug 2018 23:39:18 +0200
Subject: [Buildroot] [PATCH v2 2/2] sunxi-mali-mainline-driver: bump
 version and add support for building on arm64(aarch64).
In-Reply-To: <8c7dfd8b-3e32-79c6-2d04-26435b710df4@micronovasrl.com>
References: <20180822000648.23314-1-giulio.benetti@micronovasrl.com>
 <20180822000648.23314-3-giulio.benetti@micronovasrl.com>
 <20180822132959.39640475@windsurf>
 <58c7d88b-dc45-5426-a328-89a58dc005b2@micronovasrl.com>
 <20180822212633.0a8a625e@windsurf>
 <ac85c090-d43d-8415-5333-f8daf24e70a1@micronovasrl.com>
 <20180824211404.GR9365@scaer>
 <8c7dfd8b-3e32-79c6-2d04-26435b710df4@micronovasrl.com>
Message-ID: <20180824213918.GV9365@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2018-08-24 23:28 +0200, Giulio Benetti spake thusly:
> Il 24/08/2018 23:14, Yann E. MORIN ha scritto:
> >On 2018-08-24 21:10 +0200, Giulio Benetti spake thusly:
> >[--SNIP--]
> >>I'm getting problems with whitespaces in pdf filename.
> >>I couldn't find in Buildroot Documentation if it's allowed or not having
> >>filenames containing spaces.
> >>I've tried using:
> >>'EULA for Mali 400MP _AW.pdf'
> >>"EULA for Mali 400MP _AW.pdf"
> >>etc.
> >>but with no luck.
> >Could you please also try with a \-escape:
> >     SUNXI_MALI_MAINLINE_LICENSE_FILES = EULA\ for\ Mali\ 400MP\ _AW.pdf
[--SNIP--]
> Just tried with both \ and \\ but nothing to do, it doesn't work.
> It always tries to find 'EULA' or 'EULA\'

Damn... Yeah, I now had a look at the code, and it indeed can not work.
I had hoped ot was a shell command that would do the splitting, but no;
it is done by a make foreach loop, so we're doomed...

> So do I proceed with renaming on POST_PATCH_HOOKS?

Yes, please.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
