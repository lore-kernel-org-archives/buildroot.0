From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Apr 2015 20:51:29 +0200
Subject: [Buildroot] [PATCHv3 14/18] Makefile: implement the 'source'
 target using the package infrastructure
In-Reply-To: <1429972982-25495-15-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1429972982-25495-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1429972982-25495-15-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150425185129.GQ4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-04-25 16:42 +0200, Thomas Petazzoni spake thusly:
> Now that all the bits are in place, switch the global 'source' target
> to use the package infrastructure logic.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> [with 'make source' (actually together with the next patch).]
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Still that superfluous SoB line... ;-)

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[tested with a randpackageconfig]

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index f5ff574..e8a694b 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -612,7 +612,7 @@ target-post-image: $(TARGETS_ROOTFS) target-finalize
>  		$(call MESSAGE,"Executing post-image script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(BINARIES_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> -source: $(PACKAGES_SOURCE) $(HOST_SOURCE)
> +source: $(foreach p,$(PACKAGES),$(p)-all-source)
>  
>  _external-deps: $(foreach p,$(PACKAGES),$(p)-all-external-deps)
>  external-deps:
> -- 
> 2.1.0
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
