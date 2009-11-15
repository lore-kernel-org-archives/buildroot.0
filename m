From: llandwerlin at gmail.com <llandwerlin@gmail.com>
Date: Sun, 15 Nov 2009 11:12:49 +0100
Subject: [Buildroot] [Patch 0/8] Webkit host dependencies fixes / package
	infrastructure
Message-ID: <1258279977-1482-1-git-send-email-llandwerlin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

the following patch series fixes problems I met when building webkit
on a machine with almost no development packages. It also uses the new
package infrastructure for the 3 packages (flex, gperf and webkit).

Patch list:
  flex: fix prog-ar patch
  flex: bump to 2.5.35
  flex: convert to autotools infrastructure
  flex: add flex-host package (required by webkit)
  gperf: convert to autotools infrastructure
  gperf: add gperf-host package (required by webkit)
  webkit: convert to autotools infrastructure
  webkit: fix dependencies on host tools flex and gperf

 package/flex/flex-2.5.33-prog-ar.patch |   13 +---
 package/flex/flex.mk                   |  130 ++++++--------------------------
 package/gperf/gperf.mk                 |   13 ++-
 package/webkit/webkit.mk               |   21 +++---
 4 files changed, 42 insertions(+), 135 deletions(-)

--
Lionel Landwerlin
