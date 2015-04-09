From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 9 Apr 2015 21:52:36 +0200
Subject: [Buildroot] [git commit] binutils: backport xtensa ld optimizations
Message-ID: <20150409195245.92820804CE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6d9a92dbd173902b0fccd04ba613dcdce9494f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This series optimizes most time-consuming algorithms and data structures
in the xtensa link-time relaxation code, leaving relaxation logic intact.

Speedup linking typical linux kernel is ~8 times (1 minute instead of 8),
pathological cases (linking objects partially linked without relaxation)
are handled ~60 times faster (1 minute instead of an hour).

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch |  502 ++++++++++++
 .../907-xtensa-optimize-removed_by_actions.patch   |  356 +++++++++
 .../908-xtensa-optimize-find_removed_literal.patch |  146 ++++
 ...tensa-replace-action-list-with-splay-tree.patch |  826 ++++++++++++++++++++
 ...nsa-optimize-check_section_ebb_pcrels_fit.patch |  502 ++++++++++++
 .../907-xtensa-optimize-removed_by_actions.patch   |  356 +++++++++
 .../908-xtensa-optimize-find_removed_literal.patch |  146 ++++
 ...tensa-replace-action-list-with-splay-tree.patch |  826 ++++++++++++++++++++
 8 files changed, 3660 insertions(+), 0 deletions(-)

Patch is too large, so refusing to show it
