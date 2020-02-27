From: unixmania at gmail.com <unixmania@gmail.com>
Date: Thu, 27 Feb 2020 17:08:12 -0300
Subject: [Buildroot] [PATCH v2 1/4] Makefile: add SED_QUIET
In-Reply-To: <20200227200815.26613-1-unixmania@gmail.com>
References: <20200227200815.26613-1-unixmania@gmail.com>
Message-ID: <20200227200815.26613-2-unixmania@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carlos Santos <unixmania@gmail.com>

- Save the sed command full path in HOSTSED
- Define SED as "$(HOSTSED) -i -e"
- Define SED_QUIET as "$(HOSTSED) -n -e"

SED_QUIET will be used by the forthcoming KCONFIG_GET_OPT macro.

Signed-off-by: Carlos Santos <unixmania@gmail.com>
---
 Makefile | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index eb68598059..25285eb5c2 100644
--- a/Makefile
+++ b/Makefile
@@ -307,7 +307,9 @@ HOSTLN := $(shell which $(HOSTLN) || type -p $(HOSTLN) || echo ln)
 HOSTNM := $(shell which $(HOSTNM) || type -p $(HOSTNM) || echo nm)
 HOSTOBJCOPY := $(shell which $(HOSTOBJCOPY) || type -p $(HOSTOBJCOPY) || echo objcopy)
 HOSTRANLIB := $(shell which $(HOSTRANLIB) || type -p $(HOSTRANLIB) || echo ranlib)
-SED := $(shell which sed || type -p sed) -i -e
+HOSTSED := $(shell which sed || type -p sed)
+SED := $(HOSTSED) -i -e
+SED_QUIET := $(HOSTSED) -n -e
 
 export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD
 export HOSTCC_NOCCACHE HOSTCXX_NOCCACHE
-- 
2.18.2
