From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Feb 2017 21:55:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptodev: fix build
In-Reply-To: <1486636324-12767-1-git-send-email-sebastien.szymanski@armadeus.com>
References: <1486636324-12767-1-git-send-email-sebastien.szymanski@armadeus.com>
Message-ID: <20170209215542.5198e04d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 Feb 2017 11:32:04 +0100, S?bastien Szymanski wrote:
> cryptodev-linux-1.8 build is broken with kernel >= 4.6.0 because of
> APIs changes in the kernel. Upstream already fixed this:
> 
> https://github.com/cryptodev-linux/cryptodev-linux/commit/2b29be8ac41414ed19cb4f5d5626d9bd0d7b11a8
> https://github.com/cryptodev-linux/cryptodev-linux/commit/f126e4837e6334d0464540995df7426fedf6b175
> https://github.com/cryptodev-linux/cryptodev-linux/commit/f14b4706b0d04988e7e5bc8c4d2aefef9f029d9d
> https://github.com/cryptodev-linux/cryptodev-linux/commit/cb186f682679383e8b5806240927903730ce85d9
> 
> Bump to latest commit to fix cryptodev-linux build.
> 
> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
> ---
>  package/cryptodev-linux/cryptodev-linux.hash | 4 ++--
>  package/cryptodev-linux/cryptodev-linux.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

I've applied after tweaking the commit title: the package is
cryptodev-linux, not cryptodev, and "fix build" is very fuzzy. I've
changed it to:

	package/cryptodev-linux: fix with with recent kernels

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
