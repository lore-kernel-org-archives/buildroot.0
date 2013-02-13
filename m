From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:05 +0100
Subject: [Buildroot] [PATCH 4/9] manual: faq: add entry about the
	relocatable toolchain
In-Reply-To: <cover.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
Message-ID: <c99516cd998754307f0a5e3b19579316f37d9f95.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/faq-troubleshooting.txt | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index f91a8ef..8b0882a 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -126,3 +126,24 @@ directory as the new root, will most likely fail.
 If you want to run the target filesystem inside a chroot, or as an NFS
 root, then use the tarball image generated in +images/+ and extract it
 as root.
+
+[[faq-relocatable-toolchains]]
+Are Buildroot toolchains relocatable?
+-------------------------------------
+
+Because Buildroot uses several toolchain backends, there is one anwser
+per backend:
+
+Using the external or crosstool-NG toolchain backend
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+These toolchains are mostly likely relocatable; the _Buildroot compiler
+wrapper_ is relocatable.
+
+However, some tools built and installed into the +HOST_DIR+ may not be
+relocatable, with some absolute pathes hard-coded inside.
+
+Using the internal Buildroot toolchain backend
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+These toolchains are currently *not relocatable*.
-- 
1.8.1.3
