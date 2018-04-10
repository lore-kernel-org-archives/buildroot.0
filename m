From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 10 Apr 2018 09:36:40 +0200
Subject: [Buildroot] [PATCHv2] download/git: more resilient in case of
 kill
In-Reply-To: <20180409215651.549-1-yann.morin.1998@free.fr>
References: <20180409215651.549-1-yann.morin.1998@free.fr>
Message-ID: <20180410093640.0ffcaab1@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 23:56:51 +0200, Yann E. MORIN wrote:
> In case the git backend gets killed right in-between it finished
> initialising the repository, but before it could add the remote,
> we'd end up with a repository without the 'origin' remote, so we
> would not be able to change its URL.
> 
> Another case that may happen (like in the build failure, below),
> is that the repository was initialised with a previous version
> of Buildroot, before the commit e17719264b (download/git: don't
> require too-recent git) was applied, and that trepository was
> still lying around...
> 
> Fixes:
>     http://autobuild.buildroot.org/results/25a/25aae054634368fadb265b97ebe4dda809deff6f/
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> 
> ---
> Changes v1 -> v2:
>   - remove extraneous pushd/popd  (Thomas)
>   - fix if-block condition
> ---
>  support/download/git | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
