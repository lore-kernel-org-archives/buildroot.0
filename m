From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Sep 2013 20:24:26 +0200
Subject: [Buildroot] [PATCH 2/2] docs/manual: crosstool-NG backend is
	deprecated
In-Reply-To: <1378405466-9991-1-git-send-email-yann.morin.1998@free.fr>
References: <1378405466-9991-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <1378405466-9991-2-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Te crosstool-NG backend is deprecated.

Let it live one more cycle before we kill it for good, since the internal
backend has now gained the ability to build toolchains based on the three
C libraries that matter: uClibc, glibc and eglibc.

People that still want to use a crosstool-NG-built toolchain can do so
outside of Buildroot, and use the resulting toolchain with the external
toolchain backend.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 docs/manual/customize-toolchain.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/manual/customize-toolchain.txt b/docs/manual/customize-toolchain.txt
index 587fccc..3ffecfa 100644
--- a/docs/manual/customize-toolchain.txt
+++ b/docs/manual/customize-toolchain.txt
@@ -56,3 +56,8 @@ limited set of settings under the Buildroot +Toolchain+ menu:
 * Gdb and some toolchain options
 
 Then, the toolchain can be fine-tuned by invoking +make ctng-menuconfig+.
+
+*Note*: the crosstool-NG wrapper is deprecated. If you want to use
+http://crosstool-ng.org[crosstool-NG] to build your toolchain, please do
+so outside of Buildroot, and use the resulting toolchain as an external
+toolchain (see above).
-- 
1.8.1.2
