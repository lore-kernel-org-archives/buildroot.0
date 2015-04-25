From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Apr 2015 11:51:25 +0200
Subject: [Buildroot] [git commit] toolchain/external: ignore missing hash
	for custom downloaded toolchain
Message-ID: <20150425095655.1FFC580094@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd05cfa3113ffd9542f7b0a2a1ee014a178dc1d1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We will *always* be missing a hash file for custom external toolchains
that are downloaded.

So, just ignore that failure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/toolchain-external.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 11345cc..fd796a0 100644
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
