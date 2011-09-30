From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Fri, 30 Sep 2011 23:52:43 +0200
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.11/pkg-device
In-Reply-To: <cover.1315577080.git.maxime.ripard@free-electrons.com>
References: <cover.1315577080.git.maxime.ripard@free-electrons.com>
Message-ID: <4E863A2B.6010905@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Any comments on that ?

Maxime

Le 09/09/2011 16:05, Maxime Ripard a ?crit :
> Hello,
>
> Here is a minor set of improvement on how the devices are
> declared in buildroot. For now, All the devices to be created
> were in two files generic to every compilation. This was fine
> for most usage, but was a bit problematic when packages needed
> to create files or use specific permissions.
>
> This set of patches are addressing this issue by creating a
> new $(PKG)_FILES variable, containing the package specific
> devices, using the makedevs syntax.
>
> Changes since v1:
>    * Rename the device tables and all mentions of devices to a more exact term
>    * Cramfs was still passing a hardcoded device table. Remove it.
>
> The following changes since commit facd602dcad54df769ac759886f48f248b61e692:
>
>    Update for 2011.08 (2011-08-31 13:44:55 +0200)
>
> are available in the git repository at:
>    http://free-electrons.com/~maxime/git/buildroot.git for-2011.11/pkg-device
>
> Maxime Ripard (4):
>        Cleanup cramfs package declaration.
>        Rename the device table in the code base
>        Add support for package-declared devices
>        Convert busybox to the device declaration method
>
>   Makefile                                           |    4 +
>   fs/common.mk                                       |   15 +-
>   fs/cramfs/cramfs.mk                                |    6 +-
>   package/Makefile.package.in                        |    1 +
>   package/busybox/busybox.mk                         |    5 +
>   package/cramfs/cramfs-01-devtable.patch            | 1269 --------------------
>   ...amfs-02-endian.patch =>  cramfs-01-endian.patch} |   68 +-
>   package/cramfs/cramfs-02-cygwin_IO.patch           |   15 +
>   package/cramfs/cramfs-03-cygwin_IO.patch           |   13 -
>   .../{device_table.txt =>  file_install_table.txt}   |    0
>   target/generic/Config.in                           |    6 +-
>   .../{device_table.txt =>  file_install_table.txt}   |    2 -
>   ...evice_table_dev.txt =>  static_device_table.txt} |    0
>   target/xtensa/defconfig                            |    2 +-
>   14 files changed, 74 insertions(+), 1332 deletions(-)
>   delete mode 100644 package/cramfs/cramfs-01-devtable.patch
>   rename package/cramfs/{cramfs-02-endian.patch =>  cramfs-01-endian.patch} (86%)
>   create mode 100644 package/cramfs/cramfs-02-cygwin_IO.patch
>   delete mode 100644 package/cramfs/cramfs-03-cygwin_IO.patch
>   rename target/device/xtensa/{device_table.txt =>  file_install_table.txt} (100%)
>   rename target/generic/{device_table.txt =>  file_install_table.txt} (90%)
>   rename target/generic/{device_table_dev.txt =>  static_device_table.txt} (100%)
>
> Thanks,
