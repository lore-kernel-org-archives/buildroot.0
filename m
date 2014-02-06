From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Feb 2014 22:38:55 +0100
Subject: [Buildroot] [PATCH 1/2] package/ffmpeg2: new package
In-Reply-To: <dus7saxm8k.ln2@ID-313208.user.individual.net>
References: <cover.1390242867.git.yann.morin.1998@free.fr>
 <d4f3847e403c1e5c4e8733f75bbfccce6e0b4975.1390242867.git.yann.morin.1998@free.fr>
 <el80raxhff.ln2@ID-313208.user.individual.net>
 <20140120212701.GC3421@free.fr> <20140122223320.GD3592@free.fr>
 <8738kfd40w.fsf@dell.be.48ers.dk>
 <skn6raxead.ln2@ID-313208.user.individual.net>
 <dus7saxm8k.ln2@ID-313208.user.individual.net>
Message-ID: <20140206213855.GA16722@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-02-04 20:51 +0100, Bernd Kuhls spake thusly:
> xbmc devs are aiming to support ffmpeg 2.x after Gotham release, a repo 
> containing the necessary code is already present:
> http://forum.xbmc.org/showthread.php?tid=165707&pid=1618520#pid1618520
> 
> I am currently testing this code, first results look good. Because of this 
> I think buildroot does not need to stick to ffmpeg 1.x, it can go forward 
> to include ffmpeg 2.1.3 if other deps permit it.

For now, we do have a few packages that depend on ffmpeg:
  - vlc
  - opencv
  - freerdp
  - mediastreamer
  - mpd

I don't know the state of each package wrt ffmpeg2 compatibility. So I
would prefer to stay on the safe side, and ad dffmpeg2 as a separate
package for now.

Also, XBMC Gotham is not released yet, and from what I understood from
the above, it will still use ffmpeg1, and only the next release will
(maybe) be using ffmpeg2. We do not know how long it will take before
Gotham is released, and even less when the next release will come.

Since we already have an XBMC patch right now, and I'd like it to go in
sooner than later, we'll have to stick with ffmpeg1 for a while, I'm
afraid.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
