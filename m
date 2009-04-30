From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Apr 2009 15:50:31 +0200
Subject: [Buildroot] misc development news
In-Reply-To: <d6cda7730904290758r250060del52fa1fbafad25474@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 29 Apr 2009
	11\:58\:27 -0300")
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
	<874ox99yko.fsf@macbook.be.48ers.dk>
	<d6cda7730903312147i41ec576ar62e97a3a18832d67@mail.gmail.com>
	<878wlkfp84.fsf@macbook.be.48ers.dk>
	<d6cda7730904290758r250060del52fa1fbafad25474@mail.gmail.com>
Message-ID: <87tz469ro8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi,

 >> Sorry for the slow response - I went on holiday before answering
 >> and then forgot about the mail ..

 Thiago> It's ok. I had hopes that you had thought that git was too
 Thiago> much trouble for what it's worth. Oh well. :(

Heh ;)

Git is nice, trust me. It take a little while to get used to, but it
is very neat.

Notice that the git migration is uclibc wide
(E.G. uclibc/busybox/buildroot/uclibc++).

 >> Don't worry, it's not that hard ;)

 Thiago> I usually say that about C++ programming but somehow ppl
 Thiago> usually don't seem to fully agree :P

If you can comprehend C++ then git shouldn't be a problem either :P

 >> For contributing you basically have 2 options: Either simply send
 >> patches to the list (see man git-format-patch and man git-send-email),
 >> or setup a public git tree (on uclibc.org, your own machine or one of
 >> the many git hosting sites like github, repo.or.cz, ..) and send a
 >> pull request to the list.

 Thiago> That's the part I would like to know more. How exactly do you setup
 Thiago> the git repository at uclibc.org?

See my mail of last month:

http://lists.busybox.net/pipermail/buildroot/2009-March/026875.html

If you put git repos in your ~/git/ dir and make sure you have a
git-daemon-export-ok in them, then they can be accessed through git://
and cgit just like the "official" repos.

See the git documentation (http://git-scm.com/documentation) for info
about creating (cloning) repos.

 >> In fact I would like us to move to a workflow where all changes are
 >> first posted to the list before committing to the official tree,
 >> similar to how it's handled in the Linux kernel, U-Boot, ?..

 Thiago> I don't see that working. It does for the linux kernel
 Thiago> because of the size of it's contributor base, we are greatly
 Thiago> under powered for this scheme. Patches would just get a big
 Thiago> backlog for you to handle and we would be unable to help.  I
 Thiago> think the current commit first review later works best in our
 Thiago> case.  We don't quite have enough ppl reviewing changes and
 Thiago> reverting a patch has been uncommon, yet, it's not that hard
 Thiago> when necessary.

That's almost the situation today as well:

git shortlog -n -s --since='feb 12'
   333  jacmet
    15  correa
     8  tpetazzoni
     2  hamish
     2  wberrier
     1  austinf

In other words, 92% of all commits since the last release has gone
through me.

This doesn't mean that it has to be doing all the work. If you could
help review patches and ack/nack, and then send me a pull request of
everything you think is good then that would be a big help.

 Thiago> Also, I don't really like the individual trees concept. If
 Thiago> someone breaks the avr32 build fixing the ppc, I only get to
 Thiago> figure this out possibly at release. Integration testing,
 Thiago> which isn't really good right now, will get worst IMHO.

I'm certainly open to discuss the details - Do you have any suggestion
how we could do this better?

 >> I agree that it isn't that clear cut, but I could certainly imagine
 >> maintainers for specific archs and groups of packages like the X
 >> stack, gtk, qt, java stuff and so on.

 Thiago> Perhaps this should be sorted out before using changing the
 Thiago> repository.

Hard to do as this is done uclibc wise and has been pending for a long
time. There's imho no real problem with refining our work flow as we
go (we're entering release freeze this weekend anyway).

 >> We currently have more than 600 packages - I for sure only use a very
 >> limited subset on a regular basis.

 Thiago> True, but sometimes when there are trivial changes needed,
 Thiago> having to figure out what maintainer to bother or actually
 Thiago> having to do more than start vi, test then svn commit is a
 Thiago> big step back.

The fact that you can commit locally means that you can fix the
problem locally just as easily, it's just the path to the "official"
tree that takes a bit longer.

 >> ?Thiago> On top of all that, there is the who problem. Concentrating
 >> ?Thiago> all pulls on you kind of defeats the purpose of us even
 >> ?Thiago> having commit access in the first place.
 >> 
 >> The wonderful part of distributed version control is that you aren't
 >> blocked if I dissapear for a few days. The only "special" thing about
 >> my tree is that I do releases from it.

 Thiago> Not quite. Your tree would be the integration tree. Having a
 Thiago> separate tree for me is of little value as I don't create
 Thiago> that big amount of patches myself, but I do test others
 Thiago> changes often since I do svn updates often. With this setup I
 Thiago> would have to monitor the mailling list all the time for
 Thiago> pulls. Likewise, my changes get less testing untill you
 Thiago> decide to merge.

A seperate tree still means that you can easily test out changes
(yours or from someone else) before they get integrated into the
official tree.

 >> We had various problems in the past with the svn "ghetto" style of
 >> development where all developers could commit as they pleased with
 >> very little review. The git setup works for projects much larger than
 >> ours, so I think it's atleast worth a try.

 Thiago> I think the problem was with people management and how we did
 Thiago> (or actually didn't do) conflict solving. In the past we
 Thiago> didn't have a maintainer to help solving the conflicts.  We
 Thiago> are not going to really solve it with a different tool.

I partly agree. It's a combined people/technical problem.

-- 
Bye, Peter Korsgaard
