From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  6 Mar 2018 09:48:03 +0100
Subject: [Buildroot] [PATCH 0/2] Tainting support
Message-ID: <1520326085-18337-1-git-send-email-angelo@amarulasolutions.com>
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
a package harms the reproducibility under certain
conditions.

This variable is later used to check if the build is
tainted or not. The build then aborts with an error
when the build is marked tainted and BR2_REPRODUCIBLE is
enabled.
 
This opens the door to include per language dependency
managers in buildroot.

Angelo Compagnucci (2):
  Makefile: add tainting support
  package/nodejs: taint the build on external modules

 Makefile                 | 14 +++++++++++++-
 package/nodejs/nodejs.mk |  1 +
 package/pkg-generic.mk   |  9 +++++++++
 3 files changed, 23 insertions(+), 1 deletion(-)

-- 
2.7.4
