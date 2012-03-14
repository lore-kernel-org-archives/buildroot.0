From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Mar 2012 22:43:14 +0100
Subject: [Buildroot] [PATCH 5/6] apply-patches.sh: change archive
 management
In-Reply-To: <1331739237-29872-6-git-send-email-ludovic.desroches@atmel.com>
References: <20120314120310.13e0ea3a@skate>
 <1331739237-29872-1-git-send-email-ludovic.desroches@atmel.com>
 <1331739237-29872-6-git-send-email-ludovic.desroches@atmel.com>
Message-ID: <20120314224314.0bc538d9@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 14 Mar 2012 16:33:56 +0100,
ludovic.desroches at atmel.com a ?crit :

> From: Ludovic Desroches <ludovic.desroches@atmel.com>
> 
> The way archives were managed was incorrect because the uncompressed archives
> were sent directly to the patch command. It means that alphabetical patch
> order was not respected.
> 
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> Tested-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> with an armadeus_apf9328_defconfig build

I was initially a bit surprised by the usage of --strip-components=1,
which means that the tarball must contain one directory, and this
directory should contain all the patches. I kind of excepted the
patches to be at the root of the tarball, but I don't feel very
strongly about this, so:

Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
