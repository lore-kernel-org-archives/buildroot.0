From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 14 Sep 2007 13:26:18 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lm-sensors
In-Reply-To: <46EA589C.3060407@carallon.com>
References: <20070901180109.C927EA5D29@busybox.net>
	<12670634.post@talk.nabble.com> <20070914092913.GA26234@aon.at>
	<46EA589C.3060407@carallon.com>
Message-ID: <20070914112618.GA28176@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 14, 2007 at 10:47:08AM +0100, Will Wagner wrote:
> Bernhard,
>
> Meant to say thank you for adding this package. I managed to get it 

welcome.

> building with the following patch:
>
> Index: package/lm-sensors/lm-sensors.mk
> ===================================================================
> --- package/lm-sensors/lm-sensors.mk	(revision 19797)
> +++ package/lm-sensors/lm-sensors.mk	(working copy)
> @@ -40,6 +40,10 @@
>  $(TARGET_DIR)/$(LM_SENSORS_TARGET_BINARY): 
> $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY)
>  	cp -dpf $(LM_SENSORS_DIR)/$(LM_SENSORS_BINARY) $@
>  	$(STRIP) $(STRIP_STRIP_ALL) $@
> +	cp -dpf $(LM_SENSORS_DIR)/etc/sensors.conf.eg 
> $(TARGET_DIR)/etc/sensors.conf
> +	cp -dpf $(LM_SENSORS_DIR)/lib/libsensors.so.3.1.4 $(TARGET_DIR)/lib
> +	(cd $(TARGET_DIR)/lib && ln -s libsensors.so.3.1.4 libsensors.so.3)
> +	(cd $(TARGET_DIR)/lib && ln -s libsensors.so.3 libsensors.so)

well, libsensors* should live in usr/lib. Try r19830. Ok now?

thanks,
