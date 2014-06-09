From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 10 Jun 2014 00:28:25 +0200
Subject: [Buildroot] [RFCv1 4/4] Makefile: implement a graph-size target
In-Reply-To: <1402177567-8021-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1402177567-8021-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1402177567-8021-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20140609222825.GM3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-06-07 23:46 +0200, Thomas Petazzoni spake thusly:
> Like we have graph-build and graph-depends, this commit implements a
> graph-size target to generate the corresponding graph.

Do not forget about the manual! ;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  Makefile | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Makefile b/Makefile
> index 0b4264a..fee6b46 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -677,6 +677,11 @@ graph-depends:
>  	|tee $(O)/graphs/$(@).dot \
>  	|dot -T$(BR_GRAPH_OUT) -o $(O)/graphs/$(@).$(BR_GRAPH_OUT)
>  
> +graph-size:
> +	@$(INSTALL) -d $(O)/graphs
> +	@cd "$(TOPDIR)"; \
> +	./support/scripts/graph-size --builddir $(O) --output $(O)/graphs/$(@).$(BR_GRAPH_OUT)
> +
>  else # ifeq ($(BR2_HAVE_DOT_CONFIG),y)
>  
>  all: menuconfig
> @@ -892,6 +897,7 @@ endif
>  	@echo '  manual-epub            - build manual in ePub'
>  	@echo '  graph-build            - generate graphs of the build times'
>  	@echo '  graph-depends          - generate graph of the dependency tree'
> +	@echo '  graph-size             - generate graph of the filesystem size'
>  	@echo
>  	@echo 'Miscellaneous:'
>  	@echo '  source                 - download all sources needed for offline-build'
> -- 
> 2.0.0
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
