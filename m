From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 26 Oct 2015 21:44:07 +0100
Subject: [Buildroot] [PATCH 05/21 v2] core: remove .br-external on
	distclean
In-Reply-To: <84027326a9f437b9c829a3a6f1e7c4616bf1ae1e.1445545973.git.yann.morin.1998@free.fr>
References: <cover.1445545973.git.yann.morin.1998@free.fr>
 <84027326a9f437b9c829a3a6f1e7c4616bf1ae1e.1445545973.git.yann.morin.1998@free.fr>
Message-ID: <562E9097.5060800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-10-15 22:34, Yann E. MORIN wrote:
> distclean is supposed to return the current directory, whether in-tree
> or out-of-tree, into pristine conditions, which means we should also
> forget about any br2-external tree on distclean.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Peter Korsgaard <jacmet@uclibc.org>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 That said: why don't we just remove $(O) unconditionally?


 Note that this can be applied independently of the rest of the series.


 Regards,
 Arnout


> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 052f58a..0e25bd1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -839,7 +839,7 @@ ifeq ($(O),output)
>  	rm -rf $(O)
>  endif
>  	rm -rf $(BR2_CONFIG) $(CONFIG_DIR)/.config.old $(CONFIG_DIR)/..config.tmp \
> -		$(CONFIG_DIR)/.auto.deps
> +		$(CONFIG_DIR)/.auto.deps $(BR2_EXTERNAL_FILE)
>  
>  help:
>  	@echo 'Cleaning:'
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
