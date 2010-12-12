From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 13 Dec 2010 00:08:42 +0100
Subject: [Buildroot] [PATCH 16/17] bzip2: ensure target directories
	exist before copying into
In-Reply-To: <1291802049-18764-17-git-send-email-llandwerlin@gmail.com>
	(llandwerlin@gmail.com's message of "Wed, 8 Dec 2010 10:54:08 +0100")
References: <1291802049-18764-1-git-send-email-llandwerlin@gmail.com>
	<1291802049-18764-17-git-send-email-llandwerlin@gmail.com>
Message-ID: <87ipyyk2rp.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "llandwerlin" == llandwerlin  <llandwerlin@gmail.com> writes:

 llandwerlin> From: Lionel Landwerlin <llandwerlin@gmail.com>
 llandwerlin> Also simply installation rules a little

 
 llandwerlin> -# make sure busybox doesn't get overwritten by make install
 llandwerlin>  define BZIP2_INSTALL_TARGET_CMDS
 llandwerlin> -	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,bzip2 bunzip2 bzcat)
 llandwerlin>  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
 llandwerlin>  	$(MAKE) PREFIX=$(TARGET_DIR)/usr -C $(@D) install
 llandwerlin>  	cp $(@D)/libbz2.so.$(BZIP2_SONAME) $(TARGET_DIR)/usr/lib/

Please don't, as this breaks busybox as long as we use a shared
TARGET_DIR (see 3917ab310490)

-- 
Bye, Peter Korsgaard
