From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 9 Oct 2018 15:09:16 +0200
Subject: [Buildroot] [PATCH 2/4] package/asterisk: enable for non-glibc
 toolchains
In-Reply-To: <20181003131358.28002-2-bernd.kuhls@t-online.de>
References: <20181003131358.28002-1-bernd.kuhls@t-online.de>
 <20181003131358.28002-2-bernd.kuhls@t-online.de>
Message-ID: <20181009150916.1703c4ef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  3 Oct 2018 15:13:56 +0200, Bernd Kuhls wrote:
> Quoting Yann:
> http://lists.busybox.net/pipermail/buildroot/2017-September/203004.html
> 
> "As a final stroke of genius, asterisk checks for the re-entrant variant
> of res_ninit(), and concludes that all such functions are available,
> including res_nsearch(). Uclibc-ng has the former but not the latter, so
> the build fails. Since there is no cache variable for that check, we
> can't pre-feed that result to configure, and fixing it is a bigger
> endeavour.  So we make asterisk depend on glibc for now, until someone
> is brave enough to fix it."
> 
> This hack was copied from Optware:
> https://github.com/Optware/Optware-ng/blob/master/make/asterisk13.mk#L331
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/asterisk/Config.in   | 6 ++----
>  package/asterisk/asterisk.mk | 4 ++++
>  2 files changed, 6 insertions(+), 4 deletions(-)

I agree with Arnout here, we want to fix this with a proper autoconf
check. I've marked this patch as Changes Requested. Could you rework it?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
