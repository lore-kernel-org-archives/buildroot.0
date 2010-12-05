From: Paul Jones <paul@pauljones.id.au>
Date: Sun, 5 Dec 2010 19:23:25 +1100
Subject: [Buildroot] How to contribute to Buildroot with Git
In-Reply-To: <20101205091724.591e256b@surf>
References: <20101203113536.38481498@surf><953244.140.qm@web111110.mail.gq1.yahoo.com>
	<20101205091724.591e256b@surf>
Message-ID: <000c01cb9455$b1f49bc0$15ddd340$@pauljones.id.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You should add that to the documentation, great post!

Paul.

> -----Original Message-----
> From: buildroot-bounces at busybox.net [mailto:buildroot-
> bounces at busybox.net] On Behalf Of Thomas Petazzoni
> Sent: Sunday, 5 December 2010 7:17 PM
> To: buildroot at busybox.net
> Subject: [Buildroot] How to contribute to Buildroot with Git
> 
> On Sat, 4 Dec 2010 16:09:00 -0800 (PST)
> Justin Mark <oilehus@yahoo.com> wrote:
> 
> > I can build libgee with buildroot in my workspace, how should I submit
> > the patch for review? post the patch here or directly do it from git?
> > Can someone give me some details since I don't know much about git?
> 
> The best is to use Git. Here is a simplified version of the Git workflow
that I
> use to work with Buildroot:
> 
>  1) Clone (to be done only once)
> 
>     git clone git://git.busybox.net/buildroot
> 
>  2) Configure Git (to be done only once)
> 
>     Then tell git who you are :
> 
>     git config --global user.name "Firstname Lastname"
>     git config --global user.email firstname.lastname at somewhere.com
> 
>     And tell git how to send emails :
> 
>     git config --global sendemail.smtpserver mysmtpserver
> 
>     And to avoid chained reply :
> 
>     git config --global sendemail.chainreplyto false
> 
>  3) Create a branch to work on your topic (to be done for every
>     separate topic you'd like to work with)
> 
>     git checkout -b mytopic
> 
>     Note that this also switches immediatly to the new 'mytopic'
>     branch. You can run 'git branch' at any time to know on which
>     branch you are.
> 
>  4) Make some modifications, for one particuler subtopic (like adding
>     the vala compiler)
> 
>  5) Commit those modifications
> 
>     git commit -s -a
> 
>     And enter an appropriate commit log.
> 
>     If you created new files, add them with "git add".
> 
>     Then go back to step 4 for the other changes you want to do, or
>     proceed to step 6 if you're done with your changes.
> 
>  6) Review your changes
> 
>     git log -p master..
> 
>  7) Prepare patches for your changes
> 
>     git format-patch HEAD
> 
>     This will generate a set of 000X-*.patch files in the Buildroot
>     directory
> 
>  8) Send your patches to the list
> 
>     git send-email --to buildroot at uclibc.org --compose *.patch
> 
> And you're done.
> 
> If while reviewing your commits you find that you need to merge some of
> them (because you did some mistakes that you fixed later and you don't
> want the world to know about your mistakes), then you have to use the
> rebasing feature of git:
> 
>     git rebase -i master
> 
> Git will open up a text editor with the list of your commits. You can edit
this
> file to change the order of the commits, or to change the action taken on
a
> particular commit (see the file itself for documentation on those
actions). A
> typical thing is :
> 
>     pick SOMEGITHASH package: add foobar
>     pick SOMEGITHASH package: add barfoo
>     pick SOMEGITHASH I did something wrong in add foobar, merge me
> 
> So obviously you want the last commit to be merged into the first one, so
> that nobody knows you did some mistakes during your development. So,
> turn those three lines into the following ones:
> 
>     pick SOMEGITHASH package: add foobar
>     fixup SOMEGITHASH I did something wrong in add foobar, merge me
>     pick SOMEGITHASH package: add barfoo
> 
> And exit the text editor. Git will reorganize your commits, and you'll end
up
> with just two commits.
> 
> Don't hesitate to ask questions if you have issues,
> 
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux development, consulting,
> training and support.
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
