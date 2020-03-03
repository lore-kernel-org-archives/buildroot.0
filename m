From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 3 Mar 2020 22:30:48 +0100
Subject: [Buildroot] [PATCH] Makefile: remove bogus comment
In-Reply-To: <20200303210947.1392808-1-thomas.petazzoni@bootlin.com>
References: <20200303210947.1392808-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200303213048.GE12449@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2020-03-03 22:09 +0100, Thomas Petazzoni spake thusly:
> The comment "Check files that are touched by more than one package"
> was previously located right before the calls to the check-uniq-files
> script. However, this script and the logic calling it have been
> removed in commit 2496189a4207173e4cd5bbab90256f911175ee57 ("core:
> drop check-uniq-files"), so the comment no longer makes any sense:
> let's drop it.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 10874e9b44..31624f77a2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -736,7 +736,6 @@ staging-finalize: $(STAGING_DIR_SYMLINK)
>  target-finalize: $(PACKAGES) $(TARGET_DIR) host-finalize
>  	@$(call MESSAGE,"Finalizing target directory")
>  	$(call per-package-rsync,$(sort $(PACKAGES)),target,$(TARGET_DIR))
> -	# Check files that are touched by more than one package
>  	$(foreach hook,$(TARGET_FINALIZE_HOOKS),$($(hook))$(sep))
>  	rm -rf $(TARGET_DIR)/usr/include $(TARGET_DIR)/usr/share/aclocal \
>  		$(TARGET_DIR)/usr/lib/pkgconfig $(TARGET_DIR)/usr/share/pkgconfig \
> -- 
> 2.24.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
