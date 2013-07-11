From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Jul 2013 10:58:43 +0200
Subject: [Buildroot] [PATCH v2 1/2] linux: install firmware to staging.
In-Reply-To: <20130710171218.GC3297@free.fr>
References: <1373391595-19359-1-git-send-email-spenser@gillilanding.com>
 <20130710091145.7b8529d1@skate> <20130710171218.GC3297@free.fr>
Message-ID: <20130711105843.3fdaef14@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Wed, 10 Jul 2013 19:12:18 +0200, Yann E. MORIN wrote:

> Altenatively, as I suggested before, this could be delegated to a
> post-build script:
>   - the package (linux) always install its files in staging
>   - a post-build scripts cherry-picks what is relevant
> 
> What I don't like with this solution is that the Linux kernel would
> always install its firmware files, and that people will start using that
> as the source of the firmwares, while we do have linux-firmware for
> that.

Another solution is, inside the kernel menu:

	[*] Install in-kernel firmwares
		(*.dtbo) List of firmwares to installs

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
