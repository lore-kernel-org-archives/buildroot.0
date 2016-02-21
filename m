From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 21 Feb 2016 13:43:05 +0100
Subject: [Buildroot] [PATCH 13/14] package/jack2: add optional support
 for opus
In-Reply-To: <e5iopcx3h.ln2@ID-313208.user.individual.net>
References: <1456048218-4061-1-git-send-email-bernd.kuhls@t-online.de>
 <1456048218-4061-13-git-send-email-bernd.kuhls@t-online.de>
 <56C996A2.2080108@mind.be>
 <e5iopcx3h.ln2@ID-313208.user.individual.net>
Message-ID: <20160221124305.GA3456@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, Arnout, All,

On 2016-02-21 12:03 +0100, Bernd Kuhls spake thusly:
> Am Sun, 21 Feb 2016 11:51:14 +0100 schrieb Arnout Vandecappelle:
> >  Note that it also seems to have an optional dependency on celt051,
> >  dbus,
> > libsndfile, libsamplerate (based on looking at the wscripts).
> 
> Quoting https://git.busybox.net/buildroot/tree/package/jack2/jack2.mk#n10
> "JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib host-python"
> 
> I tried to compile celt051 with jack2 but somehow celt051 was not 
> detected by jack2.

See my previous patch on the topic:

    https://patchwork.ozlabs.org/patch/561388/

There's a comment explaining the part about celt.

Regards,
Yann E. MORIN.

> >  Which makes me wonder: how did you find these optional dependencies? I
> >  assumed
> > that you had built an allyesconfig, then deleted output/build, then
> > built again,
> > and then did a readelf. But in that case, you should have caught these
> > other dependencies.
> 
> I built an allyesconfig, but the dependency check was done by the fli4l
> [1] build system. Fli4l uses buildroot to compile its binaries but it 
> extends buildroot by a sandbox mechanism. Before installing binaries to 
> staging and target dirs all packages are installed into a package-
> specific sandbox directory first, in this directory all linked libraries 
> of the package binaries are detected and checked whether they are part of 
> <pkg>_DEPENDENCIES, if not, the build fails.
> 
> The list of packages I talked about[2] was gathered that way, so there is 
> no guarantee I caught all dependencies, the same is true for the method 
> you described. Thats the reason I did not bother much about the missing 
> celt051 detection by jack2.
> 
> Btw, fli4l uses the top-level parallel make option ;)
> 
> Regards, Bernd
> 
> [1] http://www.fli4l.de/en/home/whats-that-fli4l/
> [2] http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/139935
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
