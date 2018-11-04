From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  4 Nov 2018 19:02:37 -0200
Subject: [Buildroot] [PATCH 0/4] update/improve intel-microcode and
 iucode-tool
Message-ID: <20181104210241.20237-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Patch 1 enables MICROCODE_INTEL if intel-microcode is selected, since
otherwise it's impossible to load microcode (by means of iucode-tools).

Patch 2 updates intel-microcode to the latest version and moves its
installation path from /usr/share/misc/ to /lib/firmware/, along with
the files installed by linux-firmware. That path is also used by other
Linux distros (e.g. Ubuntu). Notice that the package now installs 100
binary files under /lib/firmware/intel-ucode/ instead of a big text file
at /usr/share/misc/intel-microcode.dat.

Patch 3 updates iucode-tool to the latest version.

Patch 4 updates the iucode-tool init script. That's what I was doing
initially. All other patches are just a consequence ot the "plucking a
feather brings a hen" effect.

Patches 1, 2 and 3 can be applied in any order (I tested this) but patch
4 is on top of patch 2.

Carlos Santos (4):
  linux: enable MICROCODE_INTEL if intel-microcode is selected
  intel-microcode: bump to version 20180807a
  iucode-tool: bump to version 2.3.1
  iucode-tool: rewrite init script

 linux/linux.mk                               |  3 ++
 package/intel-microcode/intel-microcode.hash |  4 +-
 package/intel-microcode/intel-microcode.mk   | 16 +++-----
 package/iucode-tool/S00iucode-tool           | 39 ++++++++++++--------
 package/iucode-tool/iucode-tool.hash         |  2 +-
 package/iucode-tool/iucode-tool.mk           |  2 +-
 6 files changed, 36 insertions(+), 30 deletions(-)

-- 
2.17.1
