From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Dec 2014 21:46:21 +0100
Subject: [Buildroot] [PATCH RFC 1/1] package/xfsprogs: fix shared-only
 build
In-Reply-To: <1418766053-31581-1-git-send-email-romain.naour@openwide.fr>
References: <1418766053-31581-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141220214621.776af47b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Tue, 16 Dec 2014 22:40:53 +0100, Romain Naour wrote:
> The shared-only build is not supported by xfsprogs because
> without --enable-static, the buildin libraries (libxfs, libxcmd ...)
> are only build as shared libraries and xfs tools requires the static
> one.
> 
> Also, we needs to replaces -static with -static-libtool-libs for the
> shared-only case, in order to allow the fallback to the linking with
> the shared version of libuuid library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/139/139fa30756d35a24209136068c818802074908de/
> http://autobuild.buildroot.net/results/e2e/e2eef5dbadec555756a912a24978c78c0013ee70/
> http://autobuild.buildroot.net/results/08c/08c4bc5037379a8ca312e3e7574067235da74030/
> 
> And many more.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Thanks, patch applied. Maybe you could try to submit your patch
upstream? It indeed doesn't make much sense for upstream to absolutely
require that all libraries that xfsprogs depends on should be available
as static libraries.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
