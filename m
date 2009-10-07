From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 07 Oct 2009 22:30:05 +0200
Subject: [Buildroot] [PATCH 07/14] *-menuconfig needs dirs to exist
In-Reply-To: <53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
	(Bernhard Reutner-Fischer's message of "Wed\,
	7 Oct 2009 22\:08\:30 +0200")
References: <cover.1254945750.git.rep.dot.nop@gmail.com>
	<4acf0a418a2f34c50249d56c6e76b8dba7076302.1254945750.git.rep.dot.nop@gmail.com>
	<8ddd0fbdd88acec5c801c93ce830b1ad04536118.1254945750.git.rep.dot.nop@gmail.com>
	<b1a1dc13edb6053d271297a4ac369d848c5f5749.1254945750.git.rep.dot.nop@gmail.com>
	<a576ef52cd1f156525fd2d327f1e7da466257be2.1254945750.git.rep.dot.nop@gmail.com>
	<df7563b3e1a87daa6f42ade2c505fecc014aa2a2.1254945750.git.rep.dot.nop@gmail.com>
	<382fdbb8e5e36dd9348dfd57b9267862ef8d2ead.1254945750.git.rep.dot.nop@gmail.com>
	<cover.1254945750.git.rep.dot.nop@gmail.com>
	<53e08690da5a307328d4d5dc7d53865215ced09f.1254945750.git.rep.dot.nop@gmail.com>
Message-ID: <87my43j6b6.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernhard" == Bernhard Reutner-Fischer <rep.dot.nop@gmail.com> writes:

Hi,
 
 Bernhard> -busybox-menuconfig: host-sed $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
 Bernhard> +busybox-menuconfig: host-sed dirs $(BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.config
 Bernhard>  	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig

dirs includes BUILD_DIR, so we could get rid of that.

-- 
Bye, Peter Korsgaard
