From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Jul 2017 09:58:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/kodi: fix build with newer gcc
 versions.
In-Reply-To: <20170715141419.13160-1-bernd.kuhls@t-online.de>
References: <20170715141419.13160-1-bernd.kuhls@t-online.de>
Message-ID: <20170716095834.38eaee7a@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 15 Jul 2017 16:14:19 +0200, Bernd Kuhls wrote:
> Using this defconfig produces a build error with kodi:
> 
> BR2_arm=y
> BR2_cortex_a8=y
> BR2_ARM_INSTRUCTIONS_THUMB2=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_PACKAGE_KODI=y
> BR2_PACKAGE_SUNXI_MALI=y
> BR2_PACKAGE_PYTHON=y
> BR2_PACKAGE_PYTHON_PY_ONLY=y
> 
> /home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:37:1:
>  error: ?string? does not name a type
>  string CFTPParse::getName()
>  ^~~~~~
> /home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:62:25:
>  error: variable or field ?setTime? declared void
>  void CFTPParse::setTime(string str)
>                          ^~~~~~
> /home/buildroot/buildroot/output/build/kodi-17.3-Krypton/xbmc/filesystem/FTPParse.cpp:62:25:
>  error: ?string? was not declared in this scope
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi/0003-FTPParse.cpp-use-std-string.patch    | 91 ++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 package/kodi/0003-FTPParse.cpp-use-std-string.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
