From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 6 Mar 2015 12:35:18 +0100
Subject: [Buildroot] [PATCH 2/2] samba4: bump to version 4.2.0
In-Reply-To: <54F98235.7030509@zacarias.com.ar>
References: <1425588249-20942-1-git-send-email-gustavo@zacarias.com.ar>
 <1425588249-20942-2-git-send-email-gustavo@zacarias.com.ar>
 <20150305232946.3620697e@free-electrons.com>
 <54F8F0AC.8030707@zacarias.com.ar>
 <20150306094008.7baf8c91@free-electrons.com>
 <54F96D83.4010304@zacarias.com.ar>
 <20150306102632.20dff6f7@free-electrons.com>
 <54F974C3.2020509@zacarias.com.ar>
 <20150306104010.76c71f6b@free-electrons.com>
 <54F98235.7030509@zacarias.com.ar>
Message-ID: <20150306123518.7a76d66c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 06 Mar 2015 07:32:21 -0300, Gustavo Zacarias wrote:

> Well i'd say the same applies to trivial/redundant stuff, like "hey
> bump" + "hey hash" and you never complain with that aspect.

Yes, because as I said in my earlier e-mail, the "hey bump" and "hey
hash" parts are clearly separated in the patch, so having them mixed in
the same patch doesn't cause any readability issue.

> Style changes aren't usually very readable in diff format, so why not
> make it part of a major bump? You'll have to re-read the full package
> anyway for any QA you do.

Whether style changes are or are not very readable in diff format is
your vision, not mine. I do review style changes in diff format,
specifically because it allows me to visually check that only style
changes are made, and no functional changes are made.

So clearly, I want style changes separated from functional changes.

> > I don't quite understand your feeling here. What I'm asking you to do
> > is something we ask to *all* contributors, including newcomers who have
> > never contributed a single patch to Buildroot. Why would we have more
> > relaxed/special rules for long-term contributors like you ?
> 
> FYI that's a linux kernel rule, it's not how every project out there
> works. Life isn't just the linux kernel.

Absolutely. But it happens that we follow quite a few of the rules of
the Linux kernel: Signed-off-by, how patch series revisions are
handled, how the review process takes place, etc. And the "split
patches by logical changes" is not only a kernel rule, a lot of
projects want this as well.

> > If I was annoying you with something unusual, which I never bother
> > other people with, I would understand. But here I'm just asking a very
> > basic thing, which I also ask to every other contributor.
> 
> Sorry to nitpick here, but if we weren't changing little bits of style
> all the time then we'd have more time for really cool stuff, and that
> bothers me.

I agree that quite a number of changes are style changes. However, my
feeling is that such changes are 1/ trivial to review and apply when
cleanly separated from functional changes, and therefore don't consume
much time, and 2/ make the code base more homogeneous which is nice for
new comers.

> My feeling is that lately the patchflow is getting slower, and i'm not
> talking about my patches, those usually get applied quickly because
> they're, bluntly speaking, stupid patches.
> And they're stupid because i don't feel any support/interest/whatever in
> putting any serious effort in doing anything cool, because i feel
> intertia in getting real advancement in some areas.

There is some inertia, but this inertia is mainly due to the lack of
review and testing of the patches from other core developers. Yann is
doing a lot of this, Vicente is also doing some work in this area,
Romain has recently joined.

But for example, you almost never ever give a Reviewed-by or a
Tested-by tag on a patch submitted by another developer. Whenever there
is a patch touching a package you typically take care of (Samba, Squid,
etc.) submitted by another developer, I have to ping you to get your
feedback/input on the patch.

So if you feel there is inertia on a given topic, just help the topic
make progress by reviewing the patches, saying you tested the series,
etc. When a core developer like you gives his positive feedback on a
given patch, for me (and I believe for Peter as well) it's a very
strong sign that the patch is good to apply. I never build test your
patches because I fully trust you. You can use this trust to help other
patches go in.

> When you ask "why would we have more relaxed/special rules for long-term
> contributors like you?" it sounds very detached to me - kind of saying
> contributors don't matter.

Contributors don't matter?

Do you realize that since a few months, I've basically stopped doing
any development of Buildroot on the topics I'm interested in, and
switched to spending all my available time to review, test and merge
the patches submitted by all the contributors? I'm spending all my
evenings and week-ends shrinking the patchwork backlog so that
patches sent by contributors get merged at some point.

All what I was saying is that I ask new comers to split their patches
in logical changes, as a quality rule like we have many others. And I
don't see why this quality rule wouldn't apply to a long-term
trusted core developer such as you.

> It doesn't mean you should have special rules, but bringing it up that
> way isn't nice IMO.

I'm sorry if you felt it wasn't nice, it really wasn't the intention.

> And, for me personally, it just makes me

Seems like there's a missing part here :-)

> So, one time offer with no strings attached: if you don't want me around
> just tell me, i think we are all adults and i'll just move to doing
> something elsewhere with my free time where i feel more welcome/appreciated.

One time offer rejected.

I definitely want you part of the Buildroot core developers. You're
doing an invaluable work taking care of many complex packages, doing a
lot of very useful work looking at security issues and making the
corresponding package updates.

I think we should really meet once in person one day so you can feel how
much I value the contributions done by all developers, and especially
yours.

Back on the Samba 4.2, my point is really only: "hey this patch is OK,
I would just like it to be split a bit differently". I don't really
understand why such a stupid/silly request generates such a huge amount
of discussion.

> It means that i'm not angry/mad at every comment you make in case you
> got that impression.

Ok. Glad to hear that :-)

> > Anyway, I'll take care of doing the split of the Samba 4.2 patch and
> > I'll apply. I would have expected a bit more help and understanding from
> > a long term contributor such as you.
> 
> Same goes both ways FYI (understanding).

I'm not sure what I should understand? That because you are a long-term
contributor, you have the right to do patches that don't comply with
the quality rules we request all other contributors to comply with?

Sorry, but that doesn't work for me.

Do you remember that I already yelled at Peter because he wasn't
posting to the list his patches before committing them ? So clearly,
this is nothing personal with you, you see ?

> I was going to say i'll do it myself because of a borderline failure
> that needs fixing that my autobuilder caught, but you already did it so
> i'll send a followup patch to fix that.

Sure, seen the ncurses fix. I'll apply.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
