From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 14 May 2009 17:26:29 +0200
Subject: [Buildroot] [PATCH] Fix avahi build
In-Reply-To: <1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
	(root's message of "Wed\, 13 May 2009 18\:43\:24 -0300")
References: <1242251013-25228-1-git-send-email-thiago.correa@gmail.com>
	<1242251013-25228-2-git-send-email-thiago.correa@gmail.com>
Message-ID: <877i0jr9i2.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "root" == root  <thiago.correa@gmail.com> writes:

 root> Signed-off-by: Thiago A. Correa <thiago.correa@gmail.com>
 root> ---
 root>  package/avahi/avahi.mk |    1 +
 root>  1 files changed, 1 insertions(+), 0 deletions(-)

 root> +++ b/package/avahi/avahi.mk
 root> @@ -150,6 +150,7 @@ ifeq ($(BR2_PACKAGE_AVAHI_AUTOIPD),y)
 root>  	$(INSTALL) -D -m 0755 package/avahi/busybox-udhcpc-default.script $(TARGET_DIR)/usr/share/udhcpc/default.script
 root>  	$(INSTALL) -m 0755 package/avahi/S05avahi-setup.sh $(TARGET_DIR)/etc/init.d/
 root>  	rm -f $(TARGET_DIR)/var/lib/avahi-autoipd
 root> +	mkdir -p $(TARGET_DIR)/var/lib/

What exactly does this fix? It seems like we should have /var/lib/ as
we're removing /var/lib/avahi-autoipd?

A bit more detailed description in your commit message would be good.

-- 
Bye, Peter Korsgaard
