From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 May 2018 17:06:21 +0200
Subject: [Buildroot] [PATCH] Makefile: check rootfs overlays with
 BR2_ROOTFS_MERGED_USR enabled
In-Reply-To: <87po2aupu4.fsf@dell.be.48ers.dk>
References: <20180503121958.9462-1-casantos@datacom.ind.br>
 <20180505100100.GA2481@scaer> <87po2aupu4.fsf@dell.be.48ers.dk>
Message-ID: <20180505150621.GB14524@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2018-05-05 16:41 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > Carlos, All,
>  > On 2018-05-03 09:19 -0300, Carlos Santos spake thusly:
>  >> Since commit 0db34529f48 we use rsync with the --keep-dirlinks option to
>  >> prevent overlays from accidentally overwriding /{usr,bin,sbin,lib} links
>  >> when BR2_ROOTFS_MERGED_USR option is enabled. Unfortunately this also
>  >> prevents replacing a symlink by a directory on purpose (e.g. /var/log,
>  >> to persist system logs).
> 
>  > In that case, I suggest your use a post-build script instead.
> 
>  > In facct, I think that any modifications that change the layout of the
>  > filesystem should be done as a post-build script rather than an overlay.
> 
> Why? Overlays is the the recommended way to add/override stuff, and the
> 'everything-you-put-in-the-overlay-will-override-the-buildroot-defaults'
> is a pretty nice and easy to understand behaviour.

Well, I disagree quite a bit: overlays are ugly and 99% of what users
do with an overlay can be done with a package (i.e. adding data blobs).
The remaining 1% can be done with a post-build script.

Besides, what you put in an overlay is never accoutnted for: no
graph-size, no legal-info, no nothing...

Repeat after me: overlays are ugly! ;-)

Two things that overlays are noce for:

  - provide /etc/-style config files to be written over the default ones,

  - provide test-data that is not supposed to go into production, and
    for which a package may be a bit overkill, and even then...

Otherwise, overlays are just a pita and, long term, are a liability...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
