From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sat, 14 Jun 2008 00:11:55 +1000
Subject: [Buildroot] Still no answer for a contribution -- "me too"
In-Reply-To: <006901c8cd5d$a0aca220$040514ac@atmel.com>
References: <20080613120529.GB31396@cloud.net.au>
	<006901c8cd5d$a0aca220$040514ac@atmel.com>
Message-ID: <20080613141155.GB4318@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jun 13, 2008 at 03:33:10PM +0200, Ulf Samuelsson wrote:
> Hamish Moffatt wrote:
> > Personally I am using buildroot in a commercial product for my day
> > job. I am contributing everything that is relevant back to the
> > buildroot repository, but we have some changes specific to our
> > application and some proprietary packages which will never be merged.
> > We don't expect to be able to build our whole product directly from
> > the buildroot.uclibc.org repository.
> 
> I think this is fairly common.
> That is why I proposed the "local" directory,
> where the location can be defined as a shell environment variable.
> 
> BR2_LOCAL or something.
> 
> By putting your packages here, you should be able to download
> a new svn and use it without modifications.
> 
> It was a lot of protests at that time, and it was never fully implemented.
> 
> The make saveconfig/getconfig uses the local directory.
> 
> I think that it would be easy to expand to have packages in this directory as well.

I am using several boards defined in local/<project> already, this
system works very well for me. 

So far we have added our proprietary packages in a new top-level
directory and editted the main makefiles to include it. I think it would
be useful to include this structure in vanilla buildroot though - I
prefer to minimise my changes to the standard makefiles.

I'd prefer not to mix my packages in with the existing local/ directory.
It could either be in a user-defined location as you suggest or just a
new vendor/ directory or similar.

Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
