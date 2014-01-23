From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Jan 2014 18:52:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <skn6raxead.ln2@ID-313208.user.individual.net>
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
 <8738kfd40w.fsf@dell.be.48ers.dk>
 <skn6raxead.ln2@ID-313208.user.individual.net>
Message-ID: <20140123175214.GA3446@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-01-23 06:58 +0100, Bernd Kuhls spake thusly:
> Peter Korsgaard <jacmet@uclibc.org> wrote in
> news:8738kfd40w.fsf at dell.be.48ers.dk: 
> 
> > If not, I would simply say that ffmpeg 2.x is the latest and greatest of
> > ffmpeg, so ffmpeg.mk should build 2.x (and we shouldn't have a
> > ffmpeg2.mk)
> 
> atm xbmc gotham is incompatible with ffmpeg 2.x, therefore I sent ffmpeg 
> 1.2.5 for inclusion in buildroot.

I've discussed with a guy that built XBMC Gotham (next release, from git
tree) with ffmpeg2. Here's what he said:
  - Gotham and ffmpeg 1.x      : builds and runs OK
  - Gotham and ffmpeg 2.0.x    : Builds and runs OK
  - Gotham and ffmpeg 2.1.{0,1}: builds OK, fails at runtime (broken VDPAU)
  - Gotham and ffpmeg 2.1.{2,3}: builds and runs OK
  - Gotham and ffmpeg master   : builds and runs OK

He also pointed me to this bug report:
    https://trac.ffmpeg.org/ticket/3133
and this comment stating it's been fixed:
    https://trac.ffmpeg.org/ticket/3133#comment:81

Since we're adding ffmpeg 2.1.3, we should be able to build Gotham with
our ffmpeg2 version.

Do you know of another reason why Gotham can't build with latest ffmpeg2
(that is, ffmpeg 2.1.3 or ffmpeg master)?

But even then, I'd favour keeping ffmpeg as 1.x, and add ffmpeg 2.x as
ffmpeg2. Unles Peter has a stong opinion against.

> @Yann: Does omxplayer also work with ffmpeg 1.2.5?

As I briefly answered this morning, no, they do require ffmpeg 2.1+.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
