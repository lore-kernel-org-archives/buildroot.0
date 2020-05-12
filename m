From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 May 2020 10:53:40 +0200
Subject: [Buildroot] [PATCH] package/glibc: bump version for additional
 post-2.30 security fixes
In-Reply-To: <5e5801d8-45f3-d74c-6fb7-810cc98cec65@gmail.com> (Romain Naour's
 message of "Tue, 12 May 2020 09:31:14 +0200")
References: <20200512072235.9547-1-peter@korsgaard.com>
 <5e5801d8-45f3-d74c-6fb7-810cc98cec65@gmail.com>
Message-ID: <87k11hmt4b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > Hi Peter,
 > Le 12/05/2020 ? 09:22, Peter Korsgaard a ?crit?:
 >> Fixes the following security vulnerabilities:
 >> 
 >> CVE-2020-10029: Trigonometric functions on x86 targets suffered from stack
 >> corruption when they were passed a pseudo-zero argument.  Reported by Guido
 >> Vranken / ForAllSecure Mayhem.
 >> 
 >> CVE-2020-1751: A defect in the PowerPC backtrace function could cause an
 >> out-of-bounds write when executed in a signal frame context.
 >> 
 >> CVE-2020-1752: A use-after-free vulnerability in the glob function when
 >> expanding ~user has been fixed.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> .../glibc.hash                                                  | 2 +-
 >> package/glibc/glibc.mk                                          | 2 +-
 >> 2 files changed, 2 insertions(+), 2 deletions(-)
 >> rename package/glibc/{2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91 => 2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427}/glibc.hash (70%)
 >> 
 >> diff --git a/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash b/package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
 >> similarity index 70%
 >> rename from package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
 >> rename to package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
 >> index 4283ea04b4..6677d32db9 100644
 >> --- a/package/glibc/2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91/glibc.hash
 >> +++ b/package/glibc/2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427/glibc.hash
 >> @@ -1,5 +1,5 @@
 >> # Locally calculated (fetched from Github)
 >> -sha256  fe1ca8099bc2cda997d8a585f1a512e59df56c52c9c7363a4058da2725c8f4a9  glibc-2.30-20-g50f20fe506abb8853641006a7b90a81af21d7b91.tar.gz
 >> +sha256  4462f56696332efbc5b0c2f86d7aa75a2a02c3d44bc4345fa42b5bab1225de5c  glibc-2.30-67-g4748829f86a458b76642f3e98b1d80f7b868e427.tar.gz
 >> 
 >> # Hashes for license files
 >> sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 >> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
 >> index 2ca73343b3..4621c9c2f9 100644
 >> --- a/package/glibc/glibc.mk
 >> +++ b/package/glibc/glibc.mk
 >> @@ -17,7 +17,7 @@ else
 >> # Generate version string using:
 >> #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 >> # When updating the version, please also update localedef

 > We should keep localdef package at the same version as glibc :)

Argh, indeed. Will fix.

-- 
Bye, Peter Korsgaard
