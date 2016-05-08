From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 May 2016 09:38:00 +0200
Subject: [Buildroot] [PATCH 1/1] kodi: Enable raspberry-pi2 build support
In-Reply-To: <572081A8.7060506@beneth.fr>
References: <1461702074-14376-1-git-send-email-bmauduit@beneth.fr>
 <20160426223256.0798005b@free-electrons.com>
 <8415vcxn9i.ln2@ID-313208.user.individual.net>
 <572081A8.7060506@beneth.fr>
Message-ID: <20160508073800.GB24011@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Beno?t, All,

On 2016-04-27 11:08 +0200, Beno?t Mauduit spake thusly:
> On 04/26/2016 10:54 PM, Bernd Kuhls wrote:
> > Am Tue, 26 Apr 2016 22:32:56 +0200 schrieb Thomas Petazzoni:
> > 
> >> Hello,
> >>
> >> On Tue, 26 Apr 2016 22:21:14 +0200, Beno?t Mauduit wrote:
> >>> The previous commit [ef37472b20894c99cad758397f3cd6b90f933df1] was
> >>> based on a newer version of Kodi :
> >>> "with-platform=raspberry-pi2" is not yet supported in Kodi "Jarvis" 
> > branch.
> >>>
> >>> Backport 2 patches from Kodi master branch into this one.
> >>>
> >>> Signed-off-by: Beno?t Mauduit <bmauduit@beneth.fr>
> >>
> >> Thanks. I do remember seeing a report (on IRC ?) that commit
> >> ef37472b20894c99cad758397f3cd6b90f933df1 was indeed causing some
> >> problems.
> >>
> >> Yann, Bernd, can you review/ack this patch from Beno?t?
> > 
> > Hi Thomas,
> > 
> > reviewing it will be difficult for me because I can not do a runtime test 
> > because I do not have access to RPI hardware.
> > 
> > Currently I am preparing a patch series for the 17.0-Krypton version 
> > bump, I think I will send the first part of it to my github account in 
> > the coming days after some of my PR for the Kodi project are completed.
> > 
> > Backporting feature patches is, afair, something you do not really like ;)
> > As always, as a normal Kodi user, I do not know any release dates but 
> > 17.0-Krypton did not even reach alpha1 yet so expect several months until 
> > the next version is released. Maybe we should wait for it nonetheless?
> 
> Sorry to ask this, but do you have an explanation about not taking
> upstream patches ? It is not obvious for me.

It's not upstream patch we do not like. What we do not like are feature
patches. We try to limit the number of patches we have against packages,
so we limit ourselves to bug-fix patches.

> Also, I began to implement this fix on my own, and after seeing that
> master branch have implemented this, I thought that it would better to
> backport it. (Plus some addition from my side, that I will try to report
> upstream).

Yes, backporting upstream changes is preferred instead of rolling your
own (unless the backport is not technically possible, of course).

Also, your 'additions' no longer make those patches simple upstream
backports. If they are really needed, then the upstream backports should
be in their own patches, with your additions in separate patches (note
that this might be the case, I haven't looked at the patches).

But since those are feature patches, this discussion is moot anyway...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
