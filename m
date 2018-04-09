From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 21:01:56 +0200
Subject: [Buildroot] [PATCH v3] Makefile: Avoid executing 'git log' each
 time SOURCE_DATE_EPOCH is used
In-Reply-To: <1523290081-35341-1-git-send-email-james.byrne@origamienergy.com>
References: <1523010383-27024-1-git-send-email-james.byrne@origamienergy.com>
 <1523290081-35341-1-git-send-email-james.byrne@origamienergy.com>
Message-ID: <20180409210156.748a2959@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  9 Apr 2018 17:08:01 +0100, James Byrne wrote:
> If SOURCE_DATE_EPOCH is not defined it was given a definition that
> caused 'git log' to be executed each time the variable is referenced,
> which is not very efficient given that the answer cannot change.
> 
> This commit moves the definition of BR2_VERSION_GIT_EPOCH after the
> inclusion of Makefile.in (so that GIT is defined) and makes it a simply
> expanded variable so that it is only evaluated once.
> 
> Signed-off-by: James Byrne <james.byrne@origamienergy.com>
> ---
>  Makefile | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
