From: Thomas Lundquist <lists@zelow.no>
Date: Thu, 8 Jan 2009 09:07:33 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <1231355624.32308.410.camel@elrond.atmel.com>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<d6cda7730901061022v3866b298y547235a57535d009@mail.gmail.com>
	<1231268529.32308.222.camel@elrond.atmel.com>
	<87y6xomehq.fsf@macbook.be.48ers.dk>
	<1231274947.32308.260.camel@elrond.atmel.com>
	<87ljtnl5g9.fsf@macbook.be.48ers.dk>
	<1231331663.32308.358.camel@elrond.atmel.com>
	<20090107180208.GA14648@zelow.no>
	<1231355624.32308.410.camel@elrond.atmel.com>
Message-ID: <20090108080733.GB17480@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jan 07, 2009 at 08:13:44PM +0100, Ulf Samuelsson wrote:

> > That's what tags, branches and releases are for. 
> > Having separate makefiles sounds messy.
> 
> I am not an expert in Source Code Management,
> but do you have this capability in Subversion?

Of course.

> I know you have it in git, but using git
> is apparently not an option.

Maybe not as cool as git but still tags and branches.

> I do not see it as too messy to use directories.
> 
> Go to the package/<package> directory and create a new
> directory, copy the files but not the svn info 
> from the old distribution directory X.Y.Z. 
> Call the new directory X1.X2.X3.
> 
> Add 
> 
> "<package>_VERSION=Z1.Y1.Z1"
> 
> to a file, and and
> 
> ???select BR2_PACKAGE_<package>
> 
> to another, and your are ready to go.
> 
> ONce you ahve added a patch, then it will be easy
> for other people to test this by adding 
> ???
> "<package>_VERSION=Z1.Y1.Z1"
> ???select BR2_PACKAGE_<package>
> 
> to their private override files.

This will be hell to maintain. Who / when to deprecate older versions 
that does not compile with anything new? Shall it be kept for 
ten years like you seem to suggest?

Bit rot tends to start showing up in less than a year.

> Once the "enable" file for all architectures contain this select
> then the package can be considered to be validated,
> and can be released.

for *that* particular version and patch set. 

> Then again, my requirement is not that it needs
> to be implemented in a certain way, just
> that the functionality of beeing able to 
> start with a distribution, 

That is tags and releases. No need to have more than one version 
of the packages for that.

> You can review changes by code reading,
> and you can build to check that it compiles
> but if you want to check that it actually
> runs then someone with the right H/W needs
> to build and run the code.

Yes.

> That is important as well, but I am rather thinking
> distribution X supports package 1,2,3 but not 4.

distribution or arch?

> You wamt tp develop package 4 support for your arch,
> and want to submit patches for others to test.

Then you add that package (or do you mean version? then you bump it and make 
sure it goes through the test runs) and then add your specific patches 
if it's nessesary.

> This is how openembedded works, you have a base distribution
> which defines what versions to use, but anyone
> can override the package version in their local.conf file.

it can be overridden in the .mk file and then tagged with ignore in 
the SCM so it won't be overwritten by the next update.

> Anyone (with write access) can introduce and test a new package version
> without breaking anyone elses build.

And then we end up with so many versions it'll hurt, alot.

> Yes. But in addition, I would like each architecture
> to have access to packages from earlier distributions as well.

As mentioned; Debian manages without and doing this will complicate
way too much.

> In order to avoid support nightmares, updates of
> packages belonging to previous packages should not be
> permitted, when work is starting on a new revision.

This didn't make sense. Previous versions of a package 
or "distribution"?

> Use of old packages together with the current
> distribution is not neccessarily a supported
> activity.

Whitch is exactly why we don't need this.


Thomas.
