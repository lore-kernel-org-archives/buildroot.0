From: Alexander Mukhin <alexander.i.mukhin@gmail.com>
Date: Sat, 23 Dec 2017 22:06:13 +0300
Subject: [Buildroot] [PATCH 0/4] hostapd: new configuration options
Message-ID: <20171223190617.3981-1-alexander.i.mukhin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Below is the list of patches for hostapd to give user more control
on which options to include in the build. As a byproduct, we can drop
dependencies on netlink and threads if the options selected
do not require them.

Alexander Mukhin (4):
  hostapd: select VLAN support
  hostapd: select driver support
  hostapd: make ACS dependent on nl80211
  hostapd: drop default netlink dependency

 package/hostapd/Config.in  | 58 ++++++++++++++++++++++++++++++++++++++++++----
 package/hostapd/hostapd.mk | 51 ++++++++++++++++++++++++++++++----------
 2 files changed, 92 insertions(+), 17 deletions(-)

-- 
2.11.0
