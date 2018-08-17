From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 17 Aug 2018 23:35:04 +0200
Subject: [Buildroot] [PATCH v3 1/1] Python3: Bump to 3.7.0
In-Reply-To: <20180817184607.27639-1-aduskett@gmail.com>
References: <20180817184607.27639-1-aduskett@gmail.com>
Message-ID: <20180817233504.6bea7129@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Aug 2018 11:46:07 -0700, Adam Duskett wrote:
> From: Adam Duskett <aduskett@greenlots.com>
> 
>   Other changes include:
> 
>   - Refreshing all necessary patches for 3.7.0
> 
>   - Add a hash for the license file.
> 
>   - Python no longer has it's own internal libffi, as such, host-libffi is now
>     required to build host-python3, and is added as a dependency.
> 
>   - A new core module "uuid" is now is added in the Config.in file, and relies
>     on util-linux's uuid library.
> 
>   - Also, a new patch: 0030-Fix-cross-compiling-the-uuid-module.patch is
>     required to fix compiling the uuid module, because the include directory
>     search path for uuid.h is hardcoded to /usr/include/uuid, which causes an
>     "unsafe for cross-compilation" error during compiling if the host pc has
>     uuid headers installed.
> 
>     To fix this error, a new variable called uuid_inc_dirs with the original
>     path of "/usr/include/uuid" is added to setup.py, then if the environment
>     variable STAGING_DIR exists, the STAGING_DIR path is added to the
>     beginning of the uuid_inc_dirs variable.
> 
>   - Add a new patch: 0031-fix-building-on-older-distributions.patch
>     This patch changes os.replace to os.rename in the update_file.py
>     script to fix building on older Linux distributions that have
>     older versions of python that don't include os.replace.
> 
>     os.rename acts in the same way as os.replace, but is cross-platform
>     compatible. Because Buildroot is guaranteed to be built in a POSIX
>     environment, it is safe to change replace to rename.
> 
> Tested on CentOS7 and Fedora28, All test results passed:
>              br-arm-full [1/6]: OK
>   br-arm-cortex-a9-glibc [2/6]: OK
>    br-arm-cortex-m4-full [3/6]: SKIPPED
>           br-x86-64-musl [4/6]: OK
>       br-arm-full-static [5/6]: SKIPPED
> armv5-ctng-linux-gnueabi [6/6]: OK
> 6 builds, 2 skipped, 0 build failed, 0 legal-info failed
> 
> Signed-off-by: Adam Duskett <aduskett@greenlots.com>

Ah, I was working on merging your v2 yesterday/today. Still looking at
a few things around UUID support. I'll make sure to use your v3 instead.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
