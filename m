From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Oct 2017 21:59:15 +0200
Subject: [Buildroot] [PATCH 1/2] msgpack: fix build without threads
 support
In-Reply-To: <10b0beaaa7f14fb4847cb2c1d7cdda39ce6aa566.1508251333.git.baruch@tkos.co.il>
References: <10b0beaaa7f14fb4847cb2c1d7cdda39ce6aa566.1508251333.git.baruch@tkos.co.il>
Message-ID: <20171017215915.2e0f34e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 17 Oct 2017 17:42:12 +0300, Baruch Siach wrote:

> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> +MSGPACK_CONF_OPTS += -DMSGPACK_BUILD_EXAMPLES=OFF
> +endif

We generally disable building examples unconditionally, so I've done
that instead, and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
