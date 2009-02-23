From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Mon, 23 Feb 2009 12:02:51 +0100
Subject: [Buildroot] Buildroot 2009.02 released
References: <87skmkf1s0.fsf@macbook.be.48ers.dk><49941678.4040902@cetrtapot.si>
	<87ocx7g731.fsf@macbook.be.48ers.dk><60A797DC812E4639BC2F3208D69F6547@aeglos><87ljs28chc.fsf@macbook.be.48ers.dk><02578E7FA1EB4C8380989D73D0C6C40C@aeglos><87bpsx8qk1.fsf@macbook.be.48ers.dk><1235208541.24843.26.camel@elrond.atmel.com>
	<877i3i7qhd.fsf@macbook.be.48ers.dk>
Message-ID: <008201c995a6$ebe7b330$a13118ac@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Peter Korsgaard" <jacmet@uclibc.org>
To: <ulf.samuelsson@atmel.com>
Cc: "Peter Korsgaard" <jacmet@uclibc.org>; <buildroot@uclibc.org>
Sent: Sunday, February 22, 2009 10:47 AM
Subject: Re: [Buildroot] Buildroot 2009.02 released


>>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
>
> Hi,
>
> >> Sure, like with all other issues - Add an issue to the tracker or
> >> mail the list, both preferably with a patch.
>
> Ulf> You REALLY dont get it , do you?
>
> No, I think it's pretty obvious that I don't follow you.
>
> Ulf> If you for once stopped seeing Buildroot as a hobby
> Ulf> and take the view of someone wanting to build
> Ulf> a root file system without digging deep into
> Ulf> the internals of Buildroot, then you would realize
> Ulf> that Bugzilla is NOT the way this shoudl be communicated.
>
> You seem to be mixing up developer/contributor communication such as
> mailing list/bugzilla and some kind of known issues list for a release
> (E.G. stuff that belongs in the release notes).
>

No, I am not mixing up things.
This thread is about how a release should look like.
You are mixing this up with how to ensure a package is working.

Bugzilla shows that a package is not working.
It does not show that a package is working.
The fact that you can build something on your machine
does not mean that it can build on other machines.

What you are doing is creating a *snaphot* without going through
a proper testing procedure, and the call it a release.


> Issues needs to be reported / patches sent to the developers if you
> want to get them solved - E.G. this is absolutely critical to improve
> BR quality.

Yes, but there is no documentation what works so you have no clue
what has been tested and what has not been tested.

>
> And sure, it could be that we decide to ship with known issues and
> those should get mentioned in the release notes, but most of all we
> try to fix all bugs we KNOW ABOUT.
>

> Ulf> Once it is discovered that there is a problem, there is no clean
> Ulf> way to inform the user that there is a problem with a certain
> Ulf> package so each new user will waste a lot of time trying
> Ulf> to build what is known to be broken.
>
> That's what releases are for - With a 3 month release cycle I don't
> see any real reason for casual / first time users to go to svn.

Undocumented releases are only a little better than svn

>
> >> Well, if you mail the list or add an issue, there is.
>
> Ulf> Not in a usable format.
>
> For the developers it is.

You are well aware that I am discussing non-developers.

>
> Ulf> There are dependencies on the host distribution.
> Ulf> I have seen that some packages sometimes use the host includes.
>
> Ulf> If the host includes do things in the same way as the buildroot
> Ulf> includes that should have been used, then the build can
> Ulf> complete, even though the package is inherently BROKEN.
>
> Ulf> If they are different, then the build breaks.
>
> Yes, bug reports and patches are welcome.
>
> >> >> Sure, but please be a bit more specific.
>
> Ulf> I think we should create a range of rootfs definitions
> Ulf> with reasonable combinations for testing purposes.
>
> Ulf> * Busybox only.
> Ulf> * A communications oriented (no graphics)
> Ulf>   Maybe an Internet Radio /Audio player
> Ulf> * DirectFB with a simple touch interface
> Ulf> * X-Windows
>
> Ulf> This should be tested on multiple distributions
> Ulf> (Ubuntu/Fedora/OpenSuSE etc.).
>
> Are you offering to do this? As always, talk is cheap and actions
> speak louder than words.

I have already created a framework for testing, and I have provided test 
results
for ARM on OpenSuSE 11.0. Is that loud enough for you?

I do not consider it to be complete and I do not plan to test on another 
host,
but I am prepared to extend or modify to meet other people requirements.
If people are encouraged to test vs a real framework, and to documents
the results, by making it easy to do so, then the other hosts/archs
will get documented.

You, on the other hands has always shown that you are against all attempts
to include selftesting functionality and are only talking about it, while
keeping on using the same old building defconfigs which does not
result in a comprehensive testreport.

>
> >> Heh, I would certainly prefer to spend our energy on actually
> >> fixing stuff than arguing about how to show what's
> >> broken. Everything broken is a bug, and bugs should get fixed.
>

I think we need to 
When you stop to resist adding selftest in the svn which can automatically
document whats broken and what is not, then
we can go on to the implementation stage.

> Ulf> That is because either you do not care about others
> Ulf> or you do not grip the situation.
>
> I don't see you helping people on the mailing list or fixing issues in
> the bugtracker, so don't give me that 'you don't care about others'.

Which of course does not mean that I am not fixing bugs.

>
> Ulf> Do you think that if buildroot was a commercial tool
> Ulf> that people would accept your opinion, or would they
> Ulf> go to someone more interested in their problems?
>
> People are free to go elsewhere (so are you), that's the basic concept
> of open source.
>
> Ulf> I want to spend my energy on making it easier for people
> Ulf> without too much knowledge to get an embedded linux system
> Ulf> running and telling people up front what works and does not work
> Ulf> is key to get acceptance.
>
> Ulf> Bugs needs to be fixed, as time permits,
> Ulf> but if that is the only support provided, then this
> Ulf> is no tool for anything but hobbyists like yourself.
>
> Hobbyist == care about quality? Yes, then I'm definately a hobbyist.

You have a very limited scope which drives the project towards
something that is useful for the initiated, but is hostile towards others
This results in something where the overall quality is poor
and your arrogance is not promising for the future.

Hobbyist can make important contributions, but noone can rely on
something which is driven by a hobbyist approach for a real project.

>
> >> Again, please use the bug tracker.
> >>
> >> I'm not against doing more structured build tests, and will look into
> >> getting buildbot running again with some sensible defconfigs soonish,
> >> but that shouldn't stop you or anyone else from reporting (and fixing)
> >> bugs.
>
> Ulf> It is not enough to report and fix bugs.
>
> No, that's why I'm doing releases - Nevertheless, fixing bugs is
> absolutely critical. Are you going to contribute or just continue
> to make noise on the list?

You are providing poorly tested SNAPSHOTS which you call a release.

As for contributing, I think that I both increase functionality, and fix 
bugs.
I am also the only one to provide test results.



>
> -- 
> Bye, Peter Korsgaard
>


Best Regards
Ulf Samuelsson
