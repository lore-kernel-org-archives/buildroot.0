From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jun 2014 18:59:09 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] qt5: support buildroot being
 located in /usr
In-Reply-To: <53A4C052.1050105@mind.be>
References: <patchbomb.1403291463@localhost>
 <6e90b5d192055fdb9550.1403291465@localhost>
 <53A4C052.1050105@mind.be>
Message-ID: <20140621185909.22016e05@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Sat, 21 Jun 2014 01:14:26 +0200, Arnout Vandecappelle wrote:

>  Now that I see the two patches next to each other: why is this hook needed?
> It's already done by the generic staging-install target, no? ThomasP carries the
> blame for this, so putting him in Cc...

I don't think I should be blamed for this actually :-)

The generic staging-install fixup of .la files is only part of
the autotools-package infrastructure, because it's related to libtool,
which is normally used in combination with the rest of the autotools.

However, qt5* packages are all generic-packages, so the "generic"
staging-install fixup of .la files doesn't apply for these packages.

That being said, we could certainly make the .la fixup logic a common
macro, which could be used by both the autotools-package
infrastructure, and some other packages as well.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
