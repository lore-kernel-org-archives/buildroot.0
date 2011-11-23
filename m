From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 23 Nov 2011 14:59:11 +0100
Subject: [Buildroot] [PATCH 0 of 2 v3] Add find utility functions / exclude
 files from strip
Message-ID: <patchbomb.1322054943@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a few utility functions to Makefile.package.in that
help in composing find commands, and uses these functions to exclude
user-configured files and directories from being stripped in target-finalize.

The previous version of this series also modified the Python configuration to
allow for a 'reduced Python'. These patches were left out for now, as Thomas
Petazzoni raised some objections regarding the two-faced configuration. I hope
we can continue the discussion about this topic in that thread.

Thomas, you also had comments on the complexity of the find*clauses functions.
If you have alternative suggestions, please let me know. Thanks.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v3: update based on review comments, remove Python changes for now
v2: simplify find utilities

 Config.in                   |  19 +++++++++++++++++++
 Makefile                    |   9 +++++++--
 package/Makefile.package.in |  11 +++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)
