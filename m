From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 22:11:45 +0100
Subject: [Buildroot] [PATCH 1/4 v2] core/download: drop the SSH command
In-Reply-To: <3112a0a19120c6af84b83833aa09014a3dd95fb5.1542474939.git.yann.morin.1998@free.fr>
References: <cover.1542474939.git.yann.morin.1998@free.fr>
 <3112a0a19120c6af84b83833aa09014a3dd95fb5.1542474939.git.yann.morin.1998@free.fr>
Message-ID: <20181119221145.3920ef06@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 17 Nov 2018 18:15:48 +0100, Yann E. MORIN wrote:
> The ssh command was added back in 2011 with commit c61788f09 (GENTARGETS:
> add support for scp://) and was used to check that the remote file
> existed, back when we supported 'make source-check'.
> 
> However, in 2017, with commit bf28a165d (pkg-{download, generic}: remove
> source-check), we actually removed support for source-check.
> 
> The SSH command however was not removed then, and stuck, even though
> nothing ever uses it It is not even exported in the environment, and scp
> does not use it either (it has -S to specify an ssh-compatible program).
> 
> Get rid of it.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> ---
>  Config.in               | 4 ----
>  package/pkg-download.mk | 1 -
>  2 files changed, 5 deletions(-)

Applied to next, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
