From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 10:17:54 +0200
Subject: [Buildroot] pkg-stats support for external tree?
In-Reply-To: <HE1PR03MB29888EA331AFE5BEE506CD53F0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
References: <HE1PR03MB298830C6E778223631A2A08AF0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
 <20201015085753.33f3b15e@windsurf>
 <HE1PR03MB29888EA331AFE5BEE506CD53F0020@HE1PR03MB2988.eurprd03.prod.outlook.com>
Message-ID: <20201015101754.55fb29c6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 15 Oct 2020 07:49:30 +0000
Magnus Armholt <magnus.armholt@wapice.com> wrote:

> The cve-checker sounds exactly what we are looking for.
> We are still using the 2020.02.x release, so I havent notice it.
> I need to check it out.
> 
> Actually, i was about to submit a patch for the pkg-stats which adds the functionality to parse the package list from the manifest file, but now there is no need to do that =)
> 
> The CVE listing in the pkg-stats output  is a very (if not the most) important feature.
> The pkg-stats is also very useful as a reminder to update the packages (current version vs latest version).
> This is the main reason why I was asking about the support for external tree, so we get a CI reminder to update our project specific packages when new versions are available.

Perhaps we should changes things a bit and simple make "pkg-stats"
capable of generating its output based on *all* packages or only on the
packages enabled in your current configuration.

However, I am wondering whether the "latest upstream version"
information for each package really makes a lot of sense in your case.
If you are using the LTS branch 2020.02.x, then inevitably, lots of
packages will be older than there latest upstream release: you're not
using Buildroot master, so packages obviously will not be the latest.
But that's also what you want by using an LTS release of Buildroot: to
not update packages to keep your well-tested and production-ready
system stable, while benefiting from security updates/fixes.

So to me, the "latest upstream version" information really only makes
sense for the pkg-stats on all Buildroot packages, i.e a tool for the
Buildroot community/maintainers rather than a tool for Buildoot
end-users.

Or do you see it differently?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
