From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 19:08:02 +0200
Subject: [Buildroot] [PATCHv2 0/3] Add subversion package
Message-ID: <1377623285-3359-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is the second version of the subversion package addition. The
changes since v1 are:

 * The patch factorizing the 'depends on BR2_PACKAGE_NEON' now appears
   first in the series. This was changed after the comment of Arnout,
   who didn't realise that the factorization was happening in the
   second patch of the series. Indeed, it makes more sense to have
   this change first.

 * I've introduced an hidden BR2_PACKAGE_NEON_XML option, that other
   packages can select to request XML support in Neon, without caring
   for the particular XML backend being used. This was suggested by
   Arnout.

Thanks,

Thomas

Rico Bachmann (1):
  subversion: new package

Thomas Petazzoni (2):
  neon: factorize 'depends on BR2_PACKAGE_NEON'
  neon: replace 'choice' for XML library with two options

 package/Config.in                |  1 +
 package/neon/Config.in           | 35 ++++++++++++++---------------------
 package/rpm/Config.in            |  7 ++-----
 package/subversion/Config.in     | 11 +++++++++++
 package/subversion/subversion.mk | 28 ++++++++++++++++++++++++++++
 5 files changed, 56 insertions(+), 26 deletions(-)
 create mode 100644 package/subversion/Config.in
 create mode 100644 package/subversion/subversion.mk

-- 
1.8.1.2
