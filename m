From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Sep 2013 13:34:10 +0200
Subject: [Buildroot] [git commit] libevas: async image preload support
 needs threads support in toolchain
In-Reply-To: <20130904113143.AE4BC9B6EA@busybox.osuosl.org>
References: <20130904113143.AE4BC9B6EA@busybox.osuosl.org>
Message-ID: <20130904133410.2f17a22f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Wed, 4 Sep 2013 13:31:19 +0200, Peter Korsgaard wrote:

> +# async image preload support needs threads support in toolchain
> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)

Maybe using positive logic would have been better, no?

ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
...
endif

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
