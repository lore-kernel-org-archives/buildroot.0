From: Carlos Santos <casantos@datacom.com.br>
Date: Thu, 20 Dec 2018 21:22:49 -0200
Subject: [Buildroot] [PATCH v2 2/2] package/tegrarcm: select host-cryptopp
In-Reply-To: <20181220232249.29434-1-casantos@datacom.com.br>
References: <20181220232249.29434-1-casantos@datacom.com.br>
Message-ID: <20181220232249.29434-3-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since cryptopp now has a Config.in.host, make the depending packages
(currently only tegrarcm) select it.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
  - Explain the motivation in the commit message
  - Restore the BR2_arm dependency
---
 package/tegrarcm/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
index d8cbb947d6..aeff8f158c 100644
--- a/package/tegrarcm/Config.in.host
+++ b/package/tegrarcm/Config.in.host
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_HOST_TEGRARCM
 	bool "host tegrarcm"
 	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_HOST_CRYPTOPP
 	help
 	  This program is used to send code to a Tegra device in
 	  recovery mode.
-- 
2.19.2
