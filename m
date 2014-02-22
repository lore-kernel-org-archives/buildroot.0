From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Feb 2014 23:43:21 +0100
Subject: [Buildroot] [PATCH] binutils: install libiberty
In-Reply-To: <1393108410-9568-1-git-send-email-arnout@mind.be>
References: <1393108410-9568-1-git-send-email-arnout@mind.be>
Message-ID: <20140222234321.3f8b7f8a@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Sat, 22 Feb 2014 23:33:30 +0100, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Some packages (actually, just oprofile) need to link against libiberty.
> This option just installs libiberty.a so it has no effect on the target,
> therefore it's not needed to add a config option for it.
> 
> Before binutils-2.24, there was a bug in libiberty/Makefile.in that
> caused libiberty to be installed regardless of the
> --enable-install-libiberty option. This problem wasn't noticed before
> because binutils-2.24 is not selected on any of the autobuilders: the
> version can only be selected if an internal toolchain is used, and it
> defaults to 2.21.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/binutils/binutils.mk | 1 +
>  1 file changed, 1 insertion(+)

I believe this might fix:

http://autobuild.buildroot.org/results/be1/be199b97dcdaf28a8fef9d90953115a005baa173/build-end.log

If someone could verify this, maybe this patch could be committed to
master.

On Microblaze, a non-default binutils version is used, and the version
is fairly recent, most likely a 2.24-something version (we actually use
a git commit).

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
