From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 27 Jan 2016 21:32:12 +0100
Subject: [Buildroot] [PATCH v2 0/3] graph-depends: allow to exclude host
	packages
Message-ID: <1453926735-29571-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Here is a v2 of the small patch series that allows to exclude host
packages. It fixes a major bug in the previous implementation, which
was stopping drawing the list of dependencies as soon as one host
package was encountered, rather than just skipping that one package.

This new implementation hopefully fixes that problem.

Thanks,

Thomas

Thomas Petazzoni (3):
  graph-depends: fix handling of "virtual" in exclude_list
  graph-depends: add support for excluding host packages
  docs/manual: update graph-depends documentation about --stop-on

 docs/manual/common-usage.txt  |  7 ++++---
 support/scripts/graph-depends | 16 ++++++++++------
 2 files changed, 14 insertions(+), 9 deletions(-)

-- 
2.6.4
