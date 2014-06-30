From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  1 Jul 2014 00:26:32 +0200
Subject: [Buildroot] [PATCH 14/14] package/ca-certificates: add tarball's
	hashes
In-Reply-To: <cover.1404167061.git.yann.morin.1998@free.fr>
References: <cover.1404167061.git.yann.morin.1998@free.fr>
Message-ID: <1012e1870e03d242413f54e8f021e46a6b59393f.1404167061.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ca-certificates contains sensitive security-related information,
and we want to ensure the archive that we download has not been
compromised.

Add the sha1 and sha256 hashes from Debian's packaging.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Martin Bark <martin@barkynet.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>

---
Changes v4 -> v5:
  - update hashes since we've bumped the version
---
 package/ca-certificates/ca-certificates.hash | 3 +++
 1 file changed, 3 insertions(+)
 create mode 100644 package/ca-certificates/ca-certificates.hash

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
new file mode 100644
index 0000000..bcd0723
--- /dev/null
+++ b/package/ca-certificates/ca-certificates.hash
@@ -0,0 +1,3 @@
+# hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
+sha1   ad57a45f0422fafd78a2e8191e5204f2306cc91b                         ca-certificates_20140223.tar.xz
+sha256 815b7cd97200b0d76450bb3e7d9b65997ac494ab6467b17369f65b2ef94bcb0c ca-certificates_20140223.tar.xz
-- 
1.9.1
