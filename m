From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 14 Nov 2019 20:22:10 +0100
Subject: [Buildroot] [PATCH 3/3] package/kodi: add missing host-gettext
 dependency
In-Reply-To: <cover.1573759321.git.yann.morin.1998@free.fr>
References: <cover.1573759321.git.yann.morin.1998@free.fr>
Message-ID: <9a12e61152e7f9944e986aa9f1c7483750e767c2.1573759321.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A sub-component of Kodi (cpluff) needs to be autoreconf-ed, and uses
gettext, so calls to autopoint.

Add a dependency to host-gettext to bring an appropriate variant that
provides autotpoint (gettext-tiny's autopoint works like a charm, for
the curious).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/kodi/kodi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 49728e464b..ceab5d5c0b 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -19,6 +19,7 @@ KODI_DEPENDENCIES = \
 	freetype \
 	gnutls \
 	host-gawk \
+	host-gettext \
 	host-gperf \
 	host-kodi-jsonschemabuilder \
 	host-kodi-texturepacker \
-- 
2.20.1
