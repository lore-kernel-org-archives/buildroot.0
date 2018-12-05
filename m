From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Wed,  5 Dec 2018 17:06:17 +0100
Subject: [Buildroot] [PATCH 2/3] package/pkg-rebar.mk: Change semantic of
 <PKG>_KEEP_DEPENDENCIES
In-Reply-To: <20181205160618.6884-1-johan.oudinet@gmail.com>
References: <20181205160618.6884-1-johan.oudinet@gmail.com>
Message-ID: <20181205160618.6884-2-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set it to NO by default and check if it is equal to NO. This is to
be more consistent with other boolean variables in Buildroot.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/pkg-rebar.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 838e7681de..e4e3f3bb6c 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -234,9 +234,11 @@ $(2)_REBAR = rebar
 $(2)_DEPENDENCIES += host-erlang-rebar
 endif
 
+$(2)_KEEP_DEPENDENCIES ?= NO
+
 # Remove dependencies listed in rebar.config unless the package says
 # otherwise
-ifeq ($$($(2)_KEEP_DEPENDENCIES),)
+ifeq ($$($(2)_KEEP_DEPENDENCIES),NO)
 $(2)_POST_PATCH_HOOKS += remove-rebar-config-dependencies
 endif
 
-- 
2.17.1
