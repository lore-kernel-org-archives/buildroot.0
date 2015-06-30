From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date: Tue, 30 Jun 2015 12:41:12 +0200
Subject: [Buildroot] [PATCH 0/2] pulseview: fix build failures
Message-ID: <1435660874-14116-1-git-send-email-bgolaszewski@baylibre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Autobuilders frequently report the following issue with pulseview:
  http://autobuild.buildroot.net/results/993/993622312239fe56946fdde4d3dfec73786393e5/build-end.log

It's caused by passing a nullptr as argument where
boost::optional<std::pair<(...)> > is expected. Commit ec6cc07f
fixed the issue in PulseView and the second patch makes buildroot
use it when building PV. The first patch is needed too due to some
API changes in libsigrokcxx.

NOTE: this builds fine on x86 and actually also used to build
properly on other architectures at commit edbeeef. Something must
have changed along the way that exposed the bug.

Bartosz Golaszewski (2):
  libsigrok: bump commit hash
  pulseview: bump commit hash

 package/libsigrok/libsigrok.mk | 2 +-
 package/pulseview/pulseview.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

-- 
2.1.4
