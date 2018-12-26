From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 26 Dec 2018 21:54:48 +0100
Subject: [Buildroot] [PATCH 1/1] systemd: bump to v240
In-Reply-To: <20181223011208.43478-1-aduskett@gmail.com>
References: <20181223011208.43478-1-aduskett@gmail.com>
Message-ID: <20181226215448.0eede5a3@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 22 Dec 2018 20:12:08 -0500, aduskett at gmail.com wrote:
> From: Adam Duskett <Aduskett@gmail.com>
> 
> In addition:
>   - Remove unused option -Dkill-path.
>    (See commit 9a85778412fa3e3f8d4561064131ba69f3259b28)
> 
>   - Change option -Dmyhostname to -Dnss-myhostname.
> 
>   - Remove patches from upstream.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  .../0002-install-don-t-use-ln-relative.patch  |   2 +-
>  ...-whether-struct-statx-is-defined-in-.patch | 111 ------------------
>  ...x-stat.h-check-with-other-checks-and.patch |  77 ------------
>  ...we-have-enough-space-for-the-DHCP6-o.patch |  30 -----
>  ...build-fix-detection-of-Werror-shadow.patch |  34 ------
>  package/systemd/systemd.hash                  |   2 +-
>  package/systemd/systemd.mk                    |   7 +-
>  7 files changed, 5 insertions(+), 258 deletions(-)
>  delete mode 100644 package/systemd/0003-build-sys-Detect-whether-struct-statx-is-defined-in-.patch
>  delete mode 100644 package/systemd/0004-meson-unify-linux-stat.h-check-with-other-checks-and.patch
>  delete mode 100644 package/systemd/0005-dhcp6-make-sure-we-have-enough-space-for-the-DHCP6-o.patch
>  delete mode 100644 package/systemd/0006-meson.build-fix-detection-of-Werror-shadow.patch

Applied to master. However, you forgot to update the hash of the README
file, which is listed in systemd.hash. Please make sure to run "make
legal-info" before sending a version bump of a package. Thanks!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
