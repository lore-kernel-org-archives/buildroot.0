From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Sep 2015 14:56:13 +0200
Subject: [Buildroot] [PATCH] grub2: pass target NM, OBJCOPY and STRIP
In-Reply-To: <1441747841-7905-1-git-send-email-arnout@mind.be>
References: <1441747841-7905-1-git-send-email-arnout@mind.be>
Message-ID: <20150920145613.3f4ad9c1@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle (Essensium/Mind),

On Tue, 8 Sep 2015 23:30:41 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Fixes https://bugs.busybox.net/show_bug.cgi?id=8256
> 
> grub2's build system interprets CC, CFLAGS and CPPFLAGS as for the host
> and uses TARGET_CC etc. for the target. However, NM, OBJCOPY and STRIP
> are used for the target. We currently pass the host-versions of these
> tools as part of $(HOST_CONFIGURE_OPTS).
> 
> While we're at it, also pass TARGET_LDFLAGS.
> 
> This problem had not been noticed up to now because usually we build on
> an x86 machine for the x86 architecture, so the binutils are compatible.
> However, this is not true on an i386 when building for x86_64.
> 
> Cc: Christophe Bricout <christophebricout@yahoo.fr>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> I only did a build test, with an i386 host, so I haven't even verified
> that the bug is really solved. Christophe, can you do that and add
> your Tested-by tag if it works for you?
> ---
>  boot/grub2/grub2.mk | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)

Applied, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
