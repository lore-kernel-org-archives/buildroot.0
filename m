From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 Oct 2011 09:52:33 +0200
Subject: [Buildroot] Bug in pkg-stats?
In-Reply-To: <87obxvntns.fsf@macbook.be.48ers.dk>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56F52@AUSP01VMBX24.collaborationhost.net>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE6AE@AUSP01VMBX24.collaborationhost.net>
 <20111005084340.204661fb@skate>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE877@AUSP01VMBX24.collaborationhost.net>
 <87sjn7nv4d.fsf@macbook.be.48ers.dk>
 <ADE657CA350FB648AAC2C43247A983F001F39DCFE910@AUSP01VMBX24.collaborationhost.net>
 <87obxvntns.fsf@macbook.be.48ers.dk>
Message-ID: <20111006095233.200f977e@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 05 Oct 2011 21:08:07 +0200,
Peter Korsgaard <jacmet@uclibc.org> a ?crit :

> Well, I think the info in useful, but as buildroot already knows the
> version (except for unconfigured packages), wouldn't it make more
> sense to add a <pkg>-version target to GENTARGETS and use that
> instead?

I agree here. Grepping/seding/awking into the .mk file sounds horrible
and does not work for package that do:

pkg_VERSION = $(pkg_VERSION_MAJOR).5

So, yes, if you want to do this, please add a <pkg>-show-version in
GENTARGETS, just as we have <pkg>-show-depends. Of course, this will
slow down quite a bit the pkg-stats script, but we don't really need
this script to be fast.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
