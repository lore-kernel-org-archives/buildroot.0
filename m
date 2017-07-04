From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Jul 2017 18:45:26 +0200
Subject: [Buildroot] [git commit] syslinux: drop patch 0003,
	not needed after gnu-efi update
Message-ID: <20170704164227.BB5A081EAA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=644c024edeb7e20bd96ce4426aeca2cbcd74d9b9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ....elf-Not-enough-room-for-program-headers-.patch | 35 ----------------------
 1 file changed, 35 deletions(-)

diff --git a/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch b/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch
deleted file mode 100644
index 83a87ee..0000000
--- a/boot/syslinux/0003-Fix-ldlinux.elf-Not-enough-room-for-program-headers-.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 61de7762389d460da7ffdd644f50c60175cce23b Mon Sep 17 00:00:00 2001
-From: Steve McIntyre <93sam@debian.org>
-Date: Wed, 5 Apr 2017 22:09:37 +0200
-Subject: [PATCH] Fix 'ldlinux.elf: Not enough room for program headers, try
- linking with -N'
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Fix for https://bugs.debian.org/846679: syslinux: FTBFS: ld:
-ldlinux.elf: Not enough room for program headers, try linking with -N
-
-https://bugs.debian.org/cgi-bin/bugreport.cgi?att=1;bug=846679;filename=syslinux_6.03%2Bdfsg-14.1.debdiff;msg=10
-
-Signed-off-by: Beno??t Allard <benoit.allard@greenbone.net>
----
- core/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/core/Makefile b/core/Makefile
-index ad0acb5..58a3545 100644
---- a/core/Makefile
-+++ b/core/Makefile
-@@ -165,7 +165,7 @@ LDSCRIPT = $(SRC)/$(ARCH)/syslinux.ld
- 
- %.elf: %.o $(LIBDEP) $(LDSCRIPT) $(AUXLIBS)
- 	$(LD) $(LDFLAGS) -Bsymbolic $(LD_PIE) -E --hash-style=gnu -T $(LDSCRIPT) -M -o $@ $< \
--		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group \
-+		--start-group $(LIBS) $(subst $(*F).elf,lib$(*F).a,$@) --end-group --no-dynamic-linker \
- 		> $(@:.elf=.map)
- 	$(OBJDUMP) -h $@ > $(@:.elf=.sec)
- 	$(PERL) $(SRC)/lstadjust.pl $(@:.elf=.lsr) $(@:.elf=.sec) $(@:.elf=.lst)
--- 
-2.7.4
-
