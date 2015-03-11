From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 11 Mar 2015 23:01:23 +0100
Subject: [Buildroot] [PATCHv2 0/5] uClibc updates
Message-ID: <1426111288-20529-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a v2 of the uClibc update patch series. Compared to the v1:

 * Adjust the thread implementation selection according to the
   comments made by Yann.

 * Add a table in the commit log of the "uclibc: adapt thread
   implementation selection to uClibc-ng" to help clarifying which
   thread implementation is available in which situation.

 * Add a commit renaming the uClibc-ng config option to remove the
   version number from it.

 * Add a patch that adds double quotes around the values of string
   options.

 * Integrate the patch from Waldemar bumping uClibc-ng to 1.0.1, after
   updating it to take into account the previous changes.

Thanks,

Thomas

Thomas Petazzoni (4):
  uclibc: adapt thread implementation selection to uClibc-ng
  uclibc: remove bogus comment about thread implementation selection
  uclibc: remove version from the uclibc-ng config option
  uclibc: double quote values of string options

Waldemar Brodkorb (1):
  uclibc: update to latest release 1.0.1

 ...selection-better-do-it-in-your-build-syst.patch |  60 ++++++++++
 package/uclibc/Config.in                           | 122 ++++++++++++---------
 .../{uClibc-ng-1.0.0.config => uClibc-ng.config}   |   2 +-
 package/uclibc/uclibc.mk                           |   4 +-
 4 files changed, 134 insertions(+), 54 deletions(-)
 create mode 100644 package/uclibc/1.0.1/0001-remove-NAN-selection-better-do-it-in-your-build-syst.patch
 rename package/uclibc/{uClibc-ng-1.0.0.config => uClibc-ng.config} (99%)

-- 
2.1.0
