From: Thomas Lundquist <lists@zelow.no>
Date: Wed, 7 Jan 2009 19:02:08 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231331663.32308.358.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
	<1231331663.32308.358.camel@elrond.atmel.com>
Message-ID: <20090107180208.GA14648@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 07, 2009 at 01:34:23PM +0100, Ulf Samuelsson wrote:
> 
> We need to differentiate between testing and releases.
> I have already made the comment, that I believe 
> a distribution should use a single version of the source
> (with patches).

That's what tags, branches and releases are for. 
Having separate makefiles sounds messy.

> I am talking about the process of getting a package
> into the stable distribution, and currently there
> is no process of doing this.

You could tag each package in Config.in or something 
with "UNTESTED" "TESTING" or whatever aswell, then change or remove when
we know it works.

(Or just use EXPERIMENTAL as other projects does)

> Your goal of a single source package that will not break
> for any supported architecture will thus be met by the 
> packages IN the distribution. Packages outside
> the distribution are not supported.

This is another story, maybe we should support contrib/*.* like you 
once had with local/ for out-of-tree packages and boards.

> It will also allow people to build old distributions.

That's why we have version control. Just check out an earlier
revision.

> When it is time to look at a new release, then
> it is easy to check what has been introduced
> since the last distribution, and create 
> the version file for the new testing phase.

NEW (and oldconfig)

> If it does not build, then it is set to broken
> for that architecture.

What you are suggesting here is a package-tagging about the status 
of the package per ARCH.

This would suggest a new file per package with metainfo (Which could be used
to make Config.in since we'd rather not duplicate information.)

> If the problem can be fixed with a patch, then
> a new directory is created with the patch.

As long as we keep having only one version of each package we won't need
to do this.



Thomas.
