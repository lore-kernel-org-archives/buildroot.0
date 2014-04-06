From: Philippe Reynes <tremyfr@yahoo.fr>
Date: Sun,  6 Apr 2014 09:48:19 +0200
Subject: [Buildroot] [PATCH 0/2] use host compressor for rootfs
Message-ID: <1396770501-9443-1-git-send-email-tremyfr@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the rootfs is compressed with lzma, lzo or xz, we
use the binary compiled by buildroot. But with gzip
or bzip, we use the tools of the machine. This serie
change this behaviour for gzip and bzip2, it add
a dependancy on host-<compressor> and use it to
compress the rootfs.

Philippe Reynes (2):
  rootfs-gzip: use host-gzip instead of local gzip
  rootfs-bzip: use host-bzip2 instead of local bzip2

 fs/common.mk           |    6 ++++--
 package/bzip2/bzip2.mk |    2 ++
 package/gzip/gzip.mk   |    3 +++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.4.4
