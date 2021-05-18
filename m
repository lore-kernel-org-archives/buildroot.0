From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 May 2021 22:31:59 +0200
Subject: [Buildroot] [PATCH] Makefile: remove pkg-stats data on clean
In-Reply-To: <20210518202817.2197910-1-yann.morin.1998@free.fr>
References: <20210518202817.2197910-1-yann.morin.1998@free.fr>
Message-ID: <20210518203159.GA2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2021-05-18 22:28 +0200, Yann E. MORIN spake thusly:
> Like commit 1f187371d002 for cpe-updates data, also remove pkg-stats
> data on clean.
> 
> Unlike the rest, those are not nicely located in a directory of their
> own, and have no variable name associated with them, so we just need
> to repeat their names in the clean rule.
> 
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Matthew Weber <matthew.weber@rockwellcollins.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index c3305f46e9..9d2c0d8ecb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1089,7 +1089,8 @@ printvars:
>  clean:
>  	rm -rf $(BASE_TARGET_DIR) $(BINARIES_DIR) $(HOST_DIR) $(HOST_DIR_SYMLINK) \
>  		$(BUILD_DIR) $(BASE_DIR)/staging \
> -		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR)
> +		$(LEGAL_INFO_DIR) $(GRAPHS_DIR) $(PER_PACKAGE_DIR) $(CPE_UPDATES_DIR) \
> +		$(O)/pkg-stats.*
>  
>  .PHONY: distclean
>  distclean: clean
> -- 
> 2.25.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
