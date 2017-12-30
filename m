From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 30 Dec 2017 18:57:33 +0300
Subject: [Buildroot] [PATCH 0/3] hostapd: driver selection options
Message-ID: <20171230155736.1668-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Below is the list of patches for hostapd to give user more control on
which drivers to include in the build. As a byproduct, we can drop
dependencies on netlink and threads if the drivers and options selected
do not require them.

Alexander Mukhin (3):
  hostapd: select driver support
  hostapd: make ACS dependent on nl80211
  hostapd: drop default dependency on netlink

 package/hostapd/Config.in  | 52 +++++++++++++++++++++++++++++++++++-----
 package/hostapd/hostapd.mk | 59 +++++++++++++++++++++++++++++++++-------------
 2 files changed, 88 insertions(+), 23 deletions(-)

-- 
2.11.0
