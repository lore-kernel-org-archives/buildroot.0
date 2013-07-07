From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jul 2013 20:44:54 +0200
Subject: [Buildroot] [PATCH 2/3] manual: add faq entry explaining why
	Buildroot does not support Qt{4, 5} coexistence
In-Reply-To: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1373222695-9148-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/faq-troubleshooting.txt | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/docs/manual/faq-troubleshooting.txt b/docs/manual/faq-troubleshooting.txt
index f91a8ef..d190d26 100644
--- a/docs/manual/faq-troubleshooting.txt
+++ b/docs/manual/faq-troubleshooting.txt
@@ -126,3 +126,18 @@ directory as the new root, will most likely fail.
 If you want to run the target filesystem inside a chroot, or as an NFS
 root, then use the tarball image generated in +images/+ and extract it
 as root.
+
+[[faq-why-qt4-qt5-cannot-coexist]]
+Why Qt4 and Qt5 cannot coexist in Buildroot?
+--------------------------------------------
+
+Qt4 and Qt5 provide different set of APIs, so they are not equivalent.
+
+They usually may coexist on the same system, but not in Buildroot because
+host-tools like +qmake+ are not properly handled between those two versions.
+
+This host-tools issue cause troubles when building projects or packages
+using qmake (inside and outside Buildroot).
+
+Thus, there is an explicit choice for what version of Qt should be build by
+Buildroot.
-- 
1.8.3.2
