From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 26 Sep 2012 22:46:34 +0200
Subject: [Buildroot] [PATCH 2/3] libdvdnav: Fix dvdnav-config
In-Reply-To: <20120926193351.GA3971@gmail.com>
References: <20120926193155.GA3942@gmail.com> <20120926193351.GA3971@gmail.com>
Message-ID: <20120926224634.7bddf310@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Valentine Barshak,

On Wed, 26 Sep 2012 23:33:51 +0400, Valentine Barshak wrote:

> +ifneq ($(BR2_HAVE_DEVFILES),y)
> +LIBDVDNAV_POST_INSTALL_TARGET_HOOKS += LIBDVDNAV_TARGET_CLEANUP
> +endif

We generally prefer positive logic:

ifeq ($(BR2_HAVE_DEVFILES),)
...
endif

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
