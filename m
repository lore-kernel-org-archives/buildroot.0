From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 17:57:07 +0200
Subject: [Buildroot] [PATCH 0/2] treat gcc bug 90620 in a common way
Message-ID: <20190529155709.31207-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As done for other Gcc bugs introduce and use
BR2_TOOLCHAIN_HAS_GCC_BUG_90620 in affected package:
- haproxy
This is more consistent than checking same conditions for every package
and putting a comment on top of it.

Giulio Benetti (2):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_90620
  package/haproxy: re-enable package on Microblaze

 package/haproxy/Config.in  | 2 --
 package/haproxy/haproxy.mk | 9 ++++++++-
 toolchain/Config.in        | 8 ++++++++
 3 files changed, 16 insertions(+), 3 deletions(-)

-- 
2.17.1
