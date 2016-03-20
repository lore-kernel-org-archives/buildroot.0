From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Mar 2016 22:35:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/luajit: build host variant
 dynamically
In-Reply-To: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
References: <1457132443-15973-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160320223559.39324d13@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  5 Mar 2016 00:00:42 +0100, Romain Naour wrote:

> +# host-efl package needs host-luajit to be linked dynamically.
>  define HOST_LUAJIT_BUILD_CMDS
> -	$(MAKE) PREFIX="/usr" BUILDMODE=static -C $(@D) amalg
> +	$(MAKE) PREFIX="/usr" BUILDMODE=dynamic \
> +		TARGET_LDFLAGS="$(HOST_LDFLAGS) -Wl,-rpath,$(HOST_DIR)/usr/lib/" \

-Wl,-rpath,... is already in HOST_LDFLAGS, so adding it is not
necessary. Passing HOST_LDFLAGS is sufficient.

I've fixed that up, adjusted the commit log accordingly, and applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
