From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 22:16:12 +0200
Subject: [Buildroot] OLSR in buildroot - patch 06...may be?
In-Reply-To: <a63ecaf0709191256ya56a745n8bf3798892311892@mail.gmail.com>
References: <a63ecaf0709191256ya56a745n8bf3798892311892@mail.gmail.com>
Message-ID: <20070919201612.GS20058@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 04:56:20PM -0300, Sushi Sensei wrote:
>What file .config? buldroot/.config?
>There are not any more .config file in $(OLSR_DIR)
>
>>+olsr-clean:
>>+      rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>>+      rm -f $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)/olsrd_*.so.*
>>+      rm -f $(TARGET_DIR)/etc/init.d/S50olsr
>>+      -$(MAKE) -C $(OLSR_DIR) clean
>
>I think that I already asked you to rm the .config file, didn't I? ;)
>Please rm the .config file.
>
>

>+$(TARGET_DIR)/$(OLSR_TARGET_BINARY): $(OLSR_DIR)/$(OLSR_BINARY)
>+	rm -f $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -dpf $(OLSR_DIR)/$(OLSR_BINARY) $(TARGET_DIR)/$(OLSR_TARGET_BINARY)
>+	cp -R $(OLSR_DIR)/lib/*/olsrd_*.so.* $(TARGET_DIR)/$(OLSR_TARGET_PLUGIN)
>+	mkdir -p $(TARGET_DIR)/etc/init.d
>+	cp package/olsr/files/S50olsr $(TARGET_DIR)/etc/init.d/
>+	test -r $(TARGET_DIR)/etc/olsrd.conf || \
>+	    cp -dpf $(OLSR_DIR)/files/olsrd.conf.default.lq $(TARGET_DIR)/etc/olsrd.conf

this config ------------------------------------------------^
