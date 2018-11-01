From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 1 Nov 2018 21:27:01 +0100
Subject: [Buildroot] [PATCH] meson: re-add patch for skipping RPATH
 fixing
In-Reply-To: <20181027175922.26750-1-eric.le.bihan.dev@free.fr>
References: <20181027175922.26750-1-eric.le.bihan.dev@free.fr>
Message-ID: <20181101212701.72be6f3b@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 27 Oct 2018 19:59:22 +0200, Eric Le Bihan wrote:
> The patch to skip RPATH fixing performed by Meson was removed in commit
> a03f46ca6e9f43028003aedc92f1a1204ae7480f, as the script
> support/scripts/check-host-rpath was not complaining anymore.
> 
> But without it, the problem still occurs for host packages [1].
> 
> So, restore this patch to fix build of host packages with Meson.
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-October/232956.html
> 
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> ---
>  ...y-fix-RPATH-if-install_rpath-is-not-empty.patch | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 package/meson/0001-Only-fix-RPATH-if-install_rpath-is-not-empty.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
