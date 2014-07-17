From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 17 Jul 2014 09:50:02 +0200
Subject: [Buildroot] [git commit] package/coreutils: gettextize to match the
	new gettext version
Message-ID: <20140717075142.3DAD89D26A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e0c5e75bc66185256add4bd4e669dc81075f8730
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The gettext macros in the package are from a gettext version older than
the one we have in Buildroot, so autoreconf fails.

Run gettextize prior to running autoreconf, like we do in wget.

Fixes:
    http://autobuild.buildroot.net/results/228/228224668be4376844fe924d0a5b346af0414460/
    http://autobuild.buildroot.net/results/ac4/ac4dbb1342e9c9f1de5412e0b71fe4422ef744ef/
    http://autobuild.buildroot.net/results/a0c/a0c25faf149de9d51768eed8ff5a2274282cd797/
    ...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index c90396d..af202b4 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -12,6 +12,7 @@ COREUTILS_LICENSE_FILES = COPYING
 
 # patching gnulib .m4 file
 COREUTILS_AUTORECONF = YES
+COREUTILS_GETTEXTIZE = YES
 
 # If both coreutils and busybox are selected, make certain coreutils
 # wins the fight over who gets to have their utils actually installed.
