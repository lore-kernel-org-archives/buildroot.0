From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Apr 2017 22:50:34 +0200
Subject: [Buildroot] [PATCH v5 08/13] support/test-pkg: get configs from
 buildroot defconfigs
In-Reply-To: <20170406204804.GC3538@scaer>
References: <cover.1491502445.git.arnout@mind.be>
 <20170406181854.5242-8-arnout@mind.be>
 <20170406213735.003749a9@free-electrons.com>
 <20170406204804.GC3538@scaer>
Message-ID: <20170406225034.342c907e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 6 Apr 2017 22:48:04 +0200, Yann E. MORIN wrote:

> > On the principle, I am OK with this direction, but it is needs to be
> > coordinated with a change to autobuild-run to also use the base
> > autobuild defconfigs from the Buildroot tree. Otherwise, we will have
> > two copies: one used by people running test-pkg, one used by the actual
> > autobuilders. It is not difficult to see those two copies quickly
> > getting out of sync.  
> 
> I think the idea is not to sync, but to get rid of the toolchain configs
> in autobuild-run altogether, and only use those in the Buildroot tree.

Huh, you must have misunderstood what I wrote, or it wasn't clear.

My point was precisely that we want to avoid sync'ing them. But to
achieve that the autobuild-run script needs to be changed to use base
toolchain configs from the Buildroot tree rather than through the
CSV file downloaded from autobuild.b.o. And I'm exactly saying that we
need to change the autobuild-run script at the same time as we move
base toolchain configs in the tree, otherwise we have duplication.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
