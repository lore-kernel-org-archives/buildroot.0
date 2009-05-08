From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 08 May 2009 10:29:03 +0200
Subject: [Buildroot] [GIT PULL] avr32 updates
In-Reply-To: <d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
	("Thiago A. =?utf-8?Q?Corr=C3=AAa=22's?= message of "Fri\, 8 May 2009
	04\:59\:37 -0300")
References: <d6cda7730905072152p4cce227cx2919291711edaf4d@mail.gmail.com>
	<877i0scbjf.fsf@macbook.be.48ers.dk>
	<d6cda7730905080059o7fa58ba6w3bf66241b0c90bc2@mail.gmail.com>
Message-ID: <87hbzwatgw.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:

 >> - Please sign off on your fixes (git commit -s)

 Thiago> Can this be done easily after it has been commited? Since I had setup
 Thiago> my name and address, I had hopes that it would do it automagically.

You can rebase your commits and edit the descriptions - Something
like:

git rebase -i master (or the git rev you started from if you did it in
the same branch)
change all the lines to edit
run git commit -s --amend; git rebase --continue until you're done.

Normally you shouldn't rebase something that you have pushed, but OK
..

 >> - What do you mean with 'this fixes iptables compile'? What does the
 >> ?kernel has to do with iptables compilation?

 Thiago> Something is wrong in the kernel headers in previous versions.
 Thiago> Something in byteorder.h prevended it from building earlier.

But the Linux.advanced stuff doesn't have anything to do with kernel
headers, right?

 >> You are welcome to put the fixes for 2009.05 in a seperate branch
 >> (upstream, stable or whatever) if that's easier for you to keep it
 >> seperate for new feature development while we're stabilizing for the
 >> release. I might create a 'next' branch for new stuff.
 >> 

 Thiago> I thought of using master for current and 2009.07 for next. But I
 Thiago> could use a suggestion anyway.

I would think it would be easier to leave master alone so you easily
pull new changes in the main repo and rebase your commits on it.

 Thiago> About the .gitignore, I didn't base it from a patch, I actually added
 Thiago> it myself because git was always complaining about it and I had to do
 Thiago> git commit -m "" -a
 Thiago> But feel free to apply a previous patch that does the same. I still
 Thiago> haven't figured out how to do git am stuff :D

Ok. git am is easy - Simply save the mail and run git am -s <file>

 Thiago> Btw, how does one get those nice summaries like this ?
 Thiago> http://lkml.org/lkml/2009/4/4/40

with git shortlog. E.G. to see the log since the previous release you
would do:

git shortlog 2009.02...

For sending a git pull request you can use git request-pull, E.G. if
you do your work in a 'upstream' branch you could do:

git request-pull master git://git.buildroot.net/~correa/git/buildroot.git

Which would spit out something like (well, different - but same format):

The following changes since commit cf92bc23e9708881c7e982d20eeeb236c6427dfb:
  Peter Korsgaard (1):
        Update for 2009.05-rc1, add CHANGES

are available in the git repository at:

  git://git.buildroot.net/buildroot master

Peter Korsgaard (5):
      news: announce 2009.05-rc1
      download.html: fix browse source URL
      metacity: bump version and convert to Makefile.autotools.in format
      dmraid: broken with parallel make (lib + tools race)
      clarify license and fix website license link

 CHANGES                              |    6 +
 COPYING                              |  339 ++++++++++++++++++++++++++++++++++
 docs/about.html                      |    3 +-
 docs/download.html                   |    2 +-
 docs/news.html                       |   13 ++
 package/dmraid/dmraid.mk             |    2 +
 package/metacity/metacity-nopo.patch |   24 ++-
 package/metacity/metacity.mk         |  156 ++--------------
 8 files changed, 394 insertions(+), 151 deletions(-)
 create mode 100644 COPYING

-- 
Bye, Peter Korsgaard
