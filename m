From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 16 Jul 2014 00:37:23 +0200
Subject: [Buildroot] [PATCH 4/5 v2] package/coreutils: gettextize to match
	the new gettext version
In-Reply-To: <cover.1405463657.git.yann.morin.1998@free.fr>
References: <cover.1405463657.git.yann.morin.1998@free.fr>
Message-ID: <61bc2021d4233fd18c1a083f04f0b5a1ee31a82e.1405463657.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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
---
 package/coreutils/coreutils.mk | 1 +
 1 file changed, 1 insertion(+)

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
-- 
1.9.1
