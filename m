From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Apr 2016 16:52:17 +0200
Subject: [Buildroot] Project configuration management
In-Reply-To: <5702D279.3050904@mind.be>
References: <24791852-D548-43A1-8E3D-C39D69F479BB@vestiacom.com>
 <20160404204429.472fb279@free-electrons.com>
 <5702D279.3050904@mind.be>
Message-ID: <20160406165217.07547fff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 4 Apr 2016 22:45:45 +0200, Arnout Vandecappelle wrote:

> > The mechanism we typically advise in such situation is to use defconfig
> > fragments, and assemble them as needed to create the configuration you
> > feed into Buildroot. A shell script (or other) can help generating the
> > configuration fed into Buildroot from the fragments.
> 
>   And that shell script exists already: support/kconfig/merge_config.sh

That's not exactly the sort of script I was thinking of. I was thinking
of a more high-level, project specific script, like maybe:

	genconfig -h <hwplatform> -s <softwarestack> -r <releasetype>

or anything like that, which would internally have the knowledge of
which fragments to use for which aspect (HW platform, software stack,
etc.). Of course, internally, this script can use merge_config.sh, but
having a more high-level script might help users to more easily
generate their Buildroot configuration.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
