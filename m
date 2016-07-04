From: Alex Suykov <alex.suykov@gmail.com>
Date: Mon, 4 Jul 2016 17:45:12 +0300
Subject: [Buildroot] [PATCH 2/2 v4] board: add support for Chromebook
	Snow
In-Reply-To: <87eg7ampx0.fsf@dell.be.48ers.dk>
References: <20160105170013.GA18795@vostro> <87eg7ampx0.fsf@dell.be.48ers.dk>
Message-ID: <20160704144512.GA13296@vostro.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sun, Jul 03, 2016 at 10:23:39PM +0200, Peter Korsgaard wrote:

> If you have time, it would be nice to verify that 4.6.3 works correctly
> and then send a patch to update the defconfig.

Just sent a patch.

Since it's been a long time, I did full builds with the old 4.3 and
the new 4.6 configs using current buildroot git tree. Both were successful
and I had no problems booting them on the device.

One minor issue, savedefconfig does not add BR2_KERNEL_HEADERS_AS_KERNEL=y
into the defconfig, it seems to be the default setting. There's nothing
in the board config that would require specific headers version, so I left it
as is. Please check if that's ok.
