From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 02 Oct 2012 08:46:55 +0200
Subject: [Buildroot] [PATCH] connman: bump to version 1.7
In-Reply-To: <1348232059-1055-1-git-send-email-net147@gmail.com> (Jonathan
 Liu's message of "Fri, 21 Sep 2012 22:54:19 +1000")
References: <1348232059-1055-1-git-send-email-net147@gmail.com>
Message-ID: <87ipat4bhc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Jonathan" == Jonathan Liu <net147@gmail.com> writes:

 Jonathan> Signed-off-by: Jonathan Liu <net147@gmail.com>
 Jonathan> ---
 Jonathan>  package/connman/connman.mk | 4 ++--
 Jonathan>  1 file changed, 2 insertions(+), 2 deletions(-)

 Jonathan> diff --git a/package/connman/connman.mk b/package/connman/connman.mk
 Jonathan> index ed83ebc..07122df 100644
 Jonathan> --- a/package/connman/connman.mk
 Jonathan> +++ b/package/connman/connman.mk
 Jonathan> @@ -4,7 +4,7 @@
 Jonathan>  #
 Jonathan>  #######################################################
 
 Jonathan> -CONNMAN_VERSION = 1.6
 Jonathan> +CONNMAN_VERSION = 1.7
 Jonathan>  CONNMAN_SITE = $(BR2_KERNEL_MIRROR)/linux/network/connman/
 Jonathan>  CONNMAN_DEPENDENCIES = libglib2 dbus iptables gnutls
 Jonathan>  CONNMAN_INSTALL_STAGING = YES
 Jonathan> @@ -27,7 +27,7 @@ ifeq ($(BR2_PACKAGE_CONNMAN_CLIENT),y)
 Jonathan>  CONNMAN_CONF_OPT += --enable-client
 
 Jonathan>  define CONNMAN_INSTALL_CM
 Jonathan> -	$(INSTALL) -m 0755 -D $(@D)/client/cm $(TARGET_DIR)/usr/bin/cm
 Jonathan> +	$(INSTALL) -m 0755 -D $(@D)/client/connmanctl $(TARGET_DIR)/usr/bin/connmanctl

The client application needs readline, but I fixed that and committed,
thanks.

-- 
Bye, Peter Korsgaard
