Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22210C001DF
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 13:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2A184043D;
	Sun,  6 Aug 2023 13:45:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2A184043D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSeDacxoV8wT; Sun,  6 Aug 2023 13:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 034B0414C5;
	Sun,  6 Aug 2023 13:45:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 034B0414C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 868A11BF3C0
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E27C60AEE
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 13:44:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E27C60AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SqwjsJ-aRYZt for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 13:44:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DEBB060750
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 13:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEBB060750
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3C88843C2; Sun,  6 Aug 2023 13:44:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 15:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 95116bc65e53f58b1dfbd35e5156b46f9e6b9a51
X-Git-Newrev: f3b22e3642c836f83b5f45d0bceba9c36ae9d33f
X-Patchwork-Hint: ignore
Message-Id: <20230806134455.C3C88843C2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elf2flt: refresh patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f3b22e3642c836f83b5f45d0bceba9c36ae9d33f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some patches had some fuzz, and patch 0004 was no longer applicable
using "git am". Patch 0006 is renamed so that it matches the commit
log title, as generated automatically by git format-patch.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                  |  2 +-
 .../elf2flt/0001-elf2flt-handle-binutils-2.34.patch  |  4 ++--
 ...d-reinstate-32-byte-alignment-for-.data-sec.patch |  4 ++--
 .../0003-elf2flt-add-riscv-64-bits-support.patch     |  8 ++++----
 ...004-elf2flt-create-a-common-helper-function.patch | 20 ++++++++++----------
 ...ix-fatal-error-regression-on-m68k-xtensa-ri.patch |  8 ++++----
 ....patch => 0006-xtensa-fix-text-relocations.patch} | 10 +++++-----
 7 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f612dfae4d..0954f22b4b 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -395,7 +395,7 @@ package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
 package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch Upstream
 package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch Upstream
 package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch Upstream
-package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch Upstream
+package/elf2flt/0006-xtensa-fix-text-relocations.patch Upstream
 package/elftosb/0001-fixes-includes.patch Upstream
 package/elftosb/0002-force-cxx-compiler.patch Upstream
 package/elfutils/0001-Add-a-enable-disable-progs-configure-option.patch Upstream
diff --git a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
index 4aa473c244..f9e493a761 100644
--- a/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
+++ b/package/elf2flt/0001-elf2flt-handle-binutils-2.34.patch
@@ -1,4 +1,4 @@
-From d78acba6510527aaa01a41eaf4c931f7a57e5f44 Mon Sep 17 00:00:00 2001
+From 2821fcb55cbe0f2b77237d89b5b3467fb3ad058b Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@smile.fr>
 Date: Wed, 5 Feb 2020 10:31:32 +0100
 Subject: [PATCH] elf2flt: handle binutils >= 2.34
@@ -373,5 +373,5 @@ index 7ac0617..ea6b5a1 100644
  	fatal("read error section %s", s->name);
        }
 -- 
-2.35.1
+2.41.0
 
diff --git a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
index 4df3ea5929..8bd0383683 100644
--- a/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
+++ b/package/elf2flt/0002-elf2flt.ld-reinstate-32-byte-alignment-for-.data-sec.patch
@@ -1,4 +1,4 @@
-From 85ba5664eb368eb1cbd2c30b7cd574acd75edd4c Mon Sep 17 00:00:00 2001
+From 37b281e4dd0fb5832181e51943a4eb3c74d4f618 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Mon, 4 Apr 2022 15:30:24 +0200
 Subject: [PATCH] elf2flt.ld: reinstate 32 byte alignment for .data section
@@ -77,5 +77,5 @@ index 0df999d..e5aea14 100644
  		@SYMBOL_PREFIX@__data_start = . ;
  		@SYMBOL_PREFIX@data_start = . ;
 -- 
-2.35.1
+2.41.0
 
diff --git a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch b/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
index 15c191c83d..c2aa538d02 100644
--- a/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
+++ b/package/elf2flt/0003-elf2flt-add-riscv-64-bits-support.patch
@@ -1,4 +1,4 @@
-From 3f1f323feb5cf25d8c80861991d0360784f4d2e6 Mon Sep 17 00:00:00 2001
+From 1498503bde2a6055a83f1e9f3eaa6f2a104bd597 Mon Sep 17 00:00:00 2001
 From: Damien Le Moal <damien.lemoal@wdc.com>
 Date: Wed, 9 Sep 2020 17:31:33 +0900
 Subject: [PATCH] elf2flt: add riscv 64-bits support
@@ -27,7 +27,7 @@ Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
  3 files changed, 25 insertions(+)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index da25e93..a03ea3a 100644
+index ea6b5a1..c2816b6 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
 @@ -81,6 +81,8 @@ const char *elf2flt_progname;
@@ -48,7 +48,7 @@ index da25e93..a03ea3a 100644
  #else
  #error "Don't know how to support your CPU architecture??"
  #endif
-@@ -812,6 +816,18 @@ output_relocs (
+@@ -821,6 +825,18 @@ output_relocs (
  					goto good_32bit_resolved_reloc;
  				default:
  					goto bad_resolved_reloc;
@@ -99,5 +99,5 @@ index 7cb02d5..75ee1bb 100644
  	if (!linker_script)
  		linker_script = concat(ldscriptpath, "/elf2flt.ld", NULL);
 -- 
-2.36.1
+2.41.0
 
diff --git a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
index 6fee99d45a..be8d57affa 100644
--- a/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
+++ b/package/elf2flt/0004-elf2flt-create-a-common-helper-function.patch
@@ -1,4 +1,4 @@
-From 37e1e0ace8ccebf54ec2f5522bfc1f9db86946ad Mon Sep 17 00:00:00 2001
+From 4f28e4329897b7f23d828b375fb365d0e30c9cb5 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Tue, 9 Aug 2022 12:13:50 +0200
 Subject: [PATCH] elf2flt: create a common helper function
@@ -14,10 +14,10 @@ Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
  1 file changed, 11 insertions(+), 8 deletions(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index 669591e..9c32f9a 100644
+index c2816b6..8cd48d9 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -337,6 +337,13 @@ compare_relocs (const void *pa, const void *pb)
+@@ -346,6 +346,13 @@ compare_relocs (const void *pa, const void *pb)
  }
  #endif
  
@@ -31,7 +31,7 @@ index 669591e..9c32f9a 100644
  static uint32_t *
  output_relocs (
    bfd *abs_bfd,
-@@ -428,8 +435,7 @@ output_relocs (
+@@ -437,8 +444,7 @@ output_relocs (
  	 */
  	if ((!pic_with_got || ALWAYS_RELOC_TEXT) &&
  	    ((a->flags & SEC_CODE) ||
@@ -41,7 +41,7 @@ index 669591e..9c32f9a 100644
  		sectionp = text + (a->vma - text_vma);
  	else if (a->flags & SEC_DATA)
  		sectionp = data + (a->vma - data_vma);
-@@ -1893,8 +1899,7 @@ int main(int argc, char *argv[])
+@@ -1902,8 +1908,7 @@ int main(int argc, char *argv[])
      bfd_vma sec_vma;
  
      if ((s->flags & SEC_CODE) ||
@@ -51,7 +51,7 @@ index 669591e..9c32f9a 100644
        vma = &text_vma;
        len = &text_len;
      } else if (s->flags & SEC_DATA) {
-@@ -1932,8 +1937,7 @@ int main(int argc, char *argv[])
+@@ -1941,8 +1946,7 @@ int main(int argc, char *argv[])
     * data sections.*/
    for (s = abs_bfd->sections; s != NULL; s = s->next)
      if ((s->flags & SEC_CODE) ||
@@ -60,8 +60,8 @@ index 669591e..9c32f9a 100644
 +	ro_reloc_data_section_should_be_in_text(s))
        if (!bfd_get_section_contents(abs_bfd, s,
  				   text + (s->vma - text_vma), 0,
- 				   bfd_section_size(abs_bfd, s)))
-@@ -1962,8 +1966,7 @@ int main(int argc, char *argv[])
+ 				   elf2flt_bfd_section_size(s)))
+@@ -1971,8 +1975,7 @@ int main(int argc, char *argv[])
     * data sections already included in the text output section.*/
    for (s = abs_bfd->sections; s != NULL; s = s->next)
      if ((s->flags & SEC_DATA) &&
@@ -70,7 +70,7 @@ index 669591e..9c32f9a 100644
 +	!ro_reloc_data_section_should_be_in_text(s))
        if (!bfd_get_section_contents(abs_bfd, s,
  				   data + (s->vma - data_vma), 0,
- 				   bfd_section_size(abs_bfd, s)))
+ 				   elf2flt_bfd_section_size(s)))
 -- 
-2.37.1
+2.41.0
 
diff --git a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
index 616bbc891f..96befd53d8 100644
--- a/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
+++ b/package/elf2flt/0005-elf2flt-fix-fatal-error-regression-on-m68k-xtensa-ri.patch
@@ -1,4 +1,4 @@
-From a8c9f650b82109abf7aa730f298ea5182ed62613 Mon Sep 17 00:00:00 2001
+From 87d45736a6855f2147ef9c88d2bce2cabc84cb52 Mon Sep 17 00:00:00 2001
 From: Niklas Cassel <niklas.cassel@wdc.com>
 Date: Tue, 9 Aug 2022 21:06:05 +0200
 Subject: [PATCH] elf2flt: fix fatal error regression on m68k, xtensa, riscv64
@@ -50,10 +50,10 @@ Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
  1 file changed, 7 insertions(+), 2 deletions(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index e0d7891..39d035f 100644
+index 8cd48d9..60bfa57 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -341,8 +341,13 @@ compare_relocs (const void *pa, const void *pb)
+@@ -349,8 +349,13 @@ compare_relocs (const void *pa, const void *pb)
  static bool
  ro_reloc_data_section_should_be_in_text(asection *s)
  {
@@ -70,5 +70,5 @@ index e0d7891..39d035f 100644
  
  static uint32_t *
 -- 
-2.39.0
+2.41.0
 
diff --git a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch b/package/elf2flt/0006-xtensa-fix-text-relocations.patch
similarity index 88%
rename from package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
rename to package/elf2flt/0006-xtensa-fix-text-relocations.patch
index 3664775906..19c47cca90 100644
--- a/package/elf2flt/0006-elf2flt-xtensa-fix-text-relocations.patch
+++ b/package/elf2flt/0006-xtensa-fix-text-relocations.patch
@@ -1,4 +1,4 @@
-From e248d9774506fdd8698b14a7edead113f19ecdb0 Mon Sep 17 00:00:00 2001
+From 7e1c17d7fe72a0889d56d5e6a1390d493d1de144 Mon Sep 17 00:00:00 2001
 From: Max Filippov <jcmvbkbc@gmail.com>
 Date: Tue, 29 Nov 2022 17:47:54 -0800
 Subject: [PATCH] xtensa: fix text relocations
@@ -21,10 +21,10 @@ Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
  1 file changed, 14 insertions(+), 1 deletion(-)
 
 diff --git a/elf2flt.c b/elf2flt.c
-index b93aecdaced3..cec3f4a22239 100644
+index 60bfa57..0fcb747 100644
 --- a/elf2flt.c
 +++ b/elf2flt.c
-@@ -808,7 +808,20 @@ output_relocs (
+@@ -833,7 +833,20 @@ output_relocs (
  					continue;
  				case R_XTENSA_32:
  				case R_XTENSA_PLT:
@@ -45,7 +45,7 @@ index b93aecdaced3..cec3f4a22239 100644
 +					break;
  				default:
  					goto bad_resolved_reloc;
- #else
+ #elif defined(TARGET_riscv64)
 -- 
-2.30.2
+2.41.0
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
