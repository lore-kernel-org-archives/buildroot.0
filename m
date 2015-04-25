From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 14:26:34 +0200
Subject: [Buildroot] [PATCH v7 0/8] toolchain: better handle hashes
 (branch yem/dl-hash-toolchains)
In-Reply-To: <1429740521-31943-1-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
Message-ID: <20150425142634.516e800e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 23 Apr 2015 00:08:33 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:

> Arnout Vandecappelle (1):
>       uclibc: update hash for arc
> 
> Yann E. MORIN (7):
>       package/gcc: add hashes
>       package/binutils: add hashes
>       package/uclibc: add missing hash for eXtensa
>       support/download: add possibility to not fail on missing hash
>       toolchain/external: ignore missing hash for custom downloaded toolchain
>       package/uclibc: ignore missing hash for snapshots
>       support/download: restore mandatory check of hashes

Series applied.

One thing that bothered me a little bit is that when the hash of the
tarball downloaded from upstream doesn't match the one we have in BR,
we gracefully fall back on downloading the tarball from
sources.buildroot.net.

This is good for users as it means their build succeeds. But not so
good from the point of view of noticing that upstream has for some
reason changed the tarball.

Any opinion about this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
