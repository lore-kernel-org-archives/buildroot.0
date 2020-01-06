From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  6 Jan 2020 11:47:29 +0100
Subject: [Buildroot] [PATCH 0/2] package/wireguard upgrade
Message-ID: <20200106104731.13306-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel support for WireGuard getting mainlined, the upstream repo
has been split in a wireguard-tools repo for the userspace tooling and
wireguard-linux-compat for the kernel side (for 3.10+ legacy kernels).

This series changes the wireguard package to use the wireguard-tools
repo and adds a package for wireguard-linux-compat.

Peter Korsgaard (2):
  package/wireguard: change to the wireguard-tools package
  package/wireguard-linux-compat: new package

 DEVELOPERS                                    |  1 +
 package/Config.in                             |  1 +
 package/wireguard-linux-compat/Config.in      | 23 +++++++++++++++++++
 .../wireguard-linux-compat.hash               |  4 ++++
 .../wireguard-linux-compat.mk                 | 15 ++++++++++++
 package/wireguard/Config.in                   |  9 ++++----
 package/wireguard/wireguard.hash              |  4 ++--
 package/wireguard/wireguard.mk                | 15 ++++--------
 8 files changed, 55 insertions(+), 17 deletions(-)
 create mode 100644 package/wireguard-linux-compat/Config.in
 create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.hash
 create mode 100644 package/wireguard-linux-compat/wireguard-linux-compat.mk

-- 
2.20.1
