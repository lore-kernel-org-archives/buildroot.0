From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Aug 2016 18:04:07 +0200
Subject: [Buildroot] [git commit] libiio: Disable IIOD on Blackfin
In-Reply-To: <20160829155904.75EC780269@busybox.osuosl.org>
References: <20160829155904.75EC780269@busybox.osuosl.org>
Message-ID: <20160829180407.2e54e0e2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 29 Aug 2016 17:54:07 +0200, Peter Korsgaard wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=53996bee433f09a91b12aa53b2be0f7d22c0acbe
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> IIOD uses accept4, which is not yet available on Blackfin.
> 
> Fixes:
>  http://autobuild.buildroot.net/results/b75/b7552c9325ffcc7f1cb6e114b82648f3280fded6/
> 
> [Peter: hide other toolchain comment on bfin]
> Signed-off-by: Paul Cercueil <paul.cercueil@analog.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Most likely this is wrong. The failure happens with the old Blackfin
toolchain from ADI. Was it tested to also happen with the new Blackfin
toolchain, that uses recent kernel headers and recent uClibc-ng ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
