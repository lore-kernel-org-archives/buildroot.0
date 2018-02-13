From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 13 Feb 2018 23:25:38 +0100
Subject: [Buildroot] [PATCH 1/1] cmake: bump version to 3.10.2 and add
 license hash
In-Reply-To: <20180213195729.33644-1-markhirota@gmail.com>
References: <20180213195729.33644-1-markhirota@gmail.com>
Message-ID: <20180213232538.0441c65a@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 13 Feb 2018 11:57:29 -0800, Mark Hirota wrote:
> Signed-off-by: Mark Hirota <markhirota@gmail.com>
> ---
>  package/cmake/cmake.hash | 5 +++--
>  package/cmake/cmake.mk   | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)

Thanks for this contribution. However, I'm a little bit worried by this
bump: it was already submitted before, and we had to revert because it
was causing gazillions of build failures.

See https://patchwork.ozlabs.org/patch/846757/. Basically, unless CMake
fixed the problem, CMake now requires C++11 to build, which is
annoying, as not all environments where Buildroot is used have a C++11
capable host compiler.

Could you check the status of the emplace_hint() method usage? Has it
been made conditional?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
