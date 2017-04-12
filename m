From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 12 Apr 2017 11:38:35 +0200
Subject: [Buildroot] [PATCH 01/53] pkg-rebar: remove redundant / in front of
	$($(PKG)_ERLANG_LIBDIR)
In-Reply-To: <20170412093928.1006-1-arnout@mind.be>
References: <20170412093928.1006-1-arnout@mind.be>
Message-ID: <20170412093928.1006-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sometimes $(1)/$($(PKG)_ERLANG_LIBDIR) is used, sometimes
$(1)$($(PKG)_ERLANG_LIBDIR). Make this consistent, without /, because
$($(PKG)_ERLANG_LIBDIR) already starts with a /.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pkg-rebar.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 7605a64ade..ab41d3bb34 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -56,7 +56,7 @@ REBAR_TARGET_DEPS_ENV = \
 # expands package-related variables.
 #
 define install-erlang-directories
-	$(INSTALL) -d $(1)/$($(PKG)_ERLANG_LIBDIR)
+	$(INSTALL) -d $(1)$($(PKG)_ERLANG_LIBDIR)
 	for dir in bin ebin priv $(2); do                               \
 		if test -d $(@D)/$$dir; then                            \
 			cp -r $(@D)/$$dir $(1)$($(PKG)_ERLANG_LIBDIR);  \
@@ -90,7 +90,7 @@ endef
 #
 define install-rebar-deps
 	$(INSTALL) -d $(REBAR_$(2)_DEPS_DIR)
-	ln -f -s $(1)/$($(PKG)_ERLANG_LIBDIR) \
+	ln -f -s $(1)$($(PKG)_ERLANG_LIBDIR) \
 		$(REBAR_$(2)_DEPS_DIR)/$($(PKG)_ERLANG_APP)
 endef
 
-- 
2.11.0
