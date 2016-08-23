From: Matt Flax <flatmax@flatmax.org>
Date: Tue, 23 Aug 2016 10:53:20 +1000
Subject: [Buildroot] [PATCH 0/3] arch/arm a53 + ARMV8, package/fftw rework
Message-ID: <1471913603-21487-1-git-send-email-flatmax@flatmax.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These commits :
Firstly add cortex-a53 to arch/Config.in.arm
Secondly rework the fftw package to allow multiple precision installation.
Thirdly add ARMV8 to arch/Config.in.arm, which depends on the first patch
being applied.

Matt Flax (3):
  arch/arm: Add Cortex-a53 CPU
  package/fftw : Allow all precisions to be installed at the same time.
  arch/arm: Add ARMV8 (aarch32) toolchain config.

 arch/Config.in.arm               | 21 +++++++++++-
 package/fftw/Config.in           | 69 +++++++---------------------------------
 package/fftw/fftw-common.mk      | 44 +++++++++++++++++++++++++
 package/fftw/fftw.mk             | 45 ++------------------------
 package/fftw/fftw/Config.in      |  7 ++++
 package/fftw/fftw/fftw.hash      |  1 +
 package/fftw/fftw/fftw.mk        | 21 ++++++++++++
 package/fftw/fftwf/Config.in     |  8 +++++
 package/fftw/fftwf/fftwf.hash    |  1 +
 package/fftw/fftwf/fftwf.mk      | 21 ++++++++++++
 package/fftw/fftwl/Config.in     |  8 +++++
 package/fftw/fftwl/fftwl.hash    |  1 +
 package/fftw/fftwl/fftwl.mk      | 21 ++++++++++++
 package/fftw/fftwq/Config.in     |  7 ++++
 package/fftw/fftwq/fftwq.hash    |  1 +
 package/fftw/fftwq/fftwq.mk      | 21 ++++++++++++
 package/gnuradio/Config.in       |  4 +--
 package/gnuradio/gnuradio.mk     |  2 +-
 package/liquid-dsp/liquid-dsp.mk | 10 ++++--
 19 files changed, 205 insertions(+), 108 deletions(-)
 create mode 100644 package/fftw/fftw-common.mk
 create mode 100644 package/fftw/fftw/Config.in
 create mode 120000 package/fftw/fftw/fftw.hash
 create mode 100644 package/fftw/fftw/fftw.mk
 create mode 100644 package/fftw/fftwf/Config.in
 create mode 120000 package/fftw/fftwf/fftwf.hash
 create mode 100644 package/fftw/fftwf/fftwf.mk
 create mode 100644 package/fftw/fftwl/Config.in
 create mode 120000 package/fftw/fftwl/fftwl.hash
 create mode 100644 package/fftw/fftwl/fftwl.mk
 create mode 100644 package/fftw/fftwq/Config.in
 create mode 120000 package/fftw/fftwq/fftwq.hash
 create mode 100644 package/fftw/fftwq/fftwq.mk

-- 
2.7.4
