From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 24 Oct 2019 20:16:19 +0200
Subject: [Buildroot] [PATCH v2 1/3] toolchain: add support for D language
In-Reply-To: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
References: <20191024181621.29349-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191024181621.29349-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 9.1, GCC provides support for the D programming language [1].

So add an option to indicate the selected toolchain supports this
language.

[1] https://dlang.org/

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 toolchain/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 3bc3b1b4b0..c9aa95985f 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -171,6 +171,9 @@ config BR2_ENABLE_LOCALE
 config BR2_INSTALL_LIBSTDCPP
 	bool
 
+config BR2_TOOLCHAIN_HAS_DLANG
+	bool
+
 config BR2_TOOLCHAIN_HAS_FORTRAN
 	bool
 
-- 
2.21.0
