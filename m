From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  7 Mar 2018 21:27:19 +0100
Subject: [Buildroot] [PATCH 2/2] support/check-bin-arch: exclude kernel
 modules for merged /usr
In-Reply-To: <cover.1520454419.git.yann.morin.1998@free.fr>
References: <cover.1520454419.git.yann.morin.1998@free.fr>
Message-ID: <ce786b49c9bbe6a3e2ebde9ca28b56de86e68b2e.1520454419.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When using a merged /usr, the kernel module path is really
/usr/lib/modules, as /lib is a symlink to usr/lib .

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/scripts/check-bin-arch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/scripts/check-bin-arch b/support/scripts/check-bin-arch
index 922791ab89..258014b98f 100755
--- a/support/scripts/check-bin-arch
+++ b/support/scripts/check-bin-arch
@@ -14,6 +14,7 @@ declare -a IGNORES=(
 	# and its modules may still be 64-bit. To keep the basic
 	# check-bin-arch logic simple, just skip this directory.
 	"/lib/modules"
+	"/usr/lib/modules"
 
 	# Skip files in /usr/share, several packages (qemu,
 	# pru-software-support) legitimately install ELF binaries that
-- 
2.14.1
