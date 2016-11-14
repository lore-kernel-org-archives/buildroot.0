From: Tobias Klauser <tklauser@distanz.ch>
Date: Mon, 14 Nov 2016 12:29:46 +0100
Subject: [Buildroot] [PATCH 0/2] musl support for libnet and netsniff-ng
Message-ID: <20161114112948.13292-1-tklauser@distanz.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

netsniff-ng can be build with musl since version 0.5.8, however it depends
on libnet which currently fails to build with musl. This series fixes libnet
build with musl by adding the corresponding upstream patch and then enabling
the netsniff-ng with musl as well.

Tobias Klauser (2):
  package/libnet: fix compilation with musl
  package/netsniff-ng: allow to build with musl

 package/libnet/0001-support-musl-libc.patch | 50 +++++++++++++++++++++++++++++
 package/netsniff-ng/Config.in               |  3 +-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 package/libnet/0001-support-musl-libc.patch

-- 
2.11.0.rc0.7.gbe5a750
