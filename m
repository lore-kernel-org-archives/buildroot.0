From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 12 Dec 2018 00:56:05 -0200
Subject: [Buildroot] [PATCH 2/2] package/tegrarcm: select host-cryptopp and
 drop BR2_arm dependency
In-Reply-To: <20181212025605.19382-1-casantos@datacom.com.br>
References: <20181212025605.19382-1-casantos@datacom.com.br>
Message-ID: <20181212025605.19382-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- It is not be strictly necessary to select host-cryptopp but let's do
  it like other host packages do.

- There is no reason to depend on the target architecture, since it's a
  host tool.

Yes, we could have separate commits to select host-cryptopp and drop
BR2_arm dependency but that would be overkill.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/tegrarcm/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tegrarcm/Config.in.host b/package/tegrarcm/Config.in.host
index d8cbb947d6..3411501a72 100644
--- a/package/tegrarcm/Config.in.host
+++ b/package/tegrarcm/Config.in.host
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_HOST_TEGRARCM
 	bool "host tegrarcm"
-	depends on BR2_arm || BR2_armeb
+	select BR2_PACKAGE_HOST_CRYPTOPP
 	help
 	  This program is used to send code to a Tegra device in
 	  recovery mode.
-- 
2.19.2
