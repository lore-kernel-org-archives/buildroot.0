From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Jun 2014 13:58:51 +0200
Subject: [Buildroot] [PATCH] graph-depends: add missing -show-depends
 targets in Makefile
In-Reply-To: <179177855010c6804e72.1404126915@localhost>
References: <179177855010c6804e72.1404126915@localhost>
Message-ID: <20140630135851.139091e8@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 30 Jun 2014 13:15:15 +0200, Thomas De Schampheleire wrote:
> When running 'make graph-depends' on a configuration selecting
> toolchain-eclipse-register or target-generatelocales, the command fails:
> 
>   make[1]: *** No rule to make target `target-generatelocales-show-depends'.
>   Stop.
> 
> This patch adds the missing -show-depends targets.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
> 
> ---
>  Makefile |  6 ++++++
>  1 files changed, 6 insertions(+), 0 deletions(-)
> 
> diff -r 4d6d2ac6a601 -r 179177855010 Makefile
> --- a/Makefile	Thu Jun 19 18:13:36 2014 +0200
> +++ b/Makefile	Mon Jun 30 13:11:11 2014 +0200
> @@ -621,6 +621,9 @@
>  			-i $${inputfile} -f $${charmap} \
>  			$${locale} ; \
>  	done
> +
> +target-generatelocales-show-depends:
> +	@echo host-localedef toolchain
>  endif
>  
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
> @@ -631,6 +634,9 @@
>  toolchain-eclipse-register: toolchain
>  	./support/scripts/eclipse-register-toolchain `readlink -f $(O)` $(notdir $(TARGET_CROSS)) $(BR2_ARCH)
>  
> +toolchain-eclipse-register-show-depends:
> +	@echo toolchain
> +
>  source: $(TARGETS_SOURCE) $(HOST_SOURCE)

Your tree is not up-to-date, both of these targets have been converted
to TARGET_FINALIZE_HOOKS, so the problem you're seeing shouldn't occur
I believe. Am I missing something?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
