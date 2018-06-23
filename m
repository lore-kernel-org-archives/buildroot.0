From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 23 Jun 2018 15:34:10 +0200
Subject: [Buildroot] [PATCH 1/1] package/erlang: fix host build with
 host-pcre package
Message-ID: <20180623133410.16783-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://git.buildroot.net/buildroot/commit/?id=bd12cd7d4633200ce01663df6528fd061d64b784
added an incompletely rebased patch to fix host-erlang when pcre is
available on the host.

Fixes
http://autobuild.buildroot.net/results/484/484a54b005764958073674bf07f6a760bfedb071/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-erts-emulator-reorder-inclued-headers-paths.patch       | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
index 2c976f539e..7a6e469dff 100644
--- a/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
+++ b/package/erlang/0002-erts-emulator-reorder-inclued-headers-paths.patch
@@ -35,3 +35,12 @@ index 7145824..d079487 100644
  
  $(OBJDIR)/beam_emu.S: beam/beam_emu.c
  	$(V_EMU_CC) -S -fverbose-asm $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
+@@ -765,7 +765,7 @@
+ # General targets
+ #
+ $(OBJDIR)/%.o: beam/%.c
+-	$(V_CC) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) $(INCLUDES) -c $< -o $@
++	$(V_CC) $(INCLUDES) $(subst -O2, $(GEN_OPT_FLGS), $(CFLAGS)) -c $< -o $@
+ 
+ $(OBJDIR)/%.o: $(TARGET)/%.c
+ 	$(V_CC) $(CFLAGS) $(INCLUDES) -Idrivers/common -c $< -o $@
-- 
2.11.0
