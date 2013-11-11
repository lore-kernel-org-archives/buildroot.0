From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Nov 2013 18:57:29 +0100
Subject: [Buildroot] [PATCH 0/3] Minor toolchain improvements
Message-ID: <1384192652-4203-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Three minor toolchain patches, which I think are good for 2013.11,
that:

 * Remove the 'experimental' marker from glibc/eglibc support in the
   internal toolchain backend. I don't think issues have been raised
   so far with the glibc/eglibc support, so it's time to encourage
   users to test them :-)

 * Ensure glibc or eglibc are not chosen with static only builds,
   since glibc and eglibc are known not to work for a pure static
   system. An user even had the not-so-nice experience of debugging
   why he couldn't log into his system: it was due to glibc/eglibc
   needing some shared library for authentication, and he had selected
   static library only.

Thomas

Thomas Petazzoni (3):
  toolchain-buildroot: glibc and eglibc support is no longer
    experimental
  toolchain-buildroot: make sure glibc isn't chosen when
    BR2_PREFER_STATIC_LIB=y
  toolchain-external: make sure (e)glibc isn't chosen when
    BR2_PREFER_STATIC_LIB=y

 toolchain/toolchain-buildroot/Config.in |  9 ++++++--
 toolchain/toolchain-external/Config.in  | 37 +++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+), 2 deletions(-)

-- 
1.8.1.2
