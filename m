From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu,  8 May 2014 02:51:03 +0400
Subject: [Buildroot] [PATCH 0/2] xtensa binutils fixes backports
Message-ID: <1399503065-18819-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

this series backports two fixes for binutils:
- first fixes call target misalignment during link-time relaxation often
  seen with linux kernel builds;
- second fixes 'overflow after relaxation' link-time error recently seen
  with some buildroot packages.

Max Filippov (2):
  binutils: backport first section frag alignment fix for xtensa gas
  binutils: backport R_XTENSA_DIFF* relocation signedness fix

 .../2.22/901-xtensa-gas-first-frag-alignment.patch |  51 ++++++++
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
 .../901-xtensa-gas-first-frag-alignment.patch      |  51 ++++++++
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
 .../901-xtensa-gas-first-frag-alignment.patch      |  51 ++++++++
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
 .../2.24/901-xtensa-gas-first-frag-alignment.patch |  51 ++++++++
 .../902-xtensa-gas-ld-diff-relocation-signed.patch | 133 +++++++++++++++++++++
 8 files changed, 736 insertions(+)
 create mode 100644 package/binutils/2.22/901-xtensa-gas-first-frag-alignment.patch
 create mode 100644 package/binutils/2.22/902-xtensa-gas-ld-diff-relocation-signed.patch
 create mode 100644 package/binutils/2.23.1/901-xtensa-gas-first-frag-alignment.patch
 create mode 100644 package/binutils/2.23.1/902-xtensa-gas-ld-diff-relocation-signed.patch
 create mode 100644 package/binutils/2.23.2/901-xtensa-gas-first-frag-alignment.patch
 create mode 100644 package/binutils/2.23.2/902-xtensa-gas-ld-diff-relocation-signed.patch
 create mode 100644 package/binutils/2.24/901-xtensa-gas-first-frag-alignment.patch
 create mode 100644 package/binutils/2.24/902-xtensa-gas-ld-diff-relocation-signed.patch

-- 
1.8.1.4
