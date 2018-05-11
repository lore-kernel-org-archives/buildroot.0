From: Anisse Astier <anisse@astier.eu>
Date: Fri, 11 May 2018 22:50:32 +0200
Subject: [Buildroot] [PATCH v2 0/5] package/go: fixes
Message-ID: <20180511205037.10078-1-anisse@astier.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

In this patch series, you'll find a fix to the build issues in the go
package, as well as a debug feature and a minor version bump.

Regards,

Anisse

--
Changes since v1:
 - rebase on top of Angelo's contribution, with my added sign-off to
   honor Developer Certificate of Origin
 - second patch now contains only cleanup
 - fix verbose variable scope pollution
 - DEVELOPERS modification is now a standalone patch



Angelo Compagnucci (1):
  package/go: fixing host go cross compilation

Anisse Astier (4):
  go: cleanup cross-compilation support
  go: add self to developers to get cc-ed for build failures
  go: honor building with V=1 for debugging purposes
  go: bump to version 1.10.2

 DEVELOPERS                                         |  3 ++
 ...d.go-explicit-option-for-crosscompilation.patch | 40 ++++++++++++++++++++++
 package/go/go.hash                                 |  2 +-
 package/go/go.mk                                   | 35 ++++++-------------
 4 files changed, 54 insertions(+), 26 deletions(-)
 create mode 100644 package/go/0001-build.go-explicit-option-for-crosscompilation.patch

-- 
2.14.3
