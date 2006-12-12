From: Daniel Silverstone <dsilvers@digital-scurf.org>
Date: Tue, 12 Dec 2006 15:23:21 +0000
Subject: [Buildroot] Issue preparing a buildroot
In-Reply-To: <loom.20061212T155919-203@post.gmane.org>
References: <1165919607.6628.4.camel@petitemort.i.digital-scurf.org>
	<loom.20061212T155919-203@post.gmane.org>
Message-ID: <1165937001.6628.13.camel@petitemort.i.digital-scurf.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2006-12-12 at 15:09 +0000, MikeW wrote:
> Well it's often possible to temporarily 'fix' such issues by means of a
> symbolic link to the right place; as long as it's limited in scope,
> the use of an 'external' limits.h file shouldn't break anything ....?!

Well, except for the fact that the kernel team explicitly state that
linux/limits.h belongs to *LINUX* not to userland :-)

> I would have thought there was an add-in package that would supply
> the missing headers - surely we are not in Windows "hide system files"
> territory ?

No, this is a case of the libc breaking the kernel/userland divide in a
way which it is not supposed to.

> The above is *not* from direct Ubuntu experience, but I have made
> 'enabling' fixups in the manner described to get things to build
> before now.

Unfortunately it seems my initial suggestion that it might be
Ubuntu/edgy may have been misplaced. Using a non-snapshot uClibc removes
the issue.

However I still cannot compile because snapshot busybox won't compile,
and non-snapshot busybox won't even configure for me.

*sigh*

I do wonder if anyone tests this stuff in an automated environment ever.

Thanks for your suggestions, but I cannot make in-place fixes on my
machine, nor in any given tree because we intend to autobuild things and
thus they get fresh chroots to be built in each time.

D.

-- 
Daniel Silverstone                         http://www.digital-scurf.org/
PGP mail accepted and encouraged.            Key Id: 2BC8 4016 2068 7895
