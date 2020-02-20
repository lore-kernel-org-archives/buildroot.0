From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Feb 2020 15:56:43 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/avahi: bump to version 0.8
In-Reply-To: <20200220091526.232214-1-joerg.krause@embedded.rocks>
References: <20200220091526.232214-1-joerg.krause@embedded.rocks>
Message-ID: <20200220155643.3989b5ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 20 Feb 2020 10:15:26 +0100
J?rg Krause <joerg.krause@embedded.rocks> wrote:

> This bump also includes:
>  * Drop upstream security patch which is included in the new version
>  * Unconditionally disable support for Qt5 [1] (same as Qt3 and Qt4)
>  * Drop dependency on host-inttool, as avahi switched to host-gettext [2]
>  * Conditionally enable support for libevent [3]
>  * Drop disabling support for Qt3, Qt4, and GTK, which are disabled by
>    default now
> 
> [1] https://github.com/lathiat/avahi/commit/5dbb32767ae3f5a371cfbd04b4e3a9a634b8efc4
> [2] https://github.com/lathiat/avahi/commit/3d5a0c68057e2ed76187a0bb565baaa10d566003
> [3] https://github.com/lathiat/avahi/commit/998e20cd76927ce978fb5676820a38308e21f45d
> 
> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> ---
> v2 [suggested by Thomas Petazzoni]:

Thanks!

>  * host-gettext (as replacement for host-intltool) is not needed
>  * drop disabling support for Qt3, Qt4, and GTK, which are already
>    disabled by default

Even if they are disabled by default, it's good to disable them
explicitly in the .mk file. My question in my previous review was more
"do they really still have qt3 support ?". But besides that I'm all for
keeping the --disable-<foo> for explicitly disabling features we don't
support.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
