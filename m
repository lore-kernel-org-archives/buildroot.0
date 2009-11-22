From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Nov 2009 22:05:09 +0100
Subject: [Buildroot] [git commit master] buildroot;
	move defconfigs to configs/ and print in help
In-Reply-To: <20091111150359.579df608@surf> (Thomas Petazzoni's message of
	"Wed\, 11 Nov 2009 15\:03\:59 +0100")
References: <20091004202133.B35E577762@busybox.osuosl.org>
	<20091005084845.023ff120@surf> <873a5y5nbq.fsf@macbook.be.48ers.dk>
	<20091111150359.579df608@surf>
Message-ID: <87pr7afeyi.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,

 Thomas> Coming back on this old topic, because I really don't like the
 Thomas> new way.

I'm sorry to hear. I do kind of like it ;)

 >> True - This change makes it slightly harder for developers, but easier
 >> for users to find (and for us to do a test build of all defconfigs
 >> prior to release).

 Thomas> For developers, it's a mess. You have to explain to developers that
 Thomas> they have to put some stuff in this directory, some other stuff into
 Thomas> this directory. (BTW the documentation at
 Thomas> http://buildroot.org/buildroot.html#board_support hasn't been updated
 Thomas> accordingly).

It hasn't? I did update it, and it imho is pretty clear:

You can furthermore create one or more preconfigured configuration
files, referencing those files. These config files are named
something_defconfig and are stored in the toplevel configs/
directory. Your users will then be able to run make something_defconfig
and get the right configuration for your project

Do you have a suggestion for a clearer wording?

I don't see the different directory as a big problem (E.G. it doesn't
seem to be an issue for other projects doing the same, like the Linux
kernel or U-Boot). If people add packages and/or patches for their
custom stuff (I know people at the company I work for do this) they'll
need to look outside their target/device/company/board dir anyway.

Similary, I don't believe name clashes in configs/ are a big problem
(like in Linux/U-Boot).

 Thomas> Moreover, it breaks the idea of having out-of-tree board support.
 Thomas> Before this change, it was relatively easy since the stuff needed to
 Thomas> support one board was centralized in one directory (see my proposal at
 Thomas> http://git.buildroot.net/~tpetazzoni/git/buildroot/commit/?id=ed47f42a598c665bf42c4e797187f233b955e285).

Did you rebase? The link doesn't seem to work any more :/

 Thomas> To make them more visible to users, I suggest to reorganize
 Thomas> target/. All board-stuff should be moved to a top-level boards/
 Thomas> directory. This directory would have roughly the same
 Thomas> architecture as the current target/device/ directory.

I agree, but that's imho not directly related to where to put
_defconfigs.

 Thomas> And then, to make the defconfig files visible to users, just show them
 Thomas> in "make help".

With a find-all-files-ending-in-_defconfig-under-here thing? Could be
done, but is kind of ugly - Same for make <foo>_defconfig.

 >> The stuff in target/device/ tends to get stale over time, so a bit
 >> more visibility is imho good.

 Thomas> Let's move it to boards/ then.

Optimist! ;) I don't think that will significantly change the staleness
of it though.

 Thomas> True, I forgot to send my comments at that time. Or maybe didn't
 Thomas> realized what the impact of the change would be.

 Thomas> Is it possible to re-discuss this topic before the 2008.11 release ?

Yes, but I'm about to put out -rc1, so we have limited time.

-- 
Bye, Peter Korsgaard
