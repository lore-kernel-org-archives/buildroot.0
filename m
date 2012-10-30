From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Oct 2012 09:29:41 -0300
Subject: [Buildroot] [PATCHv2 00/12] Netfilter bumps and additions
Message-ID: <1351600193-21511-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

v1 -> v2

Fixed Config.in wrapping in libnetfilter_cthelper as pointed by Thomas.
Switch from host-pkg-config to host-pkgconf for relevant packages.

Gustavo Zacarias (12):
  libnetfilter_conntrack: bump to version 1.0.2
  libnetfilter_cttimeout: add license info
  libnfnetlink: bump to version 1.0.1
  libnetfilter_cthelper: add new package
  libnetfilter_queue: add new package
  libnetfilter_acct: add new package
  libmnl: add license info
  libnetfilter_log: add new package
  nfacct: add new package
  conntrack-tools: bump to version 1.4.0
  ulogd: add new package
  arptables: add new package

 package/Config.in                                  |    7 +++++
 package/arptables/Config.in                        |    6 ++++
 package/arptables/arptables.mk                     |   21 ++++++++++++++
 package/conntrack-tools/Config.in                  |    7 +++-
 package/conntrack-tools/conntrack-tools.mk         |    5 ++-
 package/libmnl/libmnl.mk                           |    2 +
 package/libnetfilter_acct/Config.in                |   12 ++++++++
 package/libnetfilter_acct/libnetfilter-acct.mk     |   15 ++++++++++
 package/libnetfilter_conntrack/Config.in           |    5 +++
 .../libnetfilter-conntrack.mk                      |    6 +++-
 package/libnetfilter_cthelper/Config.in            |   13 +++++++++
 .../libnetfilter_cthelper/libnetfilter-cthelper.mk |   15 ++++++++++
 .../libnetfilter-cttimeout.mk                      |    2 +
 package/libnetfilter_log/Config.in                 |    8 +++++
 package/libnetfilter_log/libnetfilter-log.mk       |   15 ++++++++++
 package/libnetfilter_queue/Config.in               |   14 +++++++++
 package/libnetfilter_queue/libnetfilter-queue.mk   |   15 ++++++++++
 package/libnfnetlink/libnfnetlink.mk               |    2 +-
 package/nfacct/Config.in                           |   12 ++++++++
 package/nfacct/nfacct.mk                           |   15 ++++++++++
 package/ulogd/Config.in                            |   16 +++++++++++
 package/ulogd/ulogd-fix-libpcap-conditional.patch  |   29 ++++++++++++++++++++
 package/ulogd/ulogd.mk                             |   17 +++++++++++
 23 files changed, 252 insertions(+), 7 deletions(-)
 create mode 100644 package/arptables/Config.in
 create mode 100644 package/arptables/arptables.mk
 create mode 100644 package/libnetfilter_acct/Config.in
 create mode 100644 package/libnetfilter_acct/libnetfilter-acct.mk
 create mode 100644 package/libnetfilter_cthelper/Config.in
 create mode 100644 package/libnetfilter_cthelper/libnetfilter-cthelper.mk
 create mode 100644 package/libnetfilter_log/Config.in
 create mode 100644 package/libnetfilter_log/libnetfilter-log.mk
 create mode 100644 package/libnetfilter_queue/Config.in
 create mode 100644 package/libnetfilter_queue/libnetfilter-queue.mk
 create mode 100644 package/nfacct/Config.in
 create mode 100644 package/nfacct/nfacct.mk
 create mode 100644 package/ulogd/Config.in
 create mode 100644 package/ulogd/ulogd-fix-libpcap-conditional.patch
 create mode 100644 package/ulogd/ulogd.mk

-- 
1.7.8.6
