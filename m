From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 16:55:25 +0100
Subject: [Buildroot] [git commit] pkg-rebar.mk: pass C++ compiler path and
	options
Message-ID: <20160302202754.4B5C181941@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6be72cd8ca093c53f17d1a5b982daf2cca800b11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Previously only the C compiler path and options were passed to rebar.
Erlang projects that used the C++ compiler would fail to build, which
would for example be the case with the latest version of
erlang-p1-stringprep. This fixes those errors.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
[Thomas: adjust commit message to indicate an example of an Erlang
package that needs the C++ compiler.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
