From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 11 Mar 2016 03:45:20 +0300
Subject: [Buildroot] [PATCH 0/2] gcc: preserve CXXFLAGS_FOR_TARGET
Message-ID: <1457657122-7283-1-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this series backports gcc fix that preserves CXXFLAGS_FOR_TARGET and
reverts related xtensa-specific workaround. See discussion at
  https://patchwork.ozlabs.org/patch/479074/

Max Filippov (2):
  gcc: preserve CXXFLAGS_FOR_TARGET
  Revert "gcc/gcc-final: pass TARGET_ABI flags to configure with
    --enable-cxx-flags"

 package/gcc/4.8.5/130-pr43538.patch | 25 +++++++++++++++++++++++++
 package/gcc/4.9.3/130-pr43538.patch | 25 +++++++++++++++++++++++++
 package/gcc/gcc-final/gcc-final.mk  |  4 ----
 3 files changed, 50 insertions(+), 4 deletions(-)
 create mode 100644 package/gcc/4.8.5/130-pr43538.patch
 create mode 100644 package/gcc/4.9.3/130-pr43538.patch

-- 
2.1.4
