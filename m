From: Ulf Samuelsson <ulf@atmel.com>
Date: Wed, 18 Apr 2007 16:42:02 +0200
Subject: [Buildroot] RFC  Building Linux under Buildroot.
References: <1176885902.8660.5.camel@elrond.sweden.atmel.com>
	<20070418114046.GA10335@aon.at>
	<01ba01c781b2$63d89a90$01c4af0a@Glamdring>
	<20070418133906.GA11554@aon.at>
Message-ID: <020f01c781c9$c7ba8d90$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>Yes, but the patchfiles are in a linux  patch directory.
>
> So, IIUC, it doesn't handle downloading multiple patchfiles yet?
> $(patsubst %,$(PATCHFILE_DIR)/%,$(foo_CUSTOM_PATCHES)): same_for_http
> wget ... -O $@
> may work.
>

As I see it, you want to have multiple patches
each located in different places in internet so you need to specify
both the name and the location.

I am more thinking of a

$ make atmel

command which will download a script with predefined name from a predefined 
server

atmel:
    wget    $(DL_DIR) $(BR2_ATMEL_SITE)/get_latest_atmel_patches.sh
    source $(DL_DIR)/get_latest_atmel_patches.sh
    rm -fr $(LINUX26_DIR)

The script will download target/device/Atmel/Linux/kernel.../*.patch

Probably better I supply the linux patch and then you patch on top of that.


Best Regards
Ulf Samuelsson
