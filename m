From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Sep 2016 23:39:17 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: use
 BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <20160905210056.24393-1-bernd.kuhls@t-online.de>
References: <20160905210056.24393-1-bernd.kuhls@t-online.de>
Message-ID: <20160905233917.329b142f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Sep 2016 23:00:56 +0200, Bernd Kuhls wrote:

> +# Uses __atomic_fetch_add_4
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
> +endif

Isn't this overriding the flags already passed? Shouldn't it be:

	-DCMAKE_CXX_FLAGS="${CMAKE_CXX_FLAGS} -latomic"

or something like that?

Samuel?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
