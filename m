From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 22:18:00 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/ofono: use target ell
 library if enabled
In-Reply-To: <20191022134341.34426-2-nicolas.serafini@sensefly.com>
References: <20191022134341.34426-1-nicolas.serafini@sensefly.com>
 <20191022134341.34426-2-nicolas.serafini@sensefly.com>
Message-ID: <20191022221800.55e4bb76@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Nicolas,

On Tue, 22 Oct 2019 13:44:08 +0000
Nicolas Serafini <nicolas.serafini@sensefly.com> wrote:

> +ifeq ($(BR2_PACKAGE_ELL),y)
> +OFONO_DEPENDENCIES += ell
> +OFONO_CONF_OPTS += --enable-external-ell
> +else
> +OFONO_CONF_OPTS += --disable-external-ell
> +endif

If I understand correctly the code, ell is in fact always needed by
ofono. If ell is not available externally, it uses a bundled version of
ell.

In this case, Buildroot prefers to always use the external library, so
could you turn ell into a mandatory dependency of ofono, and pass
--enable-external-ell unconditionally?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
