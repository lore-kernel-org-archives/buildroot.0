From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Sep 2013 09:27:34 +0200
Subject: [Buildroot] [PATCH 1/1] linux: update depmod path for install
 to target
In-Reply-To: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
References: <1378850315-22371-1-git-send-email-bluemrp9@gmail.com>
Message-ID: <20130911092734.2c4bee5f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ryan Coe,

On Tue, 10 Sep 2013 14:58:35 -0700, Ryan Coe wrote:
>  		$(TARGET_MAKE_ENV) $(MAKE1) $(LINUX_MAKE_FLAGS) -C $(@D) 		\
> -			DEPMOD="$(HOST_DIR)/usr/sbin/depmod" modules_install ;		\
> +			DEPMOD="$(HOST_DIR)/sbin/depmod" modules_install ;		\

Not sure why we have to pass DEPMOD here since it's already part of
LINUX_MAKE_FLAGS. Am I missing something?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
