From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Nov 2018 11:32:25 +0100
Subject: [Buildroot] [PATCH next 0/2] Adjust Luarocks support to per-package
 folder
Message-ID: <20181119103227.24726-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Based on Fran?ois Perrad's feedback, this small patch series reworks
how Luarocks is used to make it compatible with per-package
folders. It is sent as a separate series, because it can be applied
independently from the per-package series itself.

Thanks,

Thomas

Thomas Petazzoni (2):
  package/pkg-luarocks: drop flock at installation time
  package/luarocks: rework configuration file for per-package folders

 package/luarocks/0002-getenv-in-config.patch | 31 ++++++++++++++++++++
 package/luarocks/luarocks-br-config.lua      | 12 ++++++++
 package/luarocks/luarocks.mk                 | 21 +++++--------
 package/pkg-luarocks.mk                      |  2 +-
 4 files changed, 52 insertions(+), 14 deletions(-)
 create mode 100644 package/luarocks/0002-getenv-in-config.patch
 create mode 100644 package/luarocks/luarocks-br-config.lua

-- 
2.19.1
