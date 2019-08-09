From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Fri,  9 Aug 2019 22:05:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/mpd: upnp feature requires curl
In-Reply-To: <20190809200545.10188-1-joerg.krause@embedded.rocks>
References: <20190809200545.10188-1-joerg.krause@embedded.rocks>
Message-ID: <20190809200545.10188-2-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MPD switched from the Autotools to the Meson build system. The Autotools
configure did not check for curl when enabling the UPnP feature, but the
Meson configuration script does.

Fixes:
http://autobuild.buildroot.org/results/781/781e0b335da3066783bbb65ba5b9c304f50192d8
http://autobuild.buildroot.org/results/9e1/9e15258aa4baae4f2c6febc7d364226f17bb9d9a
http://autobuild.buildroot.org/results/72a/72aab71c4a4e9001c632484930c4442058cb3927
http://autobuild.buildroot.org/results/8c4/8c41ddd812a5f080eb7f2f284ca4f4ea3c6f2ff7
http://autobuild.buildroot.org/results/bab/bab8b633d7ecb2d943ad77659c08a69f0115c5f1
.. and more.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/mpd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mpd/Config.in b/package/mpd/Config.in
index c751174f9d..db88413947 100644
--- a/package/mpd/Config.in
+++ b/package/mpd/Config.in
@@ -349,6 +349,7 @@ config BR2_PACKAGE_MPD_TCP
 
 config BR2_PACKAGE_MPD_UPNP
 	bool "UPnP"
+	select BR2_PACKAGE_MPD_CURL
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_LIBUPNP18 if !BR2_PACKAGE_LIBUPNP
 	help
-- 
2.22.0
