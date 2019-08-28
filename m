From: unixmania at gmail.com <unixmania@gmail.com>
Date: Tue, 27 Aug 2019 23:16:24 -0300
Subject: [Buildroot] [PATCH 0/2] package/thttpd: fix systemd and sysvinit
 startup
Message-ID: <20190828021626.9688-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Patch 1 creates the configuration file as /etc/thttpd.conf, as expected by
  the systemd unit file.

- Patch 2 adds a working sysvinit script instead of installing the FreeBSD
  script provided by thttpd.

Carlos Santos (2):
  package/thttpd: fix systemd startup
  package/thttpd: fix init script

 package/thttpd/S90thttpd | 54 ++++++++++++++++++++++++++++++++++++++++
 package/thttpd/thttpd.mk | 15 +++++------
 2 files changed, 62 insertions(+), 7 deletions(-)
 create mode 100644 package/thttpd/S90thttpd

-- 
2.18.1
