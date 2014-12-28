From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Dec 2014 22:34:21 +0100
Subject: [Buildroot] [PATCH 1/3 v2] package: add hashes for
 SourceForge-hosted packages
In-Reply-To: <d23cfbca4078af76c4bbee70ed02006124c5d0c7.1419768498.git.yann.morin.1998@free.fr>
References: <cover.1419768498.git.yann.morin.1998@free.fr>
 <d23cfbca4078af76c4bbee70ed02006124c5d0c7.1419768498.git.yann.morin.1998@free.fr>
Message-ID: <20141228223421.36ad48fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sun, 28 Dec 2014 13:19:29 +0100, Yann E. MORIN wrote:
> Since SourceForge sometimes serves us faulty tarballs, we can tons of
> autobuild failures:
>     http://autobuild.buildroot.org/results/9fb/9fba5bf086a4e7a29e5f7156ec43847db7aacfc4/
>     http://autobuild.buildroot.org/results/6c8/6c837b244c45ac3b3a887734a371cd6d226cf216/
>     ...
> 
> Fix that by adding hash files for all SourceForge-hosted packages (thos
> etht did not already have it).
> 
> We normally prefer to use hashes published by upstream, but hunting them
> all one by one is a tedious task, so those hashes were all locally
> computed with a script that searched for SF-hosted packages, downloades
> the associated tarball, computed the hash, and stored it in the
> corresponding .hash file.
> 
> Also, SF publishes sha1 hashes, while I used the stronger sha256, since
> sha1 is now considered to be relatively weak.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Richard Braun <rbraun@sceen.net>
> Cc: Nathaniel Roach <nroach44@gmail.com>

Applied, thanks. I've verified that the hashes were matching here by
running:

make $(git show | grep "^+++" | sed 's%.*package/\([^/]*\)/.*%\1-extract%' | sed 's/scons-extract/host-scons-extract/' | sed 's/swig-extract/host-swig-extract/' | sed 's/upx-extract/host-upx-extract/' | tr "\n" " ")

which ended successfully.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
