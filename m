From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 May 2017 21:48:49 +0200
Subject: [Buildroot] [PATCH] fbgrab: explicitly build fbgrab target to
 workaround gzip issue
In-Reply-To: <20170517145251.9047-1-peter@korsgaard.com>
References: <20170517145251.9047-1-peter@korsgaard.com>
Message-ID: <20170517214849.12844539@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 17 May 2017 16:52:51 +0200, Peter Korsgaard wrote:
> Fixes #9871
> 
> gzip reads default command line options from the environment variable GZIP.
> The fbgrab Makefile internally also uses a GZIP make variable to know what
> command to use to compress the manpage. Unfortunaly make will export the
> value of this make variable to the environment if GZIP is already present in
> the enviroment, confusing gzip (as 'gzip' isn't a valid command line argument).
> 
> This can either be triggered by users having GZIP set in their environment
> (E.G.  for custom options), or by enabling BR2_REPRODUCIBLE, where we use
> this feature to force the -n option (to not store name/timestamp) to gzip.
> 
> We don't really need to compress the manpage as it isn't installed anyway,
> so work around the issue by only building the fbgrab application.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/fbgrab/fbgrab.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
