From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Apr 2010 15:15:44 +0200
Subject: [Buildroot] [PATCH 02/41] ncurses: convert to autotools
 infrastructure
In-Reply-To: <1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
References: <1271199974-30434-1-git-send-email-llandwerlin@gmail.com>
	<1271199974-30434-3-git-send-email-llandwerlin@gmail.com>
Message-ID: <20100414151544.788d923a@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 14 Apr 2010 01:05:35 +0200
llandwerlin at gmail.com wrote:

> From: Lionel Landwerlin <llandwerlin@gmail.com>
> 
> Signed-off-by: Lionel Landwerlin <llandwerlin@gmail.com>

Except Peter's comment:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

I think the mess to install development files on the target should be
changed to just use "make DESTDIR=$(TARGET_DIR) install" and then let
the main Buildroot Makefile remove /usr/include, .a and .la files and
all the like. However, this patch is just a conversion to the autotools
infrastructure, you kept the existing behaviour, which is ok. We can
later change this development file installation thing.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
