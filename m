From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Dec 2015 19:02:01 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2015-12-07
In-Reply-To: <20151208073019.9BDA510542E@stock.ovh.net>
References: <20151208073019.9BDA510542E@stock.ovh.net>
Message-ID: <20151208180201.GP4188@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Thomas, All,

Here is a quick summarry of the most important failures, to help
concentrate on the patches already submitted to fix them...

On 2015-12-08 08:30 +0100, Thomas Petazzoni spake thusly:
> Build statistics for 2015-12-07
>                  libeet-1.7.10 | 16

Will be fixed when the EFL series by Romain is merged (libeet no longer
exists in recent EFL). I've done the review of the series, still a few
minor comments, but it is now in a vey good shape! :-)

>              lttng-tools-2.7.0 | 15

Supposedly fixed with the series from Samuel:
    https://patchwork.ozlabs.org/patch/551787/  (removes faulty patch)
    https://patchwork.ozlabs.org/patch/551789/  (static build failures)
    https://patchwork.ozlabs.org/patch/551790/  (ditto)
    https://patchwork.ozlabs.org/patch/551788/  (backport from upstream)

>                      crda-3.18 | 13

These are already fixed (or better, worked around in host-python-m2crypto).
A proper fix would be to kill the weirdness of the m2crypto buildsystem,
but that will have to be done upstream. Thomas already reported the
issue:
    https://gitlab.com/m2crypto/m2crypto/issues/89

(current master of m2crypto is still broken).

>                  libass-0.13.0 | 11

A patch has been proposed:
    https://patchwork.ozlabs.org/patch/553448/

>                 xfsprogs-4.3.0 | 11

A patch has been submitted:
    https://patchwork.ozlabs.org/patch/553503/

>                     gcr-3.18.0 | 8 

Already fixed.

>                  pixman-0.33.4 | 7 

A patch has been submitted:
    https://patchwork.ozlabs.org/patch/553414/

>                      flite-1.4 | 7 

Already fixed.

>             libsemanage-2.1.10 | 4 

Patches to bumpt ustr (the culprit) have been submited:
    http://patchwork.ozlabs.org/patch/547117/
    http://patchwork.ozlabs.org/patch/547118/

A patch to fix the issue with the current ustr version is also
available:
    https://patchwork.ozlabs.org/patch/552445/

>               alsa-utils-1.1.0 | 4 

Patch pending (to backport upstream changes):
    https://patchwork.ozlabs.org/patch/553430/

>                arptables-0.0.4 | 4 

Patch available, but not sure I understand it fully:
    https://patchwork.ozlabs.org/patch/551152/

>                   ffmpeg-2.8.3 | 4 

Issue seems to be that fontconfig is not found. Real issue if ffmpeg
doing complete crazy and stupid auto-detection code that fails miserably
on MIPS. Vicente has already submitted patches upstream, some of which
ahve already been applied (can we get a backport? ;-) ) and the others
still being under review (with positive feedback).

Vicente is handling this. :-)


I'll try to review (and possibly test) all those pending patches
tonight.


That's all for the 4-or-more build failures, but there is a long-trail
of other build failures, especially single-failure build issues.

Note that we still have build failures early in the alphabet, so it
could well hide other build failures in later packages. We won't see
those later build issues until we fix the early ones.

However, we're getting back into shape, with build sucesses now passing
over the build failures by a good margin. Let's continue the good job,
and try to reach the 10% mark from the good ol' days. Yes, we can! ;-)

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
