From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 17 Jun 2008 15:10:13 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <20080617125437.0554F3C70D@busybox.net>
References: <20080617125437.0554F3C70D@busybox.net>
Message-ID: <1213708213.13476.13.camel@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 2008-06-17 at 05:54 -0700, jacmet at uclibc.org wrote:
> Author: jacmet

<snipp>

> -	-strip --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*
> +	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/lib/libgcc_s*

$(STRIP_STRIP_UNNEEDED) as well?

>  endif
>  ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
>  ifeq ($(BR2_GCC_SHARED_LIBGCC),y)
>  	-cp -dpf $(STAGING_DIR)/lib/libstdc++.so* $(TARGET_DIR)/usr/lib/
> -	-strip --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*
> +	-$(STRIPCMD) --strip-unneeded $(TARGET_DIR)/usr/lib/libstdc++.so*

Same here.

<snipp>

-- 
With kind regards,
Hans-Christian Egtvedt, Applications Engineer
