From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Fri, 22 Jan 2016 20:10:55 -0500
Subject: [Buildroot] [PATCH 02/18] pkg-rebar.mk: pass C++ compiler path and
	options
In-Reply-To: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
References: <1453511471-28519-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1453511471-28519-3-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Previously only the C compiler path and options were passed to rebar.
Erlang projects that used the C++ compiler would fail to build. This
fixes those errors.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/pkg-rebar.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index c727489..44c6d6c 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -158,7 +158,9 @@ ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$(@D); \
 		CC="$$(TARGET_CC)" \
+		CXX="$$(TARGET_CXX)" \
 		CFLAGS="$$(TARGET_CFLAGS)" \
+		CXXFLAGS="$$(TARGET_CXXFLAGS)" \
 		LDFLAGS="$$(TARGET_LDFLAGS)" \
 		$$(REBAR_TARGET_DEPS_ENV) \
 		$$(TARGET_MAKE_ENV) \
-- 
2.5.0
