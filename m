From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Nov 2014 16:37:52 +0100
Subject: [Buildroot] [PATCH v3 0/3] Improve silent builds
In-Reply-To: <20141106185330.659d572f@free-electrons.com>
References: <1415265217-18494-1-git-send-email-fabio.porcedda@gmail.com>
 <20141106182725.450971c9@free-electrons.com>
 <CAHkwnC-Ds16rDgPAASzLof_xcGgvde_Pni9Vc8Am45gnNT5_PA@mail.gmail.com>
 <20141106185330.659d572f@free-electrons.com>
Message-ID: <20141111153752.GI4240@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fabio, All,

On 2014-11-06 18:53 +0100, Thomas Petazzoni spake thusly:
> On Thu, 6 Nov 2014 18:35:32 +0100, Fabio Porcedda wrote:
> 
> > > When I look at patches 2 and 3, I must say I dislike the fact that in
> > > one case (svn), silencing is handled in pkg-download.mk when defining
> > > the SVN variable, while in the other case (git), it's handled in the
> > > git-specific helper script.
> > 
> > I would like to do the same for git but it does not work because:
> >   git -q clone <url>
> > does not work, but
> >   git  clone -q <url>
> > works, so adding the "-q" in the script is the only option.
> > 
> > Do you have any better idea?
> 
> Yes: handle the svn case in the download helper as well. This way,
> we're consistent between svn and git. And maybe wget should be handled
> this way as well.
> 
> Yann can comment on this on whether my proposal is fine for him.

Sorry for the delay, still dequeuing my mails from last week...

I agree with Thomas proposal: move everything into the helper scripts.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
