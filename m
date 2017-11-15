From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Nov 2017 22:09:35 +0100
Subject: [Buildroot] [PATCH v2 1/3] package/feh: Fix build issue with
 some older cross-compilers
In-Reply-To: <20171115132754.9755-1-petr.vorel@gmail.com>
References: <20171115132754.9755-1-petr.vorel@gmail.com>
Message-ID: <20171115220935.03b64e14@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 15 Nov 2017 14:27:52 +0100, Petr Vorel wrote:

>  define FEH_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE1) CC="$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS)" \
> -		-C $(@D) all
> +	$(TARGET_MAKE_ENV) CFLAGS="$(TARGET_CFLAGS) -std=gnu11" $(MAKE1) \

std=gnu11 was only added in gcc 4.7, so using this would break the
build with gcc < 4.7. According to the error message, only C99 is
needed, so could you try instead -std=c99, which is available since at
least gcc 4.2 ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
