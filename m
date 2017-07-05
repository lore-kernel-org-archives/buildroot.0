From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 18:11:44 +0200
Subject: [Buildroot] [PATCH] toolchain/helpers.mk: fix creation of
 DESTDIR in copy_toolchain_lib_root
In-Reply-To: <20170705145418.25101-1-arnout@mind.be>
References: <20170705145418.25101-1-arnout@mind.be>
Message-ID: <20170705181144.7d30042f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 5 Jul 2017 16:54:18 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> In commit b3cc7e65ee, the definition of the DESTDIR variable was moved
> down into the loop that follows symlinks in the libraries that are
> copied to target. However, the corresponding mkdir was not moved down,
> so that no directories are ever created.
> 
> In practice, this mkdir is normally redundant since the directories
> should already have been created as part of creating STAGING_DIR.
> Still, the current situation is clearly wrong, so fix it by moving the
> mkdir down to after the assignment to DESTDIR.
> 
> While we're at it, also remove a redundant empty line. It's a leftover
> from when a lot of variables were declared above.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  toolchain/helpers.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
