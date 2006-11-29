From: Pavel Roskin <proski@gnu.org>
Date: Tue, 28 Nov 2006 20:43:48 -0500
Subject: [Buildroot] new DHCP version and make error
In-Reply-To: <49328.206.190.75.8.1164762791.squirrel@picard.linux.it>
References: <54185.206.190.75.8.1164745659.squirrel@picard.linux.it>
	<25387.206.190.75.8.1164749926.squirrel@picard.linux.it>
	<1164752891.4016.9.camel@dv>
	<9d921c5e52578b674eefe0f12a073f9d@bowery.com>
	<1164758347.4016.24.camel@dv>
	<49328.206.190.75.8.1164762791.squirrel@picard.linux.it>
Message-ID: <1164764628.4016.64.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2006-11-29 at 02:13 +0100, Rafael A Barrero wrote:
> Hi;
> 
> I agree that buildroot should take step forward in this direction. A
> "distribution building system" should be able to maintain a stable process
> for creating these distributions, no?

I was only talking about availability of the packages.  Stability has
other aspects.

Some packages may be incompatible with the latest compilers or with
certain targets.  For example, gcc 4.1.1 won't compile acpid without a
minor patch (and the complication is that acpid.mk doesn't know how to
apply).  Adding support for new compilers is likely to affect some
packages.

Also, uClibc snapshots have options that affect some of the packages.
For instance, unselecting fnmatch() support would break Busybox.  The
build system should incorporate this knowledge an help users make the
best choices.

Buildroot offers diverse options and supports a magnitude of packages.
It's almost unavoidable that something would be broken.  I think the
priority should be to improve the infrastructure to reduce brokenness
and to exclude known bad configurations.  That includes adding a
testsuite.

Releases could have more rigid constraints than the development code.
In particular, use of snapshots of Busybox and uClibc should be strongly
discouraged in the releases.

Maybe we could have an option to disallow selection of snapshots,
something like CONFIG_EXPERIMENTAL in Linux?

> I for example have just begun to work with buildroot and I'm coming across
> missing software distributions or software distributions that simply do
> not compile.
> 
> For example - gettext-0.14.6 does not compile... what do you guys suggest?
> Do I remove it from my list? Use an alternate version? Fix the bug?

It depends on your priorities.  The best approach for everybody would be
to have the problem fixed, but it may take more of your time.

> Does anyone have a known-good list somewhere (for x86 targets)? What
> versions allow buildroot to compile cleanly? Completely?

I don't have such list.  If the problem is just with the packages, you
can enable all of them and then disable those that don't compile.  That
would give you the known-good list for your compiler.

> I certainly don't mind pitching a hand... I've got some spare systems and
> could put together a quick test matrix. Thoughts?

Posting the list of broken packages would be a great start.

-- 
Regards,
Pavel Roskin
