From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 18:52:33 +0200
Subject: [Buildroot] [PATCH 1 of 5 RFC] uclibc: menuconfig: take into
 account initial settings from config file
In-Reply-To: <97d74ccbe054d9a16465.1403444740@localhost>
References: <patchbomb.1403444739@localhost>
 <97d74ccbe054d9a16465.1403444740@localhost>
Message-ID: <20140622185233.0d553f8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sun, 22 Jun 2014 15:45:40 +0200, Thomas De Schampheleire wrote:

>  uclibc-menuconfig: uclibc-patch
> +	$(UCLIBC_COPY_DOT_CONFIG)

But then if I repeatedly do several uclibc-menuconfig to adjust the
configuration, before restarting the build, I'm going to loose my
changes, no?

Say that UCLIBC_CONFIG_FILE=package/uclibc/uclibc-0.9.33.x.config, and
the following sequence of event:

 1/ Make uclibc-menuconfig. The $(UCLIBC_CONFIG_FILE) gets copied to
    $(BUILD_DIR)/uclibc-<version>/.config.

    I make a change in the uClibc configuration. It gets saved as
    $(BUILD_DIR)/uclibc-<version>/.config.

 2/ I do make uclibc-menuconfig again, because I forgot something. The
    $(UCLIBC_CONFIG_FILE) gets copied to
    $(BUILD_DIR)/uclibc-<version>/.config. I've lost the change I've
    made in step (1).

Am I missing something?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
