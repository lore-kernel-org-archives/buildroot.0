From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Oct 2019 22:26:03 +0200
Subject: [Buildroot] [PATCH 0/2] Bump gperf and libcap
Message-ID: <20191012202605.30113-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There was already an attempt at bumping gperf to version some time
ago, but it was reverted, because it broke the build of libcap.

It turns out that libcap upstream has fixed the build with newer
versions of gperf, so if we bump libcap, we don't have the build issue
with the new gperf.

Unfortunately, the change in libcap doesn't allow to build with the
previous version of gperf. In other words, you need to bump both at
the same time.

I thought about making a patch to libcap that detects the version of
gperf that is available, and tweak things accordingly. But this patch
would be dropped immediately after the bump of gperf, which seems a
bit useless.

So as an exception, here is a patch series that isn't bisectable.

Best regards,

Thomas Petazzoni

Christopher McCrory (1):
  package/gperf: bump to version 3.1

Thomas Petazzoni (1):
  package/libcap: bump to 2.27

 package/gperf/gperf.hash   | 4 +++-
 package/gperf/gperf.mk     | 2 +-
 package/libcap/libcap.hash | 2 +-
 package/libcap/libcap.mk   | 2 +-
 4 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.21.0
