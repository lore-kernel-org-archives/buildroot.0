From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 28 Apr 2009 23:22:19 +0200
Subject: [Buildroot] misc development news
In-Reply-To: <d6cda7730903312147i41ec576ar62e97a3a18832d67@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Wed\, 1 Apr 2009
	01\:47\:14 -0300")
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
	<874ox99yko.fsf@macbook.be.48ers.dk>
	<d6cda7730903312147i41ec576ar62e97a3a18832d67@mail.gmail.com>
Message-ID: <878wlkfp84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

Hi Thiago,

Sorry for the slow response - I went on holiday before answering and
then forgot about the mail ..

 >> I would like us to move to a setup similar to the kernel/uboot, where
 >> all changes get posted to the list before they get committed to the
 >> tree, and with package / sub-tree maintainers.
 >> 

 Thiago> This means that I currently have absolutely no idea how to
 Thiago> commit.  Could you document this better or point us to a "Git
 Thiago> for idiots (with subversion background)"?

Don't worry, it's not that hard ;)

The official documentation is quite good. Take a look at
http://git-scm.com/documentation and
http://git-scm.com/course/svn.html in particular.

For contributing you basically have 2 options: Either simply send
patches to the list (see man git-format-patch and man git-send-email),
or setup a public git tree (on uclibc.org, your own machine or one of
the many git hosting sites like github, repo.or.cz, ..) and send a
pull request to the list.

In fact I would like us to move to a workflow where all changes are
first posted to the list before committing to the official tree,
similar to how it's handled in the Linux kernel, U-Boot,  ..

 Thiago> About maintainers... I don't see any easy way to divide that
 Thiago> between the developers. Any suggestions?

I agree that it isn't that clear cut, but I could certainly imagine
maintainers for specific archs and groups of packages like the X
stack, gtk, qt, java stuff and so on.

 Thiago> We usually all touch the packages folder quite often,
 Thiago> subdividing that also doesn't seem good to me as we sure use
 Thiago> most of the same packages in our builds and would like to fix
 Thiago> stuff right away.  Dividing by platforms still leaves a big
 Thiago> chunk out.

We currently have more than 600 packages - I for sure only use a very
limited subset on a regular basis.

 Thiago> On top of all that, there is the who problem. Concentrating
 Thiago> all pulls on you kind of defeats the purpose of us even
 Thiago> having commit access in the first place.

The wonderful part of distributed version control is that you aren't
blocked if I dissapear for a few days. The only "special" thing about
my tree is that I do releases from it.

We had various problems in the past with the svn "ghetto" style of
development where all developers could commit as they pleased with
very little review. The git setup works for projects much larger than
ours, so I think it's atleast worth a try.

-- 
Bye, Peter Korsgaard
