From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 14 Aug 2017 23:04:35 +0200
Subject: [Buildroot] [PATCH] e2fsprogs: add patch for recent glibc
In-Reply-To: <20170812162255.23034-1-arnout@mind.be>
References: <20170811110549.6278-1-daggs@gmx.com>
 <20170812162255.23034-1-arnout@mind.be>
Message-ID: <20170814230435.06af05f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Aug 2017 18:22:55 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> Recent glibc have deprecated the implicit include of sys/sysmacros.h
> from sys/types.h. That means that the macros major and minor are no
> longer defined unless this header is included.
> 
> This problem was observed for host-e2fsprogs when building on a host
> with recent glibc.
> 
> Add an upstream patch that includes sys/sysmacros.h when needed.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Dagg Stompler <daggs@gmx.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
> Dagg, I prefer to cherry-pick this single commit on master instead of
> bumping the package, since the bump does quite a lot more than just
> this single change. Can you undo the bump, apply this patch, and see
> if that fixes the issue for you? If yes, please add your Tested-by.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
