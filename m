From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Dec 2010 23:59:23 +0100
Subject: [Buildroot] [PATCH 05/17] ifplugd: ensure target directories
	exist before copying into
In-Reply-To: <1291802049-18764-6-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 8 Dec 2010 10:53:57 +0100")
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-6-git-send-email-llandwerlin@gmail.com>
Message-ID: <87zksak378.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> ---
 llandwerlin>  package/ifplugd/ifplugd.mk |    1 +
 llandwerlin>  1 files changed, 1 insertions(+), 0 deletions(-)

 llandwerlin> diff --git a/package/ifplugd/ifplugd.mk b/package/ifplugd/ifplugd.mk
 llandwerlin> index 5e66cea..0be903c 100644
 llandwerlin> --- a/package/ifplugd/ifplugd.mk
 llandwerlin> +++ b/package/ifplugd/ifplugd.mk
 llandwerlin> @@ -22,6 +22,7 @@ define IFPLUGD_INSTALL_FIXUP
 llandwerlin>  		$(INSTALL) $(@D)/conf/ifplugd.conf $(TARGET_DIR)/etc/ifplugd/; \
 llandwerlin>  		$(SED) 's^\(ARGS=.*\)w^\1^' $(TARGET_DIR)/etc/ifplugd/ifplugd.conf; \
 llandwerlin>  	fi
 llandwerlin> +	mkdir -p $(TARGET_DIR)/etc/ifplugd

Hmm, just a few lines above we have install -d $(TARGET_DIR)/etc/ifplugd
- Isn't that working for you?

-- 
Bye, Peter Korsgaard
