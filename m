From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Wed, 07 Jan 2009 13:34:23 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87ljtnl5g9.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
Message-ID: <1231331663.32308.358.camel@elrond.atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ons 2009-01-07 klockan 12:29 +0100 skrev Peter Korsgaard:
> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
> 
> Hi,
> 
>  Ulf> As I pointed out, the current structure really only
>  Ulf> allows you to have one makefile fragment per package.
> 
>  Ulf> You need several for distributions (or releases) to work
> 
> Why? If big distributions like Debian can use the same sources for all
> it's archs, why can't we?

We need to differentiate between testing and releases.
I have already made the comment, that I believe 
a distribution should use a single version of the source
(with patches).

I am talking about the process of getting a package
into the stable distribution, and currently there
is no process of doing this.
Either you commit a patch or not.
As you pointed out, we do not have the resources
to do every test for every architecture.

That is why we need to be able to bring up architecture
support in an incremental fashion.

Unless we can commit patches to a development section
without breaking the distribution we cannot work 
as a team.

Your goal of a single source package that will not break
for any supported architecture will thus be met by the 
packages IN the distribution. Packages outside
the distribution are not supported.

It will also allow people to build old distributions.

Anyone wanting to build a system adding package-versions
to their own build of the distribution, cam do so without 
disrupting the build.
That means that when we plan to create a new distribution,
a lot of the work, may already be done.
Allowing a commit, will allow other people to 
test on other architectures as well.

When it is time to look at a new release, then
it is easy to check what has been introduced
since the last distribution, and create 
the version file for the new testing phase.

People can then try to build the test distribution
for different architectures, using the "enable all"
file, and if it builds, then the enable is set for
that architecture.

If it does not build, then it is set to broken
for that architecture.

If the problem can be fixed with a patch, then
a new directory is created with the patch.

The architecture specific distribution file
is set to use that directory, instead of the 
testing directory.

You can periodically during the testing phase 
generate a release candidate enabling all
working packages for a specific architecture.

During next phase, you provide a version file 
allowing you to build all architecures using
directories with the new patches.

Hopefully the patch will not break any architectures,
and then it can be accepted into next release
candidate.

If the patch fixes the problem in some
architectures, but breaks others, then
it becomes an architecture specific patch.
*.patch.$ARCH)

This approach gives us a possibility to work
as a team to bring up the distribution
and will significantly reduce the workload
because you can concentrate on a few architecture
and new patches will not break anything else.



Best Regards

Ulf Samuelsson
