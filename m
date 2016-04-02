From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Apr 2016 17:09:35 +0200
Subject: [Buildroot] [V2 3/3] dropbear: use libtomath & libtomcrypt
In-Reply-To: <1459524973-26730-3-git-send-email-francois.perrad@gadz.org>
References: <1459524973-26730-1-git-send-email-francois.perrad@gadz.org>
 <1459524973-26730-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20160402170935.7030becf@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  1 Apr 2016 17:36:13 +0200, Francois Perrad wrote:

> +ifeq ($(BR2_PACKAGE_LIBTOMMATH)$(BR2_PACKAGE_LIBTOMCRYPT),yy)
> +DROPBEAR_DEPENDENCIES += libtommath libtomcrypt
> +DROPBEAR_CONF_OPTS += --disable-bundled-libtom
> +else
> +DROPBEAR_CONF_OPTS += --enable-bundled-libtom
> +endif

Our principle is to avoid bundled libraries when possible. So should we
make Dropnbear always select libtommath/libtomcrypt ?

We could make an exception for Dropbear, as its main point is to be
small and fast to build, and unbundling will necessarily mean a
slightly longer build.

With bundled libraries (i.e original, building dropbear only) :

real	0m19.178s
user	0m35.240s
sys	0m5.308s

With unbundled libraries (i.e with libtommath/libtomcrypt built
separately) :

real	0m23.593s
user	0m50.500s
sys	0m6.000s

Not super significant change. So I think I'm in favor of unbundling.

Other opinions?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
