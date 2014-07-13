From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Jul 2014 16:56:23 +0200
Subject: [Buildroot] Open bug overview: help wanted!
In-Reply-To: <20140713082927.328541e9@core2quad.morethan.org>
References: <CAAXf6LU8ZkC4uk5qkq8HGN-zfL=MwAKJP4E=1sDNRDMSJwUutw@mail.gmail.com>
 <20140712215353.GD3582@free.fr>
 <20140712205430.1abdf0bf@core2quad.morethan.org>
 <20140713090535.GC3588@free.fr>
 <20140713082927.328541e9@core2quad.morethan.org>
Message-ID: <20140713145623.GE3588@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Mike, All,

On 2014-07-13 08:29 -0500, Mike Zick spake thusly:
> On Sun, 13 Jul 2014 11:05:35 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> > On 2014-07-12 20:54 -0500, Mike Zick spake thusly:
> > > Some members here in the past have expressed interest in supporting
> > > after-market firmware creation for consumer devices.
> > 
> > And I am completely OK with that. What I'm arguing about is whether we
> > want to support running a Buildroot system out-side of / , ie. when
> > the root of the generated filesystem is not the root at runtime.
> > 
> > What I'm saying is that, if one wants to run the Buildroot generated
> > system as a complement to an existing system, that should be done by
> > chrooting into the Buildroot system, so that / is seen as / .
> >
> 
> Well, in this application of after-market support (the Amazon Kindle)
> that is how we run Debian on the grayscale e-books.
> In fact, have been doing that for about 4 years now. ;)
> http://www.mobileread.com/forums/showthread.php?t=96048

Everything I could see in that post actually uses a chroot, and is not
running the Debian stuff from outside the chroot.

> But a chroot (by design) does place significant limits on what parts
> of the existing system outside of the chroot can be used/accessed.

Well, the post you pointed to has explicit explanations on how to do
that for the kindle. It points to:
    http://wiki.mobileread.com/wiki/Debi...n_Kindle_Touch

which contains:
    In case you want to have access to userstore from debian execute
    before chrooting:
    mount -o bind /mnt/us /mnt/debian/mnt/us

[--SNIP--]
> And, in fact, I found that I don't need to use it.
> Going down that usage path lead to too many complications.  ;)

Yes, I can imagine that. Programs that expects things (e.g.) in /etc
will be very unpleased when that stuff is in fact in /somewhere-else/etc.

So, what about the bug report? Should we close it?

[--SNIP--]
> > But OK, either we make it work (without adding too much complexity),
> > or we document it as a limitation.
> 
> I don't think it is a major limitation to the Buildroot user community.

I tried to add the script approach, but I bailed out after I banged my
head for two hours.

> A mention in the options help text, a mention in the manual and an
> addition to the known bugs list should be enough until someone really 
> needs it fixed.

Yep, that's the way I've gone with. If the maintainers don;t agree, then
someone will need to do the job. I tried, I failed. :-(

> I would be all right with just mentioning that the ld.so token "$ORIGIN"
> can not be included in the custom link options field.

I have been a bit more conservative in my change, in that I document
that as soon as there is a $ sign, expansion of the variable is
unpredictable, so it is not supported.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
