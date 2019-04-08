From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Apr 2019 22:34:12 +0200
Subject: [Buildroot] [PATCH] package/android-tools: fix static linking
 failure due to lack of deps
In-Reply-To: <20190408154311.127351-1-giulio.benetti@micronovasrl.com>
References: <20190408110431.734b346b@windsurf>
 <20190408154311.127351-1-giulio.benetti@micronovasrl.com>
Message-ID: <20190408223412.4b829ff2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  8 Apr 2019 17:43:11 +0200
Giulio Benetti <giulio.benetti@micronovasrl.com> wrote:

> When static linking some dependency library can be missing(i.e. -latomic
> for -lcrypto) on linking libraries list. This is because when static
> linking libraries dependencies are not transparently linked into binary.
> 
> To avoid moving libraries before/after one another or add new ones
> that are not needed at all in some linking case use `pkg-config --libs
> LIBRARY` where LIBRARY is the library we "probe" for its existence and
> dependency.
> So:
> - Remove 0005-fix-static-link-zlib.patch where -lcrypto and -lz were
> swapped
> - Replace it with 0005-Use-pkgconf-to-get-libs-deps.patch where -lcrypto
> has been substituted with `pkg-config --libs libcrypto`
> - Add host-pkgconf to ANDROID_TOOLS_DEPENDENCIES
> 
> Fixes:
> http://autobuild.buildroot.net/results/d3d/d3d6679cfc8afe4467368bd3d31483172c1032de/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
>  .../0005-Use-pkgconf-to-get-libs-deps.patch   | 35 ++++++++++++++++++
>  .../0005-fix-static-link-zlib.patch           | 36 -------------------
>  package/android-tools/android-tools.mk        |  1 +
>  3 files changed, 36 insertions(+), 36 deletions(-)
>  create mode 100644 package/android-tools/0005-Use-pkgconf-to-get-libs-deps.patch
>  delete mode 100644 package/android-tools/0005-fix-static-link-zlib.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
