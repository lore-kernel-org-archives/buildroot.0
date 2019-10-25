From: Stephan Henningsen <stephan@asklandd.dk>
Date: Fri, 25 Oct 2019 21:20:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/sudo: removed template config,
 added convenient 'sudo' group config options.
In-Reply-To: <20191025101534.02ab29b1@windsurf.dhcp.lyon.intranet>
References: <20191023211439.7754-1-stephan+buildroot@asklandd.dk>
 <e97fd4a9-2d28-1d36-1ad3-9ae3c4486fd8@mind.be>
 <20191024101727.7af5db84@windsurf>
 <CAH0Z9QLCKhx0-hjFUDd3xhj_281dqd8Lo93+AuXGhUit4uwikw@mail.gmail.com>
 <bc9c5724-e7e5-5220-8d21-b95810ba52e1@mind.be>
 <20191025101534.02ab29b1@windsurf.dhcp.lyon.intranet>
Message-ID: <CAH0Z9QLda+fGsfD47Vp=tkMecWTX66g7ae=0cgeWVvJLHptPeQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

fre. 25. okt. 2019 10.15 skrev Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> On Fri, 25 Oct 2019 10:10:51 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> >  I agree with that. If there is a sudo group, the only reason to have it
> is to
> > make it sudo-able. In the unlikely case that it needs to be different,
> it can
> > still be overridden in overlay.
> >
> >  I believe our principle should be: allow any user customisation, but
> make sure
> > that the out-of-the-box experience is as smooth as possible.
> >
> >  Obviously the out-of-the-box experience will still not be completely
> smooth
> > since there is no user in the sudo group, but it is still better than
> not having
> > a sudoers entry at all.
> >
> >  So the only question is: should the addition of the sudo group be
> optional or
> > not? I see little reason to make it optional. Yes, it is yet another
> group, but
> > that just costs a few bytes in /etc/groups (which in practice doesn't
> cost
> > anything as long as the file stays under 4K).
>
> I'd say let's make it non-optional.
>

Me too. The two go hand in hand. I don't know why I made the separation to
begin with.

I'll return with at revised patch when I return from vacation and to a
computer.

-- 
Stephan

>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191025/97b4ce25/attachment.html>
