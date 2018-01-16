From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 17 Jan 2018 00:03:40 +0100
Subject: [Buildroot] [PATCH v2 1/1] systemd: bump to 236,
 convert to meson
In-Reply-To: <20180101130944.12583-1-Adamduskett@outlook.com>
References: <20180101130944.12583-1-Adamduskett@outlook.com>
Message-ID: <20180117000340.73c98753@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  1 Jan 2018 08:09:44 -0500, Adam Duskett wrote:
> systemd is no longer an autotools package, as such, it has now been converted
> over to meson.
> 
> Even though systemd234 has meson support, it is broken with gcc7, as such
> the revision bump and conversion to meson must be in a single patch.
> 
> Changes include:
>   - Change systemd from an autotools package to a generic package
>   - Changing all the options from --enable/disable to -Doption=true/false
>   - Remove --without-python (no longer an option)
>   - Remove all of the ac_cv_path_ variables, and move them into CONF_OPTS
>     with the prefix -Doption-path=/path.
>   - Add sha256sum's for the license files.
>   - Remove 0002-build-check-for-ln-relative.patch and add
>     0002-install-dont-use-ln-relative.patch in its place, the old patch relied on autotools and is no longer relevant.
>   - Add 0004-add-false-option-for-tests.patch. With the conversion to meson,
>     systemd no longer has the option to disable unit tests from being built.
>     This patch re-adds the functionality. This prevents 381 files from being
>     built, and prevents gcrypt from becoming a dependency.
> 
> Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
> ---
> Changes v1 -> v2:
>   - Added 0002-install-dont-use-ln-relative.patch to allow older systems to
>     build. (Yann)
>   - Added 0004-add-false-option-for-tests.patch to turn off building tests.
>   - Added default paths for telinit, kill, kmod, kexec, sulogin, mount, 
>     and umount. (Yann)
>   - Added --libdir='/usr/lib' and -Drootlibdir='/usr/lib' to SYSTEMD_CONF_OPTS
>     to prevent systemd from placing the libraries into the incorrect target
>     directories. (Yann)
>   - Removed -Drootprefix='/' and -Dsplit-user=true as the default settings where
>     correct.
>   - Removed "SYSTEMD_CFLAGS = $(TARGET_CFLAGS) -fno-lto" as it no longer
>     applies.
>   - Added -j$(PARALLEL_JOBS) to SYSTEMD_NINJA_OPTS (Yann)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
