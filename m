From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 12 Mar 2019 22:01:04 +0100
Subject: [Buildroot] [PATCH 1/2] printvars: don't print anything when
 VARS is not set
In-Reply-To: <20190312175535.18152-1-arnout@mind.be>
References: <20190312173602.GE25009@scaer>
 <20190312175535.18152-1-arnout@mind.be>
Message-ID: <20190312220104.7acc0f67@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 12 Mar 2019 18:55:34 +0100
"Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be> wrote:

> Using 'make printvars' for printing all variables is not very useful.
> E.g. all macros will output some bogus value. In addition, the same can
> be achieved with 'make -p'.
> 
> We can simply remove the condition on $(VARS). If VARS is not set, the
> filter expression will be empty which matches nothing, so nothing is
> printed.
> 
> Note that the old behaviour can still be achieved with:
> make printvars VARS=%
> 
> Update the 'make help' text to match the new behaviour.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> ---
>  Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Both applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
