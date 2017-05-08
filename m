From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 May 2017 21:25:52 +0200
Subject: [Buildroot] [PATCH 2/2] package/ltp-testsuite: disable for sparc
In-Reply-To: <20170508190819.28493-2-romain.naour@gmail.com>
References: <20170508190819.28493-1-romain.naour@gmail.com>
 <20170508190819.28493-2-romain.naour@gmail.com>
Message-ID: <20170508212552.651ed63b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 May 2017 21:08:19 +0200, Romain Naour wrote:

> +	# missing __sync_*() family of functions
> +	depends on !BR2_sparc

This is wrong: we have BR2_TOOLCHAIN_HAS_SYNC_xyz symbols for this.
Sparc is not the only architecture affected.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
