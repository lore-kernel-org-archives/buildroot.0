From: Alvaro G. M <alvaro.gamez@hazent.com>
Date: Sun, 19 Feb 2012 13:14:47 +0100
Subject: [Buildroot] [PATCH 0/2] Downloading from esoteric URIs,
	such as Xilinx toolchain
Message-ID: <cover.1329651936.git.alvaro.gamez@hazent.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Alvaro G. M" <alvaro.gamez@hazent.com>

On the last days some of us have been trying to add Microblaze architecture to
buildroot and specifically LX9 board support.

The second patch adds the toolchain from Xilinx, but in order to download it,
it was needed to modify the DOWNLOAD_WGET routine. This is what the first
patch is for. At the same time, the API was somewhat simplified and it is
now a little shorter to interface with it in most cases.

I think this two patches can be applied with any changes thanks to Arnout's
recommendations, so I will appreciate it if they can be applied.

The next step, in which I think Spencer is working on, is the DTS support,
which can the be used for lots of different platforms.

I think I've correctly signed-off both patches, but let me know if I have
used some ideas from someone and I've forgotten about it.

Alvaro G. M (2):
  DOWNLOAD: change $1=DIRECTORY_URL, $2=FILE_NAME to $1=FULL_FILE_URL,
    $2=FILE_NAME
  Microblaze: added external toolchain from Xilinx

 docs/manual/adding-packages-handwritten.txt |    2 +-
 linux/linux.mk                              |    2 +-
 package/Makefile.package.in                 |   18 +++++++++++-------
 package/cups/cups.mk                        |    2 +-
 package/fis/fis.mk                          |    2 +-
 package/games/doom-wad/doom-wads.mk         |    2 +-
 package/gettext/gettext.mk                  |    2 +-
 package/microperl/microperl.mk              |    2 +-
 package/netkitbase/netkitbase.mk            |    2 +-
 package/netkittelnet/netkittelnet.mk        |    2 +-
 package/newt/newt.mk                        |    2 +-
 package/tinyhttpd/tinyhttpd.mk              |    2 +-
 package/ttcp/ttcp.mk                        |    2 +-
 package/uemacs/uemacs.mk                    |    2 +-
 package/vpnc/vpnc.mk                        |    2 +-
 package/xfsprogs/xfsprogs.mk                |    2 +-
 toolchain/gcc/gcc-uclibc-4.x.mk             |    2 +-
 toolchain/gdb/gdb.mk                        |    2 +-
 toolchain/kernel-headers/kernel-headers.mk  |    2 +-
 toolchain/toolchain-external/Config.in      |   16 ++++++++++++++++
 toolchain/toolchain-external/ext-tool.mk    |   12 +++++++++---
 toolchain/uClibc/uclibc.mk                  |    2 +-
 22 files changed, 55 insertions(+), 29 deletions(-)

-- 
1.7.9
