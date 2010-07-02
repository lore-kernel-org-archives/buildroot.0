From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Fri, 02 Jul 2010 12:34:35 +0100
Subject: [Buildroot] Getting package sources from git/svn/bzr
In-Reply-To: <L4XFTV$372CCE1E768A6797451FB4E08C9DC692@aruba.it>
References: <L4XFTV$372CCE1E768A6797451FB4E08C9DC692@aruba.it>
Message-ID: <1278070475.13420.19.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Luca,

On Fri, 2010-07-02 at 12:58 +0200, Luca Ceresoli wrote:
> 
> The difference between the two methods (clone vs archive) is not clear
> to me. I got how each works, but what advantages do they have over each
> other?

Well, I'm thinking that most people will just get an archive because
they just want to compile the code, but some will want to make edits and
contribute their changes so they will need to do a clone.  I suppose
it's a first step in making buildroot into a system that can be used as
a day-to-day development environment as well as a build system.

In my particular environment, certification requires the source of all
software to be trusted so _all_ packages will have to be downloaded from
local git repositories.  I realise that very few will have a similar
requirement but I believe that adding the features being discussed would
benefit a wider audience.

> I don't like this as a way to mainline package version management and
> reproducibility. Can you explain why you find it useful?
> If this is just a way to override the package/*/*.mk defaults, why not
> just changing them directly?
> 
> Luca
> 

Take the example of a project that has a few releases in existence.  One
day I decide I want to get release X, which had say 50 packages each
with its own version.  So instead of having to check out Buildroot
(containing per-package versions) as of the date of release X, perhaps
losing some of the improvements since then, I just want to be able to
check out one file that lists all package versions.  Then if I want to
move to release Y, I just get that version file as at version Y's
release.  Only the packages that have been changed will need to be
updated so it will cut down on the amount of code to be transmitted.

I'd also need to get the config files from that release to determine
what should be built.

You know, maybe the in-package version and entire Buildroot clone _is_
the way to go since you can be sure the config files are compatible with
the overall Buildroot environment - a state not guaranteed by my
proposal.
There should to be a way of outputting these versions to create a
manifest of some sort though.
