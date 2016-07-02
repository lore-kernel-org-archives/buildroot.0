From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:39 +0200
Subject: [Buildroot] [PATCH 10/69] erlang-lager: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-11-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/erlang-lager/erlang-lager.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index 19940a97514a..b55b6f7b7897 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -9,6 +9,7 @@ ERLANG_LAGER_SITE = $(call github,basho,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
 ERLANG_LAGER_DEPENDENCIES = erlang-goldrush
+HOST_ERLANG_LAGER_DEPENDENCIES = host-erlang-goldrush
 
 $(eval $(rebar-package))
 $(eval $(host-rebar-package))
-- 
2.1.0
