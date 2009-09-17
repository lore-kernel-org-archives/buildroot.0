From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Thu, 17 Sep 2009 18:17:13 +0200
Subject: [Buildroot] [PATCH 1/6] Remove the "project" feature
In-Reply-To: <1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1253135266-26880-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<1253135266-26880-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20090917161713.GA4647@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 16, 2009 at 11:07:41PM +0200, Thomas Petazzoni wrote:

> flush:
>-	rm -f $(PROJECT_BUILD_DIR)/tgt-config.cache
>+	rm -f $(BUILD_DIR)/tgt-config.cache
> 
> %_defconfig: $(CONFIG)/conf
> 	cp $(shell find ./target/ -name $@) .config
> 	-@$(MAKE) oldconfig

That find is gross. $(wildcard $(TOPDIR)/target/*/$(@)_defconfig)
and we have $(Q) that is either set to '@' or is empty.
Apart from that a failing oldconfig is and should be fatal.
