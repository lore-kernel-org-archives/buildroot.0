From: Christian Stewart <christian@paral.in>
Date: Sat, 5 Sep 2020 13:06:59 -0700
Subject: [Buildroot] More maintainers
In-Reply-To: <87y2lohw2v.fsf@dell.be.48ers.dk>
References: <CAFSsvmqGG-KvDnquq5dmGDJkhwqdKaJe8ndpYpLK=dPfuSREYA@mail.gmail.com>
 <CA+h8R2qe_DvM2c2EvUraAWgP_84LaXN98TPi_cJjG6+wOHytQQ@mail.gmail.com>
 <CAJX3zAuYgzv6_d2Fb8wUrHwPnyg0FEmNSfkiJkQ=zyqEqXKcrA@mail.gmail.com>
 <20200903182409.6b337059@windsurf.home>
 <CA+TH9V=Czc80jT1jExNC+XUrqHz5mz+oFNvORcfjotCVXrO0KQ@mail.gmail.com>
 <87o8mlmoga.fsf@dell.be.48ers.dk>
 <CA+TH9VkA2ETrCvQF+mhb=PeKm8P=o2Jnesmooh4KCKSbzUcANQ@mail.gmail.com>
 <87blilmeo2.fsf@dell.be.48ers.dk>
 <CA+h8R2qYVjSwFZR0DcOpAdSY8nZKURLwW+a8tanxpEvDh__fSg@mail.gmail.com>
 <877dt8n2o7.fsf@dell.be.48ers.dk>
 <20200905185901.soojmefslfebjtty@falbala.internal.home.lespocky.de>
 <87y2lohw2v.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2onduUquzAT9qAnTKZ45pYKeQY+LDZWN99_G8dPTOo_DQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sat, Sep 5, 2020 at 12:18 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:
>
>  > Hei hei,
>  > On Sat, Sep 05, 2020 at 08:44:08AM +0200, Peter Korsgaard wrote:
>  >> But sure, we could do the basics, E.G. check-package and perhaps even
>  >> building a basic config. That could cover basic issues and would have
>  >> the advantage that the contributor gets fast feedback. It naturally also
>  >> means quite a bit more mails on the list (E.G. to send a reviewed-by or
>  >> any issues found).
>
>  > The number of mail could be kept low, if only problems or failures are
>  > sent by mail.  Reporting each success would be too much, wouldn't it?
>  > I think that's how most bots on the Linux kernel lists currently
>  > behave, screaming when things fail, but stay silent if everything is
>  > okay?
>
> Yes, that is certainly possible. This would mean that the bot would be
> used to give early feedback to contributors whenever a (style) mistake
> was made, rather than only when a maintainer would look at the patch and
> try to apply it - But it wouldn't really help getting patches applied
> faster.
>
> But even so it might be useful to do.

I'm working on this right now:

 - Submit PRs to a "experimental" branch
 - When auto-tests pass, merge.
 - Run runtime tests on actual hardware (odroid, etc)
 - If everything looks good, forward the patches to the list

Key goals here: upon submission to list, a series should have
automated Tested-by, and several Reviewed-by based on PR approvals (or
whatever). Then, the maintainers can waste less time catching small
mistakes (like the package not building against the default C library,
or not running correctly on a real device) and be more efficient about
crunching through the backlog, especially if you're prioritizing based
on Reviewed-by.

Best regards,
Christian Stewart
