From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 11:44:57 +0200
Subject: [Buildroot] [PATCH 21/35] Makefile: simplify show-targets
In-Reply-To: <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20150406094457.GD4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> show-targets is only used currently by the graph-depends script, which
> already recurses into the dependencies of the selected packages to
> build the dependency graph. Therefore, dumping the contents of
> $(PACKAGES) and $(ROOTFS_TARGETS) is sufficient: $(HOST_DEPS) and
> $(TARGET_HOST_DEPS) will contain packages that are dependencies of
> packages already listed in $(PACKAGES), which graph-depends will
> discover by itself.
> 
> This allows to remove one more usage of $(HOST_DEPS) and
> $(TARGET_HOST_DEPS), which is one more step towards their removal.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

After reading your convining explanations about my previous concerns:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Thanks! :-)

Regards,
Yann E. MORIN.

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index ab54dda..0709751 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -644,7 +644,7 @@ legal-info: dirs legal-info-clean legal-info-prepare $(foreach p,$(PACKAGES),$(p
>  	@rm -f $(LEGAL_WARNINGS)
>  
>  show-targets:
> -	@echo $(HOST_DEPS) $(TARGETS_HOST_DEPS) $(PACKAGES) $(TARGETS_ROOTFS)
> +	@echo $(PACKAGES) $(TARGETS_ROOTFS)
>  
>  graph-build: $(O)/build/build-time.log
>  	@install -d $(O)/graphs
> -- 
> 2.1.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
