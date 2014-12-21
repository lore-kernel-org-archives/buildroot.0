From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 22:05:56 +0100
Subject: [Buildroot] [PATCH v4] package/gdb: fix shared-only build
In-Reply-To: <1418852225-7144-1-git-send-email-romain.naour@openwide.fr>
References: <1418852225-7144-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141221220556.5b343671@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Romain Naour,

On Wed, 17 Dec 2014 22:37:05 +0100, Romain Naour wrote:
> The shared build only of gdb is actually not supported.
> 
> When --disable-static is given to the gdb's main configure script,
> it also disable the static build of bundled libraries like bfd, readline
> and opcodes, which must be build statically.
> 
> Force the static build of bundled libraries by adding --enable-static in
> GDB_CONF_OPTS.
> 
> Fixes:
> http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
> http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
> http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
> http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
> http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/
> 
> And many more.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
