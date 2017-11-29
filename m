From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 29 Nov 2017 10:23:28 +0200
Subject: [Buildroot] [PATCH v5 1/3] board: Add Vyasa RK3288 board support
In-Reply-To: <20171129085334.074c7489@windsurf.home>
References: <1511893761-8292-1-git-send-email-jagan@amarulasolutions.com>
 <20171129064514.mc4iobd4roajjdtj@speedy.hunter>
 <CAMty3ZCb0upojszgdTBXtMHSG++z4bJDXvFvNFVzBorChNSoKQ@mail.gmail.com>
 <20171129085334.074c7489@windsurf.home>
Message-ID: <20171129082328.zptb4ai3i65sisgx@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 29, 2017 at 08:53:34AM +0100, Thomas Petazzoni wrote:
> On Wed, 29 Nov 2017 12:21:24 +0530, Jagan Teki wrote:
> 
> > > As Thomas mentioned in his review for v4, no way to use linux-next git tree.
> > > It is being rebased all the time. So changing commit ID is not going to help:
> > > it will be changed over and over again.  
> > 
> > Thomas never said to use the linux-next, but instead he mentioned to
> > not use the last sha1 which always changed during rebase. So the sha1
> > I have used here specific to this board which shouldn't change even
> > linux-next rebased.
> 
> What you're saying here doesn't make sense.
> 
> Either the commit you're referring to is part of Linus tree (and
> therefore is stable and will never change), but in this case, there is
> no reason to use linux-next at all.
> 
> Or the commit you're referring to is not part of Linus tree, but is
> really on top of it, part of linux-next, and in this case, the commit
> is not stable and it will disappear every day, as linux-next is rebased
> every day.

I seems that linux-next preserves older next-[date] tags. It currently goes 
back to next-20170831. The linux-next-history.git tree carries even older 
tags, back to next-20160118. So a specific commit in linux-next{-history} 
should not disappear overnight.

I do agree, though, that having a board/platform specific git tree, or a set 
of patches is easier to work with.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
