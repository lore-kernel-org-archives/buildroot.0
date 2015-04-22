From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 23 Apr 2015 00:08:39 +0200
Subject: [Buildroot] [PATCH v7 6/8] toolchain/external: ignore missing hash
	for custom downloaded toolchain
In-Reply-To: <1429740521-31943-1-git-send-email-arnout@mind.be>
References: <1429740521-31943-1-git-send-email-arnout@mind.be>
Message-ID: <1429740521-31943-7-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

We will *always* be missing a hash file for custom external toolchains
that are downloaded.

So, just ignore that failure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
Chamges v3 -> v4:
  - drop magic value, append to the exclusion list  (Arnout)

Changes v1 -> v2:
  - fix typoes in title

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-external/toolchain-external.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 2427463..5576dcb 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -400,6 +400,8 @@ else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
 TOOLCHAIN_EXTERNAL_SOURCE = $(notdir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
+# We can't check hashes for custom downloaded toolchains
+BR_NO_CHECK_HASH_FOR += $(TOOLCHAIN_EXTERNAL_SOURCE)
 endif
 
 # In fact, we don't need to download the toolchain, since it is already
-- 
2.1.4
