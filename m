From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Jul 2014 09:27:52 +0200
Subject: [Buildroot] [PATCH] libpcap: fix build for uclinux target
In-Reply-To: <15676708c0726cb3fbed1dfaafae5e85c918ff3f.1406267235.git.baruch@tkos.co.il>
References: <15676708c0726cb3fbed1dfaafae5e85c918ff3f.1406267235.git.baruch@tkos.co.il>
Message-ID: <20140726092752.150736ed@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Baruch Siach,

On Fri, 25 Jul 2014 08:47:15 +0300, Baruch Siach wrote:
> As usual, uclinux is also linux. Also, -lpthread is needed to link the canusb
> test.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3af/3af796bc0eaa8563f0fd1dfce090083482fa57b9/
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I've applied your patch, after making one minor change:

> +Also we need -lpthread for the test to build for noMMU targets.
> +
> +Signend-off-by: Baruch Siach <baruch@tkos.co.il>

Typo: Signend -> Signed.

Also, do you think you could send your new patch, as well as the
existing 0001 patch on libpcap to the upstream project? It'd be great
to be able to drop them at some point, and remove LIBPCAP_AUTORECONF =
YES.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
