From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 May 2012 16:27:07 +0200
Subject: [Buildroot] [git commit] libmpeg2: fix build breakage on lower ARM
	cores
Message-ID: <20120505142739.E411296A99@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2643db0b79de33a6490efb8adc62525a0987ea0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../libmpeg2/libmpeg2-0.5.1-armv4l.patch           |   24 ++++++++++++++++++++
 1 files changed, 24 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch b/package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch
new file mode 100644
index 0000000..70d45ef
--- /dev/null
+++ b/package/multimedia/libmpeg2/libmpeg2-0.5.1-armv4l.patch
@@ -0,0 +1,24 @@
+Patch taken from gentoo.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -urNp libmpeg2.orig/libmpeg2/motion_comp_arm_s.S libmpeg2/libmpeg2/motion_comp_arm_s.S
+--- libmpeg2.orig/libmpeg2/motion_comp_arm_s.S	2008-07-09 21:16:05.000000000 +0200
++++ libmpeg2/libmpeg2/motion_comp_arm_s.S	2009-11-20 19:55:22.000000000 +0100
+@@ -19,6 +19,16 @@
+ @ Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
+ 
+ 
++@ Data preload is supported only by ARM V5TE and above
++
++#if (defined (__ARM_ARCH_2__) || defined (__ARM_ARCH_3__) \
++     || defined (__ARM_ARCH_3M__) || defined (__ARM_ARCH_4__) \
++     || defined (__ARM_ARCH_4T__) || defined (__ARM_ARCH_5__) \
++     || defined (__ARM_ARCH_5T__))
++.macro pld reg
++.endm
++#endif
++
+ 	.text
+ 
+ @ ----------------------------------------------------------------
