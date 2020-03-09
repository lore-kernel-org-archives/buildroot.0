From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  8 Mar 2020 23:50:00 -0300
Subject: [Buildroot] [PATCH 0/3] package/ifupdown-scripts: add openrc support
Message-ID: <20200309025003.26466-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

Currently if we set BR2_SYSTEM_DHCP but don't select netifrc nothing happens,
which is a bit confusing.

Adapt ifupdown-scripts to support the BR2_SYSTEM_DHCP config with openrc, so
we don't need to depend on netifrc.

Carlos Santos (3):
  package/ifupdown-scripts: always install /etc/network/nfs_check
  package/ifupdown-scripts: relocate the generation the interfaces file
  package/ifupdown-scripts: add openrc support

 package/ifupdown-scripts/Config.in           |  2 +-
 package/ifupdown-scripts/ifupdown-scripts.mk | 31 ++++++++++++++++----
 2 files changed, 26 insertions(+), 7 deletions(-)

-- 
2.18.2
