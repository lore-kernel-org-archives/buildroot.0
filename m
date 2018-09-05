From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Thu,  6 Sep 2018 00:00:05 +0200
Subject: [Buildroot] [PATCH v4 0/3] Add tainting support to buildroot
Message-ID: <1536184808-9085-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Packages that need to resolve dependencies internally
and use a package manager would harm the reproducibility
of a build, moreover they escape the legal infrastructure
not giving enough informations on licensing.

This patch adds a tainting mechanism in the form of a
variable FOO_TAINTS that can be used to signal that
a package harms the reproducibility or licensing under
certain conditions.

This opens the door to include per language dependency
managers in buildroot.

Angelo Compagnucci (3):
  Makefile: add tainting support
  docs/manual: adding infos about tainting
  package/nodejs: taint the build on external modules

 Makefile                                | 10 ++++++++++
 docs/manual/adding-packages-generic.txt |  6 ++++++
 docs/manual/legal-notice.txt            | 12 ++++++++++++
 package/nodejs/nodejs.mk                |  1 +
 package/pkg-generic.mk                  | 12 ++++++++++++
 5 files changed, 41 insertions(+)

-- 
2.7.4
