From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Nov 2009 15:03:59 +0100
Subject: [Buildroot] [git commit master] buildroot;
 move defconfigs to configs/ and print in help
In-Reply-To: <873a5y5nbq.fsf@macbook.be.48ers.dk>
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf> <873a5y5nbq.fsf@macbook.be.48ers.dk>
Message-ID: <20091111150359.579df608@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Coming back on this old topic, because I really don't like the new way.

Le Mon, 05 Oct 2009 09:09:29 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> True - This change makes it slightly harder for developers, but easier
> for users to find (and for us to do a test build of all defconfigs
> prior to release).

For developers, it's a mess. You have to explain to developers that
they have to put some stuff in this directory, some other stuff into
this directory. (BTW the documentation at
http://buildroot.org/buildroot.html#board_support hasn't been updated
accordingly).

Moreover, it breaks the idea of having out-of-tree board support.
Before this change, it was relatively easy since the stuff needed to
support one board was centralized in one directory (see my proposal at
http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=ed47f42a598c665bf42c4e797187f233b955e285).
Now, it's split between a directory in target/device and a file in
configs/.

To make them more visible to users, I suggest to reorganize target/. All
board-stuff should be moved to a top-level boards/ directory. This
directory would have roughly the same architecture as the current
target/device/ directory.

And then, to make the defconfig files visible to users, just show them
in "make help".

> The stuff in target/device/ tends to get stale over time, so a bit
> more visibility is imho good.

Let's move it to boards/ then.

> I obviously like it, and I never had any comments when I proposed it
> back in September:
> 
> http://lists.busybox.net/pipermail/buildroot/2009-September/029269.html

True, I forgot to send my comments at that time. Or maybe didn't
realized what the impact of the change would be.

Is it possible to re-discuss this topic before the 2008.11 release ?

Sincerly,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
