From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 22 Jul 2011 13:34:15 +0200
Subject: [Buildroot] [PATCH] dropbear: Create destination directories
	before use in install stage.
In-Reply-To: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
 (Quotient Remainder's message of "Fri, 22 Jul 2011 12:05:46 +0100")
References: <1311332746-8143-1-git-send-email-quotientvremainder@gmail.com>
Message-ID: <87sjpyy2fc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Quotient" == Quotient Remainder <quotientvremainder@gmail.com> writes:

 Quotient> Signed-off-by: Quotient Remainder <quotientvremainder@gmail.com>

Real name please.

 Quotient> ---
 Quotient>  package/dropbear/dropbear.mk |    1 +
 Quotient>  1 files changed, 1 insertions(+), 0 deletions(-)

 Quotient> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
 Quotient> index 6ef5dec..2127096 100644
 Quotient> --- a/package/dropbear/dropbear.mk
 Quotient> +++ b/package/dropbear/dropbear.mk
 Quotient> @@ -47,6 +47,7 @@ DROPBEAR_DEPENDENCIES += zlib
 Quotient>  endif
 
 Quotient>  define DROPBEAR_INSTALL_TARGET_CMDS
 Quotient> +	mkdir -p $(TARGET_DIR)/usr/bin $(TARGET_DIR)/usr/sbin
 Quotient>  	$(INSTALL) -m 755 $(@D)/dropbearmulti $(TARGET_DIR)/usr/sbin/dropbear

I would prefer to use install -D like elsewhere to ensure usr/sbin is
created, and then move the mkdir -p just above the _TARGET_BINS loop.

 Quotient>  	for f in $(DROPBEAR_TARGET_BINS); do \
 Quotient>  		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 Quotient> -- 

-- 
Bye, Peter Korsgaard
