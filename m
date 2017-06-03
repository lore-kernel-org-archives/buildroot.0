From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Jun 2017 19:04:07 +0200
Subject: [Buildroot] [PATCH 2/2] package/exiv2: fix glibc pthread
 detection
In-Reply-To: <20170603163012.21169-2-bernd.kuhls@t-online.de>
References: <20170603163012.21169-1-bernd.kuhls@t-online.de>
 <20170603163012.21169-2-bernd.kuhls@t-online.de>
Message-ID: <20170603190407.45419f96@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Jun 2017 18:30:12 +0200, Bernd Kuhls wrote:
> Patch ported from librtlsdr:
> https://git.busybox.net/buildroot/commit/?id=4c6eace6f756d15ae9639a503c9245d1e7fb12a9

Could you explain a bit more? This commit is about fixing a static
linking issue...

> Fixes
> http://autobuild.buildroot.net/results/6c0/6c0264bf35c4cc0c4afaf6001930fdbd6125029d/

... but this configuration is not a static linking one.

> -EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
> +EXIV2_CONF_OPTS += \
> +	-DEXIV2_ENABLE_BUILD_SAMPLES=OFF \
> +	-DTHREADS_PTHREAD_ARG=OFF

Clearly this needs a comment in the .mk file, as one could understand
this as "let's disable thread support".

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
