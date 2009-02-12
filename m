From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Thu, 12 Feb 2009 19:05:27 +0100
Subject: [Buildroot] Easy Upgrade Path?
References: <49907BAE.3020509@ethertek.ca> <20090212132945.GA30222@zelow.no>
	<87k57vg4mh.fsf@macbook.be.48ers.dk>
Message-ID: <42127429E1E346F88C87B93D4C60CA1F@aeglos>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:
>
> Hi,
>
> >> What is the recommended method to upgrade to the newest build
> >> environment so we don't have to re-do everything? Is this possible?
>
> Thomas> Ulf introduced local/ when he started to commit and this was
> Thomas> a good idea.
>
> Thomas> It got booted out some time later, by someone.
>
> I don't remember the details, but it was afaik quite half baked,
>
> Thomas> The point is that you can put your config files and non-included
> Thomas> packages there and keep that out of the rest of the tree.
>
> Thomas> I like the idea and would like to put it back in.
>
> I agree that we should realize the fact that any big user of buildroot
> want to customize it somehow and make it easy to do - But we need to
> do it in a clean way.
>

The proposal was to create the local directory

mkdir local
touch local/Config.in
touch local/Makefile.in

and include the two new files in toplevel Makefile and Config.in
If  BUILDROOT_LOCAL exists, this should override local,
---

As long as the user is not interested, nothing happens.
If the user is interested, then the user replaces the local
with a symlink to his own directory.

Nothing halfbaked about that.
The idea was rejected, because it gave people an ability to include things
in their filesystem which was not available in the svn to other users of 
Buildroot.

Best Regards
Ulf Samuelsson
