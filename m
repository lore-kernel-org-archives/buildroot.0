From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Jun 2013 18:46:48 +0200
Subject: [Buildroot] Changes in the Buildroot autobuilders
In-Reply-To: <20130618091639.4f82fa41@skate>
References: <20130616170305.GI3495@free.fr> <20130616191806.7b4a899a@skate>
 <20130616172508.GL3495@free.fr> <20130616200540.5a370504@skate>
 <20130617074535.GB16699@lukather> <20130617094958.33eaff88@skate>
 <CAEBucnCWYyj23_RyLtP3p-B6zmBYiYOA4LiODMEdxEr7x4D+xw@mail.gmail.com>
 <20130617175407.GA3202@free.fr> <51BFFC5D.4040600@mind.be>
 <20130618091639.4f82fa41@skate>
Message-ID: <20130618164648.GA3952@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-06-18 09:16 +0200, Thomas Petazzoni spake thusly:
> On Tue, 18 Jun 2013 08:21:17 +0200, Arnout Vandecappelle wrote:
> >   So I think a nice solution would be to add a script in support/scripts 
> > that explicitly encodes all the maintainers - maintainers can add 
> > themselves with patches (just like in the kernel). The a.b.o would fetch 
> > the script once a day just before sending out its daily mails, and call 
> > it with everything it knows about the build failure set in the environment.
> 
> This does sound like a nice idea, but I would like it to also handle
> architecture maintainers if possible.
> 
> So something like:
> 
> support/script/get_maintainer --arch arc --package tvheadend
> 
> would return:
> 
> Mischa Jonker <Mischa.Jonker@synopsys.com>
> 'Yann E. MORIN' <yann.morin.1998@free.fr>
> 
> the first being the architecture maintainer, the second being the
> package maintainer.

OK, I'll code this, then.

> But then, I would probably have to send one e-mail per failure, because
> grouping them would be hard since there may be another failure for
> tvheadend, but not on the ARC architecture.

Maybe you'd want to separate the mails:
  - one for packages
  - one for achitectures

> >   However, Spenser points out in another mail:
> > 
> > > I think many people would like to know if something they did may have
> > > triggered a bug, not just the maintainer of the package.
> > 
> >   I could agree with sending mails automatically to the authors of a 
> > package commit if the commit was done in the last week or so.
> 
> Hum, ok. Not impossible to do, for sure.

Yes, sounds like a good idea.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
