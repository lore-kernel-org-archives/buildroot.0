From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 26 May 2014 11:38:40 +0200
Subject: [Buildroot] [WIP PATCH 2/5] gcc-final: disable shared build for
 static
In-Reply-To: <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
References: <1401055980-28742-1-git-send-email-gustavo@zacarias.com.ar>
 <1401055980-28742-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140526113840.3473ed77@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 25 May 2014 19:12:57 -0300, Gustavo Zacarias wrote:

>  ifneq ($(HOST_GCC_FINAL_USR_LIBS),)
> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
> +define HOST_GCC_FINAL_INSTALL_USR_LIBS
> +	mkdir -p $(TARGET_DIR)/usr/lib
> +	for i in $(HOST_GCC_FINAL_USR_LIBS) ; do \
> +		cp -dpf $(HOST_DIR)/usr/$(GNU_TARGET_NAME)/lib*/$${i}.a \
> +			$(STAGING_DIR)/usr/lib/ ; \
> +	done
> +endef

No, we want to install .a files as well in my opinion. In fact, the
patch series I have to rename BR2_PREFER_STATIC_LIB makes things even
clearer, with three possibilities: pure static, static and shared, pure
shared.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
