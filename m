From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 17 Nov 2011 20:41:39 +0100
Subject: [Buildroot] [PATCH 0 of 5 v2] Add find utility functions / exclude
 files from strip / reduce python
Message-ID: <patchbomb.1321557989@devws108>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a few utility functions to Makefile.package.in that
help in composing find commands, and uses these functions to:
* exclude user-configured files and directories from being stripped in
 target-finalize, and
* reduce a python installation to the bare minimum.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 Config.in                   |  19 +++++++++++++++++++
 Makefile                    |   9 +++++++--
 package/Makefile.package.in |  11 +++++++++++
 package/python/Config.in    |  26 ++++++++++++++++++++++----
 package/python/python.mk    |  28 +++++++++++++++++++++++++++-
 5 files changed, 86 insertions(+), 7 deletions(-)
