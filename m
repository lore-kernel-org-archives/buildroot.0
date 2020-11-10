From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Nov 2020 08:42:56 +0100
Subject: [Buildroot] [PATCH v2 1/2] linux: bump CIP kernel to version
 4.19.152-cip37
In-Reply-To: <20201109213304.2549190-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Mon, 9 Nov 2020 22:33:03 +0100")
References: <20201109213304.2549190-1-angelo@amarulasolutions.com>
Message-ID: <87r1p1pshr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:

 > This patch bumps Linux CIP to version 4.19.152-cip37
 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 v1-> v2:
 > * Fixing hash
 >  linux/Config.in  | 4 ++--
 >  linux/linux.hash | 2 +-
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 5e8390647a..2c69b842f3 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -31,7 +31,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 >  	bool "Latest version (5.9)"
 
 >  config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 > -	bool "Latest CIP SLTS version (4.19.132-cip30)"
 > +	bool "Latest CIP SLTS version (4.19.152-cip37)"
 >  	help
 >  	  CIP launched in the spring of 2016 to address the needs of
 >  	  organizations in industries such as power generation and
 > @@ -126,8 +126,8 @@ endif
 >  config BR2_LINUX_KERNEL_VERSION
 >  	string
 >  	default "5.9" if BR2_LINUX_KERNEL_LATEST_VERSION
 > -	default "4.19.132-cip30" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 >  	default "4.19.132-cip30-rt12" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 > +	default "4.19.152-cip37" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION

It is a bit odd that you move this line around (and move it back in
patch 2), but ok - Committed, thanks.

-- 
Bye, Peter Korsgaard
