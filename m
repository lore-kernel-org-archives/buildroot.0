From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Mar 2016 16:07:32 +0200
Subject: [Buildroot] [PATCH v3 1/1] jsen: new package
In-Reply-To: <1459173669.2226.8.camel@embedded.rocks>
References: <1456233895-31812-1-git-send-email-atul.singh.mandla@rockwellcollins.com>
 <56CCC4C4.5020402@mind.be>
 <20160223220413.2050528c@free-electrons.com>
 <1456396337.29027.16.camel@embedded.rocks>
 <20160225135137.09136142@free-electrons.com>
 <1456408864.29027.48.camel@embedded.rocks>
 <20160225172028.5482c36e@free-electrons.com>
 <1459173669.2226.8.camel@embedded.rocks>
Message-ID: <20160328160732.31d45101@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 28 Mar 2016 16:01:09 +0200, J?rg Krause wrote:

> Unfortunatly, scanpypi does not work with latest Buildroot.

Ah. It would be great if some of our Python contributors could take
scanpipy, finish it and send it for merging.

> But I
> tested scancpan and yes, I would say that we need something like this
> for Node.js and npm. However, the problem with dependencies of
> different versions is still there. For example Code-TidyAll depends on
> Moo whatever version. scanspan fetches latest Moo version 2.* and
> creates a fine buildroot package. The perl package Tropo however
> depends on Moo 1.*. Installing this package with scanspac afterwards
> does not change Moo, which is correct I think. However, building Tropo
> will use the package Moo 2.*, which might fail (I've not tested).

This version-dependency thing is indeed a problem. For the specific
case you point out, the solution would be to have separate moo1 and
moo2 packages, very much like we do for python/python3, qt/qt5, etc.

However, this is only realistic if there are only a few "major"
versions for a few packages. If they break the API at every minor
release, then it's clearly not doable.

I personally don't really care about npm/node.js. Maybe we should just
add a big fat legal warning in our legal information when NPM has been
used to install additional packages, to explicitly say that those
additions are not listed in the legal info output. This would at least
warn the user.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
