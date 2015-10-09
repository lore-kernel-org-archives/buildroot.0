From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  9 Oct 2015 11:15:04 +0200
Subject: [Buildroot] [PATCHv5 0/2] Detect incorrect dependencies
Message-ID: <1444382106-16019-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is the fifth version of the small patch series to detect
incorrect dependencies (i.e a package that depends on another in its
.mk file, but that forgets to do so in its Config.in).

Compared to the previous version, this new version:

 - Use $($(PKG)_TYPE) and $($(PKG)_KCONFIG)_VAR) instead of
   target-specific variables, as suggested by Arnout.

 - Move the "culprit listing" logic into a separate patch, so that it
   can be considered separately, suggested by Yann E. Morin.

 - Makes some other trivial adjustements suggested by Yann and Arnout.

 - Is rebased on top of master.

Thanks,

Thomas

Thomas Petazzoni (2):
  pkg-generic: detect incorrectly used package
  pkg-generic: improve incorrectly used package detection

 package/pkg-generic.mk | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

-- 
2.6.1
