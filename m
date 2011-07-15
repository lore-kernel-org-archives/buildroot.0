From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Jul 2011 20:59:04 +0200
Subject: [Buildroot] [PATCH] Makefile: unbreak source-check
In-Reply-To: <1310641353-7351-1-git-send-email-yann.morin.1998@anciens.enib.fr>
 (Yann E. MORIN's message of "Thu, 14 Jul 2011 13:02:33 +0200")
References: <1310641353-7351-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <87tyan8j5z.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@anciens.enib.fr> writes:

 Yann> 'source-check' breaks because the *_DEFCONFIG options are empty strings.
 Yann> There is an explicit check to avoid erroring-out when doing 'source', but
 Yann> not when doing 'source-check'.

 Yann> This patch set DL_MODE right from the first sub-make call.

Committed, thanks.
 
 Yann> -_source-check:
 Yann> -	$(MAKE) DL_MODE=SOURCE_CHECK $(EXTRAMAKEARGS) source
 Yann> -
 Yann>  external-deps:
 Yann>  	@$(MAKE) -Bs DL_MODE=SHOW_EXTERNAL_DEPS $(EXTRAMAKEARGS) source | sort -u
 
 Yann> @@ -595,7 +592,7 @@ savedefconfig: $(BUILD_DIR)/buildroot-config/conf outputmakefile
 
 Yann>  # check if download URLs are outdated
 Yann>  source-check: allyesconfig
 Yann> -	$(MAKE) $(EXTRAMAKEARGS) _source-check
 Yann> +	$(MAKE) $(EXTRAMAKEARGS) source DL_MODE=SOURCE_CHECK

trivial, but I reordered the args to match the other places ('source' at
the end).

-- 
Bye, Peter Korsgaard
