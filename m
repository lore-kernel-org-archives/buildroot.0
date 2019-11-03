From: unixmania at gmail.com <unixmania@gmail.com>
Date: Sun,  3 Nov 2019 12:12:56 -0300
Subject: [Buildroot] [PATCH RFC 0/2] Fix conflict between host-dtc headers
 and kernel dtc
Message-ID: <20191103151258.11047-1-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Install libfdt headers under $(HOST_DIR)/include/libfdt
- Tell host-qemu to use that path

Carlos Santos (2):
  package/dtc: install host libfdt headers in a subdirectory
  package/qemu: search for host-dtc (libfdt) headers at the right place

 package/dtc/dtc.mk   | 1 +
 package/qemu/qemu.mk | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
2.18.1
