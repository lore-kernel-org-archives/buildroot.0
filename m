From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Nov 2018 13:27:58 +0100
Subject: [Buildroot] [PATCH 4/4] scripts/check-bin-arch: fix failure with bpf
In-Reply-To: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
References: <20181103122758.10578-1-fontaine.fabrice@gmail.com>
Message-ID: <20181103122758.10578-4-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Do not return an error if architecture is "Linux BPF" (in-kernel
bytecode machine)

Fixes:
 - http://autobuild.buildroot.org/results/c18fb7f1ac81496db9c3a4e91ea028a26ca600b0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/scripts/check-bin-arch | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 7f97696735..a0de7a6ac4 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -74,6 +74,11 @@ while read f; do
 		continue
 	fi
 
+	# If architecture is Linux BPF (in-kernel bytecode machine), continue
+	if test "${arch}" = "Linux BPF" ; then
+		continue
+	fi
+
 	# Architecture is correct
 	if test "${arch}" = "${arch_name}" ; then
 		continue
-- 
2.17.1
