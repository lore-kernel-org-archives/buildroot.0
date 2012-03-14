From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 14 Mar 2012 17:45:05 +0100
Subject: [Buildroot] [PATCH 0 of 2 v4-resend] Add find utility functions /
 exclude files from strip
Message-ID: <patchbomb.1331743505@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series adds a few utility functions to Makefile.package.in that
help in composing find commands, and uses these functions to exclude
user-configured files and directories from being stripped in target-finalize.

Thanks to input from Arnout, the find functions are now much simpler and
should be clearly understandable by everyone.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
v4: simplify find functions even further; whitespace changes
v3: update based on review comments, remove Python changes for now
v2: simplify find functions

 Config.in                   |  19 +++++++++++++++++++
 Makefile                    |  10 ++++++++--
 package/Makefile.package.in |  10 ++++++++++
 3 files changed, 37 insertions(+), 2 deletions(-)
