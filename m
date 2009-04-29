From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 29 Apr 2009 11:58:27 -0300
Subject: [Buildroot] misc development news
In-Reply-To: <878wlkfp84.fsf@macbook.be.48ers.dk>
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
	<874ox99yko.fsf@macbook.be.48ers.dk>
	<d6cda7730903312147i41ec576ar62e97a3a18832d67@mail.gmail.com>
	<878wlkfp84.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730904290758r250060del52fa1fbafad25474@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

2009/4/28 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> Hi Thiago,
>
> Sorry for the slow response - I went on holiday before answering and
> then forgot about the mail ..

It's ok. I had hopes that you had thought that git was too much
trouble for what it's worth. Oh well. :(

>
> ?Thiago> This means that I currently have absolutely no idea how to
> ?Thiago> commit. ?Could you document this better or point us to a "Git
> ?Thiago> for idiots (with subversion background)"?
>
> Don't worry, it's not that hard ;)

I usually say that about C++ programming but somehow ppl usually don't
seem to fully agree :P

> For contributing you basically have 2 options: Either simply send
> patches to the list (see man git-format-patch and man git-send-email),
> or setup a public git tree (on uclibc.org, your own machine or one of
> the many git hosting sites like github, repo.or.cz, ..) and send a
> pull request to the list.

That's the part I would like to know more. How exactly do you setup
the git repository at uclibc.org?

> In fact I would like us to move to a workflow where all changes are
> first posted to the list before committing to the official tree,
> similar to how it's handled in the Linux kernel, U-Boot, ?..

I don't see that working. It does for the linux kernel because of the
size of it's contributor base, we are greatly under powered for this
scheme. Patches would just get a big backlog for you to handle and we
would be unable to help.
I think the current commit first review later works best in our case.
We don't quite have enough ppl reviewing changes and reverting a patch
has been uncommon, yet, it's not that hard when necessary.

Also, I don't really like the individual trees concept. If someone
breaks the avr32 build fixing the ppc, I only get to figure this out
possibly at release. Integration testing, which isn't really good
right now, will get worst IMHO.

> ?Thiago> About maintainers... I don't see any easy way to divide that
> ?Thiago> between the developers. Any suggestions?
>
> I agree that it isn't that clear cut, but I could certainly imagine
> maintainers for specific archs and groups of packages like the X
> stack, gtk, qt, java stuff and so on.

Perhaps this should be sorted out before using changing the repository.

> ?Thiago> We usually all touch the packages folder quite often,
> ?Thiago> subdividing that also doesn't seem good to me as we sure use
> ?Thiago> most of the same packages in our builds and would like to fix
> ?Thiago> stuff right away. ?Dividing by platforms still leaves a big
> ?Thiago> chunk out.
>
> We currently have more than 600 packages - I for sure only use a very
> limited subset on a regular basis.

True, but sometimes when there are trivial changes needed, having to
figure out what maintainer to bother or actually having to do more
than start vi, test then svn commit is a big step back.


> ?Thiago> On top of all that, there is the who problem. Concentrating
> ?Thiago> all pulls on you kind of defeats the purpose of us even
> ?Thiago> having commit access in the first place.
>
> The wonderful part of distributed version control is that you aren't
> blocked if I dissapear for a few days. The only "special" thing about
> my tree is that I do releases from it.

Not quite. Your tree would be the integration tree. Having a separate
tree for me is of little value as I don't create that big amount of
patches myself, but I do test others changes often since I do svn
updates often. With this setup I would have to monitor the mailling
list all the time for pulls. Likewise, my changes get less testing
untill you decide to merge.

> We had various problems in the past with the svn "ghetto" style of
> development where all developers could commit as they pleased with
> very little review. The git setup works for projects much larger than
> ours, so I think it's atleast worth a try.

I think the problem was with people management and how we did (or
actually didn't do) conflict solving. In the past we didn't have a
maintainer to help solving the conflicts.
We are not going to really solve it with a different tool.

Kind Regards,
    Thiago A. Correa
