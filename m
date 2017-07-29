From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Jul 2017 15:31:46 +0200
Subject: [Buildroot] [PATCH v3 1/1] webkitgtk: Add patches which allow
 building for ARMv8-A
In-Reply-To: <20170729131639.28156-1-aperez@igalia.com>
References: <20170729131639.28156-1-aperez@igalia.com>
Message-ID: <20170729153146.47c90404@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Jul 2017 16:16:39 +0300, Adrian Perez de Castro wrote:
> The two added patches allow building WebKitGTK+ when the compiler
> scpecifically targets ARMv8-A, and reports as such be pre-defining
> __ARCH_ARM_8A__ instead of just __ARCH_ARM_8__. Both patches were
> pulled from the corresponding upstream bug reports and edited to
> remove the conflicting parts which edit the ChangeLog files.

You did not remove the parts that edit the ChangeLog files it seems,
and therefore, those patches don't apply to webkitgtk. There is no
Source/WTF/ChangeLog file in the extracted tarball:

>>> webkitgtk 2.16.6 Extracting
xzcat /home/thomas/dl/webkitgtk-2.16.6.tar.xz | tar --strip-components=1 -C /home/thomas/projets/buildroot/output/build/webkitgtk-2.16.6   -xf -
>>> webkitgtk 2.16.6 Patching

Applying 0001-WTF-Failure-to-build-when-the-compiler-specifically-.patch using patch: 
can't find file to patch at input line 25
Perhaps you used the wrong -p or --strip option?
The text leading up to this was:
--------------------------
|From 136a378d3ce1f81676aafac4a6e225db76dafa29 Mon Sep 17 00:00:00 2001
|From: "aperez at igalia.com"
| <aperez@igalia.com@268f45cc-cd09-0410-ab3c-d52691b4dbfc>
|Date: Wed, 12 Jul 2017 18:42:29 +0000
|Subject: [PATCH] [WTF] Failure to build when the compiler specifically targets
| ARMv8-A / defines __ARM_ARCH_8A__
| https://bugs.webkit.org/show_bug.cgi?id=174425
|
|Reviewed by Michael Catanzaro.
|
|* wtf/Platform.h: Also check for __ARCH_ARM_8A__ to detect ARMv8.
|
|Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
|
|git-svn-id: http://svn.webkit.org/repository/webkit/trunk at 219415 268f45cc-cd09-0410-ab3c-d52691b4dbfc
|---
| Source/WTF/ChangeLog      | 9 +++++++++
| Source/WTF/wtf/Platform.h | 3 ++-
| 2 files changed, 11 insertions(+), 1 deletion(-)
|
|diff --git a/Source/WTF/ChangeLog b/Source/WTF/ChangeLog
|index 819c6627423..d5c67f2acae 100644
|--- a/Source/WTF/ChangeLog
|+++ b/Source/WTF/ChangeLog
--------------------------
No file to patch.  Skipping patch.
1 out of 1 hunk ignored
patching file Source/WTF/wtf/Platform.h
package/pkg-generic.mk:191: recipe for target '/home/thomas/projets/buildroot/output/build/webkitgtk-2.16.6/.stamp_patched' failed

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
