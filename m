From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 00:01:09 +0100
Subject: [Buildroot] [PATCH 06/17] i2c-tools: ensure binaries are
	installed in the right place
In-Reply-To: <1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 8 Dec 2010 10:53:58 +0100")
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-7-git-send-email-llandwerlin@gmail.com>
Message-ID: <87r5dmk34a.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/i2c-tools/i2c-tools.mk |    2 +-
 llandwerlin>  1 files changed, 1 insertions(+), 1 deletions(-)

 llandwerlin> diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
 llandwerlin> index d419524..2e60407 100644
 llandwerlin> --- a/package/i2c-tools/i2c-tools.mk
 llandwerlin> +++ b/package/i2c-tools/i2c-tools.mk
 llandwerlin> @@ -12,10 +12,10 @@ define I2C_TOOLS_BUILD_CMDS
 llandwerlin>  endef
 
 llandwerlin>  define I2C_TOOLS_INSTALL_TARGET_CMDS
 llandwerlin> +	$(INSTALL) -m 755 -d $(TARGET_DIR)/usr/bin
 llandwerlin>  	for i in i2cdump i2cget i2cset i2cdetect; \
 llandwerlin>  	do \
 llandwerlin>  		$(INSTALL) -m 755 $(@D)/tools/$$i $(TARGET_DIR)/usr/bin/$$i; \

We could simply use install -D here instead.

-- 
Bye, Peter Korsgaard
