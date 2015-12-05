From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 06 Dec 2015 00:11:24 +0100
Subject: [Buildroot] [V3 1/2] pkg-perl: avoid insertion of host-perl in
 the	shebang of scripts
References: <1449257217-8021-1-git-send-email-francois.perrad@gadz.org>
 <1449257217-8021-2-git-send-email-francois.perrad@gadz.org>
Message-ID: <sh7cjcx654.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Fri, 04 Dec 2015 20:26:56 +0100 schrieb Francois Perrad:

> Signed-off-by: Francois Perrad
> <francois.perrad@gadz.org>
> ---
>  package/pkg-perl.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/pkg-perl.mk b/package/pkg-perl.mk index
> a06c068..a027810 100644 --- a/package/pkg-perl.mk +++
> b/package/pkg-perl.mk @@ -140,6 +140,7 @@ define $(2)_BUILD_CMDS
>  	else \
>  		$$(MAKE1) \
>  			PERL_INC=$$(STAGING_DIR)/usr/lib/perl5/$
$(PERL_VERSION)/$$(PERL_ARCHNAME)/CORE
>  			\
> +			FIXIN=: \
>  			$$($(2)_BUILD_OPTS) pure_all; \
>  	fi
>  endef

Tested-by: Bernd Kuhls <bernd.kuhls@t-online.de>
(compile tested with Spamassassin, noticed no problems)
