From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 16:58:21 +0100
Subject: [Buildroot] [RFC 0/3] samba4: allow build of libsmbclient only
In-Reply-To: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
References: <1411823541-4953-1-git-send-email-zooey@hirschkaefer.de>
Message-ID: <20150203165821.4b4d5548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Sep 2014 15:12:18 +0200, zooey at hirschkaefer.de wrote:

> this set of patches is a first draft of allowing a separate build
> of samba4's libsmbclient. Most of our devices don't need all of the
> other samba servers and tools, so it seems a bit of a waste having
> to build them all.
> 
> The first patch contains the naive attempt at implementing the separation.
> 
> However, it seems that samba4's build system gets confused when not all 
> targets have been built, as it tries to install manpages along with 
> libsmbclient which haven't been generated during the build phase. Patch 2
> works around the problem by deactivating installation of manpages in general,
> but as that is hardly acceptable, I wonder if anyone here has a better idea?
> 
> Patch 3 appies --disable-rpath-private-install in order to work around
> another build problem, which is apparently caused by libsmbclient.inst.so (and
> additional install libraries) to not have been created during the build phase.
> Again, the solution proposed in the patch isn't a good one, as it basically 
> means that samba4's private libraries are not being built with RPATH set, 
> which is bound to cause problems at runtime (they won't be found by the 
> runtime loader). As with patch 2, I'd be grateful for any hints at better
> solutions.

Thanks for those patches. However, as you point out in your cover
letter, those patches are not really acceptable as is. Moreover, those
are really "feature patches", and we generally try to avoid them if
possible. Could you instead work with the upstream Samba developers a
solution to build only smbclient, and see where that goes?

Thanks a lot,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
